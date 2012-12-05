
#
# Copyright 2010-2012 Fabric Technologies Inc. All rights reserved.
#
from FabricEngine.CreationPlatform import camelCase, buildAbsolutePath
from FabricEngine.CreationPlatform.RT.Math.Vec3Impl import Vec3
from FabricEngine.CreationPlatform.Nodes.ComponentImpl import Component
from FabricEngine.CreationPlatform.Nodes.Geometry.PolygonMeshImpl import PolygonMesh

class BezierGizmoComponent(Component):

  __prefix = None
  
  @classmethod
  def _setDefaultOptions(cls, options):
    super(BezierGizmoComponent, cls)._setDefaultOptions(options)
    options.setdefault('deformerComp', None)

  @staticmethod
  def canApplyTo(node):
    return isinstance(node, PolygonMesh)

  def getPrefix(self):
    if self.__prefix is None:
      raise Exception("Component has to be applied first.")
    return self.__prefix

  def getGizmoMember(self):
    return self.getPrefix() + 'gizmo'
    
  def apply(self, node):
    super(BezierGizmoComponent, self).apply(node)

    deformerComp = self._getOption("deformerComp")
    if deformerComp is None:
      raise Exception("The option 'deformerComp' is obligatory.")

    # construct a prefix
    prefix = 'comp'+str(node.getNumComponents())+'_'
    self.__prefix = prefix

    # get the core node
    geometryDGNode = node.getGeometryDGNode()
    geometryDGNode.addMember(prefix+'visible', 'Boolean', True)
    geometryDGNode.addMember(prefix+'gizmo', 'GizmoType')

    # create a value interface to drive visibility
    def getVisible():
      return geometryDGNode.getData(prefix+'visible', 0)
    def setVisible(value):
      geometryDGNode.setData(prefix+'visible', 0, value)
    self._addValueInterface('visible', 'Boolean', getVisible, setVisible)

    # add the operator
    node.bindDGOperator(geometryDGNode.bindings,
      name = 'bezierGizmoOp',
      fileName = buildAbsolutePath('BezierGizmoComponent.kl'),
      layout = [
        'self.'+prefix+'visible',
        'self.'+prefix+'gizmo',
        'self.'+deformerComp.getPrefix()+'control1',
        'self.'+deformerComp.getPrefix()+'control2',
        'self.'+deformerComp.getPrefix()+'control3',
        'self.'+deformerComp.getPrefix()+'control4'
      ]
    )

    self.__pressed = 0
    def mousePressEvent(event):

      # store the mouse button pressed
      self.__pressed = event['mouseButton']

      # get the GizmoIntersection
      intersection = event['hitData']

      # get the transform of the camera
      camXfo = event['viewport'].getCameraNode().getTransformNode().getGlobalXfo()

      # construct a plane based on point and normal
      self.__planePoint = intersection.point.clone()
      self.__planeNormal = camXfo.ori.getZaxis()

      # store the gizmo id
      self.__gizmoId = intersection.gizmoId

      return True

    def mouseReleaseEvent(event):
      self.__pressed = 0
      return True

    def mouseMoveEvent(event):
      if self.__pressed == 0:
        return False
      if self.__gizmoId <= 0:
        return False

      # get the viewport
      viewport = event['viewport']

      # compute a ray towards the plane based on mouse pos
      ray = viewport.calcRayFromMouseEvent(event)

      # compute the point on the plane
      factor = ray.intersectPlane(self.__planePoint, self.__planeNormal)
      point = ray.pointFromFactor(factor)

      # determine the name of the setter function
      setterName = camelCase(['set', deformerComp.getPrefix()+'control'+str(self.__gizmoId)])

      # update the deformer position
      getattr(deformerComp, setterName)(point)
      return True

    setattr(node, 'mousePressEvent', mousePressEvent)
    setattr(node, 'mouseReleaseEvent', mouseReleaseEvent)
    setattr(node, 'mouseMoveEvent', mouseMoveEvent)

BezierGizmoComponent.registerComponentClass('BezierGizmoComponent')