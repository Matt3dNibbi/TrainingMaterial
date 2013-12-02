
#
# Copyright 2010-2012 Fabric Technologies Inc. All rights reserved.
#
from FabricEngine.SceneGraph import buildAbsolutePath
from FabricEngine.SceneGraph.RT.Math.Vec3Impl import Vec3
from FabricEngine.SceneGraph.Nodes.ComponentImpl import Component
from FabricEngine.SceneGraph.Nodes.Geometry.PolygonMeshImpl import PolygonMesh

class BezierDeformComponent(Component):
  
  __prefix = None

  @classmethod
  def _setDefaultOptions(cls, options):
    super(BezierDeformComponent, cls)._setDefaultOptions(options)
    options.setdefault('scale', 0.5)
    options.setdefault('control1', Vec3(0.0, -8.0, 0.0))
    options.setdefault('control2', Vec3(0.0, 3.0, -4.0))
    options.setdefault('control3', Vec3(10.0,  -3.0, 12.0))
    options.setdefault('control4', Vec3(12.0,  4.0, 2.0))

  @staticmethod
  def canApplyTo(node):
    print node
    print PolygonMesh
    return isinstance(node, PolygonMesh)

  def getPrefix(self):
    if self.__prefix is None:
      raise Exception("Component has to be applied first.")
    return self.__prefix
    
  def apply(self, node):
    super(BezierDeformComponent, self).apply(node)

    # construct a prefix
    prefix = 'comp'+str(node.getNumComponents())+'_'
    self.__prefix = prefix

    # get the core node
    geometryDGNode = node.getGeometryDGNode()
    geometryDGNode.addMember(prefix+'origins', 'Scalar[]')
    geometryDGNode.addMember(prefix+'scale', 'Scalar', self._getOption('scale'))
    geometryDGNode.addMember(prefix+'yBounds', 'Vec2')
    geometryDGNode.addMember(prefix+'control1', 'Vec3', self._getOption('control1'))
    geometryDGNode.addMember(prefix+'control2', 'Vec3', self._getOption('control2'))
    geometryDGNode.addMember(prefix+'control3', 'Vec3', self._getOption('control3'))
    geometryDGNode.addMember(prefix+'control4', 'Vec3', self._getOption('control4'))

    # add the UI elements
    self._addMemberInterface(geometryDGNode, prefix+'scale', True, label = 'scale')
    self._addMemberInterface(geometryDGNode, prefix+'control1', True, label = 'control1')
    self._addMemberInterface(geometryDGNode, prefix+'control2', True, label = 'control2')
    self._addMemberInterface(geometryDGNode, prefix+'control3', True, label = 'control3')
    self._addMemberInterface(geometryDGNode, prefix+'control4', True, label = 'control4')

    # add the operator
    node.bindDGOperator(geometryDGNode.bindings,
      name = 'bezierDeformOp',
      fileName = buildAbsolutePath('BezierDeformComponent.kl'),
      layout = [
        'self.polygonMesh',
        'self.attributes',
        'self.'+prefix+'origins',
        'self.'+prefix+'yBounds',
        'self.'+prefix+'scale',
        'self.'+prefix+'control1',
        'self.'+prefix+'control2',
        'self.'+prefix+'control3',
        'self.'+prefix+'control4'
      ]
    )
      
BezierDeformComponent.registerComponentClass('BezierDeformComponent')