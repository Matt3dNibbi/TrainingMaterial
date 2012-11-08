from FabricEngine.CreationPlatform.RT.Math import *
from FabricEngine.CreationPlatform.RT.BaseImpl import Base
from FabricEngine.CreationPlatform import iif
from PySide import QtGui, QtCore
from FabricEngine.CreationPlatform.PySide.Widgets.RT.RegisteredTypeWidgetImpl import RegisteredTypeWidget

class Complex64(Base):
  
  re = None
  im = None
  
  def __init__(self, re = None, im = None):
    self.re = iif(re is None, 0.0, re)
    self.im = iif(im is None, 0.0, im)

Complex64.registerRT('Complex64')
FabricEngine.CreationPlatform.RT.registerType('Complex64', {
  'members' : [
    { 're' : 'Float64' },
    { 'im' : 'Float64' },
  ],
  'constructor' : Complex64,
  'klBindings' : {
    'fileName': FabricEngine.CreationPlatform.buildAbsolutePath('Complex64.kl')
  }
})

class Complex64Widget(QtGui.QWidget, RegisteredTypeWidget):
  def __init__(self, **options):
    
    options['setWidgetValue'] = False
    QtGui.QWidget.__init__(self, options.setdefault('parentWidget', None))
    RegisteredTypeWidget.__init__(self, **options)
    
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
    
    self.setWidgetValue(options['getter']())
    
    if self._hasSetter():
      self.__editReWidget.editingFinished.connect(self._invokeSetter)
      self.__editImWidget.editingFinished.connect(self._invokeSetter)
  
  @staticmethod
  def getRTName():
    return "Complex64"
  
  def getWidgetValue(self):
    return Complex64(float(self.__editReWidget.text()), float(self.__editImWidget.text())) 
  
  def setWidgetValue(self, value):
    self.__editReWidget.setText(str(value.re))
    self.__editImWidget.setText(str(value.im))

RegisteredTypeWidget.registerRTWidget(Complex64Widget)