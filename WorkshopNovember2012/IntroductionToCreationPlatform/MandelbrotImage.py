
#
# Copyright 2010-2012 Fabric Technologies Inc. All rights reserved.
#

from PySide import QtGui, QtCore

from FabricEngine.CreationPlatform.Nodes.Rendering import *
from FabricEngine.CreationPlatform.Nodes.Images.Image2DImpl import Image2D
from FabricEngine.CreationPlatform.Nodes.Animation.TimeImpl import Time

from Complex64 import Complex64
import Float64WidgetImpl



class MandelbrotImage(Image2D):
  
  def __init__(self, scene, **options):

    ###########################################
    # 1.0 Setup the base image

    options.setdefault('width', 640)
    options.setdefault('height', 480)
    options.setdefault('format', 'RGB')
    options.setdefault('createSlicedDGNode', True)
    options.setdefault('forceRefresh', True)

    super(MandelbrotImage, self).__init__(scene, **options)

    ###########################################
    # 2.0 Setup the parameters for the madelbrot set.
    imageAttributesDGNode = self.getAttributesDGNode()

    imageAttributesDGNode.addMember("center", "Complex64", Complex64(0.0, 0.0))
    imageAttributesDGNode.addMember("zoom", "Float64", 1.0)
    imageAttributesDGNode.addMember("maxIterations", "Size", 1536)
    
    self._addMemberInterface(imageAttributesDGNode, 'center', True)
    self._addMemberInterface(imageAttributesDGNode, 'zoom', True)
    self._addMemberInterface(imageAttributesDGNode, 'maxIterations', True)

    ###########################################
    # 3.0 Setup the pixels node. 
    pixelsDGNode = self.getPixelsDGNode()
    pixelsDGNode.setDependency(imageAttributesDGNode, 'parameters')

    self.bindDGOperator(pixelsDGNode.bindings,
      name = 'resizeNode', 
      fileName = FabricEngine.CreationPlatform.buildAbsolutePath('Mandelbrot.kl'),
      layout = [
        'self',
        'attributes.width',
        'attributes.height',
      ]
    )

    self.bindDGOperator(pixelsDGNode.bindings,
      name = 'generateMandelbrot', 
      fileName = FabricEngine.CreationPlatform.buildAbsolutePath('Mandelbrot.kl'),
      layout = [
        'self.pixels',
        'attributes.center',
        'attributes.zoom',
        'attributes.maxIterations',
        'self.index',
        'attributes.width',
        'attributes.height',
      ]
    )
    
    ###########################################
    # 4.0 Setup time reference

    self.__timeOpBindings = None
    def __changeTimeNode(data):
      if data['prevNode'] is not None and data['node'] is None:
        if self.__timeOpBindings is not None:
          self.removeDGOperatorBinding(imageAttributesDGNode.bindings, self.__timeOpBindings)
          
        imageAttributesDGNode.removeDependency('time')
      if data['node'] is not None:
        imageAttributesDGNode.setDependency(data['node'].getDGNode(), 'time')

        self.__timeOpBindings = self.bindDGOperator(imageAttributesDGNode.bindings,
          name = 'setTime', 
          sourceCode = 'operator setTime(Scalar time, io Float64 zoom){ zoom = 1.0 + time; }',
          layout = [
            'time.time',
            'self.zoom'
          ]
        )

    self.addReferenceInterface('Time', Time, False, __changeTimeNode)


MandelbrotImage.registerNodeClass('MandelbrotImage')