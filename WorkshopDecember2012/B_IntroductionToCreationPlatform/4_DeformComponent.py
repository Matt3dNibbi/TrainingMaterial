
#
# Copyright 2010-2012 Fabric Technologies Inc. All rights reserved.
#

from PySide import QtCore

from FabricEngine.CreationPlatform.PySide import *
from FabricEngine.CreationPlatform.Nodes import *
from FabricEngine.CreationPlatform.Nodes.Importers.OBJImporterImpl import OBJImporter
from FabricEngine.CreationPlatform.PySide import *
from BezierDeformComponentImpl import BezierDeformComponent

class MyDeformerApp(CreationPlatformApplication):

  def __init__(self, **options):
    super(MyDeformerApp, self).__init__(**options)

    scene = self.getScene()

    # import the cube obj file
    importer = OBJImporter(scene, filePath='cube.obj')
    nodesList = importer.importAsset()

    # loop over all constructed nodes
    for name, node in nodesList.iteritems():
      if isinstance(node, PolygonMesh):

        # construct the bezier deformer
        node.addComponent(BezierDeformComponent())
   
        # node inspector
        self.addDockWidget(QtCore.Qt.LeftDockWidgetArea, SGNodeInspectorDockWidget({ 'node':node }))

    # check errors and show UI
    self.constructionCompleted()

app = MyDeformerApp()
app.exec_()