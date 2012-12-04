
#
# Copyright 2010-2012 Fabric Technologies Inc. All rights reserved.
#
from FabricEngine.CreationPlatform.RT.Math.Vec3Impl import Vec3
from FabricEngine.CreationPlatform.Nodes.ComponentImpl import Component
from FabricEngine.CreationPlatform.Nodes.Geometry.PolygonMeshImpl import PolygonMesh

class BezierDeformComponent(Component):
  
  @classmethod
  def _setDefaultOptions(cls, options):
    super(BezierDeformComponent, cls)._setDefaultOptions(options)
    # options.setdefault('muscleSystem', None)
    
  @staticmethod
  def canApplyTo(node):
    return isinstance(node, PolygonMesh)
    
  def apply(self, node):
    super(BezierDeformComponent, self).apply(node)

    # construct a suffix
    prefix = 'comp_'+str(node.getNumComponents())

    # get the core node
    geometryDGNode = node.getGeometryDGNode()
    geometryDGNode.addMember(prefix+'origins', 'Scalar[]')
    geometryDGNode.addMember(prefix+'yBounds', 'Vec2')
    geometryDGNode.addMember(prefix+'control1', 'Vec3', Vec3(0.0, -4.0, 0.0))
    geometryDGNode.addMember(prefix+'control2', 'Vec3', Vec3(0.0, -3.0, 0.0))
    geometryDGNode.addMember(prefix+'control3', 'Vec3', Vec3(2.0,  4.0, 0.0))
    geometryDGNode.addMember(prefix+'control4', 'Vec3', Vec3(3.0,  4.0, 0.0))

    # add the UI elements
    self._addMemberInterface(geometryDGNode, prefix+'control1', True, label = 'control1')
    self._addMemberInterface(geometryDGNode, prefix+'control2', True, label = 'control2')
    self._addMemberInterface(geometryDGNode, prefix+'control3', True, label = 'control3')
    self._addMemberInterface(geometryDGNode, prefix+'control4', True, label = 'control4')

    # add the operator
    node.bindDGOperator(geometryDGNode.bindings,
      name = 'bezierDeformOp',
      fileName = 'BezierDeformComponent.kl',
      layout = [
        'self.polygonMesh',
        'self.attributes',
        'self.'+prefix+'origins',
        'self.'+prefix+'yBounds',
        'self.'+prefix+'control1',
        'self.'+prefix+'control2',
        'self.'+prefix+'control3',
        'self.'+prefix+'control4'
      ]
    )
      
BezierDeformComponent.registerComponentClass('BezierDeformComponent')