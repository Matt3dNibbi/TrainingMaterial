import os

Application.NewScene()
Application.CPLoadPythonApplication()

Application.CreateMeshText("CurveListToSolidMeshForText", "siPersistentOperation")
Application.SetValue("text.text.text", "_RTF_{\\rtf1\\ansi\\deff0{\\fonttbl{\\f0\\fnil\\fprq2\\fcharset0 Arial;}}\r\n\\viewkind4\\uc1\\pard\\lang1031\\f0\\fs16 Creation Platform\\par\r\n}\r\n", "")
Application.SetValue("polymsh.polymsh.CurveListToMesh.crvlist.TextToCurveList.fitsize", 2, "")
Application.SetValue("polymsh.polymsh.CurveListToMesh.tesselationmethod", 0, "")
Application.SetValue("polymsh.polymsh.CurveListToMesh.tesselationmethod", 2, "")
Application.FreezeObj("", "", "")
Application.DeleteObj("text")
Application.Rotate("", 0, 0, -90, "siRelative", "siAdd", "siCtr", "siXYZ", "", "", "", "", "", "", "", 0, "")

Application.applyCPTopoIOOP("", "2_BezierDeformApp.DeformedMesh")
Application.ToggleVisibility("", "", "")

Application.SIAddProp("CPRenderOptions", "Scene_Root", "siDefaultPropagation", "CPRenderOptions", "")
