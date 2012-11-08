from PySide import QtGui, QtCore
from FabricEngine.CreationPlatform.PySide.Widgets.RT.RegisteredTypeWidgetImpl import RegisteredTypeWidget

class Float64Widget(QtGui.QLineEdit, RegisteredTypeWidget):
  def __init__(self, **options):
    QtGui.QLineEdit.__init__(self, options.setdefault('parentWidget', None))
    RegisteredTypeWidget.__init__(self, **options)
    
    self.setMinimumWidth(RegisteredTypeWidget.getRTWidgetMinWidth())
    self.setMaximumWidth(RegisteredTypeWidget.getRTWidgetMaxWidth())
    
    self.setSizePolicy(QtGui.QSizePolicy.Preferred, QtGui.QSizePolicy.Fixed)
    
    validator = QtGui.QDoubleValidator(self)
    self.setValidator(validator)
    
    if self._hasSetter():
      self.editingFinished.connect(self._invokeSetter)

  @classmethod
  def getRTName(cls):
    return "Float64"
  
  def getWidgetValue(self):
    return float(self.text())
    
  def setWidgetValue(self, value):
    self.setText(str(value))

RegisteredTypeWidget.registerRTWidget(Float64Widget)