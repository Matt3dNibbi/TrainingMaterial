from FabricEngine.SceneGraph.RT.Math import *
from FabricEngine.SceneGraph.RT.BaseImpl import Base
from FabricEngine.SceneGraph import iif
from PySide import QtGui, QtCore
from FabricEngine.SceneGraph.PySide.Widgets.Parameters.ParameterWidgetImpl import ParameterWidget

class Complex64(Base):
  
  def __init__(self, re = None, im = None):
    self.re = iif(re is None, 0.0, re)
    self.im = iif(im is None, 0.0, im)

FabricEngine.SceneGraph.RT.registerType('Complex64', {
  'members' : [
    { 're' : 'Float64' },
    { 'im' : 'Float64' },
  ],
  'constructor' : Complex64,
  'klBindings' : {
    'fileName': FabricEngine.SceneGraph.buildAbsolutePath('Complex64.kl')
  }
})


class Complex64Widget(ParameterWidget):

  def __init__(self, parameter, index = 0, addEventListener = True, parentWidget=None):
    super(Complex64Widget, self).__init__(parameter, index = index, addEventListener = addEventListener, parentWidget=parentWidget)
    
    def defineLineEditSubWidget():
      widget = QtGui.QLineEdit(self)
      validator = QtGui.QDoubleValidator(self)
      widget.setValidator(validator)
      return widget
    
    self.__editReWidget = defineLineEditSubWidget()
    self.__editImWidget = defineLineEditSubWidget()
    
    layout = QtGui.QGridLayout()
    layout.addWidget(QtGui.QLabel("Re:"), 0, 0)
    layout.addWidget(self.__editReWidget, 0, 1)
    layout.addWidget(QtGui.QLabel("Im:"), 1, 0)
    layout.addWidget(self.__editImWidget, 1, 1)
    layout.setSpacing(2)
    layout.setContentsMargins(0, 0, 0, 0)
    self.setLayout(layout)
    self.setSizePolicy(QtGui.QSizePolicy.Preferred, QtGui.QSizePolicy.Fixed)
    
    self.updateWidgetValue()
    
    if self._hasSetter():
      self.__editReWidget.editingFinished.connect(self._invokeSetter)
      self.__editImWidget.editingFinished.connect(self._invokeSetter)
  
  def getWidgetValue(self):
    return Complex64(float(self.__editReWidget.text()), float(self.__editImWidget.text())) 
  
  def setWidgetValue(self, value):
    self.__editReWidget.setText(str(value.re))
    self.__editImWidget.setText(str(value.im))

  @classmethod
  def canDisplay(self, parameter):
    return parameter.getType() == "Complex64"
    

Complex64Widget.registerParameterWidget()