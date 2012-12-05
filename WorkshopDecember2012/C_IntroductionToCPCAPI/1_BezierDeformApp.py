
#
# Copyright 2010-2012 Fabric Technologies Inc. All rights reserved.
#

from PySide import QtCore

from FabricEngine.CreationPlatform.PySide import *
from FabricEngine.CreationPlatform.Nodes import *
from FabricEngine.CreationPlatform.Nodes.Importers import *
from FabricEngine.CreationPlatform.PySide import *
from BezierDeformComponentImpl import BezierDeformComponent
from BezierGizmoComponentImpl import BezierGizmoComponent

from FabricEngine.CreationPlatform.PySide.IntegratedApplicationImpl import IntegratedApplication
from FabricEngine.CreationPlatform.PySide.Widgets.SGNodeInspectorImpl import SGNodeInspector
from FabricEngine.CreationPlatform.PySide.Widgets.IntegratedWidgetImpl import IntegratedWidget

class MyDeformerApp(IntegratedApplication):

  def __init__(self, **options):
    
    options.setdefault('enableRaycasting', True)
    super(MyDeformerApp, self).__init__(**options)

    scene = self.getScene()

    def setupBezierDeform(node):
      # construct the bezier deformer
      self.__deformerComp = BezierDeformComponent()
      self.__gizmoComp = BezierGizmoComponent(deformerComp = self.__deformerComp)
      node.addComponent(self.__deformerComp)
      node.addComponent(self.__gizmoComp)

    self.__geometry = None
    if self.runsStandalone() and False:
      # import the cube obj file
      objPath = os.path.join(self.getApplicationFolder(), 'cube.obj')
      importer = OBJImporter(scene, filePath=objPath)
      nodesList = importer.importAsset()
  
      # loop over all constructed nodes
      for name, node in nodesList.iteritems():
        if isinstance(node, PolygonMesh):
          setupBezierDeform(node)
          self.__geometry = node
          break
    else:
      self.__geometry = PolygonMesh(scene, name = "DeformedMesh")
      self.__geometry.addComponent(PolygonMeshFromArraysComponent())
      setupBezierDeform(self.__geometry)
      # self.__geometry.addComponent(PolygonMeshToArraysComponent())

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