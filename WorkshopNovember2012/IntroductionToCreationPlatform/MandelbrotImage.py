
#
# Copyright 2010-2012 Fabric Technologies Inc. All rights reserved.
#


import FabricEngine.CreationPlatform
from Complex64 import Complex64
from FabricEngine.CreationPlatform.RT.Math import *
from FabricEngine.CreationPlatform.Nodes.Images.BaseImageImpl import BaseImage
from FabricEngine.CreationPlatform.Nodes.Animation.TimeImpl import Time

class MandelbrotImage(BaseImage):
  
  @classmethod
  def displayInNodeLibrary(cls):
    return True

  def __init__(self, scene, width = 640, height = 480, color = RGBA(0.0, 0.0, 0.0, 0.0), **kwargs):

    self.__timeOpBindings = None
    super(MandelbrotImage, self).__init__(scene, format = 'RGB', **kwargs)

    ###########################################
    # 2.0 Setup the parameters for the madelbrot set.
    dgnode = self.getDGNode()
    dgnode.addMember('width', 'UInt32', width)
    dgnode.addMember('height', 'UInt32', height)
    dgnode.addMember('color', 'RGBA', color)
    self.addMemberParameter(dgnode, 'width', True)
    self.addMemberParameter(dgnode, 'height', True)


    dgnode.addMember("center", "Complex64", Complex64(0.0, 0.0))
    dgnode.addMember("zoom", "Float64", 1.0)
    dgnode.addMember("maxIterations", "Size", 20)
    self.addMemberParameter(dgnode, 'center', True)
    self.addMemberParameter(dgnode, 'zoom', True)
    self.addMemberParameter(dgnode, 'maxIterations', True, 
      uiRange=Vec2(3, 100), 
      uiOutOfSliderRange=Vec2(1, 2000), 
      dynamicRange=True
    )


    self.bindDGOperator(dgnode.bindings,
      name = 'computePixels', 
      fileName = FabricEngine.CreationPlatform.buildAbsolutePath('Mandelbrot.kl'),
      layout = [
        'self.width',
        'self.height',
        'self.image',
        'self.center',
        'self.zoom',
        'self.maxIterations'
      ]
    )

    ###########################################
    # 4.0 Setup time reference

    self.__timeOpBindings = None
    def __changeTimeNode(data):
      if data['prevNode'] is not None and data['node'] is None:
        if self.__timeOpBindings is not None:
          dgnode.removeDependency('time')
          self.removeDGOperatorBinding(dgnode.bindings, self.__timeOpBindings)
          
        dgnode.removeDependency('time')
      if data['node'] is not None:
        dgnode.setDependency('time', data['node'].getDGNode())
        self.__timeOpBindings = self.bindDGOperator(dgnode.bindings,
          name = 'setTime', 
          sourceCode = 'operator setTime(Scalar time, io Float64 zoom){ zoom = 1.0 + time; }',
          layout = [
            'time.time',
            'self.zoom'
          ]
        )

    self.addInPort('Time', Time, __changeTimeNode)

    
###########################################
# 5.0 Register the new custom node so that it will show up in the 
# user interfaces, and be saved and loaded with the scene files.

MandelbrotImage.registerNodeClass('MandelbrotImage')