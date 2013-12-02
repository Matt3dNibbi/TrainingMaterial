
#
# Copyright 2010-2012 Fabric Technologies Inc. All rights reserved.
#

from FabricEngine.SceneGraph.PySide import *
from MyNodesImpl import MyValuesNode, MyResultsNode

class MyApp(SceneGraphApplication):

  def __init__(self, **options):
    super(MyApp, self).__init__(**options)

    # do all of the custom stuff
    scene = self.getScene()

    # check errors and show UI
    self.constructionCompleted()

app = MyApp()
app.exec_()