
#
# Copyright 2010-2012 Fabric Technologies Inc. All rights reserved.
#

import math, random
from PySide import QtGui, QtCore

from FabricEngine.CreationPlatform.PySide import *
from FabricEngine.CreationPlatform.Nodes.Rendering import *

from MandelbrotImage import MandelbrotImage
import Float64WidgetImpl



class MandelBrotViewerApp(Basic3DDemoApplication):
  
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
    viewport = self.getViewport()
    standardShadersGroup = scene.getNode('StandardShaders')
    light = scene.getNode('CameraLight')

    phong = Material(scene,
      xmlFile='Standard/PhongTextured',
      shaderGroup=standardShadersGroup,
      light=light
    )
    
    self.constructionCompleted()

MandelBrotViewerApp().exec_()
