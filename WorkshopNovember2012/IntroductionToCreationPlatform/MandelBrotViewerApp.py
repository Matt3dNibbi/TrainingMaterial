
#
# Copyright 2010-2012 Fabric Technologies Inc. All rights reserved.
#

import math, random
from PySide import QtGui, QtCore

from FabricEngine.CreationPlatform.Nodes.Rendering import *
from FabricEngine.CreationPlatform.Nodes.Images import *
from FabricEngine.CreationPlatform.Nodes.Importers.AlembicImporterImpl import AlembicImporter
from FabricEngine.CreationPlatform.PySide import *


from MandelbrotImage import MandelbrotImage


class MandelBrotViewerApp(CreationPlatformApplication):
  
  def __init__(self):
    
    super(MandelBrotViewerApp, self).__init__()

    self.setWindowTitle("Creation Platform Mandelbrot Set Browser")
    
    self.setupViewports()
    
    # Setup Application Services. 
    self.setupUndoRedo()

    self.setupSunlight()
    self.setupCamera()
    self.setupGrid(gridSize = 25.0)
    self.setupGlobalTimeNode()
    self.setupImport()

    self.setWindowTitle("MandelBrot Viewer App")

    # query the constructed components
    scene = self.getScene()
    viewport = self.getViewport()

    # phongTexturedMaterial = Material(scene, xmlFile='PhongTexturedMaterial')
    
    self.constructionCompleted()

MandelBrotViewerApp().exec_()
