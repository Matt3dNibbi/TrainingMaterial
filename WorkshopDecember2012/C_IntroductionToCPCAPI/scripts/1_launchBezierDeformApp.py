import os

Application.NewScene()
Application.CPLoadPythonApplication()

Application.CreatePrim("Sphere", "MeshSurface", "", "")
Application.SetValue("sphere.polymsh.geom.subdivu", 24, "")
Application.SetValue("sphere.polymsh.geom.subdivv", 24, "")

Application.applyCPTopoIOOP("", "1_BezierDeformApp.DeformedMesh")

#Application.SIAddProp("CPRenderOptions", "Scene_Root", "siDefaultPropagation", "CPRenderOptions", "")
