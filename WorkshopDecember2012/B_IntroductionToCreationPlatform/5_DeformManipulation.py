
#
# Copyright 2010-2012 Fabric Technologies Inc. All rights reserved.
#

from PySide import QtCore

from FabricEngine.SceneGraph.PySide import *
from FabricEngine.SceneGraph.Nodes import *
from FabricEngine.SceneGraph.Nodes.Manipulation import *
from FabricEngine.SceneGraph.Nodes.Manipulation.GizmoInstanceImpl import *
from FabricEngine.SceneGraph.Nodes.Importers.OBJImporterImpl import OBJImporter
from FabricEngine.SceneGraph.PySide import *
from BezierDeformComponentImpl import BezierDeformComponent
from BezierGizmoComponentImpl import BezierGizmoComponent

class MyDeformerApp(SceneGraphApplication):

  def __init__(self, **options):
    super(MyDeformerApp, self).__init__(**options)

    # Setup Application Services. 
    self.setupUndoRedo()

    self.setupViewports()
    self.setupSunlight()
    self.setupCamera()
    self.setupGrid(gridSize = 25.0)

    scene = self.getScene()

    # import the cube obj file
    importer = OBJImporter(scene, filePath='cube.obj')
    nodesList = importer.importAsset()

    # loop over all constructed nodes
    for name, node in nodesList.iteritems():
      if isinstance(node, PolygonMesh):

        # construct the bezier deformer
        deformerComp = BezierDeformComponent()
        gizmoComp = BezierGizmoComponent(deformerComp = deformerComp)
        node.addComponent(deformerComp)
        node.addComponent(gizmoComp)
   
        # setup the gizmo
        manipulator = GizmoManipulator(scene)
        gizmo = GizmoInstance(scene,
          source=node, 
          sourceDGNodeName='GeometryDGNode', 
          sourceMemberName=gizmoComp.getGizmoMember()
        )
        manipulator.addGizmoNode(gizmo)

        self.getCameraManipulator().setChildManipulatorNode(manipulator)

        # node inspector
        self.addDockWidget(QtCore.Qt.LeftDockWidgetArea, SGNodeInspectorDockWidget({ 'node':node }))

    # check errors and show UI
    self.constructionCompleted()

app = MyDeformerApp()
app.exec_()