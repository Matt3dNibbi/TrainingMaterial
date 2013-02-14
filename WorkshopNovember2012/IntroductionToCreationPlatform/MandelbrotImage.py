
#
# Copyright 2010-2012 Fabric Technologies Inc. All rights reserved.
#


import FabricEngine.CreationPlatform
from Complex64 import Complex64
from FabricEngine.CreationPlatform.Nodes.Images.BaseImageImpl import BaseImage
from FabricEngine.CreationPlatform.Nodes.Animation.TimeImpl import Time

class MandelbrotImage(BaseImage):
  
  @classmethod
  def displayInNodeLibrary(cls):
    return True

  def __init__(self, scene, **options):

    ###########################################
    # 1.0 Setup the base image

    options.setdefault('width', 640)
    options.setdefault('height', 480)
    options.setdefault('createSlicedDGNode', True)
    options.setdefault('forceRefresh', True)
    options['format'] = 'RGB'

    super(MandelbrotImage, self).__init__(scene, **options)

    ###########################################
    # 2.0 Setup the parameters for the madelbrot set.
    dgnode = self.getDGNode()
    dgnode.addMember('width', 'UInt32', options.setdefault('width', 640))
    dgnode.addMember('height', 'UInt32', options.setdefault('height', 480))
    self._addMemberInterface(dgnode, 'width', True)
    self._addMemberInterface(dgnode, 'height', True)


    dgnode.addMember("center", "Complex64", Complex64(0.0, 0.0))
    dgnode.addMember("zoom", "Float64", 1.0)
    dgnode.addMember("maxIterations", "Size", 1536)
    self._addMemberInterface(dgnode, 'center', True)
    self._addMemberInterface(dgnode, 'zoom', True)
    self._addMemberInterface(dgnode, 'maxIterations', True)

    ###########################################
    # 3.0 Compile and bind the operator

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
          self.removeDGOperatorBinding(dgnode.bindings, self.__timeOpBindings)
          
        dgnode.removeDependency('time')
      if data['node'] is not None:
        dgnode.setDependency(data['node'].getDGNode(), 'time')
      
        self.__timeOpBindings = self.bindDGOperator(dgnode.bindings,
          name = 'setTime', 
          sourceCode = 'operator setTime(Scalar time, io Float64 zoom){ zoom = 1.0 + time; }',
          layout = [
            'time.time',
            'self.zoom'
          ]
        )

    self.addReferenceInterface('Time', Time, False, __changeTimeNode)

    
###########################################
# 5.0 Register the new custom node so that it will show up in the 
# user interfaces, and be saved and loaded with the scene files.

MandelbrotImage.registerNodeClass('MandelbrotImage')