
#
# Copyright 2010-2012 Fabric Technologies Inc. All rights reserved.
#

import math, random
from PySide import QtGui, QtCore

from FabricEngine.CreationPlatform.Nodes.Importers.AlembicImporterImpl import AlembicImporter
from FabricEngine.CreationPlatform.PySide import *
from FabricEngine.CreationPlatform.Nodes.Rendering import *

from MandelbrotImage import MandelbrotImage
import Float64WidgetImpl



class MandelBrotViewerApp(CreationPlatformApplication):
  
  def __init__(self):
    super(MandelBrotViewerApp, self).__init__(
      setupGlobalTimeNode = True,
      setupSelection = False,
      setupUndoRedo = True,
      setupPersistence = True,
      enableRaycasting = True,
      setupImport = True
    )

    self.setWindowTitle("MandelBrot Viewer App")

    # query the constructed components
    scene = self.getScene()

    phong = Material(scene, xmlFile='PhongTexturedMaterial')
    
    self.constructionCompleted()

MandelBrotViewerApp().exec_()
