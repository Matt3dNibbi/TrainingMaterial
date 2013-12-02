
#
# Copyright 2010-2012 Fabric Technologies Inc. All rights reserved.
#

from PySide import QtCore

from FabricEngine.SceneGraph.PySide import *
from FabricEngine.SceneGraph.Nodes import *
from FabricEngine.SceneGraph.Nodes.Importers import *
from FabricEngine.SceneGraph.PySide import *
from BezierDeformComponentImpl import BezierDeformComponent
from BezierGizmoComponentImpl import BezierGizmoComponent

from FabricEngine.SceneGraph.PySide.IntegratedApplicationImpl import IntegratedApplication
from FabricEngine.SceneGraph.PySide.Widgets.SGNodeInspectorImpl import SGNodeInspector
from FabricEngine.SceneGraph.PySide.Widgets.IntegratedWidgetImpl import IntegratedWidget

class MyDeformerApp(IntegratedApplication):

  def __init__(self, **options):
    
    options.setdefault('enableRaycasting', True)
    super(MyDeformerApp, self).__init__(**options)

    scene = self.getScene()

    # setup an empty polygon mesh node
    self.__geometry = PolygonMesh(scene, name = "DeformedMesh")
    self.__geometry.addComponent(PolygonMeshFromArraysComponent())
    self.__deformerComp = BezierDeformComponent()
    self.__gizmoComp = BezierGizmoComponent(deformerComp = self.__deformerComp)
    self.__geometry.addComponent(self.__deformerComp)
    self.__geometry.addComponent(self.__gizmoComp)

    if self.runsStandalone():

      # import the cube obj file
      objPath = os.path.join(self.getApplicationFolder(), 'cube.obj')
      importer = OBJImporter(scene, filePath=objPath, constructMaterials = False)
      nodesList = importer.importAsset()
  
      # loop over all constructed nodes
      for name, node in nodesList.iteritems():
        if isinstance(node, PolygonMesh):
          node.addComponent(PolygonMeshToArraysComponent())

          def connectMeshToMesh(data):
            node = data['node']

            # add an operator which will copy the arrays
            self.__geometry.getGeometryDGNode().setDependency('inGeometry', node.getGeometryDGNode())
            node.bindDGOperator(self.__geometry.getGeometryDGNode().bindings,
              name = 'copyPolygonMeshFromArray',
              sourceCode = [
                'operator copyPolygonMeshFromArray(',
                '  Vec3 outputTopoPositions[],',
                '  Integer outputTopoIndices[],',
                '  io Vec3 inputTopoPositions[],',
                '  io Integer inputTopoIndices[]',
                ') {',
                '  inputTopoPositions = outputTopoPositions;',
                '  inputTopoIndices = outputTopoIndices;',
                '}'
              ],
              layout = [
                'inGeometry.outputTopoPositions',
                'inGeometry.outputTopoIndices',
                'self.inputTopoPositions',
                'self.inputTopoIndices'
              ],
              index = 0 # put this operator in the first place
            )

          self.__geometry.addReferenceInterface('InputGeometry', PolygonMesh, False, connectMeshToMesh)
          self.__geometry.setInputGeometryNode(node)
          break

    # create the shaders
    phongMaterial = Material(scene, xmlFile='PhongMaterial')
    phongMaterial.addPreset(name='blue',diffuseColor=Color(0.0,0.0,1.0))
    
    # create transforms
    self.__transform = Transform(scene)

    # create the instances
    instance = GeometryInstance(scene,
      geometry=self.__geometry,
      transform=self.__transform,
      material=phongMaterial
    )

    # setup the gizmo
    self.__manipulator = GizmoManipulator(scene)
    self.__gizmo = GizmoInstance(scene,
      source=self.__geometry, 
      sourceDGNodeName='GeometryDGNode', 
      sourceMemberName=self.__gizmoComp.getGizmoMember()
    )
    self.__manipulator.addGizmoNode(self.__gizmo)
    self.__gizmoComp.setVisible(False)

    # listen to activation and deactivation of manipulators
    def onManipActivate(data):
      if data['manipulator'] == self.__manipulator:
        self.__gizmoComp.setVisible(True)

    def onManipDeactivate(data):
      if data['manipulator'] == self.__manipulator:
        self.__gizmoComp.setVisible(False)

    self.addEventListener("manipulatorActivated", onManipActivate)
    self.addEventListener("manipulatorDeactivated", onManipDeactivate)

    # check errors and show UI
    self.constructionCompleted()

  def getWidgetNames(self):
    return ["BezierDeform Options"]

  def getWidget(self, name):
    if name == "BezierDeform Options":
      widget = IntegratedWidget(SGNodeInspector({ 'node':self.__geometry }), self)
      widget.setWindowTitle("Fur Options")
      return widget
    return None

  def getManipulatorNames(self):
    names = ["BezierManip"]
    if self.runsStandalone():
      names.append("Camera")
    return names

  def getManipulator(self, name):
    if name == "BezierManip":
      return self.__manipulator
    if name == "Camera":
      return self.getCameraManipulator()
    return None

app = MyDeformerApp()
app.exec_()