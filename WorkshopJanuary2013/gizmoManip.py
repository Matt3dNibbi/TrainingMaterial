import sys
import random
import FabricEngine.SceneGraph
from FabricEngine.SceneGraph.Nodes.Primitives.PolygonMeshCuboidImpl import *
from FabricEngine.SceneGraph.Nodes.Rendering.MaterialImpl import *
from FabricEngine.SceneGraph.Nodes.Rendering.GeometryInstanceImpl import *
from FabricEngine.SceneGraph.Nodes.Kinematics.TransformImpl import *
from FabricEngine.SceneGraph.Nodes.Manipulation.GizmoInstanceImpl import *
from FabricEngine.SceneGraph.Nodes.Manipulation.GizmoManipulatorImpl import *
from FabricEngine.SceneGraph.RT.Math import *
from FabricEngine.SceneGraph.PySide.SceneGraphApplicationImpl import *

# any node can become manipulatable, geometries, containers etc
# you could also perform this modification / specialization using
# a component. so the dgnode creation / operator binding etc would
# happen in a component, rather than in a new inherited class. this
# depends on the case, more general cases should possible be performed
# using a component
class ManipulatableCuboid(PolygonMeshCuboid):

  def __init__(self, scene, **options):

    # call to super class
    super(ManipulatableCuboid, self).__init__(scene, **options)

    # get the geometry node
    geometryDGNode = self.getGeometryDGNode()

    # construct gizmo node
    gizmoDGNode = self.constructDGNode('Gizmo')

    # make the gizmo depend on the geometry and the bounding box
    gizmoDGNode.setDependency('geometry', geometryDGNode)
    gizmoDGNode.setDependency('bbox', self.getBoundingVolumeDGNode())

    # setup the gizmo type (required)
    gizmoDGNode.addMember('gizmo', 'GizmoType')

    # setup any additional member required for manipulation
    # this can contain temporary transforms, quaternions etc
    # these members might live on the gizmo DG node or else-
    # where, like in this case on the geometry
    geometryDGNode.addMember('gizmoPoints', 'Vec3[]')

    # setup the operator for performing the deformation
    self.bindDGOperator(geometryDGNode.bindings,
      name = 'deformManipulatableCuboid',
      layout = [
        'self.polygonMesh',
        'self.gizmoPoints'
      ],
      fileName = FabricEngine.SceneGraph.buildAbsolutePath('ManipulatableCuboid.kl')
    )

    # setup the operator to perform the drawing
    self.bindDGOperator(gizmoDGNode.bindings,
      name = 'drawManipulatableCuboidGizmos',
      layout = [
        'geometry',
        'self',
        'geometry.gizmoPoints<>',
        'bbox.localBVol<>',
        'self.gizmo<>'
      ],
      fileName = FabricEngine.SceneGraph.buildAbsolutePath('ManipulatableCuboid.kl')
    )

    # setup private members required for manipulation
    self.__gizmoHandler = None

  def getGizmoDGNodeName(self):
    return 'GizmoDGNode'

  def getGizmoDGNodeMember(self):
    return 'gizmo'

  def mousePressEvent(self, event):

    # check if this event contains a proper hit data
    self.__gizmoHandler = None
    if not event.has_key('hitData'):
      return False

    # extract the hitData
    hitData = event['hitData']

    # get the transform of the camera
    camXfo = event['viewport'].getInPort('Camera').getConnectedNode().getInPort('Transform').getConnectedNode().getParameter('globalXfo').getValue()

    # store private members
    self.__gizmoHandler = hitData.gizmoHandler
    self.__sliceId = hitData.sliceId
    self.__gizmoId = hitData.gizmoId
    self.__bindingId = hitData.bindingId
    self.__parentXfo = hitData.xfo.clone()
    self.__planePoint = hitData.point.clone()
    self.__parentOffset = self.__parentXfo.tr.subtract(self.__planePoint)
    self.__planeNormal = camXfo.ori.getZaxis()

    # in case of the 'scale' gizmo let's use a different plant axis
    if self.__gizmoHandler == 'scale':
      self.__planeNormal = self.__parentXfo.ori.getYaxis()

    return True

  def mouseMoveEvent(self, event):

    # only perform if the gizmo handler is set
    if self.__gizmoHandler is None:
      return False

    # the gizmo points live on the geometry node, so get it
    geometryDGNode = self.getGeometryDGNode()

    # get the viewport out of the event data
    viewport = event['viewport']

    # compute a ray into the scene based on the viewport
    ray = viewport.calcRayFromMouseEvent(event)

    # get the point on the temporary plane used for manipulation
    point = ray.pointFromFactor(ray.intersectPlane(self.__planePoint, self.__planeNormal))  

    # perform based on the gizmo handler
    if self.__gizmoHandler == 'center':

      # compute the translation
      translation = point.subtract(self.__planePoint)

      # get ALL of the gizmo points and update them
      gizmoPoints = geometryDGNode.getData('gizmoPoints', self.__sliceId)
      for i in range(len(gizmoPoints)):
        gizmoPoints[i] = gizmoPoints[i].add(translation)
      geometryDGNode.setData('gizmoPoints', self.__sliceId, gizmoPoints)

      # move the planepoint to the current one
      self.__planePoint = point

    elif self.__gizmoHandler == 'point':

      # compute the translation
      translation = point.subtract(self.__planePoint)

      # move only the gizmo point with the bindingId
      gizmoPoints = geometryDGNode.getData('gizmoPoints', self.__sliceId)
      gizmoPoints[self.__bindingId] = gizmoPoints[self.__bindingId].add(translation)
      geometryDGNode.setData('gizmoPoints', self.__sliceId, gizmoPoints)

      # move the planepoint to the current one
      self.__planePoint = point

    elif self.__gizmoHandler == 'scale':

      # compute the scale factor
      oldDist = self.__parentXfo.tr.subtract(self.__planePoint).length()
      if oldDist == 0.0:
        return True
      newDist = self.__parentXfo.tr.subtract(point).length()
      scale = newDist / oldDist

      # project the gizmo points locally and scale them
      gizmoPoints = geometryDGNode.getData('gizmoPoints', self.__sliceId)
      for i in range(len(gizmoPoints)):
        localPos = gizmoPoints[i].subtract(self.__parentXfo.tr)
        gizmoPoints[i] = self.__parentXfo.tr.add(localPos.multiplyScalar(scale))
      geometryDGNode.setData('gizmoPoints', self.__sliceId, gizmoPoints)

      # move the planepoint to the current one
      self.__planePoint = point

    else:
      # unknown gizmo handler
      return False

    return True

  def mouseReleaseEvent(self, event):
    self.__gizmoHandler = None
    return True    

class gizmoManipApp(SceneGraphApplication):

  def __init__(self, **options):
    super(gizmoManipApp, self).__init__(**options)
    
    # Setup Application Services. 
    self.setupUndoRedo()

    self.setupViewports()
    self.setupSunlight()
    self.setupCamera()
    self.setupGrid(gridSize = 25.0)

    scene = self.getScene()

    # setup the new node with a gizmo
    cuboid = ManipulatableCuboid(scene)

    # setup the material and rendering for the cube
    phongMaterial = Material(scene, xmlFile='PhongMaterial')
    phongMaterial.addPreset(name='red')
    transform = Transform(scene)
    GeometryInstance(scene,
      geometry=cuboid,
      transform=transform,
      material=phongMaterial,
      materialPreset='red'
    )

    # setup the manipulator
    # it can perform manipulations on any number of instances
    manipulator = GizmoManipulator(scene, name = 'ArnoldManipulator')

    # setup the manipulation instance
    # this will perform drawing of the instance on screen
    instance = GizmoInstance(scene,
      source=cuboid, 
      sourceDGNodeName=cuboid.getGizmoDGNodeName(),
      sourceMemberName=cuboid.getGizmoDGNodeMember()
    )

    # add the instance to the manipulator to make it 'manipulatable'
    manipulator.addGizmoNode(instance)

    # setup the manipulator to be a child of the camera, so they both
    # can be active at the same time
    self.getCameraManipulator().getInPort('ChildManipulator').setConnectedNode(manipulator)

    # mark the application as constructed, show the app on scree
    self.constructionCompleted()

app = gizmoManipApp()
app.exec_()