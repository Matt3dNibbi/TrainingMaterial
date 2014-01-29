//Maya ASCII 2014 scene
//Name: 12_raycasting.ma
//Last modified: Tue, Nov 19, 2013 12:23:21 PM
//Codeset: 1252
requires maya "2014";
requires -nodeType "spliceMayaNode" -nodeType "spliceMayaDeformer" -dataType "SpliceMayaData"
		 "FabricSpliceMaya2014" "1.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2014";
fileInfo "version" "2014 x64";
fileInfo "cutIdentifier" "201306050448-875228";
fileInfo "osv" "Microsoft Windows 7 Business Edition, 64-bit Windows 7 Service Pack 1 (Build 7601)\n";
createNode transform -s -n "persp";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 8.6994787097733379 11.510786614358707 18.54389465074221 ;
	setAttr ".r" -type "double3" -31.538352729600735 25.800000000000196 0 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 23.655918371909308;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 100.1 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 100.1 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 100.1 0 0 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "pSphere1";
createNode mesh -n "pSphereShape1" -p "pSphere1";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode mesh -n "pSphereShape1Orig" -p "pSphere1";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "pCube1";
createNode mesh -n "pCubeShape1" -p "pCube1";
	setAttr -k off ".v";
	setAttr -s 2 ".iog";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode displayLayerManager -n "layerManager";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
createNode script -n "uiConfigurationScriptNode";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"top\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n"
		+ "                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n"
		+ "                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n"
		+ "                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n"
		+ "            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n"
		+ "            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"side\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n"
		+ "                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n"
		+ "                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n"
		+ "                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n"
		+ "            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n"
		+ "            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"front\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n"
		+ "                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n"
		+ "                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n"
		+ "                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n"
		+ "            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n"
		+ "            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n"
		+ "        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n"
		+ "                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n"
		+ "                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n"
		+ "                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n"
		+ "            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n"
		+ "            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n"
		+ "            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            outlinerEditor -e \n                -docTag \"isolOutln_fromSeln\" \n                -showShapes 1\n                -showReferenceNodes 1\n                -showReferenceMembers 1\n                -showAttributes 0\n                -showConnected 0\n                -showAnimCurvesOnly 0\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n"
		+ "                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 1\n                -showAssets 1\n                -showContainedOnly 1\n                -showPublishedAsConnected 0\n                -showContainerContents 1\n                -ignoreDagHierarchy 0\n                -expandConnections 0\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 0\n                -highlightActive 1\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"defaultSetFilter\" \n                -showSetMembers 1\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n"
		+ "                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 1\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n"
		+ "            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n"
		+ "            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"graphEditor\" -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n"
		+ "                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n"
		+ "                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n"
		+ "                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n"
		+ "                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n"
		+ "                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n"
		+ "                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dopeSheetPanel\" -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n"
		+ "                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n"
		+ "                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n"
		+ "                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n"
		+ "                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n"
		+ "                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"sequenceEditorPanel\" -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n"
		+ "                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n"
		+ "                -showConnectionToSelected 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n"
		+ "                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperShadePanel\" -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"visorPanel\" -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -defaultPinnedState 0\n                -ignoreAssets 1\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -keyReleaseCommand \"nodeEdKeyReleaseCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -island 0\n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n"
		+ "                -syncedSelection 1\n                -extendToShapes 1\n                $editorName;;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -defaultPinnedState 0\n                -ignoreAssets 1\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -keyReleaseCommand \"nodeEdKeyReleaseCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -island 0\n                -showNamespace 1\n"
		+ "                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -syncedSelection 1\n                -extendToShapes 1\n                $editorName;;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"createNodePanel\" -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Texture Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"blendShapePanel\" (localizedPanelLabel(\"Blend Shape\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\tblendShapePanel -unParent -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tblendShapePanel -edit -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"scriptEditorPanel\" -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"wireframe\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"wireframe\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 24 -ast 1 -aet 48 ";
	setAttr ".st" 6;
createNode polySphere -n "polySphere1";
	setAttr ".r" 12.376933341306962;
	setAttr ".sa" 51;
	setAttr ".sh" 51;
createNode polyCube -n "polyCube1";
	setAttr ".w" 5;
	setAttr ".h" 5;
	setAttr ".d" 5;
	setAttr ".sw" 4;
	setAttr ".sh" 4;
	setAttr ".sd" 4;
	setAttr ".cuv" 4;
createNode spliceMayaDeformer -n "spliceMayaDeformer1";
	addAttr -ci true -sn "mesh0" -ln "mesh0" -dt "SpliceMayaData";
	addAttr -ci true -sn "target" -ln "target" -dt "mesh";
	addAttr -ci true -k true -sn "factor" -ln "factor" -at "double";
	setAttr ".cch" no;
	setAttr ".ihi" 2;
	setAttr ".nds" 0;
	setAttr ".ip[0].ig" -type "mesh" 


		"v"	2552
		0.7561596	-12.353458	-0.093632497
		0.738922	-12.353458	-0.18584599
		0.71048301	-12.353458	-0.27524224
		0.67127389	-12.353458	-0.36046609
		0.62188894	-12.353458	-0.44022563
		0.56307679	-12.353458	-0.51331186
		0.49572897	-12.353458	-0.57861674
		0.42086637	-12.353458	-0.63515043
		0.33962384	-12.353458	-0.68205589
		0.25323302	-12.353458	-0.71862203
		0.1630034	-12.353458	-0.74429464
		0.070302814	-12.353458	-0.75868446
		-0.023463495	-12.353458	-0.76157343
		-0.11687412	-12.353458	-0.75291777
		-0.20851307	-12.353458	-0.73284858
		-0.29699117	-12.353458	-0.70167017
		-0.3809672	-12.353458	-0.65985507
		-0.45916814	-12.353458	-0.60803729
		-0.53040856	-12.353458	-0.54700232
		-0.5936085	-12.353458	-0.47767532
		-0.64780998	-12.353458	-0.40110725
		-0.6921913	-12.353458	-0.3184588
		-0.72607976	-12.353458	-0.23098283
		-0.74896151	-12.353458	-0.14000539
		-0.76048982	-12.353458	-0.046905622
		-0.76048988	-12.353458	0.046905201
		-0.74896163	-12.353458	0.14000499
		-0.72607994	-12.353458	0.23098245
		-0.6921916	-12.353458	0.31845847
		-0.64781034	-12.353458	0.40110698
		-0.59360892	-12.353458	0.47767511
		-0.53040898	-12.353458	0.5470022
		-0.45916858	-12.353458	0.60803723
		-0.38096768	-12.353458	0.65985507
		-0.29699165	-12.353458	0.70167017
		-0.20851354	-12.353458	0.7328487
		-0.11687458	-12.353458	0.75291795
		-0.023463927	-12.353458	0.76157379
		0.070302427	-12.353458	0.75868487
		0.16300306	-12.353458	0.74429512
		0.25323272	-12.353458	0.71862257
		0.33962366	-12.353458	0.68205643
		0.42086622	-12.353458	0.63515103
		0.49572894	-12.353458	0.57861733
		0.56307685	-12.353458	0.51331246
		0.62188917	-12.353458	0.44022623
		0.67127419	-12.353458	0.36046666
		0.71048337	-12.353458	0.27524275
		0.73892242	-12.353458	0.18584646
		0.75616014	-12.353458	0.093632922
		0.76193523	-12.353458	0
		1.5094509	-12.283122	-0.18690982
		1.475041	-12.283122	-0.370987
		1.4182711	-12.283122	-0.54944038
		1.3400015	-12.283122	-0.71956486
		1.2414188	-12.283122	-0.87878138
		1.1240177	-12.283122	-1.0246766
		0.98957753	-12.283122	-1.1550387
		0.84013623	-12.283122	-1.2678915
		0.67795938	-12.283122	-1.3615245
		0.50550544	-12.283122	-1.4345181
		0.32538849	-12.283122	-1.4857659
		0.14033894	-12.283122	-1.5144911
		-0.046837986	-12.283122	-1.5202581
		-0.23330492	-12.283122	-1.5029795
		-0.41623518	-12.283122	-1.4629173
		-0.59285575	-12.283122	-1.4006786
		-0.76048928	-12.283122	-1.3172071
		-0.91659451	-12.283122	-1.2137681
		-1.0588051	-12.283122	-1.0919297
		-1.1849654	-12.283122	-0.95353872
		-1.2931627	-12.283122	-0.80069298
		-1.381757	-12.283122	-0.63570958
		-1.4494052	-12.283122	-0.46108946
		-1.495082	-12.283122	-0.27947971
		-1.5180949	-12.283122	-0.093633316
		-1.518095	-12.283122	0.093632482
		-1.4950823	-12.283122	0.27947891
		-1.4494057	-12.283122	0.46108875
		-1.3817575	-12.283122	0.63570893
		-1.2931633	-12.283122	0.80069244
		-1.1849661	-12.283122	0.95353824
		-1.0588059	-12.283122	1.0919294
		-0.9165954	-12.283122	1.213768
		-0.76049024	-12.283122	1.3172071
		-0.59285671	-12.283122	1.4006788
		-0.41623613	-12.283122	1.4629176
		-0.23330581	-12.283122	1.5029799
		-0.046838846	-12.283122	1.5202587
		0.14033817	-12.283122	1.5144919
		0.32538781	-12.283122	1.4857669
		0.50550491	-12.283122	1.4345192
		0.67795902	-12.283122	1.3615257
		0.84013599	-12.283122	1.2678927
		0.98957741	-12.283122	1.1550398
		1.1240178	-12.283122	1.0246778
		1.2414193	-12.283122	0.87878257
		1.3400021	-12.283122	0.71956599
		1.4182718	-12.283122	0.54944146
		1.4750419	-12.283122	0.37098795
		1.509452	-12.283122	0.18691067
		1.5209802	-12.283122	0
		2.2570162	-12.166192	-0.2794781
		2.2055645	-12.166192	-0.5547207
		2.1206789	-12.166192	-0.8215543
		2.0036457	-12.166192	-1.0759339
		1.8562396	-12.166192	-1.3140035
		1.6806947	-12.166192	-1.5321542
		1.4796722	-12.166192	-1.727079
		1.2562191	-12.166192	-1.895823
		1.0137231	-12.166192	-2.0358284
		0.75586027	-12.166192	-2.1449726
		0.48653924	-12.166192	-2.2216012
		0.20984271	-12.166192	-2.2645526
		-0.070034802	-12.166192	-2.2731757
		-0.34885067	-12.166192	-2.2473397
		-0.62237835	-12.166192	-2.1874366
		-0.88647139	-12.166192	-2.0943737
		-1.1371264	-12.166192	-1.9695625
		-1.3705438	-12.166192	-1.8148947
		-1.5831852	-12.166192	-1.632715
		-1.7718271	-12.166192	-1.4257849
		-1.9336098	-12.166192	-1.1972414
		-2.066081	-12.166192	-0.95054883
		-2.1672325	-12.166192	-0.68944699
		-2.2355311	-12.166192	-0.41789386
		-2.2699411	-12.166192	-0.14000583
		-2.2699413	-12.166192	0.14000458
		-2.2355313	-12.166192	0.41789263
		-2.1672332	-12.166192	0.68944591
		-2.0660818	-12.166192	0.95054787
		-1.9336108	-12.166192	1.1972406
		-1.7718282	-12.166192	1.4257842
		-1.5831864	-12.166192	1.6327145
		-1.3705453	-12.166192	1.8148944
		-1.1371279	-12.166192	1.9695625
		-0.88647282	-12.166192	2.0943739
		-0.62237978	-12.166192	2.1874368
		-0.34885204	-12.166192	2.2473404
		-0.070036091	-12.166192	2.2731767
		0.20984156	-12.166192	2.2645538
		0.48653823	-12.166192	2.2216024
		0.75585943	-12.166192	2.144974
		1.0137227	-12.166192	2.03583
		1.2562188	-12.166192	1.8958248
		1.4796721	-12.166192	1.7270808
		1.6806949	-12.166192	1.532156
		1.8562402	-12.166192	1.3140053
		2.0036466	-12.166192	1.0759356
		2.1206799	-12.166192	0.82155585
		2.2055659	-12.166192	0.55472213
		2.2570179	-12.166192	0.27947938
		2.2742555	-12.166192	0
		2.9960201	-12.003112	-0.37098628
		2.927722	-12.003112	-0.73635024
		2.8150425	-12.003112	-1.0905519
		2.6596899	-12.003112	-1.4282218
		2.4640191	-12.003112	-1.7442414
		2.2309964	-12.003112	-2.0338202
		1.964154	-12.003112	-2.2925682
		1.6675369	-12.003112	-2.5165632
		1.3456416	-12.003112	-2.7024097
		1.0033479	-12.003112	-2.8472903
		0.6458444	-12.003112	-2.9490092
		0.27855051	-12.003112	-3.0060239
		-0.092965961	-12.003112	-3.0174706
		-0.46307316	-12.003112	-2.9831753
		-0.82616067	-12.003112	-2.9036582
		-1.1767244	-12.003112	-2.7801244
		-1.5094503	-12.003112	-2.6144469
		-1.8192945	-12.003112	-2.4091368
		-2.1015599	-12.003112	-2.1673069
		-2.3519678	-12.003112	-1.8926227
		-2.5667224	-12.003112	-1.5892483
		-2.742568	-12.003112	-1.2617824
		-2.8768389	-12.003112	-0.91518927
		-2.9675002	-12.003112	-0.55472279
		-3.0131769	-12.003112	-0.18584725
		-3.0131772	-12.003112	0.18584558
		-2.9675007	-12.003112	0.55472118
		-2.8768399	-12.003112	0.91518784
		-2.742569	-12.003112	1.2617812
		-2.5667236	-12.003112	1.5892472
		-2.3519692	-12.003112	1.8926219
		-2.1015615	-12.003112	2.1673064
		-1.8192962	-12.003112	2.4091365
		-1.5094522	-12.003112	2.6144469
		-1.1767263	-12.003112	2.7801247
		-0.82616252	-12.003112	2.9036589
		-0.46307495	-12.003112	2.9831762
		-0.092967667	-12.003112	3.0174718
		0.27854896	-12.003112	3.0060256
		0.64584309	-12.003112	2.9490111
		1.0033468	-12.003112	2.8472927
		1.3456409	-12.003112	2.7024121
		1.6675364	-12.003112	2.5165656
		1.9641539	-12.003112	2.2925704
		2.2309968	-12.003112	2.0338223
		2.46402	-12.003112	1.7442436
		2.6596911	-12.003112	1.4282241
		2.8150439	-12.003112	1.0905539
		2.9277236	-12.003112	0.73635209
		2.9960222	-12.003112	0.37098798
		3.018904	-12.003112	0
		3.7236588	-11.794499	-0.46108714
		3.6387732	-11.794499	-0.91518646
		3.4987276	-11.794499	-1.3554125
		3.3056445	-11.794499	-1.7750918
		3.0624516	-11.794499	-2.1678624
		2.772835	-11.794499	-2.5277708
		2.441185	-11.794499	-2.8493605
		2.0725291	-11.794499	-3.1277568
		1.6724555	-11.794499	-3.3587396
		1.2470294	-11.794499	-3.5388074
		0.80269963	-11.794499	-3.6652305
		0.34620163	-11.794499	-3.7360923
		-0.11554445	-11.794499	-3.750319
		-0.57553899	-11.794499	-3.7076945
		-1.026809	-11.794499	-3.6088653
		-1.4625137	-11.794499	-3.4553289
		-1.8760481	-11.794499	-3.2494133
		-2.2611437	-11.794499	-2.99424
		-2.6119623	-11.794499	-2.6936774
		-2.9231865	-11.794499	-2.3522811
		-3.1900983	-11.794499	-1.9752265
		-3.4086511	-11.794499	-1.5682296
		-3.5755324	-11.794499	-1.1374599
		-3.6882122	-11.794499	-0.68944746
		-3.7449825	-11.794499	-0.23098369
		-3.7449827	-11.794499	0.23098162
		-3.6882129	-11.794499	0.68944544
		-3.5755334	-11.794499	1.1374581
		-3.4086525	-11.794499	1.568228
		-3.1900997	-11.794499	1.9752252
		-2.9231884	-11.794499	2.3522799
		-2.6119645	-11.794499	2.6936767
		-2.2611458	-11.794499	2.9942398
		-1.8760505	-11.794499	3.2494133
		-1.4625161	-11.794499	3.4553292
		-1.0268114	-11.794499	3.608866
		-0.57554126	-11.794499	3.7076955
		-0.11554658	-11.794499	3.7503204
		0.34619972	-11.794499	3.7360945
		0.80269796	-11.794499	3.6652327
		1.2470281	-11.794499	3.53881
		1.6724546	-11.794499	3.3587427
		2.0725284	-11.794499	3.1277599
		2.4411848	-11.794499	2.8493636
		2.7728355	-11.794499	2.5277736
		3.0624526	-11.794499	2.1678653
		3.3056462	-11.794499	1.7750946
		3.4987292	-11.794499	1.355415
		3.6387753	-11.794499	0.91518879
		3.7236614	-11.794499	0.46108922
		3.7521005	-11.794499	0
		4.4371724	-11.541146	-0.54943895
		4.3360214	-11.541146	-1.0905511
		4.1691408	-11.541146	-1.6151316
		3.93906	-11.541146	-2.1152284
		3.6492672	-11.541146	-2.5832603
		3.3041553	-11.541146	-3.0121329
		2.9089558	-11.541146	-3.3953445
		2.4696593	-11.541146	-3.7270861
		1.9929253	-11.541146	-4.0023289
		1.4859806	-11.541146	-4.2169003
		0.95651001	-11.541146	-4.3675485
		0.41253948	-11.541146	-4.4519887
		-0.13768466	-11.541146	-4.4689412
		-0.68582165	-11.541146	-4.418149
		-1.2235624	-11.541146	-4.3003826
		-1.7427552	-11.541146	-4.1174264
		-2.2355294	-11.541146	-3.8720539
		-2.6944156	-11.541146	-3.5679853
		-3.112457	-11.541146	-3.2098298
		-3.4833167	-11.541146	-2.8030164
		-3.801373	-11.541146	-2.3537121
		-4.0618043	-11.541146	-1.8687279
		-4.2606626	-11.541146	-1.3554157
		-4.3949337	-11.541146	-0.82155687
		-4.4625821	-11.541146	-0.27524394
		-4.4625826	-11.541146	0.27524146
		-4.3949347	-11.541146	0.82155442
		-4.260664	-11.541146	1.3554136
		-4.0618057	-11.541146	1.868726
		-3.8013749	-11.541146	2.3537107
		-3.4833188	-11.541146	2.8030152
		-3.1124594	-11.541146	3.2098291
		-2.6944182	-11.541146	3.5679851
		-2.2355323	-11.541146	3.8720539
		-1.7427579	-11.541146	4.1174264
		-1.2235651	-11.541146	4.3003836
		-0.68582433	-11.541146	4.4181504
		-0.13768719	-11.541146	4.4689431
		0.41253722	-11.541146	4.4519911
		0.95650798	-11.541146	4.3675513
		1.485979	-11.541146	4.2169037
		1.9929242	-11.541146	4.0023327
		2.4696586	-11.541146	3.7270896
		2.9089556	-11.541146	3.3953481
		3.3041558	-11.541146	3.0121362
		3.6492684	-11.541146	2.5832636
		3.9390616	-11.541146	2.1152318
		4.1691427	-11.541146	1.6151346
		4.3360243	-11.541146	1.0905539
		4.4371758	-11.541146	0.54944146
		4.4710641	-11.541146	0
		5.1338539	-11.244014	-0.63570648
		5.0168214	-11.244014	-1.2617788
		4.8237386	-11.244014	-1.8687239
		4.5575328	-11.244014	-2.447341
		4.2222395	-11.244014	-2.9888587
		3.8229418	-11.244014	-3.4850686
		3.3656919	-11.244014	-3.9284484
		2.8574212	-11.244014	-4.3122768
		2.305835	-11.244014	-4.6307359
		1.7192948	-11.244014	-4.8789973
		1.1066918	-11.244014	-5.0532985
		0.47731245	-11.244014	-5.1509967
		-0.15930256	-11.244014	-5.1706109
		-0.79350275	-11.244014	-5.1118441
		-1.4156742	-11.244014	-4.9755869
		-2.0163856	-11.244014	-4.7639046
		-2.5865307	-11.244014	-4.4800062
		-3.1174664	-11.244014	-4.1281958
		-3.6011446	-11.244014	-3.7138062
		-4.0302334	-11.244014	-3.2431188
		-4.3982277	-11.244014	-2.7232692
		-4.6995492	-11.244014	-2.1621373
		-4.9296303	-11.244014	-1.5682299
		-5.0849838	-11.244014	-0.95054972
		-5.1632538	-11.244014	-0.31846005
		-5.1632538	-11.244014	0.31845719
		-5.0849848	-11.244014	0.95054692
		-4.9296322	-11.244014	1.5682274
		-4.6995511	-11.244014	2.1621351
		-4.3982296	-11.244014	2.7232673
		-4.0302358	-11.244014	3.2431173
		-3.6011474	-11.244014	3.7138052
		-3.1174695	-11.244014	4.1281953
		-2.5865338	-11.244014	4.4800062
		-2.0163889	-11.244014	4.763905
		-1.4156774	-11.244014	4.9755878
		-0.79350579	-11.244014	5.1118455
		-0.15930548	-11.244014	5.1706128
		0.47730982	-11.244014	5.1509991
		1.1066896	-11.244014	5.0533013
		1.719293	-11.244014	4.8790011
		2.3058338	-11.244014	4.6307397
		2.8574202	-11.244014	4.3122811
		3.3656917	-11.244014	3.9284525
		3.8229423	-11.244014	3.4850726
		4.2222409	-11.244014	2.9888628
		4.5575347	-11.244014	2.4473448
		4.823741	-11.244014	1.8687274
		5.0168242	-11.244014	1.2617821
		5.1338577	-11.244014	0.6357094
		5.1730671	-11.244014	0
		5.8110619	-10.904229	-0.71956265
		5.6785913	-10.904229	-1.4282203
		5.4600387	-10.904229	-2.1152275
		5.1587176	-10.904229	-2.7701702
		4.7791958	-10.904229	-3.3831196
		4.3272266	-10.904229	-3.9447846
		3.8096609	-10.904229	-4.446651
		3.2343442	-10.904229	-4.8811102
		2.609998	-10.904229	-5.2415771
		1.9460874	-10.904229	-5.5225868
		1.2526758	-10.904229	-5.7198801
		0.5402748	-10.904229	-5.8304653
		-0.18031619	-10.904229	-5.8526669
		-0.89817381	-10.904229	-5.7861481
		-1.602416	-10.904229	-5.6319175
		-2.2823675	-10.904229	-5.392312
		-2.9277203	-10.904229	-5.0709648
		-3.528692	-10.904229	-4.6727467
		-4.0761724	-10.904229	-4.2036948
		-4.561862	-10.904229	-3.6709192
		-4.9783988	-10.904229	-3.0824962
		-5.3194675	-10.904229	-2.4473453
		-5.5798988	-10.904229	-1.7750955
		-5.7557449	-10.904229	-1.0759369
		-5.8443394	-10.904229	-0.36046818
		-5.8443398	-10.904229	0.36046493
		-5.7557459	-10.904229	1.0759337
		-5.5799007	-10.904229	1.7750926
		-5.3194699	-10.904229	2.4473429
		-4.9784012	-10.904229	3.082494
		-4.5618649	-10.904229	3.6709175
		-4.0761752	-10.904229	4.2036939
		-3.5286956	-10.904229	4.6727462
		-2.9277239	-10.904229	5.0709648
		-2.282371	-10.904229	5.3923125
		-1.6024197	-10.904229	5.6319184
		-0.89817733	-10.904229	5.78615
		-0.1803195	-10.904229	5.8526697
		0.54027182	-10.904229	5.8304687
		1.2526731	-10.904229	5.7198834
		1.9460852	-10.904229	5.5225906
		2.6099968	-10.904229	5.2415814
		3.2343431	-10.904229	4.881115
		3.8096604	-10.904229	4.4466553
		4.3272271	-10.904229	3.9447892
		4.7791977	-10.904229	3.3831241
		5.15872	-10.904229	2.7701745
		5.4600415	-10.904229	2.1152315
		5.6785946	-10.904229	1.428224
		5.8110657	-10.904229	0.71956593
		5.8554473	-10.904229	0
		6.4662256	-10.52308	-0.80068922
		6.31882	-10.52308	-1.589244
		6.0756269	-10.52308	-2.3537073
		5.7403336	-10.52308	-3.0824909
		5.3180227	-10.52308	-3.7645469
		4.8150969	-10.52308	-4.3895364
		4.2391782	-10.52308	-4.9479852
		3.5989981	-10.52308	-5.4314275
		2.9042604	-10.52308	-5.8325348
		2.1654975	-10.52308	-6.1452265
		1.3939078	-10.52308	-6.3647637
		0.60118771	-10.52308	-6.4878168
		-0.2006458	-10.52308	-6.5125217
		-0.99943775	-10.52308	-6.4385033
		-1.7830793	-10.52308	-6.2668839
		-2.5396912	-10.52308	-6.0002642
		-3.2578042	-10.52308	-5.6426868
		-3.9265318	-10.52308	-5.1995721
		-4.5357375	-10.52308	-4.6776376
		-5.0761857	-10.52308	-4.0847945
		-5.5396848	-10.52308	-3.4300299
		-5.9192071	-10.52308	-2.7232695
		-6.2090006	-10.52308	-1.9752272
		-6.4046721	-10.52308	-1.1972426
		-6.5032549	-10.52308	-0.40110889
		-6.5032554	-10.52308	0.40110531
		-6.4046731	-10.52308	1.1972392
		-6.2090025	-10.52308	1.9752241
		-5.9192095	-10.52308	2.7232668
		-5.5396872	-10.52308	3.4300275
		-5.076189	-10.52308	4.0847926
		-4.5357409	-10.52308	4.6776361
		-3.9265358	-10.52308	5.1995716
		-3.2578082	-10.52308	5.6426868
		-2.5396953	-10.52308	6.0002646
		-1.7830833	-10.52308	6.2668848
		-0.99944162	-10.52308	6.4385052
		-0.2006495	-10.52308	6.5125246
		0.60118437	-10.52308	6.4878206
		1.3939049	-10.52308	6.3647676
		2.1654952	-10.52308	6.1452312
		2.904259	-10.52308	5.83254
		3.5989969	-10.52308	5.4314322
		4.2391782	-10.52308	4.9479904
		4.8150973	-10.52308	4.3895416
		5.3180251	-10.52308	3.7645519
		5.7403364	-10.52308	3.0824957
		6.0756302	-10.52308	2.3537118
		6.3188238	-10.52308	1.5892481
		6.4662304	-10.52308	0.80069292
		6.5156155	-10.52308	0
		7.0968609	-10.102015	-0.87877852
		6.9350791	-10.102015	-1.7442391
		6.6681681	-10.102015	-2.5832586
		6.3001747	-10.102015	-3.3831189
		5.8366771	-10.102015	-4.1316943
		5.2847013	-10.102015	-4.8176374
		4.6526151	-10.102015	-5.4305501
		3.9499996	-10.102015	-5.9611416
		3.187506	-10.102015	-6.4013677
		2.3766932	-10.102015	-6.744556
		1.5298523	-10.102015	-6.9855037
		0.65982008	-10.102015	-7.1205583
		-0.22021431	-10.102015	-7.1476722
		-1.0969105	-10.102015	-7.0664349
		-1.9569787	-10.102015	-6.878078
		-2.7873812	-10.102015	-6.5854559
		-3.5755298	-10.102015	-6.1930046
		-4.3094769	-10.102015	-5.7066736
		-4.978097	-10.102015	-5.1338363
		-5.5712543	-10.102015	-4.4831743
		-6.0799565	-10.102015	-3.7645524
		-6.4964933	-10.102015	-2.9888635
		-6.8145494	-10.102015	-2.1678665
		-7.029304	-10.102015	-1.3140068
		-7.1375017	-10.102015	-0.44022807
		-7.1375022	-10.102015	0.44022414
		-7.0293055	-10.102015	1.314003
		-6.8145518	-10.102015	2.1678629
		-6.4964957	-10.102015	2.9888604
		-6.0799599	-10.102015	3.76455
		-5.5712576	-10.102015	4.4831724
		-4.9781008	-10.102015	5.1338348
		-4.3094811	-10.102015	5.7066731
		-3.5755343	-10.102015	6.1930046
		-2.7873857	-10.102015	6.5854559
		-1.9569832	-10.102015	6.8780794
		-1.0969148	-10.102015	7.0664372
		-0.22021836	-10.102015	7.1476755
		0.65981644	-10.102015	7.1205621
		1.5298491	-10.102015	6.985508
		2.3766906	-10.102015	6.7445612
		3.1875043	-10.102015	6.4013734
		3.9499984	-10.102015	5.9611468
		4.6526146	-10.102015	5.4305558
		5.2847023	-10.102015	4.8176432
		5.836679	-10.102015	4.1316996
		6.3001776	-10.102015	3.3831241
		6.6681714	-10.102015	2.5832636
		6.9350834	-10.102015	1.7442436
		7.0968661	-10.102015	0.87878251
		7.1510677	-10.102015	0
		7.7005758	-9.6426277	-0.95353436
		7.5250311	-9.6426277	-1.8926178
		7.235415	-9.6426277	-2.8030109
		6.8361168	-9.6426277	-3.6709135
		6.3331904	-9.6426277	-4.4831686
		5.7342596	-9.6426277	-5.2274637
		5.0484033	-9.6426277	-5.8925157
		4.2860174	-9.6426277	-6.4682431
		3.4586601	-9.6426277	-6.9459186
		2.5788734	-9.6426277	-7.3183007
		1.6599935	-9.6426277	-7.5797453
		0.71594954	-9.6426277	-7.7262888
		-0.23894747	-9.6426277	-7.7557096
		-1.1902224	-9.6426277	-7.6675615
		-2.1234546	-9.6426277	-7.463181
		-3.0244977	-9.6426277	-7.1456661
		-3.8796926	-9.6426277	-6.71983
		-4.676075	-9.6426277	-6.1921282
		-5.4015727	-9.6426277	-5.5705605
		-6.0451889	-9.6426277	-4.8645487
		-6.5971656	-9.6426277	-4.084795
		-7.0491362	-9.6426277	-3.2431195
		-7.3942485	-9.6426277	-2.352282
		-7.6272721	-9.6426277	-1.4257865
		-7.7446737	-9.6426277	-0.47767735
		-7.7446742	-9.6426277	0.47767305
		-7.6272736	-9.6426277	1.4257823
		-7.3942509	-9.6426277	2.3522785
		-7.0491385	-9.6426277	3.2431164
		-6.5971689	-9.6426277	4.0847921
		-6.0451922	-9.6426277	4.8645463
		-5.401577	-9.6426277	5.570559
		-4.6760798	-9.6426277	6.1921277
		-3.8796973	-9.6426277	6.71983
		-3.0245025	-9.6426277	7.1456666
		-2.1234596	-9.6426277	7.4631824
		-1.1902269	-9.6426277	7.6675639
		-0.23895186	-9.6426277	7.7557125
		0.7159456	-9.6426277	7.7262931
		1.6599901	-9.6426277	7.5797501
		2.5788708	-9.6426277	7.3183064
		3.4586585	-9.6426277	6.9459243
		4.286016	-9.6426277	6.4682488
		5.0484028	-9.6426277	5.8925214
		5.7342606	-9.6426277	5.2274694
		6.3331928	-9.6426277	4.4831743
		6.8361201	-9.6426277	3.6709192
		7.2354188	-9.6426277	2.8030164
		7.5250359	-9.6426277	1.8926226
		7.7005816	-9.6426277	0.95353866
		7.7593937	-9.6426277	0
		8.2750797	-9.1466637	-1.024673
		8.0864382	-9.1466637	-2.0338171
		7.7752151	-9.1466637	-3.0121305
		7.346127	-9.1466637	-3.944783
		6.8056798	-9.1466637	-4.8176365
		6.1620655	-9.1466637	-5.6174598
		5.4250407	-9.1466637	-6.3321285
		4.6057773	-9.1466637	-6.950808
		3.7166946	-9.1466637	-7.4641209
		2.771271	-9.1466637	-7.8642845
		1.7838378	-9.1466637	-8.1452341
		0.76936316	-9.1466637	-8.3027105
		-0.25677422	-9.1466637	-8.3343267
		-1.2790192	-9.1466637	-8.2396021
		-2.2818756	-9.1466637	-8.0199738
		-3.2501411	-9.1466637	-7.6787705
		-4.169138	-9.1466637	-7.2211647
		-5.0249348	-9.1466637	-6.6540937
		-5.8045588	-9.1466637	-5.9861541
		-6.4961915	-9.1466637	-5.2274694
		-7.0893488	-9.1466637	-4.3895421
		-7.5750389	-9.1466637	-3.4850733
		-7.9458985	-9.1466637	-2.5277748
		-8.1963072	-9.1466637	-1.5321578
		-8.3224678	-9.1466637	-0.5133146
		-8.3224678	-9.1466637	0.51331002
		-8.1963081	-9.1466637	1.5321532
		-7.9459009	-9.1466637	2.5277708
		-7.5750418	-9.1466637	3.48507
		-7.0893526	-9.1466637	4.3895392
		-6.4961958	-9.1466637	5.2274671
		-5.804563	-9.1466637	5.9861522
		-5.02494	-9.1466637	6.6540933
		-4.1691432	-9.1466637	7.2211647
		-3.2501464	-9.1466637	7.678771
		-2.2818809	-9.1466637	8.0199757
		-1.2790242	-9.1466637	8.2396049
		-0.25677893	-9.1466637	8.3343296
		0.76935893	-9.1466637	8.3027153
		1.7838341	-9.1466637	8.1452398
		2.7712681	-9.1466637	7.8642907
		3.7166924	-9.1466637	7.4641271
		4.6057754	-9.1466637	6.9508147
		5.4250402	-9.1466637	6.3321347
		6.1620665	-9.1466637	5.6174664
		6.8056822	-9.1466637	4.8176432
		7.3461308	-9.1466637	3.9447892
		7.775219	-9.1466637	3.0121362
		8.0864429	-9.1466637	2.0338223
		8.2750854	-9.1466637	1.0246778
		8.3382854	-9.1466637	0
		8.8181934	-8.616004	-1.0919249
		8.6171713	-8.616004	-2.1673014
		8.2855215	-8.616004	-3.2098238
		7.8282719	-8.616004	-4.2036886
		7.2523532	-8.616004	-5.1338296
		6.5664973	-8.616004	-5.9861479
		5.7810993	-8.616004	-6.7477217
		4.9080658	-8.616004	-7.4070067
		3.9606304	-8.616004	-7.9540091
		2.9531565	-8.616004	-8.3804369
		1.9009155	-8.616004	-8.6798267
		0.81985837	-8.616004	-8.8476381
		-0.27362692	-8.616004	-8.8813286
		-1.3629644	-8.616004	-8.7803869
		-2.4316406	-8.616004	-8.5463448
		-3.4634559	-8.616004	-8.1827469
		-4.4427686	-8.616004	-7.6951079
		-5.3547339	-8.616004	-7.0908184
		-6.1855264	-8.616004	-6.3790398
		-6.9225526	-8.616004	-5.5705614
		-7.5546403	-8.616004	-4.6776385
		-8.0722075	-8.616004	-3.7138073
		-8.4674072	-8.616004	-2.6936789
		-8.734251	-8.616004	-1.632717
		-8.8686914	-8.616004	-0.5470047
		-8.8686924	-8.616004	0.54699981
		-8.734252	-8.616004	1.6327122
		-8.4674101	-8.616004	2.6936746
		-8.0722103	-8.616004	3.7138038
		-7.5546441	-8.616004	4.6776352
		-6.9225569	-8.616004	5.5705585
		-6.1855311	-8.616004	6.3790383
		-5.3547392	-8.616004	7.0908179
		-4.4427743	-8.616004	7.6951079
		-3.4634616	-8.616004	8.1827478
		-2.4316463	-8.616004	8.5463467
		-1.3629696	-8.616004	8.7803898
		-0.27363196	-8.616004	8.8813324
		0.8198539	-8.616004	8.8476429
		1.9009116	-8.616004	8.6798315
		2.9531531	-8.616004	8.3804436
		3.9606283	-8.616004	7.9540162
		4.9080639	-8.616004	7.4070134
		5.7810988	-8.616004	6.7477283
		6.5664983	-8.616004	5.9861546
		7.2523561	-8.616004	5.1338367
		7.8282752	-8.616004	4.2036953
		8.2855263	-8.616004	3.20983
		8.6171761	-8.616004	2.1673071
		8.8181992	-8.616004	1.0919298
		8.8855476	-8.616004	0
		9.3278561	-8.052659	-1.1550345
		9.1152153	-8.052659	-2.2925644
		8.7643976	-8.052659	-3.3953412
		8.2807198	-8.052659	-4.4466481
		7.6715155	-8.052659	-5.4305482
		6.9460192	-8.052659	-6.3321276
		6.1152282	-8.052659	-7.1377177
		5.1917357	-8.052659	-7.8351073
		4.1895418	-8.052659	-8.4137249
		3.1238391	-8.052659	-8.8647985
		2.0107822	-8.052659	-9.1814919
		0.86724353	-8.052659	-9.3590021
		-0.28944167	-8.052659	-9.39464
		-1.4417393	-8.052659	-9.2878647
		-2.5721815	-8.052659	-9.0402956
		-3.6636324	-8.052659	-8.6556835
		-4.6995463	-8.052659	-8.1398602
		-5.6642199	-8.052659	-7.5006442
		-6.5430293	-8.052659	-6.7477274
		-7.3226538	-8.052659	-5.8925214
		-7.9912739	-8.052659	-4.9479909
		-8.5387545	-8.052659	-3.9284532
		-8.9567957	-8.052659	-2.8493648
		-9.2390614	-8.052659	-1.7270827
		-9.3812723	-8.052659	-0.57861978
		-9.3812733	-8.052659	0.57861459
		-9.2390633	-8.052659	1.7270777
		-8.9567986	-8.052659	2.8493602
		-8.5387573	-8.052659	3.9284494
		-7.9912777	-8.052659	4.9479876
		-7.3226581	-8.052659	5.8925185
		-6.5430346	-8.052659	6.747726
		-5.6642256	-8.052659	7.5006437
		-4.6995521	-8.052659	8.1398602
		-3.6636384	-8.052659	8.6556835
		-2.5721874	-8.052659	9.0402966
		-1.4417449	-8.052659	9.2878675
		-0.28944701	-8.052659	9.3946447
		0.86723876	-8.052659	9.3590078
		2.010778	-8.052659	9.1814976
		3.1238358	-8.052659	8.8648052
		4.1895394	-8.052659	8.4137325
		5.1917338	-8.052659	7.8351145
		6.1152277	-8.052659	7.1377249
		6.9460201	-8.052659	6.3321347
		7.6715183	-8.052659	5.4305558
		8.2807236	-8.052659	4.4466553
		8.7644024	-8.052659	3.3953476
		9.115221	-8.052659	2.2925704
		9.3278627	-8.052659	1.1550398
		9.3991032	-8.052659	0
		9.8021355	-7.4587688	-1.2137629
		9.5786839	-7.4587688	-2.4091311
		9.2100277	-7.4587688	-3.5679791
		8.7017574	-7.4587688	-4.6727405
		8.0615778	-7.4587688	-5.7066674
		7.2991934	-7.4587688	-6.6540875
		6.4261603	-7.4587688	-7.500639
		5.4557123	-7.4587688	-8.2334871
		4.4025612	-7.4587688	-8.8415251
		3.2826724	-7.4587688	-9.3155346
		2.1130214	-7.4587688	-9.6483297
		0.91133898	-7.4587688	-9.8348656
		-0.30415848	-7.4587688	-9.8723154
		-1.5150453	-7.4587688	-9.7601118
		-2.7029655	-7.4587688	-9.4999542
		-3.8499117	-7.4587688	-9.0957861
		-4.9384971	-7.4587688	-8.5537348
		-5.95222	-7.4587688	-7.8820186
		-6.8757133	-7.4587688	-7.0908194
		-7.6949778	-7.4587688	-6.1921301
		-8.3975945	-7.4587688	-5.199574
		-8.9729118	-7.4587688	-4.1281977
		-9.4122086	-7.4587688	-2.9942422
		-9.708827	-7.4587688	-1.8148972
		-9.8582687	-7.4587688	-0.60803998
		-9.8582687	-7.4587688	0.60803455
		-9.708828	-7.4587688	1.8148918
		-9.4122114	-7.4587688	2.9942374
		-8.9729156	-7.4587688	4.1281934
		-8.3975983	-7.4587688	5.1995702
		-7.6949825	-7.4587688	6.1921268
		-6.8757186	-7.4587688	7.0908175
		-5.9522262	-7.4587688	7.8820181
		-4.9385033	-7.4587688	8.5537348
		-3.8499179	-7.4587688	9.095787
		-2.7029717	-7.4587688	9.4999561
		-1.5150511	-7.4587688	9.7601147
		-0.30416408	-7.4587688	9.8723202
		0.91133398	-7.4587688	9.8348713
		2.1130171	-7.4587688	9.6483355
		3.2826688	-7.4587688	9.3155413
		4.4025588	-7.4587688	8.8415327
		5.4557104	-7.4587688	8.2334957
		6.4261594	-7.4587688	7.5006466
		7.2991943	-7.4587688	6.6540956
		8.0615807	-7.4587688	5.7066751
		8.7017622	-7.4587688	4.6727476
		9.2100325	-7.4587688	3.567986
		9.5786896	-7.4587688	2.4091372
		9.8021431	-7.4587688	1.2137684
		9.8770056	-7.4587688	0
		10.239232	-6.8365846	-1.267887
		10.005816	-6.8365846	-2.5165591
		9.6207218	-6.8365846	-3.7270825
		9.0897865	-6.8365846	-4.8811073
		8.4210596	-6.8365846	-5.9611392
		7.6246791	-6.8365846	-6.9508066
		6.7127156	-6.8365846	-7.8351073
		5.6989932	-6.8365846	-8.6006355
		4.5988803	-6.8365846	-9.2357864
		3.4290533	-6.8365846	-9.7309322
		2.2072453	-6.8365846	-10.078568
		0.95197737	-6.8365846	-10.273422
		-0.31772152	-6.8365846	-10.312542
		-1.5826042	-6.8365846	-10.195334
		-2.8234961	-6.8365846	-9.9235764
		-4.0215869	-6.8365846	-9.5013857
		-5.1587148	-6.8365846	-8.9351635
		-6.2176414	-6.8365846	-8.2334938
		-7.1823149	-6.8365846	-7.4070129
		-8.0381126	-6.8365846	-6.4682493
		-8.7720594	-6.8365846	-5.4314332
		-9.3730316	-6.8365846	-4.3122821
		-9.8319178	-6.8365846	-3.1277614
		-10.141763	-6.8365846	-1.8958271
		-10.297869	-6.8365846	-0.63515371
		-10.297869	-6.8365846	0.63514805
		-10.141765	-6.8365846	1.8958216
		-9.8319216	-6.8365846	3.1277566
		-9.3730354	-6.8365846	4.3122778
		-8.7720642	-6.8365846	5.4314299
		-8.0381174	-6.8365846	6.4682465
		-7.1823206	-6.8365846	7.407011
		-6.2176476	-6.8365846	8.2334929
		-5.158721	-6.8365846	8.9351635
		-4.0215936	-6.8365846	9.5013857
		-2.8235025	-6.8365846	9.9235773
		-1.5826104	-6.8365846	10.195337
		-0.31772736	-6.8365846	10.312547
		0.95197213	-6.8365846	10.273428
		2.2072408	-6.8365846	10.078574
		3.4290497	-6.8365846	9.7309399
		4.5988779	-6.8365846	9.2357941
		5.6989913	-6.8365846	8.6006432
		6.7127147	-6.8365846	7.8351154
		7.62468	-6.8365846	6.9508147
		8.4210625	-6.8365846	5.9611473
		9.0897903	-6.8365846	4.881115
		9.6207266	-6.8365846	3.7270896
		10.005822	-6.8365846	2.5165656
		10.23924	-6.8365846	1.2678927
		10.317441	-6.8365846	0
		10.637488	-6.1884661	-1.3172015
		10.394993	-6.1884661	-2.6144407
		9.9949207	-6.1884661	-3.8720477
		9.4433346	-6.1884661	-5.0709581
		8.7485971	-6.1884661	-6.1929979
		7.9212413	-6.1884661	-7.221159
		6.9738069	-6.1884661	-8.1398544
		5.9206562	-6.1884661	-8.9351578
		4.7777538	-6.1884661	-9.5950127
		3.5624266	-6.1884661	-10.109418
		2.2930963	-6.1884661	-10.470574
		0.98900461	-6.1884661	-10.673008
		-0.33007932	-6.1884661	-10.713649
		-1.6441597	-6.1884661	-10.591883
		-2.9333162	-6.1884661	-10.309554
		-4.1780071	-6.1884661	-9.8709421
		-5.3593631	-6.1884661	-9.2826967
		-6.4594769	-6.1884661	-8.5537357
		-7.4616718	-6.1884661	-7.6951094
		-8.3507547	-6.1884661	-6.7198324
		-9.1132498	-6.1884661	-5.6426892
		-9.7375965	-6.1884661	-4.4800086
		-10.214332	-6.1884661	-3.2494159
		-10.536227	-6.1884661	-1.9695654
		-10.698404	-6.1884661	-0.65985805
		-10.698405	-6.1884661	0.65985215
		-10.536229	-6.1884661	1.9695597
		-10.214334	-6.1884661	3.2494109
		-9.7376003	-6.1884661	4.4800043
		-9.1132545	-6.1884661	5.6426854
		-8.3507605	-6.1884661	6.7198291
		-7.4616776	-6.1884661	7.6951075
		-6.4594836	-6.1884661	8.5537348
		-5.3593698	-6.1884661	9.2826967
		-4.1780138	-6.1884661	9.8709431
		-2.9333229	-6.1884661	10.309556
		-1.644166	-6.1884661	10.591886
		-0.3300854	-6.1884661	10.713654
		0.98899919	-6.1884661	10.673014
		2.2930915	-6.1884661	10.470581
		3.5624228	-6.1884661	10.109426
		4.7777514	-6.1884661	9.5950212
		5.9206543	-6.1884661	8.9351654
		6.9738064	-6.1884661	8.139863
		7.9212427	-6.1884661	7.2211671
		8.748601	-6.1884661	6.1930065
		9.4433384	-6.1884661	5.0709662
		9.9949255	-6.1884661	3.8720551
		10.395	-6.1884661	2.6144474
		10.637496	-6.1884661	1.3172076
		10.718739	-6.1884661	0
		10.995392	-5.5168738	-1.3615195
		10.744738	-5.5168738	-2.702405
		10.331204	-5.5168738	-4.0023246
		9.7610607	-5.5168738	-5.2415733
		9.0429487	-5.5168738	-6.4013648
		8.1877556	-5.5168738	-7.4641185
		7.2084446	-5.5168738	-8.4137239
		6.1198597	-5.5168738	-9.2357855
		4.9385042	-5.5168738	-9.9178419
		3.6822863	-5.5168738	-10.449554
		2.3702488	-5.5168738	-10.822863
		1.0222802	-5.5168738	-11.032106
		-0.34118503	-5.5168738	-11.074116
		-1.6994783	-5.5168738	-10.948252
		-3.0320091	-5.5168738	-10.656425
		-4.3185782	-5.5168738	-10.203055
		-5.5396819	-5.5168738	-9.5950184
		-6.6768098	-5.5168738	-8.8415308
		-7.7127237	-5.5168738	-7.9540153
		-8.6317205	-5.5168738	-6.9459248
		-9.4198694	-5.5168738	-5.8325405
		-10.065223	-5.5168738	-4.6307411
		-10.557998	-5.5168738	-3.3587441
		-10.890724	-5.5168738	-2.0358324
		-11.058358	-5.5168738	-0.68205935
		-11.058359	-5.5168738	0.68205321
		-10.890726	-5.5168738	2.0358264
		-10.558002	-5.5168738	3.3587389
		-10.065228	-5.5168738	4.6307364
		-9.4198742	-5.5168738	5.8325367
		-8.6317263	-5.5168738	6.9459214
		-7.7127295	-5.5168738	7.9540133
		-6.676816	-5.5168738	8.8415298
		-5.5396886	-5.5168738	9.5950184
		-4.3185849	-5.5168738	10.203056
		-3.032016	-5.5168738	10.656426
		-1.6994849	-5.5168738	10.948256
		-0.34119129	-5.5168738	11.074121
		1.0222746	-5.5168738	11.032113
		2.3702438	-5.5168738	10.822869
		3.6822824	-5.5168738	10.449562
		4.9385014	-5.5168738	9.9178505
		6.1198578	-5.5168738	9.2357941
		7.2084436	-5.5168738	8.4137325
		8.1877565	-5.5168738	7.4641271
		9.0429525	-5.5168738	6.4013734
		9.7610645	-5.5168738	5.2415814
		10.33121	-5.5168738	4.0023322
		10.744744	-5.5168738	2.7024119
		10.9954	-5.5168738	1.3615257
		11.079376	-5.5168738	0
		11.311587	-4.8243537	-1.4006728
		11.053725	-4.8243537	-2.7801182
		10.6283	-4.8243537	-4.1174197
		10.041759	-4.8243537	-5.3923054
		9.3029976	-4.8243537	-6.5854492
		8.4232111	-4.8243537	-7.6787648
		7.4157381	-4.8243537	-8.6556778
		6.2958488	-4.8243537	-9.50138
		5.0805211	-4.8243537	-10.203051
		3.788178	-4.8243537	-10.750052
		2.43841	-4.8243537	-11.134096
		1.0516779	-4.8243537	-11.349358
		-0.35099649	-4.8243537	-11.392574
		-1.7483503	-4.8243537	-11.263091
		-3.1192009	-4.8243537	-10.962872
		-4.4427676	-4.8243537	-10.496466
		-5.6989865	-4.8243537	-9.8709431
		-6.8688149	-4.8243537	-9.095787
		-7.9345188	-4.8243537	-8.1827497
		-8.8799438	-4.8243537	-7.145669
		-9.6907578	-4.8243537	-6.000267
		-10.35467	-4.8243537	-4.7639074
		-10.861614	-4.8243537	-3.4553318
		-11.203909	-4.8243537	-2.094377
		-11.376364	-4.8243537	-0.70167333
		-11.376365	-4.8243537	0.70166707
		-11.203912	-4.8243537	2.0943708
		-10.861618	-4.8243537	3.4553263
		-10.354673	-4.8243537	4.7639027
		-9.6907625	-4.8243537	6.0002632
		-8.8799486	-4.8243537	7.1456656
		-7.934525	-4.8243537	8.1827469
		-6.8688216	-4.8243537	9.0957861
		-5.6989937	-4.8243537	9.8709431
		-4.4427748	-4.8243537	10.496466
		-3.1192081	-4.8243537	10.962873
		-1.7483571	-4.8243537	11.263095
		-0.35100296	-4.8243537	11.392579
		1.0516722	-4.8243537	11.349363
		2.438405	-4.8243537	11.134103
		3.7881739	-4.8243537	10.750061
		5.0805182	-4.8243537	10.203059
		6.2958469	-4.8243537	9.5013885
		7.4157372	-4.8243537	8.6556864
		8.423213	-4.8243537	7.6787734
		9.3030005	-4.8243537	6.5854578
		10.041764	-4.8243537	5.392314
		10.628305	-4.8243537	4.1174278
		11.053732	-4.8243537	2.7801254
		11.311595	-4.8243537	1.4006791
		11.397986	-4.8243537	0
		11.584873	-4.113533	-1.4345127
		11.320781	-4.113533	-2.8472853
		10.885077	-4.113533	-4.2168961
		10.284367	-4.113533	-5.522583
		9.5277557	-4.113533	-6.7445526
		8.6267147	-4.113533	-7.8642826
		7.5949011	-4.113533	-8.8647976
		6.4479556	-4.113533	-9.7309313
		5.2032657	-4.113533	-10.449554
		3.8796997	-4.113533	-11.009772
		2.4973216	-4.113533	-11.403094
		1.0770863	-4.113533	-11.623556
		-0.35947651	-4.113533	-11.667817
		-1.7905902	-4.113533	-11.535206
		-3.1945603	-4.113533	-11.227733
		-4.5501041	-4.113533	-10.750058
		-5.8366733	-4.113533	-10.109424
		-7.0347643	-4.113533	-9.3155403
		-8.126215	-4.113533	-8.3804436
		-9.0944815	-4.113533	-7.3183069
		-9.9248848	-4.113533	-6.1452327
		-10.604836	-4.113533	-4.8790026
		-11.124029	-4.113533	-3.5388122
		-11.474594	-4.113533	-2.1449769
		-11.651215	-4.113533	-0.71862566
		-11.651216	-4.113533	0.71861923
		-11.474596	-4.113533	2.1449704
		-11.124033	-4.113533	3.5388064
		-10.60484	-4.113533	4.8789978
		-9.9248896	-4.113533	6.1452284
		-9.0944872	-4.113533	7.3183036
		-8.1262217	-4.113533	8.3804407
		-7.0347714	-4.113533	9.3155394
		-5.8366804	-4.113533	10.109424
		-4.5501118	-4.113533	10.750059
		-3.1945674	-4.113533	11.227736
		-1.7905971	-4.113533	11.53521
		-0.35948312	-4.113533	11.667822
		1.0770804	-4.113533	11.623563
		2.4973164	-4.113533	11.403101
		3.8796957	-4.113533	11.009781
		5.2032628	-4.113533	10.449563
		6.4479532	-4.113533	9.7309408
		7.5949001	-4.113533	8.8648071
		8.6267166	-4.113533	7.8642917
		9.5277596	-4.113533	6.7445617
		10.284371	-4.113533	5.5225916
		10.885083	-4.113533	4.2169042
		11.320788	-4.113533	2.8472927
		11.584882	-4.113533	1.4345193
		11.67336	-4.113533	0
		11.814214	-3.3871086	-1.4629112
		11.544894	-3.3871086	-2.903652
		11.100565	-3.3871086	-4.3003759
		10.487962	-3.3871086	-5.6319108
		9.7163734	-3.3871086	-6.8780713
		8.7974939	-3.3871086	-8.019968
		7.745254	-3.3871086	-9.0402899
		6.575603	-3.3871086	-9.9235706
		5.3062725	-3.3871086	-10.65642
		3.9565046	-3.3871086	-11.227728
		2.5467601	-3.3871086	-11.628837
		1.0984089	-3.3871086	-11.853662
		-0.36659291	-3.3871086	-11.8988
		-1.8260376	-3.3871086	-11.763563
		-3.2578015	-3.3871086	-11.450004
		-4.6401806	-3.3871086	-10.962873
		-5.9522195	-3.3871086	-10.309555
		-7.1740284	-3.3871086	-9.4999552
		-8.2870865	-3.3871086	-8.5463476
		-9.2745209	-3.3871086	-7.4631844
		-10.121364	-3.3871086	-6.2668872
		-10.814775	-3.3871086	-4.9755902
		-11.344247	-3.3871086	-3.6088684
		-11.701752	-3.3871086	-2.1874399
		-11.881869	-3.3871086	-0.73285198
		-11.88187	-3.3871086	0.73284543
		-11.701754	-3.3871086	2.1874335
		-11.344251	-3.3871086	3.6088626
		-10.81478	-3.3871086	4.975585
		-10.121368	-3.3871086	6.2668829
		-9.2745266	-3.3871086	7.463181
		-8.2870932	-3.3871086	8.5463448
		-7.1740355	-3.3871086	9.4999552
		-5.9522266	-3.3871086	10.309555
		-4.6401882	-3.3871086	10.962873
		-3.2578089	-3.3871086	11.450006
		-1.8260448	-3.3871086	11.763567
		-0.36659965	-3.3871086	11.898805
		1.0984029	-3.3871086	11.853669
		2.5467548	-3.3871086	11.628843
		3.9565003	-3.3871086	11.227736
		5.3062696	-3.3871086	10.656428
		6.5756006	-3.3871086	9.9235792
		7.7452531	-3.3871086	9.0402994
		8.7974958	-3.3871086	8.0199776
		9.7163763	-3.3871086	6.8780808
		10.487967	-3.3871086	5.6319199
		11.100571	-3.3871086	4.300384
		11.544901	-3.3871086	2.9036593
		11.814222	-3.3871086	1.4629179
		11.904452	-3.3871086	0
		11.998738	-2.6478355	-1.4857602
		11.725212	-2.6478355	-2.9490037
		11.273943	-2.6478355	-4.3675432
		10.651772	-2.6478355	-5.7198749
		9.8681316	-2.6478355	-6.9854994
		8.9349012	-2.6478355	-8.1452312
		7.8662262	-2.6478355	-9.181489
		6.6783061	-2.6478355	-10.078566
		5.3891501	-2.6478355	-10.822861
		4.0183005	-2.6478355	-11.403092
		2.5865376	-2.6478355	-11.810466
		1.1155648	-2.6478355	-12.038803
		-0.37231869	-2.6478355	-12.084645
		-1.8545583	-2.6478355	-11.947297
		-3.3086848	-2.6478355	-11.628839
		-4.7126551	-2.6478355	-11.1341
		-6.0451865	-2.6478355	-10.470579
		-7.2860789	-2.6478355	-9.6483345
		-8.4165211	-2.6478355	-8.6798315
		-9.4193783	-2.6478355	-7.579751
		-10.279448	-2.6478355	-6.364769
		-10.98369	-2.6478355	-5.0533032
		-11.521431	-2.6478355	-3.6652348
		-11.88452	-2.6478355	-2.2216053
		-12.067451	-2.6478355	-0.74429828
		-12.067451	-2.6478355	0.7442916
		-11.884521	-2.6478355	2.2215989
		-11.521435	-2.6478355	3.6652291
		-10.983695	-2.6478355	5.053298
		-10.279452	-2.6478355	6.3647647
		-9.419384	-2.6478355	7.5797472
		-8.4165277	-2.6478355	8.6798296
		-7.2860861	-2.6478355	9.6483335
		-6.0451941	-2.6478355	10.470579
		-4.7126627	-2.6478355	11.134101
		-3.3086922	-2.6478355	11.628841
		-1.8545655	-2.6478355	11.947301
		-0.37232554	-2.6478355	12.084651
		1.1155587	-2.6478355	12.03881
		2.5865321	-2.6478355	11.810472
		4.0182962	-2.6478355	11.403101
		5.3891473	-2.6478355	10.82287
		6.6783042	-2.6478355	10.078575
		7.8662252	-2.6478355	9.1814985
		8.9349022	-2.6478355	8.1452408
		9.8681355	-2.6478355	6.9855084
		10.651777	-2.6478355	5.7198839
		11.273949	-2.6478355	4.3675513
		11.725219	-2.6478355	2.9490111
		11.998747	-2.6478355	1.485767
		12.090386	-2.6478355	0
		12.137749	-1.8985183	-1.5029733
		11.861053	-1.8985183	-2.9831691
		11.404556	-1.8985183	-4.4181428
		10.775177	-1.8985183	-5.7861419
		9.9824581	-1.8985183	-7.0664291
		9.038415	-1.8985183	-8.2395964
		7.9573593	-1.8985183	-9.2878609
		6.7556772	-1.8985183	-10.19533
		5.4515858	-1.8985183	-10.948248
		4.0648541	-1.8985183	-11.535202
		2.6165037	-1.8985183	-11.947294
		1.1284891	-1.8985183	-12.178278
		-0.37663212	-1.8985183	-12.224651
		-1.876044	-1.8985183	-12.085711
		-3.347017	-1.8985183	-11.763564
		-4.7672529	-1.8985183	-11.263093
		-6.115222	-1.8985183	-10.591885
		-7.370491	-1.8985183	-9.7601137
		-8.5140305	-1.8985183	-8.7803907
		-9.5285063	-1.8985183	-7.6675653
		-10.398539	-1.8985183	-6.4385071
		-11.110941	-1.8985183	-5.1118479
		-11.654912	-1.8985183	-3.7076981
		-12.022206	-1.8985183	-2.2473435
		-12.207256	-1.8985183	-0.75292128
		-12.207257	-1.8985183	0.75291455
		-12.022208	-1.8985183	2.2473369
		-11.654916	-1.8985183	3.7076921
		-11.110945	-1.8985183	5.1118426
		-10.398544	-1.8985183	6.4385028
		-9.528512	-1.8985183	7.6675615
		-8.5140371	-1.8985183	8.7803888
		-7.3704982	-1.8985183	9.7601128
		-6.1152301	-1.8985183	10.591885
		-4.7672606	-1.8985183	11.263094
		-3.3470249	-1.8985183	11.763567
		-1.8760514	-1.8985183	12.085714
		-0.37663907	-1.8985183	12.224656
		1.1284829	-1.8985183	12.178285
		2.6164982	-1.8985183	11.947302
		4.0648499	-1.8985183	11.535211
		5.4515829	-1.8985183	10.948257
		6.7556748	-1.8985183	10.195339
		7.9573588	-1.8985183	9.2878695
		9.0384169	-1.8985183	8.2396059
		9.9824619	-1.8985183	7.0664387
		10.775182	-1.8985183	5.7861509
		11.404562	-1.8985183	4.4181514
		11.86106	-1.8985183	2.9831767
		12.137757	-1.8985183	1.5029802
		12.230458	-1.8985183	0
		12.230715	-1.1419995	-1.514485
		11.9519	-1.1419995	-3.0060179
		11.491907	-1.1419995	-4.4519825
		10.857707	-1.1419995	-5.8304596
		10.058916	-1.1419995	-7.1205525
		9.1076431	-1.1419995	-8.3027058
		8.0183067	-1.1419995	-9.3589993
		6.8074207	-1.1419995	-10.273418
		5.493341	-1.1419995	-11.032104
		4.0959883	-1.1419995	-11.623553
		2.6365442	-1.1419995	-12.038802
		1.1371325	-1.1419995	-12.271555
		-0.37951687	-1.1419995	-12.318283
		-1.8904133	-1.1419995	-12.178279
		-3.372653	-1.1419995	-11.853664
		-4.8037667	-1.1419995	-11.34936
		-6.1620603	-1.1419995	-10.673011
		-7.4269438	-1.1419995	-9.8348694
		-8.5792418	-1.1419995	-8.8476419
		-9.6014872	-1.1419995	-7.7262936
		-10.478185	-1.1419995	-6.4878216
		-11.196043	-1.1419995	-5.151001
		-11.74418	-1.1419995	-3.7360964
		-12.114288	-1.1419995	-2.2645564
		-12.300756	-1.1419995	-0.75868815
		-12.300756	-1.1419995	0.75868136
		-12.11429	-1.1419995	2.26455
		-11.744184	-1.1419995	3.7360904
		-11.196047	-1.1419995	5.1509957
		-10.478189	-1.1419995	6.4878173
		-9.6014929	-1.1419995	7.7262897
		-8.5792484	-1.1419995	8.84764
		-7.4269509	-1.1419995	9.8348684
		-6.1620684	-1.1419995	10.673011
		-4.8037744	-1.1419995	11.349361
		-3.3726606	-1.1419995	11.853667
		-1.8904206	-1.1419995	12.178283
		-0.37952384	-1.1419995	12.318289
		1.1371263	-1.1419995	12.271562
		2.6365387	-1.1419995	12.03881
		4.0959835	-1.1419995	11.623562
		5.4933381	-1.1419995	11.032113
		6.8074188	-1.1419995	10.273428
		8.0183067	-1.1419995	9.3590088
		9.107645	-1.1419995	8.3027153
		10.05892	-1.1419995	7.1205626
		10.857713	-1.1419995	5.8304691
		11.491913	-1.1419995	4.4519911
		11.951908	-1.1419995	3.0060256
		12.230724	-1.1419995	1.5144919
		12.324135	-1.1419995	0
		12.277287	-0.38114855	-1.520252
		11.997412	-0.38114855	-3.0174644
		11.535666	-0.38114855	-4.468935
		10.899052	-0.38114855	-5.8526611
		10.097219	-0.38114855	-7.1476669
		9.1423235	-0.38114855	-8.334322
		8.0488396	-0.38114855	-9.3946362
		6.8333426	-0.38114855	-10.312538
		5.5142589	-0.38114855	-11.074112
		4.1115851	-0.38114855	-11.667814
		2.6465838	-0.38114855	-12.084644
		1.1414626	-0.38114855	-12.318283
		-0.38096201	-0.38114855	-12.36519
		-1.8976116	-0.38114855	-12.224652
		-3.3854954	-0.38114855	-11.898802
		-4.8220587	-0.38114855	-11.392577
		-6.1855245	-0.38114855	-10.713652
		-7.455224	-0.38114855	-9.8723192
		-8.6119099	-0.38114855	-8.8813324
		-9.6380482	-0.38114855	-7.7557139
		-10.518084	-0.38114855	-6.512526
		-11.238675	-0.38114855	-5.1706152
		-11.7889	-0.38114855	-3.7503228
		-12.160418	-0.38114855	-2.2731795
		-12.347595	-0.38114855	-0.76157707
		-12.347595	-0.38114855	0.76157027
		-12.160419	-0.38114855	2.2731729
		-11.788903	-0.38114855	3.7503169
		-11.23868	-0.38114855	5.17061
		-10.518088	-0.38114855	6.5125217
		-9.6380539	-0.38114855	7.7557101
		-8.6119165	-0.38114855	8.8813305
		-7.4552317	-0.38114855	9.8723183
		-6.1855326	-0.38114855	10.713652
		-4.8220668	-0.38114855	11.392577
		-3.3855033	-0.38114855	11.898804
		-1.897619	-0.38114855	12.224656
		-0.38096902	-0.38114855	12.365194
		1.1414562	-0.38114855	12.31829
		2.6465781	-0.38114855	12.084651
		4.1115804	-0.38114855	11.667823
		5.514256	-0.38114855	11.074121
		6.8333402	-0.38114855	10.312548
		8.0488386	-0.38114855	9.3946457
		9.1423254	-0.38114855	8.3343315
		10.097223	-0.38114855	7.1476765
		10.899057	-0.38114855	5.8526707
		11.535672	-0.38114855	4.4689436
		11.997418	-0.38114855	3.017472
		12.277297	-0.38114855	1.5202589
		12.371063	-0.38114855	0
		12.277287	0.38114855	-1.520252
		11.997412	0.38114855	-3.0174644
		11.535666	0.38114855	-4.468935
		10.899052	0.38114855	-5.8526611
		10.097219	0.38114855	-7.1476669
		9.1423235	0.38114855	-8.334322
		8.0488396	0.38114855	-9.3946362
		6.8333426	0.38114855	-10.312538
		5.5142589	0.38114855	-11.074112
		4.1115851	0.38114855	-11.667814
		2.6465838	0.38114855	-12.084644
		1.1414626	0.38114855	-12.318283
		-0.38096201	0.38114855	-12.36519
		-1.8976116	0.38114855	-12.224652
		-3.3854954	0.38114855	-11.898802
		-4.8220587	0.38114855	-11.392577
		-6.1855245	0.38114855	-10.713652
		-7.455224	0.38114855	-9.8723192
		-8.6119099	0.38114855	-8.8813324
		-9.6380482	0.38114855	-7.7557139
		-10.518084	0.38114855	-6.512526
		-11.238675	0.38114855	-5.1706152
		-11.7889	0.38114855	-3.7503228
		-12.160418	0.38114855	-2.2731795
		-12.347595	0.38114855	-0.76157707
		-12.347595	0.38114855	0.76157027
		-12.160419	0.38114855	2.2731729
		-11.788903	0.38114855	3.7503169
		-11.23868	0.38114855	5.17061
		-10.518088	0.38114855	6.5125217
		-9.6380539	0.38114855	7.7557101
		-8.6119165	0.38114855	8.8813305
		-7.4552317	0.38114855	9.8723183
		-6.1855326	0.38114855	10.713652
		-4.8220668	0.38114855	11.392577
		-3.3855033	0.38114855	11.898804
		-1.897619	0.38114855	12.224656
		-0.38096902	0.38114855	12.365194
		1.1414562	0.38114855	12.31829
		2.6465781	0.38114855	12.084651
		4.1115804	0.38114855	11.667823
		5.514256	0.38114855	11.074121
		6.8333402	0.38114855	10.312548
		8.0488386	0.38114855	9.3946457
		9.1423254	0.38114855	8.3343315
		10.097223	0.38114855	7.1476765
		10.899057	0.38114855	5.8526707
		11.535672	0.38114855	4.4689436
		11.997418	0.38114855	3.017472
		12.277297	0.38114855	1.5202589
		12.371063	0.38114855	0
		12.230715	1.1419995	-1.514485
		11.9519	1.1419995	-3.0060179
		11.491907	1.1419995	-4.4519825
		10.857707	1.1419995	-5.8304596
		10.058916	1.1419995	-7.1205525
		9.1076431	1.1419995	-8.3027058
		8.0183067	1.1419995	-9.3589993
		6.8074207	1.1419995	-10.273418
		5.493341	1.1419995	-11.032104
		4.0959883	1.1419995	-11.623553
		2.6365442	1.1419995	-12.038802
		1.1371325	1.1419995	-12.271555
		-0.37951687	1.1419995	-12.318283
		-1.8904133	1.1419995	-12.178279
		-3.372653	1.1419995	-11.853664
		-4.8037667	1.1419995	-11.34936
		-6.1620603	1.1419995	-10.673011
		-7.4269438	1.1419995	-9.8348694
		-8.5792418	1.1419995	-8.8476419
		-9.6014872	1.1419995	-7.7262936
		-10.478185	1.1419995	-6.4878216
		-11.196043	1.1419995	-5.151001
		-11.74418	1.1419995	-3.7360964
		-12.114288	1.1419995	-2.2645564
		-12.300756	1.1419995	-0.75868815
		-12.300756	1.1419995	0.75868136
		-12.11429	1.1419995	2.26455
		-11.744184	1.1419995	3.7360904
		-11.196047	1.1419995	5.1509957
		-10.478189	1.1419995	6.4878173
		-9.6014929	1.1419995	7.7262897
		-8.5792484	1.1419995	8.84764
		-7.4269509	1.1419995	9.8348684
		-6.1620684	1.1419995	10.673011
		-4.8037744	1.1419995	11.349361
		-3.3726606	1.1419995	11.853667
		-1.8904206	1.1419995	12.178283
		-0.37952384	1.1419995	12.318289
		1.1371263	1.1419995	12.271562
		2.6365387	1.1419995	12.03881
		4.0959835	1.1419995	11.623562
		5.4933381	1.1419995	11.032113
		6.8074188	1.1419995	10.273428
		8.0183067	1.1419995	9.3590088
		9.107645	1.1419995	8.3027153
		10.05892	1.1419995	7.1205626
		10.857713	1.1419995	5.8304691
		11.491913	1.1419995	4.4519911
		11.951908	1.1419995	3.0060256
		12.230724	1.1419995	1.5144919
		12.324135	1.1419995	0
		12.137749	1.8985183	-1.5029733
		11.861053	1.8985183	-2.9831691
		11.404556	1.8985183	-4.4181428
		10.775177	1.8985183	-5.7861419
		9.9824581	1.8985183	-7.0664291
		9.038415	1.8985183	-8.2395964
		7.9573593	1.8985183	-9.2878609
		6.7556772	1.8985183	-10.19533
		5.4515858	1.8985183	-10.948248
		4.0648541	1.8985183	-11.535202
		2.6165037	1.8985183	-11.947294
		1.1284891	1.8985183	-12.178278
		-0.37663212	1.8985183	-12.224651
		-1.876044	1.8985183	-12.085711
		-3.347017	1.8985183	-11.763564
		-4.7672529	1.8985183	-11.263093
		-6.115222	1.8985183	-10.591885
		-7.370491	1.8985183	-9.7601137
		-8.5140305	1.8985183	-8.7803907
		-9.5285063	1.8985183	-7.6675653
		-10.398539	1.8985183	-6.4385071
		-11.110941	1.8985183	-5.1118479
		-11.654912	1.8985183	-3.7076981
		-12.022206	1.8985183	-2.2473435
		-12.207256	1.8985183	-0.75292128
		-12.207257	1.8985183	0.75291455
		-12.022208	1.8985183	2.2473369
		-11.654916	1.8985183	3.7076921
		-11.110945	1.8985183	5.1118426
		-10.398544	1.8985183	6.4385028
		-9.528512	1.8985183	7.6675615
		-8.5140371	1.8985183	8.7803888
		-7.3704982	1.8985183	9.7601128
		-6.1152301	1.8985183	10.591885
		-4.7672606	1.8985183	11.263094
		-3.3470249	1.8985183	11.763567
		-1.8760514	1.8985183	12.085714
		-0.37663907	1.8985183	12.224656
		1.1284829	1.8985183	12.178285
		2.6164982	1.8985183	11.947302
		4.0648499	1.8985183	11.535211
		5.4515829	1.8985183	10.948257
		6.7556748	1.8985183	10.195339
		7.9573588	1.8985183	9.2878695
		9.0384169	1.8985183	8.2396059
		9.9824619	1.8985183	7.0664387
		10.775182	1.8985183	5.7861509
		11.404562	1.8985183	4.4181514
		11.86106	1.8985183	2.9831767
		12.137757	1.8985183	1.5029802
		12.230458	1.8985183	0
		11.998738	2.6478355	-1.4857602
		11.725212	2.6478355	-2.9490037
		11.273943	2.6478355	-4.3675432
		10.651772	2.6478355	-5.7198749
		9.8681316	2.6478355	-6.9854994
		8.9349012	2.6478355	-8.1452312
		7.8662262	2.6478355	-9.181489
		6.6783061	2.6478355	-10.078566
		5.3891501	2.6478355	-10.822861
		4.0183005	2.6478355	-11.403092
		2.5865376	2.6478355	-11.810466
		1.1155648	2.6478355	-12.038803
		-0.37231869	2.6478355	-12.084645
		-1.8545583	2.6478355	-11.947297
		-3.3086848	2.6478355	-11.628839
		-4.7126551	2.6478355	-11.1341
		-6.0451865	2.6478355	-10.470579
		-7.2860789	2.6478355	-9.6483345
		-8.4165211	2.6478355	-8.6798315
		-9.4193783	2.6478355	-7.579751
		-10.279448	2.6478355	-6.364769
		-10.98369	2.6478355	-5.0533032
		-11.521431	2.6478355	-3.6652348
		-11.88452	2.6478355	-2.2216053
		-12.067451	2.6478355	-0.74429828
		-12.067451	2.6478355	0.7442916
		-11.884521	2.6478355	2.2215989
		-11.521435	2.6478355	3.6652291
		-10.983695	2.6478355	5.053298
		-10.279452	2.6478355	6.3647647
		-9.419384	2.6478355	7.5797472
		-8.4165277	2.6478355	8.6798296
		-7.2860861	2.6478355	9.6483335
		-6.0451941	2.6478355	10.470579
		-4.7126627	2.6478355	11.134101
		-3.3086922	2.6478355	11.628841
		-1.8545655	2.6478355	11.947301
		-0.37232554	2.6478355	12.084651
		1.1155587	2.6478355	12.03881
		2.5865321	2.6478355	11.810472
		4.0182962	2.6478355	11.403101
		5.3891473	2.6478355	10.82287
		6.6783042	2.6478355	10.078575
		7.8662252	2.6478355	9.1814985
		8.9349022	2.6478355	8.1452408
		9.8681355	2.6478355	6.9855084
		10.651777	2.6478355	5.7198839
		11.273949	2.6478355	4.3675513
		11.725219	2.6478355	2.9490111
		11.998747	2.6478355	1.485767
		12.090386	2.6478355	0
		11.814214	3.3871086	-1.4629112
		11.544894	3.3871086	-2.903652
		11.100565	3.3871086	-4.3003759
		10.487962	3.3871086	-5.6319108
		9.7163734	3.3871086	-6.8780713
		8.7974939	3.3871086	-8.019968
		7.745254	3.3871086	-9.0402899
		6.575603	3.3871086	-9.9235706
		5.3062725	3.3871086	-10.65642
		3.9565046	3.3871086	-11.227728
		2.5467601	3.3871086	-11.628837
		1.0984089	3.3871086	-11.853662
		-0.36659291	3.3871086	-11.8988
		-1.8260376	3.3871086	-11.763563
		-3.2578015	3.3871086	-11.450004
		-4.6401806	3.3871086	-10.962873
		-5.9522195	3.3871086	-10.309555
		-7.1740284	3.3871086	-9.4999552
		-8.2870865	3.3871086	-8.5463476
		-9.2745209	3.3871086	-7.4631844
		-10.121364	3.3871086	-6.2668872
		-10.814775	3.3871086	-4.9755902
		-11.344247	3.3871086	-3.6088684
		-11.701752	3.3871086	-2.1874399
		-11.881869	3.3871086	-0.73285198
		-11.88187	3.3871086	0.73284543
		-11.701754	3.3871086	2.1874335
		-11.344251	3.3871086	3.6088626
		-10.81478	3.3871086	4.975585
		-10.121368	3.3871086	6.2668829
		-9.2745266	3.3871086	7.463181
		-8.2870932	3.3871086	8.5463448
		-7.1740355	3.3871086	9.4999552
		-5.9522266	3.3871086	10.309555
		-4.6401882	3.3871086	10.962873
		-3.2578089	3.3871086	11.450006
		-1.8260448	3.3871086	11.763567
		-0.36659965	3.3871086	11.898805
		1.0984029	3.3871086	11.853669
		2.5467548	3.3871086	11.628843
		3.9565003	3.3871086	11.227736
		5.3062696	3.3871086	10.656428
		6.5756006	3.3871086	9.9235792
		7.7452531	3.3871086	9.0402994
		8.7974958	3.3871086	8.0199776
		9.7163763	3.3871086	6.8780808
		10.487967	3.3871086	5.6319199
		11.100571	3.3871086	4.300384
		11.544901	3.3871086	2.9036593
		11.814222	3.3871086	1.4629179
		11.904452	3.3871086	0
		11.584873	4.113533	-1.4345127
		11.320781	4.113533	-2.8472853
		10.885077	4.113533	-4.2168961
		10.284367	4.113533	-5.522583
		9.5277557	4.113533	-6.7445526
		8.6267147	4.113533	-7.8642826
		7.5949011	4.113533	-8.8647976
		6.4479556	4.113533	-9.7309313
		5.2032657	4.113533	-10.449554
		3.8796997	4.113533	-11.009772
		2.4973216	4.113533	-11.403094
		1.0770863	4.113533	-11.623556
		-0.35947651	4.113533	-11.667817
		-1.7905902	4.113533	-11.535206
		-3.1945603	4.113533	-11.227733
		-4.5501041	4.113533	-10.750058
		-5.8366733	4.113533	-10.109424
		-7.0347643	4.113533	-9.3155403
		-8.126215	4.113533	-8.3804436
		-9.0944815	4.113533	-7.3183069
		-9.9248848	4.113533	-6.1452327
		-10.604836	4.113533	-4.8790026
		-11.124029	4.113533	-3.5388122
		-11.474594	4.113533	-2.1449769
		-11.651215	4.113533	-0.71862566
		-11.651216	4.113533	0.71861923
		-11.474596	4.113533	2.1449704
		-11.124033	4.113533	3.5388064
		-10.60484	4.113533	4.8789978
		-9.9248896	4.113533	6.1452284
		-9.0944872	4.113533	7.3183036
		-8.1262217	4.113533	8.3804407
		-7.0347714	4.113533	9.3155394
		-5.8366804	4.113533	10.109424
		-4.5501118	4.113533	10.750059
		-3.1945674	4.113533	11.227736
		-1.7905971	4.113533	11.53521
		-0.35948312	4.113533	11.667822
		1.0770804	4.113533	11.623563
		2.4973164	4.113533	11.403101
		3.8796957	4.113533	11.009781
		5.2032628	4.113533	10.449563
		6.4479532	4.113533	9.7309408
		7.5949001	4.113533	8.8648071
		8.6267166	4.113533	7.8642917
		9.5277596	4.113533	6.7445617
		10.284371	4.113533	5.5225916
		10.885083	4.113533	4.2169042
		11.320788	4.113533	2.8472927
		11.584882	4.113533	1.4345193
		11.67336	4.113533	0
		11.311587	4.8243537	-1.4006728
		11.053725	4.8243537	-2.7801182
		10.6283	4.8243537	-4.1174197
		10.041759	4.8243537	-5.3923054
		9.3029976	4.8243537	-6.5854492
		8.4232111	4.8243537	-7.6787648
		7.4157381	4.8243537	-8.6556778
		6.2958488	4.8243537	-9.50138
		5.0805211	4.8243537	-10.203051
		3.788178	4.8243537	-10.750052
		2.43841	4.8243537	-11.134096
		1.0516779	4.8243537	-11.349358
		-0.35099649	4.8243537	-11.392574
		-1.7483503	4.8243537	-11.263091
		-3.1192009	4.8243537	-10.962872
		-4.4427676	4.8243537	-10.496466
		-5.6989865	4.8243537	-9.8709431
		-6.8688149	4.8243537	-9.095787
		-7.9345188	4.8243537	-8.1827497
		-8.8799438	4.8243537	-7.145669
		-9.6907578	4.8243537	-6.000267
		-10.35467	4.8243537	-4.7639074
		-10.861614	4.8243537	-3.4553318
		-11.203909	4.8243537	-2.094377
		-11.376364	4.8243537	-0.70167333
		-11.376365	4.8243537	0.70166707
		-11.203912	4.8243537	2.0943708
		-10.861618	4.8243537	3.4553263
		-10.354673	4.8243537	4.7639027
		-9.6907625	4.8243537	6.0002632
		-8.8799486	4.8243537	7.1456656
		-7.934525	4.8243537	8.1827469
		-6.8688216	4.8243537	9.0957861
		-5.6989937	4.8243537	9.8709431
		-4.4427748	4.8243537	10.496466
		-3.1192081	4.8243537	10.962873
		-1.7483571	4.8243537	11.263095
		-0.35100296	4.8243537	11.392579
		1.0516722	4.8243537	11.349363
		2.438405	4.8243537	11.134103
		3.7881739	4.8243537	10.750061
		5.0805182	4.8243537	10.203059
		6.2958469	4.8243537	9.5013885
		7.4157372	4.8243537	8.6556864
		8.423213	4.8243537	7.6787734
		9.3030005	4.8243537	6.5854578
		10.041764	4.8243537	5.392314
		10.628305	4.8243537	4.1174278
		11.053732	4.8243537	2.7801254
		11.311595	4.8243537	1.4006791
		11.397986	4.8243537	0
		10.995392	5.5168738	-1.3615195
		10.744738	5.5168738	-2.702405
		10.331204	5.5168738	-4.0023246
		9.7610607	5.5168738	-5.2415733
		9.0429487	5.5168738	-6.4013648
		8.1877556	5.5168738	-7.4641185
		7.2084446	5.5168738	-8.4137239
		6.1198597	5.5168738	-9.2357855
		4.9385042	5.5168738	-9.9178419
		3.6822863	5.5168738	-10.449554
		2.3702488	5.5168738	-10.822863
		1.0222802	5.5168738	-11.032106
		-0.34118503	5.5168738	-11.074116
		-1.6994783	5.5168738	-10.948252
		-3.0320091	5.5168738	-10.656425
		-4.3185782	5.5168738	-10.203055
		-5.5396819	5.5168738	-9.5950184
		-6.6768098	5.5168738	-8.8415308
		-7.7127237	5.5168738	-7.9540153
		-8.6317205	5.5168738	-6.9459248
		-9.4198694	5.5168738	-5.8325405
		-10.065223	5.5168738	-4.6307411
		-10.557998	5.5168738	-3.3587441
		-10.890724	5.5168738	-2.0358324
		-11.058358	5.5168738	-0.68205935
		-11.058359	5.5168738	0.68205321
		-10.890726	5.5168738	2.0358264
		-10.558002	5.5168738	3.3587389
		-10.065228	5.5168738	4.6307364
		-9.4198742	5.5168738	5.8325367
		-8.6317263	5.5168738	6.9459214
		-7.7127295	5.5168738	7.9540133
		-6.676816	5.5168738	8.8415298
		-5.5396886	5.5168738	9.5950184
		-4.3185849	5.5168738	10.203056
		-3.032016	5.5168738	10.656426
		-1.6994849	5.5168738	10.948256
		-0.34119129	5.5168738	11.074121
		1.0222746	5.5168738	11.032113
		2.3702438	5.5168738	10.822869
		3.6822824	5.5168738	10.449562
		4.9385014	5.5168738	9.9178505
		6.1198578	5.5168738	9.2357941
		7.2084436	5.5168738	8.4137325
		8.1877565	5.5168738	7.4641271
		9.0429525	5.5168738	6.4013734
		9.7610645	5.5168738	5.2415814
		10.33121	5.5168738	4.0023322
		10.744744	5.5168738	2.7024119
		10.9954	5.5168738	1.3615257
		11.079376	5.5168738	0
		10.637488	6.1884661	-1.3172015
		10.394993	6.1884661	-2.6144407
		9.9949207	6.1884661	-3.8720477
		9.4433346	6.1884661	-5.0709581
		8.7485971	6.1884661	-6.1929979
		7.9212413	6.1884661	-7.221159
		6.9738069	6.1884661	-8.1398544
		5.9206562	6.1884661	-8.9351578
		4.7777538	6.1884661	-9.5950127
		3.5624266	6.1884661	-10.109418
		2.2930963	6.1884661	-10.470574
		0.98900461	6.1884661	-10.673008
		-0.33007932	6.1884661	-10.713649
		-1.6441597	6.1884661	-10.591883
		-2.9333162	6.1884661	-10.309554
		-4.1780071	6.1884661	-9.8709421
		-5.3593631	6.1884661	-9.2826967
		-6.4594769	6.1884661	-8.5537357
		-7.4616718	6.1884661	-7.6951094
		-8.3507547	6.1884661	-6.7198324
		-9.1132498	6.1884661	-5.6426892
		-9.7375965	6.1884661	-4.4800086
		-10.214332	6.1884661	-3.2494159
		-10.536227	6.1884661	-1.9695654
		-10.698404	6.1884661	-0.65985805
		-10.698405	6.1884661	0.65985215
		-10.536229	6.1884661	1.9695597
		-10.214334	6.1884661	3.2494109
		-9.7376003	6.1884661	4.4800043
		-9.1132545	6.1884661	5.6426854
		-8.3507605	6.1884661	6.7198291
		-7.4616776	6.1884661	7.6951075
		-6.4594836	6.1884661	8.5537348
		-5.3593698	6.1884661	9.2826967
		-4.1780138	6.1884661	9.8709431
		-2.9333229	6.1884661	10.309556
		-1.644166	6.1884661	10.591886
		-0.3300854	6.1884661	10.713654
		0.98899919	6.1884661	10.673014
		2.2930915	6.1884661	10.470581
		3.5624228	6.1884661	10.109426
		4.7777514	6.1884661	9.5950212
		5.9206543	6.1884661	8.9351654
		6.9738064	6.1884661	8.139863
		7.9212427	6.1884661	7.2211671
		8.748601	6.1884661	6.1930065
		9.4433384	6.1884661	5.0709662
		9.9949255	6.1884661	3.8720551
		10.395	6.1884661	2.6144474
		10.637496	6.1884661	1.3172076
		10.718739	6.1884661	0
		10.239232	6.8365846	-1.267887
		10.005816	6.8365846	-2.5165591
		9.6207218	6.8365846	-3.7270825
		9.0897865	6.8365846	-4.8811073
		8.4210596	6.8365846	-5.9611392
		7.6246791	6.8365846	-6.9508066
		6.7127156	6.8365846	-7.8351073
		5.6989932	6.8365846	-8.6006355
		4.5988803	6.8365846	-9.2357864
		3.4290533	6.8365846	-9.7309322
		2.2072453	6.8365846	-10.078568
		0.95197737	6.8365846	-10.273422
		-0.31772152	6.8365846	-10.312542
		-1.5826042	6.8365846	-10.195334
		-2.8234961	6.8365846	-9.9235764
		-4.0215869	6.8365846	-9.5013857
		-5.1587148	6.8365846	-8.9351635
		-6.2176414	6.8365846	-8.2334938
		-7.1823149	6.8365846	-7.4070129
		-8.0381126	6.8365846	-6.4682493
		-8.7720594	6.8365846	-5.4314332
		-9.3730316	6.8365846	-4.3122821
		-9.8319178	6.8365846	-3.1277614
		-10.141763	6.8365846	-1.8958271
		-10.297869	6.8365846	-0.63515371
		-10.297869	6.8365846	0.63514805
		-10.141765	6.8365846	1.8958216
		-9.8319216	6.8365846	3.1277566
		-9.3730354	6.8365846	4.3122778
		-8.7720642	6.8365846	5.4314299
		-8.0381174	6.8365846	6.4682465
		-7.1823206	6.8365846	7.407011
		-6.2176476	6.8365846	8.2334929
		-5.158721	6.8365846	8.9351635
		-4.0215936	6.8365846	9.5013857
		-2.8235025	6.8365846	9.9235773
		-1.5826104	6.8365846	10.195337
		-0.31772736	6.8365846	10.312547
		0.95197213	6.8365846	10.273428
		2.2072408	6.8365846	10.078574
		3.4290497	6.8365846	9.7309399
		4.5988779	6.8365846	9.2357941
		5.6989913	6.8365846	8.6006432
		6.7127147	6.8365846	7.8351154
		7.62468	6.8365846	6.9508147
		8.4210625	6.8365846	5.9611473
		9.0897903	6.8365846	4.881115
		9.6207266	6.8365846	3.7270896
		10.005822	6.8365846	2.5165656
		10.23924	6.8365846	1.2678927
		10.317441	6.8365846	0
		9.8021355	7.4587688	-1.2137629
		9.5786839	7.4587688	-2.4091311
		9.2100277	7.4587688	-3.5679791
		8.7017574	7.4587688	-4.6727405
		8.0615778	7.4587688	-5.7066674
		7.2991934	7.4587688	-6.6540875
		6.4261603	7.4587688	-7.500639
		5.4557123	7.4587688	-8.2334871
		4.4025612	7.4587688	-8.8415251
		3.2826724	7.4587688	-9.3155346
		2.1130214	7.4587688	-9.6483297
		0.91133898	7.4587688	-9.8348656
		-0.30415848	7.4587688	-9.8723154
		-1.5150453	7.4587688	-9.7601118
		-2.7029655	7.4587688	-9.4999542
		-3.8499117	7.4587688	-9.0957861
		-4.9384971	7.4587688	-8.5537348
		-5.95222	7.4587688	-7.8820186
		-6.8757133	7.4587688	-7.0908194
		-7.6949778	7.4587688	-6.1921301
		-8.3975945	7.4587688	-5.199574
		-8.9729118	7.4587688	-4.1281977
		-9.4122086	7.4587688	-2.9942422
		-9.708827	7.4587688	-1.8148972
		-9.8582687	7.4587688	-0.60803998
		-9.8582687	7.4587688	0.60803455
		-9.708828	7.4587688	1.8148918
		-9.4122114	7.4587688	2.9942374
		-8.9729156	7.4587688	4.1281934
		-8.3975983	7.4587688	5.1995702
		-7.6949825	7.4587688	6.1921268
		-6.8757186	7.4587688	7.0908175
		-5.9522262	7.4587688	7.8820181
		-4.9385033	7.4587688	8.5537348
		-3.8499179	7.4587688	9.095787
		-2.7029717	7.4587688	9.4999561
		-1.5150511	7.4587688	9.7601147
		-0.30416408	7.4587688	9.8723202
		0.91133398	7.4587688	9.8348713
		2.1130171	7.4587688	9.6483355
		3.2826688	7.4587688	9.3155413
		4.4025588	7.4587688	8.8415327
		5.4557104	7.4587688	8.2334957
		6.4261594	7.4587688	7.5006466
		7.2991943	7.4587688	6.6540956
		8.0615807	7.4587688	5.7066751
		8.7017622	7.4587688	4.6727476
		9.2100325	7.4587688	3.567986
		9.5786896	7.4587688	2.4091372
		9.8021431	7.4587688	1.2137684
		9.8770056	7.4587688	0
		9.3278561	8.052659	-1.1550345
		9.1152153	8.052659	-2.2925644
		8.7643976	8.052659	-3.3953412
		8.2807198	8.052659	-4.4466481
		7.6715155	8.052659	-5.4305482
		6.9460192	8.052659	-6.3321276
		6.1152282	8.052659	-7.1377177
		5.1917357	8.052659	-7.8351073
		4.1895418	8.052659	-8.4137249
		3.1238391	8.052659	-8.8647985
		2.0107822	8.052659	-9.1814919
		0.86724353	8.052659	-9.3590021
		-0.28944167	8.052659	-9.39464
		-1.4417393	8.052659	-9.2878647
		-2.5721815	8.052659	-9.0402956
		-3.6636324	8.052659	-8.6556835
		-4.6995463	8.052659	-8.1398602
		-5.6642199	8.052659	-7.5006442
		-6.5430293	8.052659	-6.7477274
		-7.3226538	8.052659	-5.8925214
		-7.9912739	8.052659	-4.9479909
		-8.5387545	8.052659	-3.9284532
		-8.9567957	8.052659	-2.8493648
		-9.2390614	8.052659	-1.7270827
		-9.3812723	8.052659	-0.57861978
		-9.3812733	8.052659	0.57861459
		-9.2390633	8.052659	1.7270777
		-8.9567986	8.052659	2.8493602
		-8.5387573	8.052659	3.9284494
		-7.9912777	8.052659	4.9479876
		-7.3226581	8.052659	5.8925185
		-6.5430346	8.052659	6.747726
		-5.6642256	8.052659	7.5006437
		-4.6995521	8.052659	8.1398602
		-3.6636384	8.052659	8.6556835
		-2.5721874	8.052659	9.0402966
		-1.4417449	8.052659	9.2878675
		-0.28944701	8.052659	9.3946447
		0.86723876	8.052659	9.3590078
		2.010778	8.052659	9.1814976
		3.1238358	8.052659	8.8648052
		4.1895394	8.052659	8.4137325
		5.1917338	8.052659	7.8351145
		6.1152277	8.052659	7.1377249
		6.9460201	8.052659	6.3321347
		7.6715183	8.052659	5.4305558
		8.2807236	8.052659	4.4466553
		8.7644024	8.052659	3.3953476
		9.115221	8.052659	2.2925704
		9.3278627	8.052659	1.1550398
		9.3991032	8.052659	0
		8.8181934	8.616004	-1.0919249
		8.6171713	8.616004	-2.1673014
		8.2855215	8.616004	-3.2098238
		7.8282719	8.616004	-4.2036886
		7.2523532	8.616004	-5.1338296
		6.5664973	8.616004	-5.9861479
		5.7810993	8.616004	-6.7477217
		4.9080658	8.616004	-7.4070067
		3.9606304	8.616004	-7.9540091
		2.9531565	8.616004	-8.3804369
		1.9009155	8.616004	-8.6798267
		0.81985837	8.616004	-8.8476381
		-0.27362692	8.616004	-8.8813286
		-1.3629644	8.616004	-8.7803869
		-2.4316406	8.616004	-8.5463448
		-3.4634559	8.616004	-8.1827469
		-4.4427686	8.616004	-7.6951079
		-5.3547339	8.616004	-7.0908184
		-6.1855264	8.616004	-6.3790398
		-6.9225526	8.616004	-5.5705614
		-7.5546403	8.616004	-4.6776385
		-8.0722075	8.616004	-3.7138073
		-8.4674072	8.616004	-2.6936789
		-8.734251	8.616004	-1.632717
		-8.8686914	8.616004	-0.5470047
		-8.8686924	8.616004	0.54699981
		-8.734252	8.616004	1.6327122
		-8.4674101	8.616004	2.6936746
		-8.0722103	8.616004	3.7138038
		-7.5546441	8.616004	4.6776352
		-6.9225569	8.616004	5.5705585
		-6.1855311	8.616004	6.3790383
		-5.3547392	8.616004	7.0908179
		-4.4427743	8.616004	7.6951079
		-3.4634616	8.616004	8.1827478
		-2.4316463	8.616004	8.5463467
		-1.3629696	8.616004	8.7803898
		-0.27363196	8.616004	8.8813324
		0.8198539	8.616004	8.8476429
		1.9009116	8.616004	8.6798315
		2.9531531	8.616004	8.3804436
		3.9606283	8.616004	7.9540162
		4.9080639	8.616004	7.4070134
		5.7810988	8.616004	6.7477283
		6.5664983	8.616004	5.9861546
		7.2523561	8.616004	5.1338367
		7.8282752	8.616004	4.2036953
		8.2855263	8.616004	3.20983
		8.6171761	8.616004	2.1673071
		8.8181992	8.616004	1.0919298
		8.8855476	8.616004	0
		8.2750797	9.1466637	-1.024673
		8.0864382	9.1466637	-2.0338171
		7.7752151	9.1466637	-3.0121305
		7.346127	9.1466637	-3.944783
		6.8056798	9.1466637	-4.8176365
		6.1620655	9.1466637	-5.6174598
		5.4250407	9.1466637	-6.3321285
		4.6057773	9.1466637	-6.950808
		3.7166946	9.1466637	-7.4641209
		2.771271	9.1466637	-7.8642845
		1.7838378	9.1466637	-8.1452341
		0.76936316	9.1466637	-8.3027105
		-0.25677422	9.1466637	-8.3343267
		-1.2790192	9.1466637	-8.2396021
		-2.2818756	9.1466637	-8.0199738
		-3.2501411	9.1466637	-7.6787705
		-4.169138	9.1466637	-7.2211647
		-5.0249348	9.1466637	-6.6540937
		-5.8045588	9.1466637	-5.9861541
		-6.4961915	9.1466637	-5.2274694
		-7.0893488	9.1466637	-4.3895421
		-7.5750389	9.1466637	-3.4850733
		-7.9458985	9.1466637	-2.5277748
		-8.1963072	9.1466637	-1.5321578
		-8.3224678	9.1466637	-0.5133146
		-8.3224678	9.1466637	0.51331002
		-8.1963081	9.1466637	1.5321532
		-7.9459009	9.1466637	2.5277708
		-7.5750418	9.1466637	3.48507
		-7.0893526	9.1466637	4.3895392
		-6.4961958	9.1466637	5.2274671
		-5.804563	9.1466637	5.9861522
		-5.02494	9.1466637	6.6540933
		-4.1691432	9.1466637	7.2211647
		-3.2501464	9.1466637	7.678771
		-2.2818809	9.1466637	8.0199757
		-1.2790242	9.1466637	8.2396049
		-0.25677893	9.1466637	8.3343296
		0.76935893	9.1466637	8.3027153
		1.7838341	9.1466637	8.1452398
		2.7712681	9.1466637	7.8642907
		3.7166924	9.1466637	7.4641271
		4.6057754	9.1466637	6.9508147
		5.4250402	9.1466637	6.3321347
		6.1620665	9.1466637	5.6174664
		6.8056822	9.1466637	4.8176432
		7.3461308	9.1466637	3.9447892
		7.775219	9.1466637	3.0121362
		8.0864429	9.1466637	2.0338223
		8.2750854	9.1466637	1.0246778
		8.3382854	9.1466637	0
		7.7005758	9.6426277	-0.95353436
		7.5250311	9.6426277	-1.8926178
		7.235415	9.6426277	-2.8030109
		6.8361168	9.6426277	-3.6709135
		6.3331904	9.6426277	-4.4831686
		5.7342596	9.6426277	-5.2274637
		5.0484033	9.6426277	-5.8925157
		4.2860174	9.6426277	-6.4682431
		3.4586601	9.6426277	-6.9459186
		2.5788734	9.6426277	-7.3183007
		1.6599935	9.6426277	-7.5797453
		0.71594954	9.6426277	-7.7262888
		-0.23894747	9.6426277	-7.7557096
		-1.1902224	9.6426277	-7.6675615
		-2.1234546	9.6426277	-7.463181
		-3.0244977	9.6426277	-7.1456661
		-3.8796926	9.6426277	-6.71983
		-4.676075	9.6426277	-6.1921282
		-5.4015727	9.6426277	-5.5705605
		-6.0451889	9.6426277	-4.8645487
		-6.5971656	9.6426277	-4.084795
		-7.0491362	9.6426277	-3.2431195
		-7.3942485	9.6426277	-2.352282
		-7.6272721	9.6426277	-1.4257865
		-7.7446737	9.6426277	-0.47767735
		-7.7446742	9.6426277	0.47767305
		-7.6272736	9.6426277	1.4257823
		-7.3942509	9.6426277	2.3522785
		-7.0491385	9.6426277	3.2431164
		-6.5971689	9.6426277	4.0847921
		-6.0451922	9.6426277	4.8645463
		-5.401577	9.6426277	5.570559
		-4.6760798	9.6426277	6.1921277
		-3.8796973	9.6426277	6.71983
		-3.0245025	9.6426277	7.1456666
		-2.1234596	9.6426277	7.4631824
		-1.1902269	9.6426277	7.6675639
		-0.23895186	9.6426277	7.7557125
		0.7159456	9.6426277	7.7262931
		1.6599901	9.6426277	7.5797501
		2.5788708	9.6426277	7.3183064
		3.4586585	9.6426277	6.9459243
		4.286016	9.6426277	6.4682488
		5.0484028	9.6426277	5.8925214
		5.7342606	9.6426277	5.2274694
		6.3331928	9.6426277	4.4831743
		6.8361201	9.6426277	3.6709192
		7.2354188	9.6426277	2.8030164
		7.5250359	9.6426277	1.8926226
		7.7005816	9.6426277	0.95353866
		7.7593937	9.6426277	0
		7.0968609	10.102015	-0.87877852
		6.9350791	10.102015	-1.7442391
		6.6681681	10.102015	-2.5832586
		6.3001747	10.102015	-3.3831189
		5.8366771	10.102015	-4.1316943
		5.2847013	10.102015	-4.8176374
		4.6526151	10.102015	-5.4305501
		3.9499996	10.102015	-5.9611416
		3.187506	10.102015	-6.4013677
		2.3766932	10.102015	-6.744556
		1.5298523	10.102015	-6.9855037
		0.65982008	10.102015	-7.1205583
		-0.22021431	10.102015	-7.1476722
		-1.0969105	10.102015	-7.0664349
		-1.9569787	10.102015	-6.878078
		-2.7873812	10.102015	-6.5854559
		-3.5755298	10.102015	-6.1930046
		-4.3094769	10.102015	-5.7066736
		-4.978097	10.102015	-5.1338363
		-5.5712543	10.102015	-4.4831743
		-6.0799565	10.102015	-3.7645524
		-6.4964933	10.102015	-2.9888635
		-6.8145494	10.102015	-2.1678665
		-7.029304	10.102015	-1.3140068
		-7.1375017	10.102015	-0.44022807
		-7.1375022	10.102015	0.44022414
		-7.0293055	10.102015	1.314003
		-6.8145518	10.102015	2.1678629
		-6.4964957	10.102015	2.9888604
		-6.0799599	10.102015	3.76455
		-5.5712576	10.102015	4.4831724
		-4.9781008	10.102015	5.1338348
		-4.3094811	10.102015	5.7066731
		-3.5755343	10.102015	6.1930046
		-2.7873857	10.102015	6.5854559
		-1.9569832	10.102015	6.8780794
		-1.0969148	10.102015	7.0664372
		-0.22021836	10.102015	7.1476755
		0.65981644	10.102015	7.1205621
		1.5298491	10.102015	6.985508
		2.3766906	10.102015	6.7445612
		3.1875043	10.102015	6.4013734
		3.9499984	10.102015	5.9611468
		4.6526146	10.102015	5.4305558
		5.2847023	10.102015	4.8176432
		5.836679	10.102015	4.1316996
		6.3001776	10.102015	3.3831241
		6.6681714	10.102015	2.5832636
		6.9350834	10.102015	1.7442436
		7.0968661	10.102015	0.87878251
		7.1510677	10.102015	0
		6.4662256	10.52308	-0.80068922
		6.31882	10.52308	-1.589244
		6.0756269	10.52308	-2.3537073
		5.7403336	10.52308	-3.0824909
		5.3180227	10.52308	-3.7645469
		4.8150969	10.52308	-4.3895364
		4.2391782	10.52308	-4.9479852
		3.5989981	10.52308	-5.4314275
		2.9042604	10.52308	-5.8325348
		2.1654975	10.52308	-6.1452265
		1.3939078	10.52308	-6.3647637
		0.60118771	10.52308	-6.4878168
		-0.2006458	10.52308	-6.5125217
		-0.99943775	10.52308	-6.4385033
		-1.7830793	10.52308	-6.2668839
		-2.5396912	10.52308	-6.0002642
		-3.2578042	10.52308	-5.6426868
		-3.9265318	10.52308	-5.1995721
		-4.5357375	10.52308	-4.6776376
		-5.0761857	10.52308	-4.0847945
		-5.5396848	10.52308	-3.4300299
		-5.9192071	10.52308	-2.7232695
		-6.2090006	10.52308	-1.9752272
		-6.4046721	10.52308	-1.1972426
		-6.5032549	10.52308	-0.40110889
		-6.5032554	10.52308	0.40110531
		-6.4046731	10.52308	1.1972392
		-6.2090025	10.52308	1.9752241
		-5.9192095	10.52308	2.7232668
		-5.5396872	10.52308	3.4300275
		-5.076189	10.52308	4.0847926
		-4.5357409	10.52308	4.6776361
		-3.9265358	10.52308	5.1995716
		-3.2578082	10.52308	5.6426868
		-2.5396953	10.52308	6.0002646
		-1.7830833	10.52308	6.2668848
		-0.99944162	10.52308	6.4385052
		-0.2006495	10.52308	6.5125246
		0.60118437	10.52308	6.4878206
		1.3939049	10.52308	6.3647676
		2.1654952	10.52308	6.1452312
		2.904259	10.52308	5.83254
		3.5989969	10.52308	5.4314322
		4.2391782	10.52308	4.9479904
		4.8150973	10.52308	4.3895416
		5.3180251	10.52308	3.7645519
		5.7403364	10.52308	3.0824957
		6.0756302	10.52308	2.3537118
		6.3188238	10.52308	1.5892481
		6.4662304	10.52308	0.80069292
		6.5156155	10.52308	0
		5.8110619	10.904229	-0.71956265
		5.6785913	10.904229	-1.4282203
		5.4600387	10.904229	-2.1152275
		5.1587176	10.904229	-2.7701702
		4.7791958	10.904229	-3.3831196
		4.3272266	10.904229	-3.9447846
		3.8096609	10.904229	-4.446651
		3.2343442	10.904229	-4.8811102
		2.609998	10.904229	-5.2415771
		1.9460874	10.904229	-5.5225868
		1.2526758	10.904229	-5.7198801
		0.5402748	10.904229	-5.8304653
		-0.18031619	10.904229	-5.8526669
		-0.89817381	10.904229	-5.7861481
		-1.602416	10.904229	-5.6319175
		-2.2823675	10.904229	-5.392312
		-2.9277203	10.904229	-5.0709648
		-3.528692	10.904229	-4.6727467
		-4.0761724	10.904229	-4.2036948
		-4.561862	10.904229	-3.6709192
		-4.9783988	10.904229	-3.0824962
		-5.3194675	10.904229	-2.4473453
		-5.5798988	10.904229	-1.7750955
		-5.7557449	10.904229	-1.0759369
		-5.8443394	10.904229	-0.36046818
		-5.8443398	10.904229	0.36046493
		-5.7557459	10.904229	1.0759337
		-5.5799007	10.904229	1.7750926
		-5.3194699	10.904229	2.4473429
		-4.9784012	10.904229	3.082494
		-4.5618649	10.904229	3.6709175
		-4.0761752	10.904229	4.2036939
		-3.5286956	10.904229	4.6727462
		-2.9277239	10.904229	5.0709648
		-2.282371	10.904229	5.3923125
		-1.6024197	10.904229	5.6319184
		-0.89817733	10.904229	5.78615
		-0.1803195	10.904229	5.8526697
		0.54027182	10.904229	5.8304687
		1.2526731	10.904229	5.7198834
		1.9460852	10.904229	5.5225906
		2.6099968	10.904229	5.2415814
		3.2343431	10.904229	4.881115
		3.8096604	10.904229	4.4466553
		4.3272271	10.904229	3.9447892
		4.7791977	10.904229	3.3831241
		5.15872	10.904229	2.7701745
		5.4600415	10.904229	2.1152315
		5.6785946	10.904229	1.428224
		5.8110657	10.904229	0.71956593
		5.8554473	10.904229	0
		5.1338539	11.244014	-0.63570648
		5.0168214	11.244014	-1.2617788
		4.8237386	11.244014	-1.8687239
		4.5575328	11.244014	-2.447341
		4.2222395	11.244014	-2.9888587
		3.8229418	11.244014	-3.4850686
		3.3656919	11.244014	-3.9284484
		2.8574212	11.244014	-4.3122768
		2.305835	11.244014	-4.6307359
		1.7192948	11.244014	-4.8789973
		1.1066918	11.244014	-5.0532985
		0.47731245	11.244014	-5.1509967
		-0.15930256	11.244014	-5.1706109
		-0.79350275	11.244014	-5.1118441
		-1.4156742	11.244014	-4.9755869
		-2.0163856	11.244014	-4.7639046
		-2.5865307	11.244014	-4.4800062
		-3.1174664	11.244014	-4.1281958
		-3.6011446	11.244014	-3.7138062
		-4.0302334	11.244014	-3.2431188
		-4.3982277	11.244014	-2.7232692
		-4.6995492	11.244014	-2.1621373
		-4.9296303	11.244014	-1.5682299
		-5.0849838	11.244014	-0.95054972
		-5.1632538	11.244014	-0.31846005
		-5.1632538	11.244014	0.31845719
		-5.0849848	11.244014	0.95054692
		-4.9296322	11.244014	1.5682274
		-4.6995511	11.244014	2.1621351
		-4.3982296	11.244014	2.7232673
		-4.0302358	11.244014	3.2431173
		-3.6011474	11.244014	3.7138052
		-3.1174695	11.244014	4.1281953
		-2.5865338	11.244014	4.4800062
		-2.0163889	11.244014	4.763905
		-1.4156774	11.244014	4.9755878
		-0.79350579	11.244014	5.1118455
		-0.15930548	11.244014	5.1706128
		0.47730982	11.244014	5.1509991
		1.1066896	11.244014	5.0533013
		1.719293	11.244014	4.8790011
		2.3058338	11.244014	4.6307397
		2.8574202	11.244014	4.3122811
		3.3656917	11.244014	3.9284525
		3.8229423	11.244014	3.4850726
		4.2222409	11.244014	2.9888628
		4.5575347	11.244014	2.4473448
		4.823741	11.244014	1.8687274
		5.0168242	11.244014	1.2617821
		5.1338577	11.244014	0.6357094
		5.1730671	11.244014	0
		4.4371724	11.541146	-0.54943895
		4.3360214	11.541146	-1.0905511
		4.1691408	11.541146	-1.6151316
		3.93906	11.541146	-2.1152284
		3.6492672	11.541146	-2.5832603
		3.3041553	11.541146	-3.0121329
		2.9089558	11.541146	-3.3953445
		2.4696593	11.541146	-3.7270861
		1.9929253	11.541146	-4.0023289
		1.4859806	11.541146	-4.2169003
		0.95651001	11.541146	-4.3675485
		0.41253948	11.541146	-4.4519887
		-0.13768466	11.541146	-4.4689412
		-0.68582165	11.541146	-4.418149
		-1.2235624	11.541146	-4.3003826
		-1.7427552	11.541146	-4.1174264
		-2.2355294	11.541146	-3.8720539
		-2.6944156	11.541146	-3.5679853
		-3.112457	11.541146	-3.2098298
		-3.4833167	11.541146	-2.8030164
		-3.801373	11.541146	-2.3537121
		-4.0618043	11.541146	-1.8687279
		-4.2606626	11.541146	-1.3554157
		-4.3949337	11.541146	-0.82155687
		-4.4625821	11.541146	-0.27524394
		-4.4625826	11.541146	0.27524146
		-4.3949347	11.541146	0.82155442
		-4.260664	11.541146	1.3554136
		-4.0618057	11.541146	1.868726
		-3.8013749	11.541146	2.3537107
		-3.4833188	11.541146	2.8030152
		-3.1124594	11.541146	3.2098291
		-2.6944182	11.541146	3.5679851
		-2.2355323	11.541146	3.8720539
		-1.7427579	11.541146	4.1174264
		-1.2235651	11.541146	4.3003836
		-0.68582433	11.541146	4.4181504
		-0.13768719	11.541146	4.4689431
		0.41253722	11.541146	4.4519911
		0.95650798	11.541146	4.3675513
		1.485979	11.541146	4.2169037
		1.9929242	11.541146	4.0023327
		2.4696586	11.541146	3.7270896
		2.9089556	11.541146	3.3953481
		3.3041558	11.541146	3.0121362
		3.6492684	11.541146	2.5832636
		3.9390616	11.541146	2.1152318
		4.1691427	11.541146	1.6151346
		4.3360243	11.541146	1.0905539
		4.4371758	11.541146	0.54944146
		4.4710641	11.541146	0
		3.7236588	11.794499	-0.46108714
		3.6387732	11.794499	-0.91518646
		3.4987276	11.794499	-1.3554125
		3.3056445	11.794499	-1.7750918
		3.0624516	11.794499	-2.1678624
		2.772835	11.794499	-2.5277708
		2.441185	11.794499	-2.8493605
		2.0725291	11.794499	-3.1277568
		1.6724555	11.794499	-3.3587396
		1.2470294	11.794499	-3.5388074
		0.80269963	11.794499	-3.6652305
		0.34620163	11.794499	-3.7360923
		-0.11554445	11.794499	-3.750319
		-0.57553899	11.794499	-3.7076945
		-1.026809	11.794499	-3.6088653
		-1.4625137	11.794499	-3.4553289
		-1.8760481	11.794499	-3.2494133
		-2.2611437	11.794499	-2.99424
		-2.6119623	11.794499	-2.6936774
		-2.9231865	11.794499	-2.3522811
		-3.1900983	11.794499	-1.9752265
		-3.4086511	11.794499	-1.5682296
		-3.5755324	11.794499	-1.1374599
		-3.6882122	11.794499	-0.68944746
		-3.7449825	11.794499	-0.23098369
		-3.7449827	11.794499	0.23098162
		-3.6882129	11.794499	0.68944544
		-3.5755334	11.794499	1.1374581
		-3.4086525	11.794499	1.568228
		-3.1900997	11.794499	1.9752252
		-2.9231884	11.794499	2.3522799
		-2.6119645	11.794499	2.6936767
		-2.2611458	11.794499	2.9942398
		-1.8760505	11.794499	3.2494133
		-1.4625161	11.794499	3.4553292
		-1.0268114	11.794499	3.608866
		-0.57554126	11.794499	3.7076955
		-0.11554658	11.794499	3.7503204
		0.34619972	11.794499	3.7360945
		0.80269796	11.794499	3.6652327
		1.2470281	11.794499	3.53881
		1.6724546	11.794499	3.3587427
		2.0725284	11.794499	3.1277599
		2.4411848	11.794499	2.8493636
		2.7728355	11.794499	2.5277736
		3.0624526	11.794499	2.1678653
		3.3056462	11.794499	1.7750946
		3.4987292	11.794499	1.355415
		3.6387753	11.794499	0.91518879
		3.7236614	11.794499	0.46108922
		3.7521005	11.794499	0
		2.9960201	12.003112	-0.37098628
		2.927722	12.003112	-0.73635024
		2.8150425	12.003112	-1.0905519
		2.6596899	12.003112	-1.4282218
		2.4640191	12.003112	-1.7442414
		2.2309964	12.003112	-2.0338202
		1.964154	12.003112	-2.2925682
		1.6675369	12.003112	-2.5165632
		1.3456416	12.003112	-2.7024097
		1.0033479	12.003112	-2.8472903
		0.6458444	12.003112	-2.9490092
		0.27855051	12.003112	-3.0060239
		-0.092965961	12.003112	-3.0174706
		-0.46307316	12.003112	-2.9831753
		-0.82616067	12.003112	-2.9036582
		-1.1767244	12.003112	-2.7801244
		-1.5094503	12.003112	-2.6144469
		-1.8192945	12.003112	-2.4091368
		-2.1015599	12.003112	-2.1673069
		-2.3519678	12.003112	-1.8926227
		-2.5667224	12.003112	-1.5892483
		-2.742568	12.003112	-1.2617824
		-2.8768389	12.003112	-0.91518927
		-2.9675002	12.003112	-0.55472279
		-3.0131769	12.003112	-0.18584725
		-3.0131772	12.003112	0.18584558
		-2.9675007	12.003112	0.55472118
		-2.8768399	12.003112	0.91518784
		-2.742569	12.003112	1.2617812
		-2.5667236	12.003112	1.5892472
		-2.3519692	12.003112	1.8926219
		-2.1015615	12.003112	2.1673064
		-1.8192962	12.003112	2.4091365
		-1.5094522	12.003112	2.6144469
		-1.1767263	12.003112	2.7801247
		-0.82616252	12.003112	2.9036589
		-0.46307495	12.003112	2.9831762
		-0.092967667	12.003112	3.0174718
		0.27854896	12.003112	3.0060256
		0.64584309	12.003112	2.9490111
		1.0033468	12.003112	2.8472927
		1.3456409	12.003112	2.7024121
		1.6675364	12.003112	2.5165656
		1.9641539	12.003112	2.2925704
		2.2309968	12.003112	2.0338223
		2.46402	12.003112	1.7442436
		2.6596911	12.003112	1.4282241
		2.8150439	12.003112	1.0905539
		2.9277236	12.003112	0.73635209
		2.9960222	12.003112	0.37098798
		3.018904	12.003112	0
		2.2570162	12.166192	-0.2794781
		2.2055645	12.166192	-0.5547207
		2.1206789	12.166192	-0.8215543
		2.0036457	12.166192	-1.0759339
		1.8562396	12.166192	-1.3140035
		1.6806947	12.166192	-1.5321542
		1.4796722	12.166192	-1.727079
		1.2562191	12.166192	-1.895823
		1.0137231	12.166192	-2.0358284
		0.75586027	12.166192	-2.1449726
		0.48653924	12.166192	-2.2216012
		0.20984271	12.166192	-2.2645526
		-0.070034802	12.166192	-2.2731757
		-0.34885067	12.166192	-2.2473397
		-0.62237835	12.166192	-2.1874366
		-0.88647139	12.166192	-2.0943737
		-1.1371264	12.166192	-1.9695625
		-1.3705438	12.166192	-1.8148947
		-1.5831852	12.166192	-1.632715
		-1.7718271	12.166192	-1.4257849
		-1.9336098	12.166192	-1.1972414
		-2.066081	12.166192	-0.95054883
		-2.1672325	12.166192	-0.68944699
		-2.2355311	12.166192	-0.41789386
		-2.2699411	12.166192	-0.14000583
		-2.2699413	12.166192	0.14000458
		-2.2355313	12.166192	0.41789263
		-2.1672332	12.166192	0.68944591
		-2.0660818	12.166192	0.95054787
		-1.9336108	12.166192	1.1972406
		-1.7718282	12.166192	1.4257842
		-1.5831864	12.166192	1.6327145
		-1.3705453	12.166192	1.8148944
		-1.1371279	12.166192	1.9695625
		-0.88647282	12.166192	2.0943739
		-0.62237978	12.166192	2.1874368
		-0.34885204	12.166192	2.2473404
		-0.070036091	12.166192	2.2731767
		0.20984156	12.166192	2.2645538
		0.48653823	12.166192	2.2216024
		0.75585943	12.166192	2.144974
		1.0137227	12.166192	2.03583
		1.2562188	12.166192	1.8958248
		1.4796721	12.166192	1.7270808
		1.6806949	12.166192	1.532156
		1.8562402	12.166192	1.3140053
		2.0036466	12.166192	1.0759356
		2.1206799	12.166192	0.82155585
		2.2055659	12.166192	0.55472213
		2.2570179	12.166192	0.27947938
		2.2742555	12.166192	0
		1.5094509	12.283122	-0.18690982
		1.475041	12.283122	-0.370987
		1.4182711	12.283122	-0.54944038
		1.3400015	12.283122	-0.71956486
		1.2414188	12.283122	-0.87878138
		1.1240177	12.283122	-1.0246766
		0.98957753	12.283122	-1.1550387
		0.84013623	12.283122	-1.2678915
		0.67795938	12.283122	-1.3615245
		0.50550544	12.283122	-1.4345181
		0.32538849	12.283122	-1.4857659
		0.14033894	12.283122	-1.5144911
		-0.046837986	12.283122	-1.5202581
		-0.23330492	12.283122	-1.5029795
		-0.41623518	12.283122	-1.4629173
		-0.59285575	12.283122	-1.4006786
		-0.76048928	12.283122	-1.3172071
		-0.91659451	12.283122	-1.2137681
		-1.0588051	12.283122	-1.0919297
		-1.1849654	12.283122	-0.95353872
		-1.2931627	12.283122	-0.80069298
		-1.381757	12.283122	-0.63570958
		-1.4494052	12.283122	-0.46108946
		-1.495082	12.283122	-0.27947971
		-1.5180949	12.283122	-0.093633316
		-1.518095	12.283122	0.093632482
		-1.4950823	12.283122	0.27947891
		-1.4494057	12.283122	0.46108875
		-1.3817575	12.283122	0.63570893
		-1.2931633	12.283122	0.80069244
		-1.1849661	12.283122	0.95353824
		-1.0588059	12.283122	1.0919294
		-0.9165954	12.283122	1.213768
		-0.76049024	12.283122	1.3172071
		-0.59285671	12.283122	1.4006788
		-0.41623613	12.283122	1.4629176
		-0.23330581	12.283122	1.5029799
		-0.046838846	12.283122	1.5202587
		0.14033817	12.283122	1.5144919
		0.32538781	12.283122	1.4857669
		0.50550491	12.283122	1.4345192
		0.67795902	12.283122	1.3615257
		0.84013599	12.283122	1.2678927
		0.98957741	12.283122	1.1550398
		1.1240178	12.283122	1.0246778
		1.2414193	12.283122	0.87878257
		1.3400021	12.283122	0.71956599
		1.4182718	12.283122	0.54944146
		1.4750419	12.283122	0.37098795
		1.509452	12.283122	0.18691067
		1.5209802	12.283122	0
		0.7561596	12.353458	-0.093632497
		0.738922	12.353458	-0.18584599
		0.71048301	12.353458	-0.27524224
		0.67127389	12.353458	-0.36046609
		0.62188894	12.353458	-0.44022563
		0.56307679	12.353458	-0.51331186
		0.49572897	12.353458	-0.57861674
		0.42086637	12.353458	-0.63515043
		0.33962384	12.353458	-0.68205589
		0.25323302	12.353458	-0.71862203
		0.1630034	12.353458	-0.74429464
		0.070302814	12.353458	-0.75868446
		-0.023463495	12.353458	-0.76157343
		-0.11687412	12.353458	-0.75291777
		-0.20851307	12.353458	-0.73284858
		-0.29699117	12.353458	-0.70167017
		-0.3809672	12.353458	-0.65985507
		-0.45916814	12.353458	-0.60803729
		-0.53040856	12.353458	-0.54700232
		-0.5936085	12.353458	-0.47767532
		-0.64780998	12.353458	-0.40110725
		-0.6921913	12.353458	-0.3184588
		-0.72607976	12.353458	-0.23098283
		-0.74896151	12.353458	-0.14000539
		-0.76048982	12.353458	-0.046905622
		-0.76048988	12.353458	0.046905201
		-0.74896163	12.353458	0.14000499
		-0.72607994	12.353458	0.23098245
		-0.6921916	12.353458	0.31845847
		-0.64781034	12.353458	0.40110698
		-0.59360892	12.353458	0.47767511
		-0.53040898	12.353458	0.5470022
		-0.45916858	12.353458	0.60803723
		-0.38096768	12.353458	0.65985507
		-0.29699165	12.353458	0.70167017
		-0.20851354	12.353458	0.7328487
		-0.11687458	12.353458	0.75291795
		-0.023463927	12.353458	0.76157379
		0.070302427	12.353458	0.75868487
		0.16300306	12.353458	0.74429512
		0.25323272	12.353458	0.71862257
		0.33962366	12.353458	0.68205643
		0.42086622	12.353458	0.63515103
		0.49572894	12.353458	0.57861733
		0.56307685	12.353458	0.51331246
		0.62188917	12.353458	0.44022623
		0.67127419	12.353458	0.36046666
		0.71048337	12.353458	0.27524275
		0.73892242	12.353458	0.18584646
		0.75616014	12.353458	0.093632922
		0.76193523	12.353458	0
		0	-12.376933	0
		0	12.376933	0

		"vt"	2702
		0	0.019607844
		0.019607844	0.019607844
		0.039215688	0.019607844
		0.058823533	0.019607844
		0.078431375	0.019607844
		0.098039217	0.019607844
		0.11764706	0.019607844
		0.13725491	0.019607844
		0.15686275	0.019607844
		0.17647059	0.019607844
		0.19607843	0.019607844
		0.21568628	0.019607844
		0.23529412	0.019607844
		0.25490198	0.019607844
		0.27450982	0.019607844
		0.29411766	0.019607844
		0.3137255	0.019607844
		0.33333334	0.019607844
		0.35294119	0.019607844
		0.37254903	0.019607844
		0.39215687	0.019607844
		0.41176471	0.019607844
		0.43137255	0.019607844
		0.4509804	0.019607844
		0.47058824	0.019607844
		0.49019608	0.019607844
		0.50980395	0.019607844
		0.52941179	0.019607844
		0.54901963	0.019607844
		0.56862748	0.019607844
		0.58823532	0.019607844
		0.60784316	0.019607844
		0.627451	0.019607844
		0.64705884	0.019607844
		0.66666669	0.019607844
		0.68627453	0.019607844
		0.70588237	0.019607844
		0.72549021	0.019607844
		0.74509805	0.019607844
		0.7647059	0.019607844
		0.78431374	0.019607844
		0.80392158	0.019607844
		0.82352942	0.019607844
		0.84313726	0.019607844
		0.86274511	0.019607844
		0.88235295	0.019607844
		0.90196079	0.019607844
		0.92156863	0.019607844
		0.94117647	0.019607844
		0.96078432	0.019607844
		0.98039216	0.019607844
		1	0.019607844
		0	0.039215688
		0.019607844	0.039215688
		0.039215688	0.039215688
		0.058823533	0.039215688
		0.078431375	0.039215688
		0.098039217	0.039215688
		0.11764706	0.039215688
		0.13725491	0.039215688
		0.15686275	0.039215688
		0.17647059	0.039215688
		0.19607843	0.039215688
		0.21568628	0.039215688
		0.23529412	0.039215688
		0.25490198	0.039215688
		0.27450982	0.039215688
		0.29411766	0.039215688
		0.3137255	0.039215688
		0.33333334	0.039215688
		0.35294119	0.039215688
		0.37254903	0.039215688
		0.39215687	0.039215688
		0.41176471	0.039215688
		0.43137255	0.039215688
		0.4509804	0.039215688
		0.47058824	0.039215688
		0.49019608	0.039215688
		0.50980395	0.039215688
		0.52941179	0.039215688
		0.54901963	0.039215688
		0.56862748	0.039215688
		0.58823532	0.039215688
		0.60784316	0.039215688
		0.627451	0.039215688
		0.64705884	0.039215688
		0.66666669	0.039215688
		0.68627453	0.039215688
		0.70588237	0.039215688
		0.72549021	0.039215688
		0.74509805	0.039215688
		0.7647059	0.039215688
		0.78431374	0.039215688
		0.80392158	0.039215688
		0.82352942	0.039215688
		0.84313726	0.039215688
		0.86274511	0.039215688
		0.88235295	0.039215688
		0.90196079	0.039215688
		0.92156863	0.039215688
		0.94117647	0.039215688
		0.96078432	0.039215688
		0.98039216	0.039215688
		1	0.039215688
		0	0.058823533
		0.019607844	0.058823533
		0.039215688	0.058823533
		0.058823533	0.058823533
		0.078431375	0.058823533
		0.098039217	0.058823533
		0.11764706	0.058823533
		0.13725491	0.058823533
		0.15686275	0.058823533
		0.17647059	0.058823533
		0.19607843	0.058823533
		0.21568628	0.058823533
		0.23529412	0.058823533
		0.25490198	0.058823533
		0.27450982	0.058823533
		0.29411766	0.058823533
		0.3137255	0.058823533
		0.33333334	0.058823533
		0.35294119	0.058823533
		0.37254903	0.058823533
		0.39215687	0.058823533
		0.41176471	0.058823533
		0.43137255	0.058823533
		0.4509804	0.058823533
		0.47058824	0.058823533
		0.49019608	0.058823533
		0.50980395	0.058823533
		0.52941179	0.058823533
		0.54901963	0.058823533
		0.56862748	0.058823533
		0.58823532	0.058823533
		0.60784316	0.058823533
		0.627451	0.058823533
		0.64705884	0.058823533
		0.66666669	0.058823533
		0.68627453	0.058823533
		0.70588237	0.058823533
		0.72549021	0.058823533
		0.74509805	0.058823533
		0.7647059	0.058823533
		0.78431374	0.058823533
		0.80392158	0.058823533
		0.82352942	0.058823533
		0.84313726	0.058823533
		0.86274511	0.058823533
		0.88235295	0.058823533
		0.90196079	0.058823533
		0.92156863	0.058823533
		0.94117647	0.058823533
		0.96078432	0.058823533
		0.98039216	0.058823533
		1	0.058823533
		0	0.078431375
		0.019607844	0.078431375
		0.039215688	0.078431375
		0.058823533	0.078431375
		0.078431375	0.078431375
		0.098039217	0.078431375
		0.11764706	0.078431375
		0.13725491	0.078431375
		0.15686275	0.078431375
		0.17647059	0.078431375
		0.19607843	0.078431375
		0.21568628	0.078431375
		0.23529412	0.078431375
		0.25490198	0.078431375
		0.27450982	0.078431375
		0.29411766	0.078431375
		0.3137255	0.078431375
		0.33333334	0.078431375
		0.35294119	0.078431375
		0.37254903	0.078431375
		0.39215687	0.078431375
		0.41176471	0.078431375
		0.43137255	0.078431375
		0.4509804	0.078431375
		0.47058824	0.078431375
		0.49019608	0.078431375
		0.50980395	0.078431375
		0.52941179	0.078431375
		0.54901963	0.078431375
		0.56862748	0.078431375
		0.58823532	0.078431375
		0.60784316	0.078431375
		0.627451	0.078431375
		0.64705884	0.078431375
		0.66666669	0.078431375
		0.68627453	0.078431375
		0.70588237	0.078431375
		0.72549021	0.078431375
		0.74509805	0.078431375
		0.7647059	0.078431375
		0.78431374	0.078431375
		0.80392158	0.078431375
		0.82352942	0.078431375
		0.84313726	0.078431375
		0.86274511	0.078431375
		0.88235295	0.078431375
		0.90196079	0.078431375
		0.92156863	0.078431375
		0.94117647	0.078431375
		0.96078432	0.078431375
		0.98039216	0.078431375
		1	0.078431375
		0	0.098039217
		0.019607844	0.098039217
		0.039215688	0.098039217
		0.058823533	0.098039217
		0.078431375	0.098039217
		0.098039217	0.098039217
		0.11764706	0.098039217
		0.13725491	0.098039217
		0.15686275	0.098039217
		0.17647059	0.098039217
		0.19607843	0.098039217
		0.21568628	0.098039217
		0.23529412	0.098039217
		0.25490198	0.098039217
		0.27450982	0.098039217
		0.29411766	0.098039217
		0.3137255	0.098039217
		0.33333334	0.098039217
		0.35294119	0.098039217
		0.37254903	0.098039217
		0.39215687	0.098039217
		0.41176471	0.098039217
		0.43137255	0.098039217
		0.4509804	0.098039217
		0.47058824	0.098039217
		0.49019608	0.098039217
		0.50980395	0.098039217
		0.52941179	0.098039217
		0.54901963	0.098039217
		0.56862748	0.098039217
		0.58823532	0.098039217
		0.60784316	0.098039217
		0.627451	0.098039217
		0.64705884	0.098039217
		0.66666669	0.098039217
		0.68627453	0.098039217
		0.70588237	0.098039217
		0.72549021	0.098039217
		0.74509805	0.098039217
		0.7647059	0.098039217
		0.78431374	0.098039217
		0.80392158	0.098039217
		0.82352942	0.098039217
		0.84313726	0.098039217
		0.86274511	0.098039217
		0.88235295	0.098039217
		0.90196079	0.098039217
		0.92156863	0.098039217
		0.94117647	0.098039217
		0.96078432	0.098039217
		0.98039216	0.098039217
		1	0.098039217
		0	0.11764706
		0.019607844	0.11764706
		0.039215688	0.11764706
		0.058823533	0.11764706
		0.078431375	0.11764706
		0.098039217	0.11764706
		0.11764706	0.11764706
		0.13725491	0.11764706
		0.15686275	0.11764706
		0.17647059	0.11764706
		0.19607843	0.11764706
		0.21568628	0.11764706
		0.23529412	0.11764706
		0.25490198	0.11764706
		0.27450982	0.11764706
		0.29411766	0.11764706
		0.3137255	0.11764706
		0.33333334	0.11764706
		0.35294119	0.11764706
		0.37254903	0.11764706
		0.39215687	0.11764706
		0.41176471	0.11764706
		0.43137255	0.11764706
		0.4509804	0.11764706
		0.47058824	0.11764706
		0.49019608	0.11764706
		0.50980395	0.11764706
		0.52941179	0.11764706
		0.54901963	0.11764706
		0.56862748	0.11764706
		0.58823532	0.11764706
		0.60784316	0.11764706
		0.627451	0.11764706
		0.64705884	0.11764706
		0.66666669	0.11764706
		0.68627453	0.11764706
		0.70588237	0.11764706
		0.72549021	0.11764706
		0.74509805	0.11764706
		0.7647059	0.11764706
		0.78431374	0.11764706
		0.80392158	0.11764706
		0.82352942	0.11764706
		0.84313726	0.11764706
		0.86274511	0.11764706
		0.88235295	0.11764706
		0.90196079	0.11764706
		0.92156863	0.11764706
		0.94117647	0.11764706
		0.96078432	0.11764706
		0.98039216	0.11764706
		1	0.11764706
		0	0.13725491
		0.019607844	0.13725491
		0.039215688	0.13725491
		0.058823533	0.13725491
		0.078431375	0.13725491
		0.098039217	0.13725491
		0.11764706	0.13725491
		0.13725491	0.13725491
		0.15686275	0.13725491
		0.17647059	0.13725491
		0.19607843	0.13725491
		0.21568628	0.13725491
		0.23529412	0.13725491
		0.25490198	0.13725491
		0.27450982	0.13725491
		0.29411766	0.13725491
		0.3137255	0.13725491
		0.33333334	0.13725491
		0.35294119	0.13725491
		0.37254903	0.13725491
		0.39215687	0.13725491
		0.41176471	0.13725491
		0.43137255	0.13725491
		0.4509804	0.13725491
		0.47058824	0.13725491
		0.49019608	0.13725491
		0.50980395	0.13725491
		0.52941179	0.13725491
		0.54901963	0.13725491
		0.56862748	0.13725491
		0.58823532	0.13725491
		0.60784316	0.13725491
		0.627451	0.13725491
		0.64705884	0.13725491
		0.66666669	0.13725491
		0.68627453	0.13725491
		0.70588237	0.13725491
		0.72549021	0.13725491
		0.74509805	0.13725491
		0.7647059	0.13725491
		0.78431374	0.13725491
		0.80392158	0.13725491
		0.82352942	0.13725491
		0.84313726	0.13725491
		0.86274511	0.13725491
		0.88235295	0.13725491
		0.90196079	0.13725491
		0.92156863	0.13725491
		0.94117647	0.13725491
		0.96078432	0.13725491
		0.98039216	0.13725491
		1	0.13725491
		0	0.15686275
		0.019607844	0.15686275
		0.039215688	0.15686275
		0.058823533	0.15686275
		0.078431375	0.15686275
		0.098039217	0.15686275
		0.11764706	0.15686275
		0.13725491	0.15686275
		0.15686275	0.15686275
		0.17647059	0.15686275
		0.19607843	0.15686275
		0.21568628	0.15686275
		0.23529412	0.15686275
		0.25490198	0.15686275
		0.27450982	0.15686275
		0.29411766	0.15686275
		0.3137255	0.15686275
		0.33333334	0.15686275
		0.35294119	0.15686275
		0.37254903	0.15686275
		0.39215687	0.15686275
		0.41176471	0.15686275
		0.43137255	0.15686275
		0.4509804	0.15686275
		0.47058824	0.15686275
		0.49019608	0.15686275
		0.50980395	0.15686275
		0.52941179	0.15686275
		0.54901963	0.15686275
		0.56862748	0.15686275
		0.58823532	0.15686275
		0.60784316	0.15686275
		0.627451	0.15686275
		0.64705884	0.15686275
		0.66666669	0.15686275
		0.68627453	0.15686275
		0.70588237	0.15686275
		0.72549021	0.15686275
		0.74509805	0.15686275
		0.7647059	0.15686275
		0.78431374	0.15686275
		0.80392158	0.15686275
		0.82352942	0.15686275
		0.84313726	0.15686275
		0.86274511	0.15686275
		0.88235295	0.15686275
		0.90196079	0.15686275
		0.92156863	0.15686275
		0.94117647	0.15686275
		0.96078432	0.15686275
		0.98039216	0.15686275
		1	0.15686275
		0	0.17647059
		0.019607844	0.17647059
		0.039215688	0.17647059
		0.058823533	0.17647059
		0.078431375	0.17647059
		0.098039217	0.17647059
		0.11764706	0.17647059
		0.13725491	0.17647059
		0.15686275	0.17647059
		0.17647059	0.17647059
		0.19607843	0.17647059
		0.21568628	0.17647059
		0.23529412	0.17647059
		0.25490198	0.17647059
		0.27450982	0.17647059
		0.29411766	0.17647059
		0.3137255	0.17647059
		0.33333334	0.17647059
		0.35294119	0.17647059
		0.37254903	0.17647059
		0.39215687	0.17647059
		0.41176471	0.17647059
		0.43137255	0.17647059
		0.4509804	0.17647059
		0.47058824	0.17647059
		0.49019608	0.17647059
		0.50980395	0.17647059
		0.52941179	0.17647059
		0.54901963	0.17647059
		0.56862748	0.17647059
		0.58823532	0.17647059
		0.60784316	0.17647059
		0.627451	0.17647059
		0.64705884	0.17647059
		0.66666669	0.17647059
		0.68627453	0.17647059
		0.70588237	0.17647059
		0.72549021	0.17647059
		0.74509805	0.17647059
		0.7647059	0.17647059
		0.78431374	0.17647059
		0.80392158	0.17647059
		0.82352942	0.17647059
		0.84313726	0.17647059
		0.86274511	0.17647059
		0.88235295	0.17647059
		0.90196079	0.17647059
		0.92156863	0.17647059
		0.94117647	0.17647059
		0.96078432	0.17647059
		0.98039216	0.17647059
		1	0.17647059
		0	0.19607843
		0.019607844	0.19607843
		0.039215688	0.19607843
		0.058823533	0.19607843
		0.078431375	0.19607843
		0.098039217	0.19607843
		0.11764706	0.19607843
		0.13725491	0.19607843
		0.15686275	0.19607843
		0.17647059	0.19607843
		0.19607843	0.19607843
		0.21568628	0.19607843
		0.23529412	0.19607843
		0.25490198	0.19607843
		0.27450982	0.19607843
		0.29411766	0.19607843
		0.3137255	0.19607843
		0.33333334	0.19607843
		0.35294119	0.19607843
		0.37254903	0.19607843
		0.39215687	0.19607843
		0.41176471	0.19607843
		0.43137255	0.19607843
		0.4509804	0.19607843
		0.47058824	0.19607843
		0.49019608	0.19607843
		0.50980395	0.19607843
		0.52941179	0.19607843
		0.54901963	0.19607843
		0.56862748	0.19607843
		0.58823532	0.19607843
		0.60784316	0.19607843
		0.627451	0.19607843
		0.64705884	0.19607843
		0.66666669	0.19607843
		0.68627453	0.19607843
		0.70588237	0.19607843
		0.72549021	0.19607843
		0.74509805	0.19607843
		0.7647059	0.19607843
		0.78431374	0.19607843
		0.80392158	0.19607843
		0.82352942	0.19607843
		0.84313726	0.19607843
		0.86274511	0.19607843
		0.88235295	0.19607843
		0.90196079	0.19607843
		0.92156863	0.19607843
		0.94117647	0.19607843
		0.96078432	0.19607843
		0.98039216	0.19607843
		1	0.19607843
		0	0.21568628
		0.019607844	0.21568628
		0.039215688	0.21568628
		0.058823533	0.21568628
		0.078431375	0.21568628
		0.098039217	0.21568628
		0.11764706	0.21568628
		0.13725491	0.21568628
		0.15686275	0.21568628
		0.17647059	0.21568628
		0.19607843	0.21568628
		0.21568628	0.21568628
		0.23529412	0.21568628
		0.25490198	0.21568628
		0.27450982	0.21568628
		0.29411766	0.21568628
		0.3137255	0.21568628
		0.33333334	0.21568628
		0.35294119	0.21568628
		0.37254903	0.21568628
		0.39215687	0.21568628
		0.41176471	0.21568628
		0.43137255	0.21568628
		0.4509804	0.21568628
		0.47058824	0.21568628
		0.49019608	0.21568628
		0.50980395	0.21568628
		0.52941179	0.21568628
		0.54901963	0.21568628
		0.56862748	0.21568628
		0.58823532	0.21568628
		0.60784316	0.21568628
		0.627451	0.21568628
		0.64705884	0.21568628
		0.66666669	0.21568628
		0.68627453	0.21568628
		0.70588237	0.21568628
		0.72549021	0.21568628
		0.74509805	0.21568628
		0.7647059	0.21568628
		0.78431374	0.21568628
		0.80392158	0.21568628
		0.82352942	0.21568628
		0.84313726	0.21568628
		0.86274511	0.21568628
		0.88235295	0.21568628
		0.90196079	0.21568628
		0.92156863	0.21568628
		0.94117647	0.21568628
		0.96078432	0.21568628
		0.98039216	0.21568628
		1	0.21568628
		0	0.23529412
		0.019607844	0.23529412
		0.039215688	0.23529412
		0.058823533	0.23529412
		0.078431375	0.23529412
		0.098039217	0.23529412
		0.11764706	0.23529412
		0.13725491	0.23529412
		0.15686275	0.23529412
		0.17647059	0.23529412
		0.19607843	0.23529412
		0.21568628	0.23529412
		0.23529412	0.23529412
		0.25490198	0.23529412
		0.27450982	0.23529412
		0.29411766	0.23529412
		0.3137255	0.23529412
		0.33333334	0.23529412
		0.35294119	0.23529412
		0.37254903	0.23529412
		0.39215687	0.23529412
		0.41176471	0.23529412
		0.43137255	0.23529412
		0.4509804	0.23529412
		0.47058824	0.23529412
		0.49019608	0.23529412
		0.50980395	0.23529412
		0.52941179	0.23529412
		0.54901963	0.23529412
		0.56862748	0.23529412
		0.58823532	0.23529412
		0.60784316	0.23529412
		0.627451	0.23529412
		0.64705884	0.23529412
		0.66666669	0.23529412
		0.68627453	0.23529412
		0.70588237	0.23529412
		0.72549021	0.23529412
		0.74509805	0.23529412
		0.7647059	0.23529412
		0.78431374	0.23529412
		0.80392158	0.23529412
		0.82352942	0.23529412
		0.84313726	0.23529412
		0.86274511	0.23529412
		0.88235295	0.23529412
		0.90196079	0.23529412
		0.92156863	0.23529412
		0.94117647	0.23529412
		0.96078432	0.23529412
		0.98039216	0.23529412
		1	0.23529412
		0	0.25490198
		0.019607844	0.25490198
		0.039215688	0.25490198
		0.058823533	0.25490198
		0.078431375	0.25490198
		0.098039217	0.25490198
		0.11764706	0.25490198
		0.13725491	0.25490198
		0.15686275	0.25490198
		0.17647059	0.25490198
		0.19607843	0.25490198
		0.21568628	0.25490198
		0.23529412	0.25490198
		0.25490198	0.25490198
		0.27450982	0.25490198
		0.29411766	0.25490198
		0.3137255	0.25490198
		0.33333334	0.25490198
		0.35294119	0.25490198
		0.37254903	0.25490198
		0.39215687	0.25490198
		0.41176471	0.25490198
		0.43137255	0.25490198
		0.4509804	0.25490198
		0.47058824	0.25490198
		0.49019608	0.25490198
		0.50980395	0.25490198
		0.52941179	0.25490198
		0.54901963	0.25490198
		0.56862748	0.25490198
		0.58823532	0.25490198
		0.60784316	0.25490198
		0.627451	0.25490198
		0.64705884	0.25490198
		0.66666669	0.25490198
		0.68627453	0.25490198
		0.70588237	0.25490198
		0.72549021	0.25490198
		0.74509805	0.25490198
		0.7647059	0.25490198
		0.78431374	0.25490198
		0.80392158	0.25490198
		0.82352942	0.25490198
		0.84313726	0.25490198
		0.86274511	0.25490198
		0.88235295	0.25490198
		0.90196079	0.25490198
		0.92156863	0.25490198
		0.94117647	0.25490198
		0.96078432	0.25490198
		0.98039216	0.25490198
		1	0.25490198
		0	0.27450982
		0.019607844	0.27450982
		0.039215688	0.27450982
		0.058823533	0.27450982
		0.078431375	0.27450982
		0.098039217	0.27450982
		0.11764706	0.27450982
		0.13725491	0.27450982
		0.15686275	0.27450982
		0.17647059	0.27450982
		0.19607843	0.27450982
		0.21568628	0.27450982
		0.23529412	0.27450982
		0.25490198	0.27450982
		0.27450982	0.27450982
		0.29411766	0.27450982
		0.3137255	0.27450982
		0.33333334	0.27450982
		0.35294119	0.27450982
		0.37254903	0.27450982
		0.39215687	0.27450982
		0.41176471	0.27450982
		0.43137255	0.27450982
		0.4509804	0.27450982
		0.47058824	0.27450982
		0.49019608	0.27450982
		0.50980395	0.27450982
		0.52941179	0.27450982
		0.54901963	0.27450982
		0.56862748	0.27450982
		0.58823532	0.27450982
		0.60784316	0.27450982
		0.627451	0.27450982
		0.64705884	0.27450982
		0.66666669	0.27450982
		0.68627453	0.27450982
		0.70588237	0.27450982
		0.72549021	0.27450982
		0.74509805	0.27450982
		0.7647059	0.27450982
		0.78431374	0.27450982
		0.80392158	0.27450982
		0.82352942	0.27450982
		0.84313726	0.27450982
		0.86274511	0.27450982
		0.88235295	0.27450982
		0.90196079	0.27450982
		0.92156863	0.27450982
		0.94117647	0.27450982
		0.96078432	0.27450982
		0.98039216	0.27450982
		1	0.27450982
		0	0.29411766
		0.019607844	0.29411766
		0.039215688	0.29411766
		0.058823533	0.29411766
		0.078431375	0.29411766
		0.098039217	0.29411766
		0.11764706	0.29411766
		0.13725491	0.29411766
		0.15686275	0.29411766
		0.17647059	0.29411766
		0.19607843	0.29411766
		0.21568628	0.29411766
		0.23529412	0.29411766
		0.25490198	0.29411766
		0.27450982	0.29411766
		0.29411766	0.29411766
		0.3137255	0.29411766
		0.33333334	0.29411766
		0.35294119	0.29411766
		0.37254903	0.29411766
		0.39215687	0.29411766
		0.41176471	0.29411766
		0.43137255	0.29411766
		0.4509804	0.29411766
		0.47058824	0.29411766
		0.49019608	0.29411766
		0.50980395	0.29411766
		0.52941179	0.29411766
		0.54901963	0.29411766
		0.56862748	0.29411766
		0.58823532	0.29411766
		0.60784316	0.29411766
		0.627451	0.29411766
		0.64705884	0.29411766
		0.66666669	0.29411766
		0.68627453	0.29411766
		0.70588237	0.29411766
		0.72549021	0.29411766
		0.74509805	0.29411766
		0.7647059	0.29411766
		0.78431374	0.29411766
		0.80392158	0.29411766
		0.82352942	0.29411766
		0.84313726	0.29411766
		0.86274511	0.29411766
		0.88235295	0.29411766
		0.90196079	0.29411766
		0.92156863	0.29411766
		0.94117647	0.29411766
		0.96078432	0.29411766
		0.98039216	0.29411766
		1	0.29411766
		0	0.3137255
		0.019607844	0.3137255
		0.039215688	0.3137255
		0.058823533	0.3137255
		0.078431375	0.3137255
		0.098039217	0.3137255
		0.11764706	0.3137255
		0.13725491	0.3137255
		0.15686275	0.3137255
		0.17647059	0.3137255
		0.19607843	0.3137255
		0.21568628	0.3137255
		0.23529412	0.3137255
		0.25490198	0.3137255
		0.27450982	0.3137255
		0.29411766	0.3137255
		0.3137255	0.3137255
		0.33333334	0.3137255
		0.35294119	0.3137255
		0.37254903	0.3137255
		0.39215687	0.3137255
		0.41176471	0.3137255
		0.43137255	0.3137255
		0.4509804	0.3137255
		0.47058824	0.3137255
		0.49019608	0.3137255
		0.50980395	0.3137255
		0.52941179	0.3137255
		0.54901963	0.3137255
		0.56862748	0.3137255
		0.58823532	0.3137255
		0.60784316	0.3137255
		0.627451	0.3137255
		0.64705884	0.3137255
		0.66666669	0.3137255
		0.68627453	0.3137255
		0.70588237	0.3137255
		0.72549021	0.3137255
		0.74509805	0.3137255
		0.7647059	0.3137255
		0.78431374	0.3137255
		0.80392158	0.3137255
		0.82352942	0.3137255
		0.84313726	0.3137255
		0.86274511	0.3137255
		0.88235295	0.3137255
		0.90196079	0.3137255
		0.92156863	0.3137255
		0.94117647	0.3137255
		0.96078432	0.3137255
		0.98039216	0.3137255
		1	0.3137255
		0	0.33333334
		0.019607844	0.33333334
		0.039215688	0.33333334
		0.058823533	0.33333334
		0.078431375	0.33333334
		0.098039217	0.33333334
		0.11764706	0.33333334
		0.13725491	0.33333334
		0.15686275	0.33333334
		0.17647059	0.33333334
		0.19607843	0.33333334
		0.21568628	0.33333334
		0.23529412	0.33333334
		0.25490198	0.33333334
		0.27450982	0.33333334
		0.29411766	0.33333334
		0.3137255	0.33333334
		0.33333334	0.33333334
		0.35294119	0.33333334
		0.37254903	0.33333334
		0.39215687	0.33333334
		0.41176471	0.33333334
		0.43137255	0.33333334
		0.4509804	0.33333334
		0.47058824	0.33333334
		0.49019608	0.33333334
		0.50980395	0.33333334
		0.52941179	0.33333334
		0.54901963	0.33333334
		0.56862748	0.33333334
		0.58823532	0.33333334
		0.60784316	0.33333334
		0.627451	0.33333334
		0.64705884	0.33333334
		0.66666669	0.33333334
		0.68627453	0.33333334
		0.70588237	0.33333334
		0.72549021	0.33333334
		0.74509805	0.33333334
		0.7647059	0.33333334
		0.78431374	0.33333334
		0.80392158	0.33333334
		0.82352942	0.33333334
		0.84313726	0.33333334
		0.86274511	0.33333334
		0.88235295	0.33333334
		0.90196079	0.33333334
		0.92156863	0.33333334
		0.94117647	0.33333334
		0.96078432	0.33333334
		0.98039216	0.33333334
		1	0.33333334
		0	0.35294119
		0.019607844	0.35294119
		0.039215688	0.35294119
		0.058823533	0.35294119
		0.078431375	0.35294119
		0.098039217	0.35294119
		0.11764706	0.35294119
		0.13725491	0.35294119
		0.15686275	0.35294119
		0.17647059	0.35294119
		0.19607843	0.35294119
		0.21568628	0.35294119
		0.23529412	0.35294119
		0.25490198	0.35294119
		0.27450982	0.35294119
		0.29411766	0.35294119
		0.3137255	0.35294119
		0.33333334	0.35294119
		0.35294119	0.35294119
		0.37254903	0.35294119
		0.39215687	0.35294119
		0.41176471	0.35294119
		0.43137255	0.35294119
		0.4509804	0.35294119
		0.47058824	0.35294119
		0.49019608	0.35294119
		0.50980395	0.35294119
		0.52941179	0.35294119
		0.54901963	0.35294119
		0.56862748	0.35294119
		0.58823532	0.35294119
		0.60784316	0.35294119
		0.627451	0.35294119
		0.64705884	0.35294119
		0.66666669	0.35294119
		0.68627453	0.35294119
		0.70588237	0.35294119
		0.72549021	0.35294119
		0.74509805	0.35294119
		0.7647059	0.35294119
		0.78431374	0.35294119
		0.80392158	0.35294119
		0.82352942	0.35294119
		0.84313726	0.35294119
		0.86274511	0.35294119
		0.88235295	0.35294119
		0.90196079	0.35294119
		0.92156863	0.35294119
		0.94117647	0.35294119
		0.96078432	0.35294119
		0.98039216	0.35294119
		1	0.35294119
		0	0.37254903
		0.019607844	0.37254903
		0.039215688	0.37254903
		0.058823533	0.37254903
		0.078431375	0.37254903
		0.098039217	0.37254903
		0.11764706	0.37254903
		0.13725491	0.37254903
		0.15686275	0.37254903
		0.17647059	0.37254903
		0.19607843	0.37254903
		0.21568628	0.37254903
		0.23529412	0.37254903
		0.25490198	0.37254903
		0.27450982	0.37254903
		0.29411766	0.37254903
		0.3137255	0.37254903
		0.33333334	0.37254903
		0.35294119	0.37254903
		0.37254903	0.37254903
		0.39215687	0.37254903
		0.41176471	0.37254903
		0.43137255	0.37254903
		0.4509804	0.37254903
		0.47058824	0.37254903
		0.49019608	0.37254903
		0.50980395	0.37254903
		0.52941179	0.37254903
		0.54901963	0.37254903
		0.56862748	0.37254903
		0.58823532	0.37254903
		0.60784316	0.37254903
		0.627451	0.37254903
		0.64705884	0.37254903
		0.66666669	0.37254903
		0.68627453	0.37254903
		0.70588237	0.37254903
		0.72549021	0.37254903
		0.74509805	0.37254903
		0.7647059	0.37254903
		0.78431374	0.37254903
		0.80392158	0.37254903
		0.82352942	0.37254903
		0.84313726	0.37254903
		0.86274511	0.37254903
		0.88235295	0.37254903
		0.90196079	0.37254903
		0.92156863	0.37254903
		0.94117647	0.37254903
		0.96078432	0.37254903
		0.98039216	0.37254903
		1	0.37254903
		0	0.39215687
		0.019607844	0.39215687
		0.039215688	0.39215687
		0.058823533	0.39215687
		0.078431375	0.39215687
		0.098039217	0.39215687
		0.11764706	0.39215687
		0.13725491	0.39215687
		0.15686275	0.39215687
		0.17647059	0.39215687
		0.19607843	0.39215687
		0.21568628	0.39215687
		0.23529412	0.39215687
		0.25490198	0.39215687
		0.27450982	0.39215687
		0.29411766	0.39215687
		0.3137255	0.39215687
		0.33333334	0.39215687
		0.35294119	0.39215687
		0.37254903	0.39215687
		0.39215687	0.39215687
		0.41176471	0.39215687
		0.43137255	0.39215687
		0.4509804	0.39215687
		0.47058824	0.39215687
		0.49019608	0.39215687
		0.50980395	0.39215687
		0.52941179	0.39215687
		0.54901963	0.39215687
		0.56862748	0.39215687
		0.58823532	0.39215687
		0.60784316	0.39215687
		0.627451	0.39215687
		0.64705884	0.39215687
		0.66666669	0.39215687
		0.68627453	0.39215687
		0.70588237	0.39215687
		0.72549021	0.39215687
		0.74509805	0.39215687
		0.7647059	0.39215687
		0.78431374	0.39215687
		0.80392158	0.39215687
		0.82352942	0.39215687
		0.84313726	0.39215687
		0.86274511	0.39215687
		0.88235295	0.39215687
		0.90196079	0.39215687
		0.92156863	0.39215687
		0.94117647	0.39215687
		0.96078432	0.39215687
		0.98039216	0.39215687
		1	0.39215687
		0	0.41176471
		0.019607844	0.41176471
		0.039215688	0.41176471
		0.058823533	0.41176471
		0.078431375	0.41176471
		0.098039217	0.41176471
		0.11764706	0.41176471
		0.13725491	0.41176471
		0.15686275	0.41176471
		0.17647059	0.41176471
		0.19607843	0.41176471
		0.21568628	0.41176471
		0.23529412	0.41176471
		0.25490198	0.41176471
		0.27450982	0.41176471
		0.29411766	0.41176471
		0.3137255	0.41176471
		0.33333334	0.41176471
		0.35294119	0.41176471
		0.37254903	0.41176471
		0.39215687	0.41176471
		0.41176471	0.41176471
		0.43137255	0.41176471
		0.4509804	0.41176471
		0.47058824	0.41176471
		0.49019608	0.41176471
		0.50980395	0.41176471
		0.52941179	0.41176471
		0.54901963	0.41176471
		0.56862748	0.41176471
		0.58823532	0.41176471
		0.60784316	0.41176471
		0.627451	0.41176471
		0.64705884	0.41176471
		0.66666669	0.41176471
		0.68627453	0.41176471
		0.70588237	0.41176471
		0.72549021	0.41176471
		0.74509805	0.41176471
		0.7647059	0.41176471
		0.78431374	0.41176471
		0.80392158	0.41176471
		0.82352942	0.41176471
		0.84313726	0.41176471
		0.86274511	0.41176471
		0.88235295	0.41176471
		0.90196079	0.41176471
		0.92156863	0.41176471
		0.94117647	0.41176471
		0.96078432	0.41176471
		0.98039216	0.41176471
		1	0.41176471
		0	0.43137255
		0.019607844	0.43137255
		0.039215688	0.43137255
		0.058823533	0.43137255
		0.078431375	0.43137255
		0.098039217	0.43137255
		0.11764706	0.43137255
		0.13725491	0.43137255
		0.15686275	0.43137255
		0.17647059	0.43137255
		0.19607843	0.43137255
		0.21568628	0.43137255
		0.23529412	0.43137255
		0.25490198	0.43137255
		0.27450982	0.43137255
		0.29411766	0.43137255
		0.3137255	0.43137255
		0.33333334	0.43137255
		0.35294119	0.43137255
		0.37254903	0.43137255
		0.39215687	0.43137255
		0.41176471	0.43137255
		0.43137255	0.43137255
		0.4509804	0.43137255
		0.47058824	0.43137255
		0.49019608	0.43137255
		0.50980395	0.43137255
		0.52941179	0.43137255
		0.54901963	0.43137255
		0.56862748	0.43137255
		0.58823532	0.43137255
		0.60784316	0.43137255
		0.627451	0.43137255
		0.64705884	0.43137255
		0.66666669	0.43137255
		0.68627453	0.43137255
		0.70588237	0.43137255
		0.72549021	0.43137255
		0.74509805	0.43137255
		0.7647059	0.43137255
		0.78431374	0.43137255
		0.80392158	0.43137255
		0.82352942	0.43137255
		0.84313726	0.43137255
		0.86274511	0.43137255
		0.88235295	0.43137255
		0.90196079	0.43137255
		0.92156863	0.43137255
		0.94117647	0.43137255
		0.96078432	0.43137255
		0.98039216	0.43137255
		1	0.43137255
		0	0.4509804
		0.019607844	0.4509804
		0.039215688	0.4509804
		0.058823533	0.4509804
		0.078431375	0.4509804
		0.098039217	0.4509804
		0.11764706	0.4509804
		0.13725491	0.4509804
		0.15686275	0.4509804
		0.17647059	0.4509804
		0.19607843	0.4509804
		0.21568628	0.4509804
		0.23529412	0.4509804
		0.25490198	0.4509804
		0.27450982	0.4509804
		0.29411766	0.4509804
		0.3137255	0.4509804
		0.33333334	0.4509804
		0.35294119	0.4509804
		0.37254903	0.4509804
		0.39215687	0.4509804
		0.41176471	0.4509804
		0.43137255	0.4509804
		0.4509804	0.4509804
		0.47058824	0.4509804
		0.49019608	0.4509804
		0.50980395	0.4509804
		0.52941179	0.4509804
		0.54901963	0.4509804
		0.56862748	0.4509804
		0.58823532	0.4509804
		0.60784316	0.4509804
		0.627451	0.4509804
		0.64705884	0.4509804
		0.66666669	0.4509804
		0.68627453	0.4509804
		0.70588237	0.4509804
		0.72549021	0.4509804
		0.74509805	0.4509804
		0.7647059	0.4509804
		0.78431374	0.4509804
		0.80392158	0.4509804
		0.82352942	0.4509804
		0.84313726	0.4509804
		0.86274511	0.4509804
		0.88235295	0.4509804
		0.90196079	0.4509804
		0.92156863	0.4509804
		0.94117647	0.4509804
		0.96078432	0.4509804
		0.98039216	0.4509804
		1	0.4509804
		0	0.47058824
		0.019607844	0.47058824
		0.039215688	0.47058824
		0.058823533	0.47058824
		0.078431375	0.47058824
		0.098039217	0.47058824
		0.11764706	0.47058824
		0.13725491	0.47058824
		0.15686275	0.47058824
		0.17647059	0.47058824
		0.19607843	0.47058824
		0.21568628	0.47058824
		0.23529412	0.47058824
		0.25490198	0.47058824
		0.27450982	0.47058824
		0.29411766	0.47058824
		0.3137255	0.47058824
		0.33333334	0.47058824
		0.35294119	0.47058824
		0.37254903	0.47058824
		0.39215687	0.47058824
		0.41176471	0.47058824
		0.43137255	0.47058824
		0.4509804	0.47058824
		0.47058824	0.47058824
		0.49019608	0.47058824
		0.50980395	0.47058824
		0.52941179	0.47058824
		0.54901963	0.47058824
		0.56862748	0.47058824
		0.58823532	0.47058824
		0.60784316	0.47058824
		0.627451	0.47058824
		0.64705884	0.47058824
		0.66666669	0.47058824
		0.68627453	0.47058824
		0.70588237	0.47058824
		0.72549021	0.47058824
		0.74509805	0.47058824
		0.7647059	0.47058824
		0.78431374	0.47058824
		0.80392158	0.47058824
		0.82352942	0.47058824
		0.84313726	0.47058824
		0.86274511	0.47058824
		0.88235295	0.47058824
		0.90196079	0.47058824
		0.92156863	0.47058824
		0.94117647	0.47058824
		0.96078432	0.47058824
		0.98039216	0.47058824
		1	0.47058824
		0	0.49019608
		0.019607844	0.49019608
		0.039215688	0.49019608
		0.058823533	0.49019608
		0.078431375	0.49019608
		0.098039217	0.49019608
		0.11764706	0.49019608
		0.13725491	0.49019608
		0.15686275	0.49019608
		0.17647059	0.49019608
		0.19607843	0.49019608
		0.21568628	0.49019608
		0.23529412	0.49019608
		0.25490198	0.49019608
		0.27450982	0.49019608
		0.29411766	0.49019608
		0.3137255	0.49019608
		0.33333334	0.49019608
		0.35294119	0.49019608
		0.37254903	0.49019608
		0.39215687	0.49019608
		0.41176471	0.49019608
		0.43137255	0.49019608
		0.4509804	0.49019608
		0.47058824	0.49019608
		0.49019608	0.49019608
		0.50980395	0.49019608
		0.52941179	0.49019608
		0.54901963	0.49019608
		0.56862748	0.49019608
		0.58823532	0.49019608
		0.60784316	0.49019608
		0.627451	0.49019608
		0.64705884	0.49019608
		0.66666669	0.49019608
		0.68627453	0.49019608
		0.70588237	0.49019608
		0.72549021	0.49019608
		0.74509805	0.49019608
		0.7647059	0.49019608
		0.78431374	0.49019608
		0.80392158	0.49019608
		0.82352942	0.49019608
		0.84313726	0.49019608
		0.86274511	0.49019608
		0.88235295	0.49019608
		0.90196079	0.49019608
		0.92156863	0.49019608
		0.94117647	0.49019608
		0.96078432	0.49019608
		0.98039216	0.49019608
		1	0.49019608
		0	0.50980395
		0.019607844	0.50980395
		0.039215688	0.50980395
		0.058823533	0.50980395
		0.078431375	0.50980395
		0.098039217	0.50980395
		0.11764706	0.50980395
		0.13725491	0.50980395
		0.15686275	0.50980395
		0.17647059	0.50980395
		0.19607843	0.50980395
		0.21568628	0.50980395
		0.23529412	0.50980395
		0.25490198	0.50980395
		0.27450982	0.50980395
		0.29411766	0.50980395
		0.3137255	0.50980395
		0.33333334	0.50980395
		0.35294119	0.50980395
		0.37254903	0.50980395
		0.39215687	0.50980395
		0.41176471	0.50980395
		0.43137255	0.50980395
		0.4509804	0.50980395
		0.47058824	0.50980395
		0.49019608	0.50980395
		0.50980395	0.50980395
		0.52941179	0.50980395
		0.54901963	0.50980395
		0.56862748	0.50980395
		0.58823532	0.50980395
		0.60784316	0.50980395
		0.627451	0.50980395
		0.64705884	0.50980395
		0.66666669	0.50980395
		0.68627453	0.50980395
		0.70588237	0.50980395
		0.72549021	0.50980395
		0.74509805	0.50980395
		0.7647059	0.50980395
		0.78431374	0.50980395
		0.80392158	0.50980395
		0.82352942	0.50980395
		0.84313726	0.50980395
		0.86274511	0.50980395
		0.88235295	0.50980395
		0.90196079	0.50980395
		0.92156863	0.50980395
		0.94117647	0.50980395
		0.96078432	0.50980395
		0.98039216	0.50980395
		1	0.50980395
		0	0.52941179
		0.019607844	0.52941179
		0.039215688	0.52941179
		0.058823533	0.52941179
		0.078431375	0.52941179
		0.098039217	0.52941179
		0.11764706	0.52941179
		0.13725491	0.52941179
		0.15686275	0.52941179
		0.17647059	0.52941179
		0.19607843	0.52941179
		0.21568628	0.52941179
		0.23529412	0.52941179
		0.25490198	0.52941179
		0.27450982	0.52941179
		0.29411766	0.52941179
		0.3137255	0.52941179
		0.33333334	0.52941179
		0.35294119	0.52941179
		0.37254903	0.52941179
		0.39215687	0.52941179
		0.41176471	0.52941179
		0.43137255	0.52941179
		0.4509804	0.52941179
		0.47058824	0.52941179
		0.49019608	0.52941179
		0.50980395	0.52941179
		0.52941179	0.52941179
		0.54901963	0.52941179
		0.56862748	0.52941179
		0.58823532	0.52941179
		0.60784316	0.52941179
		0.627451	0.52941179
		0.64705884	0.52941179
		0.66666669	0.52941179
		0.68627453	0.52941179
		0.70588237	0.52941179
		0.72549021	0.52941179
		0.74509805	0.52941179
		0.7647059	0.52941179
		0.78431374	0.52941179
		0.80392158	0.52941179
		0.82352942	0.52941179
		0.84313726	0.52941179
		0.86274511	0.52941179
		0.88235295	0.52941179
		0.90196079	0.52941179
		0.92156863	0.52941179
		0.94117647	0.52941179
		0.96078432	0.52941179
		0.98039216	0.52941179
		1	0.52941179
		0	0.54901963
		0.019607844	0.54901963
		0.039215688	0.54901963
		0.058823533	0.54901963
		0.078431375	0.54901963
		0.098039217	0.54901963
		0.11764706	0.54901963
		0.13725491	0.54901963
		0.15686275	0.54901963
		0.17647059	0.54901963
		0.19607843	0.54901963
		0.21568628	0.54901963
		0.23529412	0.54901963
		0.25490198	0.54901963
		0.27450982	0.54901963
		0.29411766	0.54901963
		0.3137255	0.54901963
		0.33333334	0.54901963
		0.35294119	0.54901963
		0.37254903	0.54901963
		0.39215687	0.54901963
		0.41176471	0.54901963
		0.43137255	0.54901963
		0.4509804	0.54901963
		0.47058824	0.54901963
		0.49019608	0.54901963
		0.50980395	0.54901963
		0.52941179	0.54901963
		0.54901963	0.54901963
		0.56862748	0.54901963
		0.58823532	0.54901963
		0.60784316	0.54901963
		0.627451	0.54901963
		0.64705884	0.54901963
		0.66666669	0.54901963
		0.68627453	0.54901963
		0.70588237	0.54901963
		0.72549021	0.54901963
		0.74509805	0.54901963
		0.7647059	0.54901963
		0.78431374	0.54901963
		0.80392158	0.54901963
		0.82352942	0.54901963
		0.84313726	0.54901963
		0.86274511	0.54901963
		0.88235295	0.54901963
		0.90196079	0.54901963
		0.92156863	0.54901963
		0.94117647	0.54901963
		0.96078432	0.54901963
		0.98039216	0.54901963
		1	0.54901963
		0	0.56862748
		0.019607844	0.56862748
		0.039215688	0.56862748
		0.058823533	0.56862748
		0.078431375	0.56862748
		0.098039217	0.56862748
		0.11764706	0.56862748
		0.13725491	0.56862748
		0.15686275	0.56862748
		0.17647059	0.56862748
		0.19607843	0.56862748
		0.21568628	0.56862748
		0.23529412	0.56862748
		0.25490198	0.56862748
		0.27450982	0.56862748
		0.29411766	0.56862748
		0.3137255	0.56862748
		0.33333334	0.56862748
		0.35294119	0.56862748
		0.37254903	0.56862748
		0.39215687	0.56862748
		0.41176471	0.56862748
		0.43137255	0.56862748
		0.4509804	0.56862748
		0.47058824	0.56862748
		0.49019608	0.56862748
		0.50980395	0.56862748
		0.52941179	0.56862748
		0.54901963	0.56862748
		0.56862748	0.56862748
		0.58823532	0.56862748
		0.60784316	0.56862748
		0.627451	0.56862748
		0.64705884	0.56862748
		0.66666669	0.56862748
		0.68627453	0.56862748
		0.70588237	0.56862748
		0.72549021	0.56862748
		0.74509805	0.56862748
		0.7647059	0.56862748
		0.78431374	0.56862748
		0.80392158	0.56862748
		0.82352942	0.56862748
		0.84313726	0.56862748
		0.86274511	0.56862748
		0.88235295	0.56862748
		0.90196079	0.56862748
		0.92156863	0.56862748
		0.94117647	0.56862748
		0.96078432	0.56862748
		0.98039216	0.56862748
		1	0.56862748
		0	0.58823532
		0.019607844	0.58823532
		0.039215688	0.58823532
		0.058823533	0.58823532
		0.078431375	0.58823532
		0.098039217	0.58823532
		0.11764706	0.58823532
		0.13725491	0.58823532
		0.15686275	0.58823532
		0.17647059	0.58823532
		0.19607843	0.58823532
		0.21568628	0.58823532
		0.23529412	0.58823532
		0.25490198	0.58823532
		0.27450982	0.58823532
		0.29411766	0.58823532
		0.3137255	0.58823532
		0.33333334	0.58823532
		0.35294119	0.58823532
		0.37254903	0.58823532
		0.39215687	0.58823532
		0.41176471	0.58823532
		0.43137255	0.58823532
		0.4509804	0.58823532
		0.47058824	0.58823532
		0.49019608	0.58823532
		0.50980395	0.58823532
		0.52941179	0.58823532
		0.54901963	0.58823532
		0.56862748	0.58823532
		0.58823532	0.58823532
		0.60784316	0.58823532
		0.627451	0.58823532
		0.64705884	0.58823532
		0.66666669	0.58823532
		0.68627453	0.58823532
		0.70588237	0.58823532
		0.72549021	0.58823532
		0.74509805	0.58823532
		0.7647059	0.58823532
		0.78431374	0.58823532
		0.80392158	0.58823532
		0.82352942	0.58823532
		0.84313726	0.58823532
		0.86274511	0.58823532
		0.88235295	0.58823532
		0.90196079	0.58823532
		0.92156863	0.58823532
		0.94117647	0.58823532
		0.96078432	0.58823532
		0.98039216	0.58823532
		1	0.58823532
		0	0.60784316
		0.019607844	0.60784316
		0.039215688	0.60784316
		0.058823533	0.60784316
		0.078431375	0.60784316
		0.098039217	0.60784316
		0.11764706	0.60784316
		0.13725491	0.60784316
		0.15686275	0.60784316
		0.17647059	0.60784316
		0.19607843	0.60784316
		0.21568628	0.60784316
		0.23529412	0.60784316
		0.25490198	0.60784316
		0.27450982	0.60784316
		0.29411766	0.60784316
		0.3137255	0.60784316
		0.33333334	0.60784316
		0.35294119	0.60784316
		0.37254903	0.60784316
		0.39215687	0.60784316
		0.41176471	0.60784316
		0.43137255	0.60784316
		0.4509804	0.60784316
		0.47058824	0.60784316
		0.49019608	0.60784316
		0.50980395	0.60784316
		0.52941179	0.60784316
		0.54901963	0.60784316
		0.56862748	0.60784316
		0.58823532	0.60784316
		0.60784316	0.60784316
		0.627451	0.60784316
		0.64705884	0.60784316
		0.66666669	0.60784316
		0.68627453	0.60784316
		0.70588237	0.60784316
		0.72549021	0.60784316
		0.74509805	0.60784316
		0.7647059	0.60784316
		0.78431374	0.60784316
		0.80392158	0.60784316
		0.82352942	0.60784316
		0.84313726	0.60784316
		0.86274511	0.60784316
		0.88235295	0.60784316
		0.90196079	0.60784316
		0.92156863	0.60784316
		0.94117647	0.60784316
		0.96078432	0.60784316
		0.98039216	0.60784316
		1	0.60784316
		0	0.627451
		0.019607844	0.627451
		0.039215688	0.627451
		0.058823533	0.627451
		0.078431375	0.627451
		0.098039217	0.627451
		0.11764706	0.627451
		0.13725491	0.627451
		0.15686275	0.627451
		0.17647059	0.627451
		0.19607843	0.627451
		0.21568628	0.627451
		0.23529412	0.627451
		0.25490198	0.627451
		0.27450982	0.627451
		0.29411766	0.627451
		0.3137255	0.627451
		0.33333334	0.627451
		0.35294119	0.627451
		0.37254903	0.627451
		0.39215687	0.627451
		0.41176471	0.627451
		0.43137255	0.627451
		0.4509804	0.627451
		0.47058824	0.627451
		0.49019608	0.627451
		0.50980395	0.627451
		0.52941179	0.627451
		0.54901963	0.627451
		0.56862748	0.627451
		0.58823532	0.627451
		0.60784316	0.627451
		0.627451	0.627451
		0.64705884	0.627451
		0.66666669	0.627451
		0.68627453	0.627451
		0.70588237	0.627451
		0.72549021	0.627451
		0.74509805	0.627451
		0.7647059	0.627451
		0.78431374	0.627451
		0.80392158	0.627451
		0.82352942	0.627451
		0.84313726	0.627451
		0.86274511	0.627451
		0.88235295	0.627451
		0.90196079	0.627451
		0.92156863	0.627451
		0.94117647	0.627451
		0.96078432	0.627451
		0.98039216	0.627451
		1	0.627451
		0	0.64705884
		0.019607844	0.64705884
		0.039215688	0.64705884
		0.058823533	0.64705884
		0.078431375	0.64705884
		0.098039217	0.64705884
		0.11764706	0.64705884
		0.13725491	0.64705884
		0.15686275	0.64705884
		0.17647059	0.64705884
		0.19607843	0.64705884
		0.21568628	0.64705884
		0.23529412	0.64705884
		0.25490198	0.64705884
		0.27450982	0.64705884
		0.29411766	0.64705884
		0.3137255	0.64705884
		0.33333334	0.64705884
		0.35294119	0.64705884
		0.37254903	0.64705884
		0.39215687	0.64705884
		0.41176471	0.64705884
		0.43137255	0.64705884
		0.4509804	0.64705884
		0.47058824	0.64705884
		0.49019608	0.64705884
		0.50980395	0.64705884
		0.52941179	0.64705884
		0.54901963	0.64705884
		0.56862748	0.64705884
		0.58823532	0.64705884
		0.60784316	0.64705884
		0.627451	0.64705884
		0.64705884	0.64705884
		0.66666669	0.64705884
		0.68627453	0.64705884
		0.70588237	0.64705884
		0.72549021	0.64705884
		0.74509805	0.64705884
		0.7647059	0.64705884
		0.78431374	0.64705884
		0.80392158	0.64705884
		0.82352942	0.64705884
		0.84313726	0.64705884
		0.86274511	0.64705884
		0.88235295	0.64705884
		0.90196079	0.64705884
		0.92156863	0.64705884
		0.94117647	0.64705884
		0.96078432	0.64705884
		0.98039216	0.64705884
		1	0.64705884
		0	0.66666669
		0.019607844	0.66666669
		0.039215688	0.66666669
		0.058823533	0.66666669
		0.078431375	0.66666669
		0.098039217	0.66666669
		0.11764706	0.66666669
		0.13725491	0.66666669
		0.15686275	0.66666669
		0.17647059	0.66666669
		0.19607843	0.66666669
		0.21568628	0.66666669
		0.23529412	0.66666669
		0.25490198	0.66666669
		0.27450982	0.66666669
		0.29411766	0.66666669
		0.3137255	0.66666669
		0.33333334	0.66666669
		0.35294119	0.66666669
		0.37254903	0.66666669
		0.39215687	0.66666669
		0.41176471	0.66666669
		0.43137255	0.66666669
		0.4509804	0.66666669
		0.47058824	0.66666669
		0.49019608	0.66666669
		0.50980395	0.66666669
		0.52941179	0.66666669
		0.54901963	0.66666669
		0.56862748	0.66666669
		0.58823532	0.66666669
		0.60784316	0.66666669
		0.627451	0.66666669
		0.64705884	0.66666669
		0.66666669	0.66666669
		0.68627453	0.66666669
		0.70588237	0.66666669
		0.72549021	0.66666669
		0.74509805	0.66666669
		0.7647059	0.66666669
		0.78431374	0.66666669
		0.80392158	0.66666669
		0.82352942	0.66666669
		0.84313726	0.66666669
		0.86274511	0.66666669
		0.88235295	0.66666669
		0.90196079	0.66666669
		0.92156863	0.66666669
		0.94117647	0.66666669
		0.96078432	0.66666669
		0.98039216	0.66666669
		1	0.66666669
		0	0.68627453
		0.019607844	0.68627453
		0.039215688	0.68627453
		0.058823533	0.68627453
		0.078431375	0.68627453
		0.098039217	0.68627453
		0.11764706	0.68627453
		0.13725491	0.68627453
		0.15686275	0.68627453
		0.17647059	0.68627453
		0.19607843	0.68627453
		0.21568628	0.68627453
		0.23529412	0.68627453
		0.25490198	0.68627453
		0.27450982	0.68627453
		0.29411766	0.68627453
		0.3137255	0.68627453
		0.33333334	0.68627453
		0.35294119	0.68627453
		0.37254903	0.68627453
		0.39215687	0.68627453
		0.41176471	0.68627453
		0.43137255	0.68627453
		0.4509804	0.68627453
		0.47058824	0.68627453
		0.49019608	0.68627453
		0.50980395	0.68627453
		0.52941179	0.68627453
		0.54901963	0.68627453
		0.56862748	0.68627453
		0.58823532	0.68627453
		0.60784316	0.68627453
		0.627451	0.68627453
		0.64705884	0.68627453
		0.66666669	0.68627453
		0.68627453	0.68627453
		0.70588237	0.68627453
		0.72549021	0.68627453
		0.74509805	0.68627453
		0.7647059	0.68627453
		0.78431374	0.68627453
		0.80392158	0.68627453
		0.82352942	0.68627453
		0.84313726	0.68627453
		0.86274511	0.68627453
		0.88235295	0.68627453
		0.90196079	0.68627453
		0.92156863	0.68627453
		0.94117647	0.68627453
		0.96078432	0.68627453
		0.98039216	0.68627453
		1	0.68627453
		0	0.70588237
		0.019607844	0.70588237
		0.039215688	0.70588237
		0.058823533	0.70588237
		0.078431375	0.70588237
		0.098039217	0.70588237
		0.11764706	0.70588237
		0.13725491	0.70588237
		0.15686275	0.70588237
		0.17647059	0.70588237
		0.19607843	0.70588237
		0.21568628	0.70588237
		0.23529412	0.70588237
		0.25490198	0.70588237
		0.27450982	0.70588237
		0.29411766	0.70588237
		0.3137255	0.70588237
		0.33333334	0.70588237
		0.35294119	0.70588237
		0.37254903	0.70588237
		0.39215687	0.70588237
		0.41176471	0.70588237
		0.43137255	0.70588237
		0.4509804	0.70588237
		0.47058824	0.70588237
		0.49019608	0.70588237
		0.50980395	0.70588237
		0.52941179	0.70588237
		0.54901963	0.70588237
		0.56862748	0.70588237
		0.58823532	0.70588237
		0.60784316	0.70588237
		0.627451	0.70588237
		0.64705884	0.70588237
		0.66666669	0.70588237
		0.68627453	0.70588237
		0.70588237	0.70588237
		0.72549021	0.70588237
		0.74509805	0.70588237
		0.7647059	0.70588237
		0.78431374	0.70588237
		0.80392158	0.70588237
		0.82352942	0.70588237
		0.84313726	0.70588237
		0.86274511	0.70588237
		0.88235295	0.70588237
		0.90196079	0.70588237
		0.92156863	0.70588237
		0.94117647	0.70588237
		0.96078432	0.70588237
		0.98039216	0.70588237
		1	0.70588237
		0	0.72549021
		0.019607844	0.72549021
		0.039215688	0.72549021
		0.058823533	0.72549021
		0.078431375	0.72549021
		0.098039217	0.72549021
		0.11764706	0.72549021
		0.13725491	0.72549021
		0.15686275	0.72549021
		0.17647059	0.72549021
		0.19607843	0.72549021
		0.21568628	0.72549021
		0.23529412	0.72549021
		0.25490198	0.72549021
		0.27450982	0.72549021
		0.29411766	0.72549021
		0.3137255	0.72549021
		0.33333334	0.72549021
		0.35294119	0.72549021
		0.37254903	0.72549021
		0.39215687	0.72549021
		0.41176471	0.72549021
		0.43137255	0.72549021
		0.4509804	0.72549021
		0.47058824	0.72549021
		0.49019608	0.72549021
		0.50980395	0.72549021
		0.52941179	0.72549021
		0.54901963	0.72549021
		0.56862748	0.72549021
		0.58823532	0.72549021
		0.60784316	0.72549021
		0.627451	0.72549021
		0.64705884	0.72549021
		0.66666669	0.72549021
		0.68627453	0.72549021
		0.70588237	0.72549021
		0.72549021	0.72549021
		0.74509805	0.72549021
		0.7647059	0.72549021
		0.78431374	0.72549021
		0.80392158	0.72549021
		0.82352942	0.72549021
		0.84313726	0.72549021
		0.86274511	0.72549021
		0.88235295	0.72549021
		0.90196079	0.72549021
		0.92156863	0.72549021
		0.94117647	0.72549021
		0.96078432	0.72549021
		0.98039216	0.72549021
		1	0.72549021
		0	0.74509805
		0.019607844	0.74509805
		0.039215688	0.74509805
		0.058823533	0.74509805
		0.078431375	0.74509805
		0.098039217	0.74509805
		0.11764706	0.74509805
		0.13725491	0.74509805
		0.15686275	0.74509805
		0.17647059	0.74509805
		0.19607843	0.74509805
		0.21568628	0.74509805
		0.23529412	0.74509805
		0.25490198	0.74509805
		0.27450982	0.74509805
		0.29411766	0.74509805
		0.3137255	0.74509805
		0.33333334	0.74509805
		0.35294119	0.74509805
		0.37254903	0.74509805
		0.39215687	0.74509805
		0.41176471	0.74509805
		0.43137255	0.74509805
		0.4509804	0.74509805
		0.47058824	0.74509805
		0.49019608	0.74509805
		0.50980395	0.74509805
		0.52941179	0.74509805
		0.54901963	0.74509805
		0.56862748	0.74509805
		0.58823532	0.74509805
		0.60784316	0.74509805
		0.627451	0.74509805
		0.64705884	0.74509805
		0.66666669	0.74509805
		0.68627453	0.74509805
		0.70588237	0.74509805
		0.72549021	0.74509805
		0.74509805	0.74509805
		0.7647059	0.74509805
		0.78431374	0.74509805
		0.80392158	0.74509805
		0.82352942	0.74509805
		0.84313726	0.74509805
		0.86274511	0.74509805
		0.88235295	0.74509805
		0.90196079	0.74509805
		0.92156863	0.74509805
		0.94117647	0.74509805
		0.96078432	0.74509805
		0.98039216	0.74509805
		1	0.74509805
		0	0.7647059
		0.019607844	0.7647059
		0.039215688	0.7647059
		0.058823533	0.7647059
		0.078431375	0.7647059
		0.098039217	0.7647059
		0.11764706	0.7647059
		0.13725491	0.7647059
		0.15686275	0.7647059
		0.17647059	0.7647059
		0.19607843	0.7647059
		0.21568628	0.7647059
		0.23529412	0.7647059
		0.25490198	0.7647059
		0.27450982	0.7647059
		0.29411766	0.7647059
		0.3137255	0.7647059
		0.33333334	0.7647059
		0.35294119	0.7647059
		0.37254903	0.7647059
		0.39215687	0.7647059
		0.41176471	0.7647059
		0.43137255	0.7647059
		0.4509804	0.7647059
		0.47058824	0.7647059
		0.49019608	0.7647059
		0.50980395	0.7647059
		0.52941179	0.7647059
		0.54901963	0.7647059
		0.56862748	0.7647059
		0.58823532	0.7647059
		0.60784316	0.7647059
		0.627451	0.7647059
		0.64705884	0.7647059
		0.66666669	0.7647059
		0.68627453	0.7647059
		0.70588237	0.7647059
		0.72549021	0.7647059
		0.74509805	0.7647059
		0.7647059	0.7647059
		0.78431374	0.7647059
		0.80392158	0.7647059
		0.82352942	0.7647059
		0.84313726	0.7647059
		0.86274511	0.7647059
		0.88235295	0.7647059
		0.90196079	0.7647059
		0.92156863	0.7647059
		0.94117647	0.7647059
		0.96078432	0.7647059
		0.98039216	0.7647059
		1	0.7647059
		0	0.78431374
		0.019607844	0.78431374
		0.039215688	0.78431374
		0.058823533	0.78431374
		0.078431375	0.78431374
		0.098039217	0.78431374
		0.11764706	0.78431374
		0.13725491	0.78431374
		0.15686275	0.78431374
		0.17647059	0.78431374
		0.19607843	0.78431374
		0.21568628	0.78431374
		0.23529412	0.78431374
		0.25490198	0.78431374
		0.27450982	0.78431374
		0.29411766	0.78431374
		0.3137255	0.78431374
		0.33333334	0.78431374
		0.35294119	0.78431374
		0.37254903	0.78431374
		0.39215687	0.78431374
		0.41176471	0.78431374
		0.43137255	0.78431374
		0.4509804	0.78431374
		0.47058824	0.78431374
		0.49019608	0.78431374
		0.50980395	0.78431374
		0.52941179	0.78431374
		0.54901963	0.78431374
		0.56862748	0.78431374
		0.58823532	0.78431374
		0.60784316	0.78431374
		0.627451	0.78431374
		0.64705884	0.78431374
		0.66666669	0.78431374
		0.68627453	0.78431374
		0.70588237	0.78431374
		0.72549021	0.78431374
		0.74509805	0.78431374
		0.7647059	0.78431374
		0.78431374	0.78431374
		0.80392158	0.78431374
		0.82352942	0.78431374
		0.84313726	0.78431374
		0.86274511	0.78431374
		0.88235295	0.78431374
		0.90196079	0.78431374
		0.92156863	0.78431374
		0.94117647	0.78431374
		0.96078432	0.78431374
		0.98039216	0.78431374
		1	0.78431374
		0	0.80392158
		0.019607844	0.80392158
		0.039215688	0.80392158
		0.058823533	0.80392158
		0.078431375	0.80392158
		0.098039217	0.80392158
		0.11764706	0.80392158
		0.13725491	0.80392158
		0.15686275	0.80392158
		0.17647059	0.80392158
		0.19607843	0.80392158
		0.21568628	0.80392158
		0.23529412	0.80392158
		0.25490198	0.80392158
		0.27450982	0.80392158
		0.29411766	0.80392158
		0.3137255	0.80392158
		0.33333334	0.80392158
		0.35294119	0.80392158
		0.37254903	0.80392158
		0.39215687	0.80392158
		0.41176471	0.80392158
		0.43137255	0.80392158
		0.4509804	0.80392158
		0.47058824	0.80392158
		0.49019608	0.80392158
		0.50980395	0.80392158
		0.52941179	0.80392158
		0.54901963	0.80392158
		0.56862748	0.80392158
		0.58823532	0.80392158
		0.60784316	0.80392158
		0.627451	0.80392158
		0.64705884	0.80392158
		0.66666669	0.80392158
		0.68627453	0.80392158
		0.70588237	0.80392158
		0.72549021	0.80392158
		0.74509805	0.80392158
		0.7647059	0.80392158
		0.78431374	0.80392158
		0.80392158	0.80392158
		0.82352942	0.80392158
		0.84313726	0.80392158
		0.86274511	0.80392158
		0.88235295	0.80392158
		0.90196079	0.80392158
		0.92156863	0.80392158
		0.94117647	0.80392158
		0.96078432	0.80392158
		0.98039216	0.80392158
		1	0.80392158
		0	0.82352942
		0.019607844	0.82352942
		0.039215688	0.82352942
		0.058823533	0.82352942
		0.078431375	0.82352942
		0.098039217	0.82352942
		0.11764706	0.82352942
		0.13725491	0.82352942
		0.15686275	0.82352942
		0.17647059	0.82352942
		0.19607843	0.82352942
		0.21568628	0.82352942
		0.23529412	0.82352942
		0.25490198	0.82352942
		0.27450982	0.82352942
		0.29411766	0.82352942
		0.3137255	0.82352942
		0.33333334	0.82352942
		0.35294119	0.82352942
		0.37254903	0.82352942
		0.39215687	0.82352942
		0.41176471	0.82352942
		0.43137255	0.82352942
		0.4509804	0.82352942
		0.47058824	0.82352942
		0.49019608	0.82352942
		0.50980395	0.82352942
		0.52941179	0.82352942
		0.54901963	0.82352942
		0.56862748	0.82352942
		0.58823532	0.82352942
		0.60784316	0.82352942
		0.627451	0.82352942
		0.64705884	0.82352942
		0.66666669	0.82352942
		0.68627453	0.82352942
		0.70588237	0.82352942
		0.72549021	0.82352942
		0.74509805	0.82352942
		0.7647059	0.82352942
		0.78431374	0.82352942
		0.80392158	0.82352942
		0.82352942	0.82352942
		0.84313726	0.82352942
		0.86274511	0.82352942
		0.88235295	0.82352942
		0.90196079	0.82352942
		0.92156863	0.82352942
		0.94117647	0.82352942
		0.96078432	0.82352942
		0.98039216	0.82352942
		1	0.82352942
		0	0.84313726
		0.019607844	0.84313726
		0.039215688	0.84313726
		0.058823533	0.84313726
		0.078431375	0.84313726
		0.098039217	0.84313726
		0.11764706	0.84313726
		0.13725491	0.84313726
		0.15686275	0.84313726
		0.17647059	0.84313726
		0.19607843	0.84313726
		0.21568628	0.84313726
		0.23529412	0.84313726
		0.25490198	0.84313726
		0.27450982	0.84313726
		0.29411766	0.84313726
		0.3137255	0.84313726
		0.33333334	0.84313726
		0.35294119	0.84313726
		0.37254903	0.84313726
		0.39215687	0.84313726
		0.41176471	0.84313726
		0.43137255	0.84313726
		0.4509804	0.84313726
		0.47058824	0.84313726
		0.49019608	0.84313726
		0.50980395	0.84313726
		0.52941179	0.84313726
		0.54901963	0.84313726
		0.56862748	0.84313726
		0.58823532	0.84313726
		0.60784316	0.84313726
		0.627451	0.84313726
		0.64705884	0.84313726
		0.66666669	0.84313726
		0.68627453	0.84313726
		0.70588237	0.84313726
		0.72549021	0.84313726
		0.74509805	0.84313726
		0.7647059	0.84313726
		0.78431374	0.84313726
		0.80392158	0.84313726
		0.82352942	0.84313726
		0.84313726	0.84313726
		0.86274511	0.84313726
		0.88235295	0.84313726
		0.90196079	0.84313726
		0.92156863	0.84313726
		0.94117647	0.84313726
		0.96078432	0.84313726
		0.98039216	0.84313726
		1	0.84313726
		0	0.86274511
		0.019607844	0.86274511
		0.039215688	0.86274511
		0.058823533	0.86274511
		0.078431375	0.86274511
		0.098039217	0.86274511
		0.11764706	0.86274511
		0.13725491	0.86274511
		0.15686275	0.86274511
		0.17647059	0.86274511
		0.19607843	0.86274511
		0.21568628	0.86274511
		0.23529412	0.86274511
		0.25490198	0.86274511
		0.27450982	0.86274511
		0.29411766	0.86274511
		0.3137255	0.86274511
		0.33333334	0.86274511
		0.35294119	0.86274511
		0.37254903	0.86274511
		0.39215687	0.86274511
		0.41176471	0.86274511
		0.43137255	0.86274511
		0.4509804	0.86274511
		0.47058824	0.86274511
		0.49019608	0.86274511
		0.50980395	0.86274511
		0.52941179	0.86274511
		0.54901963	0.86274511
		0.56862748	0.86274511
		0.58823532	0.86274511
		0.60784316	0.86274511
		0.627451	0.86274511
		0.64705884	0.86274511
		0.66666669	0.86274511
		0.68627453	0.86274511
		0.70588237	0.86274511
		0.72549021	0.86274511
		0.74509805	0.86274511
		0.7647059	0.86274511
		0.78431374	0.86274511
		0.80392158	0.86274511
		0.82352942	0.86274511
		0.84313726	0.86274511
		0.86274511	0.86274511
		0.88235295	0.86274511
		0.90196079	0.86274511
		0.92156863	0.86274511
		0.94117647	0.86274511
		0.96078432	0.86274511
		0.98039216	0.86274511
		1	0.86274511
		0	0.88235295
		0.019607844	0.88235295
		0.039215688	0.88235295
		0.058823533	0.88235295
		0.078431375	0.88235295
		0.098039217	0.88235295
		0.11764706	0.88235295
		0.13725491	0.88235295
		0.15686275	0.88235295
		0.17647059	0.88235295
		0.19607843	0.88235295
		0.21568628	0.88235295
		0.23529412	0.88235295
		0.25490198	0.88235295
		0.27450982	0.88235295
		0.29411766	0.88235295
		0.3137255	0.88235295
		0.33333334	0.88235295
		0.35294119	0.88235295
		0.37254903	0.88235295
		0.39215687	0.88235295
		0.41176471	0.88235295
		0.43137255	0.88235295
		0.4509804	0.88235295
		0.47058824	0.88235295
		0.49019608	0.88235295
		0.50980395	0.88235295
		0.52941179	0.88235295
		0.54901963	0.88235295
		0.56862748	0.88235295
		0.58823532	0.88235295
		0.60784316	0.88235295
		0.627451	0.88235295
		0.64705884	0.88235295
		0.66666669	0.88235295
		0.68627453	0.88235295
		0.70588237	0.88235295
		0.72549021	0.88235295
		0.74509805	0.88235295
		0.7647059	0.88235295
		0.78431374	0.88235295
		0.80392158	0.88235295
		0.82352942	0.88235295
		0.84313726	0.88235295
		0.86274511	0.88235295
		0.88235295	0.88235295
		0.90196079	0.88235295
		0.92156863	0.88235295
		0.94117647	0.88235295
		0.96078432	0.88235295
		0.98039216	0.88235295
		1	0.88235295
		0	0.90196079
		0.019607844	0.90196079
		0.039215688	0.90196079
		0.058823533	0.90196079
		0.078431375	0.90196079
		0.098039217	0.90196079
		0.11764706	0.90196079
		0.13725491	0.90196079
		0.15686275	0.90196079
		0.17647059	0.90196079
		0.19607843	0.90196079
		0.21568628	0.90196079
		0.23529412	0.90196079
		0.25490198	0.90196079
		0.27450982	0.90196079
		0.29411766	0.90196079
		0.3137255	0.90196079
		0.33333334	0.90196079
		0.35294119	0.90196079
		0.37254903	0.90196079
		0.39215687	0.90196079
		0.41176471	0.90196079
		0.43137255	0.90196079
		0.4509804	0.90196079
		0.47058824	0.90196079
		0.49019608	0.90196079
		0.50980395	0.90196079
		0.52941179	0.90196079
		0.54901963	0.90196079
		0.56862748	0.90196079
		0.58823532	0.90196079
		0.60784316	0.90196079
		0.627451	0.90196079
		0.64705884	0.90196079
		0.66666669	0.90196079
		0.68627453	0.90196079
		0.70588237	0.90196079
		0.72549021	0.90196079
		0.74509805	0.90196079
		0.7647059	0.90196079
		0.78431374	0.90196079
		0.80392158	0.90196079
		0.82352942	0.90196079
		0.84313726	0.90196079
		0.86274511	0.90196079
		0.88235295	0.90196079
		0.90196079	0.90196079
		0.92156863	0.90196079
		0.94117647	0.90196079
		0.96078432	0.90196079
		0.98039216	0.90196079
		1	0.90196079
		0	0.92156863
		0.019607844	0.92156863
		0.039215688	0.92156863
		0.058823533	0.92156863
		0.078431375	0.92156863
		0.098039217	0.92156863
		0.11764706	0.92156863
		0.13725491	0.92156863
		0.15686275	0.92156863
		0.17647059	0.92156863
		0.19607843	0.92156863
		0.21568628	0.92156863
		0.23529412	0.92156863
		0.25490198	0.92156863
		0.27450982	0.92156863
		0.29411766	0.92156863
		0.3137255	0.92156863
		0.33333334	0.92156863
		0.35294119	0.92156863
		0.37254903	0.92156863
		0.39215687	0.92156863
		0.41176471	0.92156863
		0.43137255	0.92156863
		0.4509804	0.92156863
		0.47058824	0.92156863
		0.49019608	0.92156863
		0.50980395	0.92156863
		0.52941179	0.92156863
		0.54901963	0.92156863
		0.56862748	0.92156863
		0.58823532	0.92156863
		0.60784316	0.92156863
		0.627451	0.92156863
		0.64705884	0.92156863
		0.66666669	0.92156863
		0.68627453	0.92156863
		0.70588237	0.92156863
		0.72549021	0.92156863
		0.74509805	0.92156863
		0.7647059	0.92156863
		0.78431374	0.92156863
		0.80392158	0.92156863
		0.82352942	0.92156863
		0.84313726	0.92156863
		0.86274511	0.92156863
		0.88235295	0.92156863
		0.90196079	0.92156863
		0.92156863	0.92156863
		0.94117647	0.92156863
		0.96078432	0.92156863
		0.98039216	0.92156863
		1	0.92156863
		0	0.94117647
		0.019607844	0.94117647
		0.039215688	0.94117647
		0.058823533	0.94117647
		0.078431375	0.94117647
		0.098039217	0.94117647
		0.11764706	0.94117647
		0.13725491	0.94117647
		0.15686275	0.94117647
		0.17647059	0.94117647
		0.19607843	0.94117647
		0.21568628	0.94117647
		0.23529412	0.94117647
		0.25490198	0.94117647
		0.27450982	0.94117647
		0.29411766	0.94117647
		0.3137255	0.94117647
		0.33333334	0.94117647
		0.35294119	0.94117647
		0.37254903	0.94117647
		0.39215687	0.94117647
		0.41176471	0.94117647
		0.43137255	0.94117647
		0.4509804	0.94117647
		0.47058824	0.94117647
		0.49019608	0.94117647
		0.50980395	0.94117647
		0.52941179	0.94117647
		0.54901963	0.94117647
		0.56862748	0.94117647
		0.58823532	0.94117647
		0.60784316	0.94117647
		0.627451	0.94117647
		0.64705884	0.94117647
		0.66666669	0.94117647
		0.68627453	0.94117647
		0.70588237	0.94117647
		0.72549021	0.94117647
		0.74509805	0.94117647
		0.7647059	0.94117647
		0.78431374	0.94117647
		0.80392158	0.94117647
		0.82352942	0.94117647
		0.84313726	0.94117647
		0.86274511	0.94117647
		0.88235295	0.94117647
		0.90196079	0.94117647
		0.92156863	0.94117647
		0.94117647	0.94117647
		0.96078432	0.94117647
		0.98039216	0.94117647
		1	0.94117647
		0	0.96078432
		0.019607844	0.96078432
		0.039215688	0.96078432
		0.058823533	0.96078432
		0.078431375	0.96078432
		0.098039217	0.96078432
		0.11764706	0.96078432
		0.13725491	0.96078432
		0.15686275	0.96078432
		0.17647059	0.96078432
		0.19607843	0.96078432
		0.21568628	0.96078432
		0.23529412	0.96078432
		0.25490198	0.96078432
		0.27450982	0.96078432
		0.29411766	0.96078432
		0.3137255	0.96078432
		0.33333334	0.96078432
		0.35294119	0.96078432
		0.37254903	0.96078432
		0.39215687	0.96078432
		0.41176471	0.96078432
		0.43137255	0.96078432
		0.4509804	0.96078432
		0.47058824	0.96078432
		0.49019608	0.96078432
		0.50980395	0.96078432
		0.52941179	0.96078432
		0.54901963	0.96078432
		0.56862748	0.96078432
		0.58823532	0.96078432
		0.60784316	0.96078432
		0.627451	0.96078432
		0.64705884	0.96078432
		0.66666669	0.96078432
		0.68627453	0.96078432
		0.70588237	0.96078432
		0.72549021	0.96078432
		0.74509805	0.96078432
		0.7647059	0.96078432
		0.78431374	0.96078432
		0.80392158	0.96078432
		0.82352942	0.96078432
		0.84313726	0.96078432
		0.86274511	0.96078432
		0.88235295	0.96078432
		0.90196079	0.96078432
		0.92156863	0.96078432
		0.94117647	0.96078432
		0.96078432	0.96078432
		0.98039216	0.96078432
		1	0.96078432
		0	0.98039216
		0.019607844	0.98039216
		0.039215688	0.98039216
		0.058823533	0.98039216
		0.078431375	0.98039216
		0.098039217	0.98039216
		0.11764706	0.98039216
		0.13725491	0.98039216
		0.15686275	0.98039216
		0.17647059	0.98039216
		0.19607843	0.98039216
		0.21568628	0.98039216
		0.23529412	0.98039216
		0.25490198	0.98039216
		0.27450982	0.98039216
		0.29411766	0.98039216
		0.3137255	0.98039216
		0.33333334	0.98039216
		0.35294119	0.98039216
		0.37254903	0.98039216
		0.39215687	0.98039216
		0.41176471	0.98039216
		0.43137255	0.98039216
		0.4509804	0.98039216
		0.47058824	0.98039216
		0.49019608	0.98039216
		0.50980395	0.98039216
		0.52941179	0.98039216
		0.54901963	0.98039216
		0.56862748	0.98039216
		0.58823532	0.98039216
		0.60784316	0.98039216
		0.627451	0.98039216
		0.64705884	0.98039216
		0.66666669	0.98039216
		0.68627453	0.98039216
		0.70588237	0.98039216
		0.72549021	0.98039216
		0.74509805	0.98039216
		0.7647059	0.98039216
		0.78431374	0.98039216
		0.80392158	0.98039216
		0.82352942	0.98039216
		0.84313726	0.98039216
		0.86274511	0.98039216
		0.88235295	0.98039216
		0.90196079	0.98039216
		0.92156863	0.98039216
		0.94117647	0.98039216
		0.96078432	0.98039216
		0.98039216	0.98039216
		1	0.98039216
		0.0098039219	0
		0.029411767	0
		0.049019609	0
		0.068627454	0
		0.088235296	0
		0.10784314	0
		0.12745099	0
		0.14705883	0
		0.16666667	0
		0.18627451	0
		0.20588236	0
		0.2254902	0
		0.24509805	0
		0.2647059	0
		0.28431374	0
		0.30392158	0
		0.32352942	0
		0.34313726	0
		0.36274511	0
		0.38235295	0
		0.40196079	0
		0.42156863	0
		0.44117647	0
		0.46078432	0
		0.48039219	0
		0.5	0
		0.51960784	0
		0.53921568	0
		0.55882353	0
		0.57843137	0
		0.59803921	0
		0.61764705	0
		0.63725495	0
		0.6568628	0
		0.67647064	0
		0.69607848	0
		0.71568632	0
		0.73529416	0
		0.75490201	0
		0.77450985	0
		0.79411769	0
		0.81372553	0
		0.83333337	0
		0.85294122	0
		0.87254906	0
		0.8921569	0
		0.91176474	0
		0.93137258	0
		0.95098042	0
		0.97058827	0
		0.99019611	0
		0.0098039219	1
		0.029411767	1
		0.049019609	1
		0.068627454	1
		0.088235296	1
		0.10784314	1
		0.12745099	1
		0.14705883	1
		0.16666667	1
		0.18627451	1
		0.20588236	1
		0.2254902	1
		0.24509805	1
		0.2647059	1
		0.28431374	1
		0.30392158	1
		0.32352942	1
		0.34313726	1
		0.36274511	1
		0.38235295	1
		0.40196079	1
		0.42156863	1
		0.44117647	1
		0.46078432	1
		0.48039219	1
		0.5	1
		0.51960784	1
		0.53921568	1
		0.55882353	1
		0.57843137	1
		0.59803921	1
		0.61764705	1
		0.63725495	1
		0.6568628	1
		0.67647064	1
		0.69607848	1
		0.71568632	1
		0.73529416	1
		0.75490201	1
		0.77450985	1
		0.79411769	1
		0.81372553	1
		0.83333337	1
		0.85294122	1
		0.87254906	1
		0.8921569	1
		0.91176474	1
		0.93137258	1
		0.95098042	1
		0.97058827	1
		0.99019611	1

		"e"	5151
		0	1	"smooth"
		1	2	"smooth"
		2	3	"smooth"
		3	4	"smooth"
		4	5	"smooth"
		5	6	"smooth"
		6	7	"smooth"
		7	8	"smooth"
		8	9	"smooth"
		9	10	"smooth"
		10	11	"smooth"
		11	12	"smooth"
		12	13	"smooth"
		13	14	"smooth"
		14	15	"smooth"
		15	16	"smooth"
		16	17	"smooth"
		17	18	"smooth"
		18	19	"smooth"
		19	20	"smooth"
		20	21	"smooth"
		21	22	"smooth"
		22	23	"smooth"
		23	24	"smooth"
		24	25	"smooth"
		25	26	"smooth"
		26	27	"smooth"
		27	28	"smooth"
		28	29	"smooth"
		29	30	"smooth"
		30	31	"smooth"
		31	32	"smooth"
		32	33	"smooth"
		33	34	"smooth"
		34	35	"smooth"
		35	36	"smooth"
		36	37	"smooth"
		37	38	"smooth"
		38	39	"smooth"
		39	40	"smooth"
		40	41	"smooth"
		41	42	"smooth"
		42	43	"smooth"
		43	44	"smooth"
		44	45	"smooth"
		45	46	"smooth"
		46	47	"smooth"
		47	48	"smooth"
		48	49	"smooth"
		49	50	"smooth"
		50	0	"smooth"
		51	52	"smooth"
		52	53	"smooth"
		53	54	"smooth"
		54	55	"smooth"
		55	56	"smooth"
		56	57	"smooth"
		57	58	"smooth"
		58	59	"smooth"
		59	60	"smooth"
		60	61	"smooth"
		61	62	"smooth"
		62	63	"smooth"
		63	64	"smooth"
		64	65	"smooth"
		65	66	"smooth"
		66	67	"smooth"
		67	68	"smooth"
		68	69	"smooth"
		69	70	"smooth"
		70	71	"smooth"
		71	72	"smooth"
		72	73	"smooth"
		73	74	"smooth"
		74	75	"smooth"
		75	76	"smooth"
		76	77	"smooth"
		77	78	"smooth"
		78	79	"smooth"
		79	80	"smooth"
		80	81	"smooth"
		81	82	"smooth"
		82	83	"smooth"
		83	84	"smooth"
		84	85	"smooth"
		85	86	"smooth"
		86	87	"smooth"
		87	88	"smooth"
		88	89	"smooth"
		89	90	"smooth"
		90	91	"smooth"
		91	92	"smooth"
		92	93	"smooth"
		93	94	"smooth"
		94	95	"smooth"
		95	96	"smooth"
		96	97	"smooth"
		97	98	"smooth"
		98	99	"smooth"
		99	100	"smooth"
		100	101	"smooth"
		101	51	"smooth"
		102	103	"smooth"
		103	104	"smooth"
		104	105	"smooth"
		105	106	"smooth"
		106	107	"smooth"
		107	108	"smooth"
		108	109	"smooth"
		109	110	"smooth"
		110	111	"smooth"
		111	112	"smooth"
		112	113	"smooth"
		113	114	"smooth"
		114	115	"smooth"
		115	116	"smooth"
		116	117	"smooth"
		117	118	"smooth"
		118	119	"smooth"
		119	120	"smooth"
		120	121	"smooth"
		121	122	"smooth"
		122	123	"smooth"
		123	124	"smooth"
		124	125	"smooth"
		125	126	"smooth"
		126	127	"smooth"
		127	128	"smooth"
		128	129	"smooth"
		129	130	"smooth"
		130	131	"smooth"
		131	132	"smooth"
		132	133	"smooth"
		133	134	"smooth"
		134	135	"smooth"
		135	136	"smooth"
		136	137	"smooth"
		137	138	"smooth"
		138	139	"smooth"
		139	140	"smooth"
		140	141	"smooth"
		141	142	"smooth"
		142	143	"smooth"
		143	144	"smooth"
		144	145	"smooth"
		145	146	"smooth"
		146	147	"smooth"
		147	148	"smooth"
		148	149	"smooth"
		149	150	"smooth"
		150	151	"smooth"
		151	152	"smooth"
		152	102	"smooth"
		153	154	"smooth"
		154	155	"smooth"
		155	156	"smooth"
		156	157	"smooth"
		157	158	"smooth"
		158	159	"smooth"
		159	160	"smooth"
		160	161	"smooth"
		161	162	"smooth"
		162	163	"smooth"
		163	164	"smooth"
		164	165	"smooth"
		165	166	"smooth"
		166	167	"smooth"
		167	168	"smooth"
		168	169	"smooth"
		169	170	"smooth"
		170	171	"smooth"
		171	172	"smooth"
		172	173	"smooth"
		173	174	"smooth"
		174	175	"smooth"
		175	176	"smooth"
		176	177	"smooth"
		177	178	"smooth"
		178	179	"smooth"
		179	180	"smooth"
		180	181	"smooth"
		181	182	"smooth"
		182	183	"smooth"
		183	184	"smooth"
		184	185	"smooth"
		185	186	"smooth"
		186	187	"smooth"
		187	188	"smooth"
		188	189	"smooth"
		189	190	"smooth"
		190	191	"smooth"
		191	192	"smooth"
		192	193	"smooth"
		193	194	"smooth"
		194	195	"smooth"
		195	196	"smooth"
		196	197	"smooth"
		197	198	"smooth"
		198	199	"smooth"
		199	200	"smooth"
		200	201	"smooth"
		201	202	"smooth"
		202	203	"smooth"
		203	153	"smooth"
		204	205	"smooth"
		205	206	"smooth"
		206	207	"smooth"
		207	208	"smooth"
		208	209	"smooth"
		209	210	"smooth"
		210	211	"smooth"
		211	212	"smooth"
		212	213	"smooth"
		213	214	"smooth"
		214	215	"smooth"
		215	216	"smooth"
		216	217	"smooth"
		217	218	"smooth"
		218	219	"smooth"
		219	220	"smooth"
		220	221	"smooth"
		221	222	"smooth"
		222	223	"smooth"
		223	224	"smooth"
		224	225	"smooth"
		225	226	"smooth"
		226	227	"smooth"
		227	228	"smooth"
		228	229	"smooth"
		229	230	"smooth"
		230	231	"smooth"
		231	232	"smooth"
		232	233	"smooth"
		233	234	"smooth"
		234	235	"smooth"
		235	236	"smooth"
		236	237	"smooth"
		237	238	"smooth"
		238	239	"smooth"
		239	240	"smooth"
		240	241	"smooth"
		241	242	"smooth"
		242	243	"smooth"
		243	244	"smooth"
		244	245	"smooth"
		245	246	"smooth"
		246	247	"smooth"
		247	248	"smooth"
		248	249	"smooth"
		249	250	"smooth"
		250	251	"smooth"
		251	252	"smooth"
		252	253	"smooth"
		253	254	"smooth"
		254	204	"smooth"
		255	256	"smooth"
		256	257	"smooth"
		257	258	"smooth"
		258	259	"smooth"
		259	260	"smooth"
		260	261	"smooth"
		261	262	"smooth"
		262	263	"smooth"
		263	264	"smooth"
		264	265	"smooth"
		265	266	"smooth"
		266	267	"smooth"
		267	268	"smooth"
		268	269	"smooth"
		269	270	"smooth"
		270	271	"smooth"
		271	272	"smooth"
		272	273	"smooth"
		273	274	"smooth"
		274	275	"smooth"
		275	276	"smooth"
		276	277	"smooth"
		277	278	"smooth"
		278	279	"smooth"
		279	280	"smooth"
		280	281	"smooth"
		281	282	"smooth"
		282	283	"smooth"
		283	284	"smooth"
		284	285	"smooth"
		285	286	"smooth"
		286	287	"smooth"
		287	288	"smooth"
		288	289	"smooth"
		289	290	"smooth"
		290	291	"smooth"
		291	292	"smooth"
		292	293	"smooth"
		293	294	"smooth"
		294	295	"smooth"
		295	296	"smooth"
		296	297	"smooth"
		297	298	"smooth"
		298	299	"smooth"
		299	300	"smooth"
		300	301	"smooth"
		301	302	"smooth"
		302	303	"smooth"
		303	304	"smooth"
		304	305	"smooth"
		305	255	"smooth"
		306	307	"smooth"
		307	308	"smooth"
		308	309	"smooth"
		309	310	"smooth"
		310	311	"smooth"
		311	312	"smooth"
		312	313	"smooth"
		313	314	"smooth"
		314	315	"smooth"
		315	316	"smooth"
		316	317	"smooth"
		317	318	"smooth"
		318	319	"smooth"
		319	320	"smooth"
		320	321	"smooth"
		321	322	"smooth"
		322	323	"smooth"
		323	324	"smooth"
		324	325	"smooth"
		325	326	"smooth"
		326	327	"smooth"
		327	328	"smooth"
		328	329	"smooth"
		329	330	"smooth"
		330	331	"smooth"
		331	332	"smooth"
		332	333	"smooth"
		333	334	"smooth"
		334	335	"smooth"
		335	336	"smooth"
		336	337	"smooth"
		337	338	"smooth"
		338	339	"smooth"
		339	340	"smooth"
		340	341	"smooth"
		341	342	"smooth"
		342	343	"smooth"
		343	344	"smooth"
		344	345	"smooth"
		345	346	"smooth"
		346	347	"smooth"
		347	348	"smooth"
		348	349	"smooth"
		349	350	"smooth"
		350	351	"smooth"
		351	352	"smooth"
		352	353	"smooth"
		353	354	"smooth"
		354	355	"smooth"
		355	356	"smooth"
		356	306	"smooth"
		357	358	"smooth"
		358	359	"smooth"
		359	360	"smooth"
		360	361	"smooth"
		361	362	"smooth"
		362	363	"smooth"
		363	364	"smooth"
		364	365	"smooth"
		365	366	"smooth"
		366	367	"smooth"
		367	368	"smooth"
		368	369	"smooth"
		369	370	"smooth"
		370	371	"smooth"
		371	372	"smooth"
		372	373	"smooth"
		373	374	"smooth"
		374	375	"smooth"
		375	376	"smooth"
		376	377	"smooth"
		377	378	"smooth"
		378	379	"smooth"
		379	380	"smooth"
		380	381	"smooth"
		381	382	"smooth"
		382	383	"smooth"
		383	384	"smooth"
		384	385	"smooth"
		385	386	"smooth"
		386	387	"smooth"
		387	388	"smooth"
		388	389	"smooth"
		389	390	"smooth"
		390	391	"smooth"
		391	392	"smooth"
		392	393	"smooth"
		393	394	"smooth"
		394	395	"smooth"
		395	396	"smooth"
		396	397	"smooth"
		397	398	"smooth"
		398	399	"smooth"
		399	400	"smooth"
		400	401	"smooth"
		401	402	"smooth"
		402	403	"smooth"
		403	404	"smooth"
		404	405	"smooth"
		405	406	"smooth"
		406	407	"smooth"
		407	357	"smooth"
		408	409	"smooth"
		409	410	"smooth"
		410	411	"smooth"
		411	412	"smooth"
		412	413	"smooth"
		413	414	"smooth"
		414	415	"smooth"
		415	416	"smooth"
		416	417	"smooth"
		417	418	"smooth"
		418	419	"smooth"
		419	420	"smooth"
		420	421	"smooth"
		421	422	"smooth"
		422	423	"smooth"
		423	424	"smooth"
		424	425	"smooth"
		425	426	"smooth"
		426	427	"smooth"
		427	428	"smooth"
		428	429	"smooth"
		429	430	"smooth"
		430	431	"smooth"
		431	432	"smooth"
		432	433	"smooth"
		433	434	"smooth"
		434	435	"smooth"
		435	436	"smooth"
		436	437	"smooth"
		437	438	"smooth"
		438	439	"smooth"
		439	440	"smooth"
		440	441	"smooth"
		441	442	"smooth"
		442	443	"smooth"
		443	444	"smooth"
		444	445	"smooth"
		445	446	"smooth"
		446	447	"smooth"
		447	448	"smooth"
		448	449	"smooth"
		449	450	"smooth"
		450	451	"smooth"
		451	452	"smooth"
		452	453	"smooth"
		453	454	"smooth"
		454	455	"smooth"
		455	456	"smooth"
		456	457	"smooth"
		457	458	"smooth"
		458	408	"smooth"
		459	460	"smooth"
		460	461	"smooth"
		461	462	"smooth"
		462	463	"smooth"
		463	464	"smooth"
		464	465	"smooth"
		465	466	"smooth"
		466	467	"smooth"
		467	468	"smooth"
		468	469	"smooth"
		469	470	"smooth"
		470	471	"smooth"
		471	472	"smooth"
		472	473	"smooth"
		473	474	"smooth"
		474	475	"smooth"
		475	476	"smooth"
		476	477	"smooth"
		477	478	"smooth"
		478	479	"smooth"
		479	480	"smooth"
		480	481	"smooth"
		481	482	"smooth"
		482	483	"smooth"
		483	484	"smooth"
		484	485	"smooth"
		485	486	"smooth"
		486	487	"smooth"
		487	488	"smooth"
		488	489	"smooth"
		489	490	"smooth"
		490	491	"smooth"
		491	492	"smooth"
		492	493	"smooth"
		493	494	"smooth"
		494	495	"smooth"
		495	496	"smooth"
		496	497	"smooth"
		497	498	"smooth"
		498	499	"smooth"
		499	500	"smooth"
		500	501	"smooth"
		501	502	"smooth"
		502	503	"smooth"
		503	504	"smooth"
		504	505	"smooth"
		505	506	"smooth"
		506	507	"smooth"
		507	508	"smooth"
		508	509	"smooth"
		509	459	"smooth"
		510	511	"smooth"
		511	512	"smooth"
		512	513	"smooth"
		513	514	"smooth"
		514	515	"smooth"
		515	516	"smooth"
		516	517	"smooth"
		517	518	"smooth"
		518	519	"smooth"
		519	520	"smooth"
		520	521	"smooth"
		521	522	"smooth"
		522	523	"smooth"
		523	524	"smooth"
		524	525	"smooth"
		525	526	"smooth"
		526	527	"smooth"
		527	528	"smooth"
		528	529	"smooth"
		529	530	"smooth"
		530	531	"smooth"
		531	532	"smooth"
		532	533	"smooth"
		533	534	"smooth"
		534	535	"smooth"
		535	536	"smooth"
		536	537	"smooth"
		537	538	"smooth"
		538	539	"smooth"
		539	540	"smooth"
		540	541	"smooth"
		541	542	"smooth"
		542	543	"smooth"
		543	544	"smooth"
		544	545	"smooth"
		545	546	"smooth"
		546	547	"smooth"
		547	548	"smooth"
		548	549	"smooth"
		549	550	"smooth"
		550	551	"smooth"
		551	552	"smooth"
		552	553	"smooth"
		553	554	"smooth"
		554	555	"smooth"
		555	556	"smooth"
		556	557	"smooth"
		557	558	"smooth"
		558	559	"smooth"
		559	560	"smooth"
		560	510	"smooth"
		561	562	"smooth"
		562	563	"smooth"
		563	564	"smooth"
		564	565	"smooth"
		565	566	"smooth"
		566	567	"smooth"
		567	568	"smooth"
		568	569	"smooth"
		569	570	"smooth"
		570	571	"smooth"
		571	572	"smooth"
		572	573	"smooth"
		573	574	"smooth"
		574	575	"smooth"
		575	576	"smooth"
		576	577	"smooth"
		577	578	"smooth"
		578	579	"smooth"
		579	580	"smooth"
		580	581	"smooth"
		581	582	"smooth"
		582	583	"smooth"
		583	584	"smooth"
		584	585	"smooth"
		585	586	"smooth"
		586	587	"smooth"
		587	588	"smooth"
		588	589	"smooth"
		589	590	"smooth"
		590	591	"smooth"
		591	592	"smooth"
		592	593	"smooth"
		593	594	"smooth"
		594	595	"smooth"
		595	596	"smooth"
		596	597	"smooth"
		597	598	"smooth"
		598	599	"smooth"
		599	600	"smooth"
		600	601	"smooth"
		601	602	"smooth"
		602	603	"smooth"
		603	604	"smooth"
		604	605	"smooth"
		605	606	"smooth"
		606	607	"smooth"
		607	608	"smooth"
		608	609	"smooth"
		609	610	"smooth"
		610	611	"smooth"
		611	561	"smooth"
		612	613	"smooth"
		613	614	"smooth"
		614	615	"smooth"
		615	616	"smooth"
		616	617	"smooth"
		617	618	"smooth"
		618	619	"smooth"
		619	620	"smooth"
		620	621	"smooth"
		621	622	"smooth"
		622	623	"smooth"
		623	624	"smooth"
		624	625	"smooth"
		625	626	"smooth"
		626	627	"smooth"
		627	628	"smooth"
		628	629	"smooth"
		629	630	"smooth"
		630	631	"smooth"
		631	632	"smooth"
		632	633	"smooth"
		633	634	"smooth"
		634	635	"smooth"
		635	636	"smooth"
		636	637	"smooth"
		637	638	"smooth"
		638	639	"smooth"
		639	640	"smooth"
		640	641	"smooth"
		641	642	"smooth"
		642	643	"smooth"
		643	644	"smooth"
		644	645	"smooth"
		645	646	"smooth"
		646	647	"smooth"
		647	648	"smooth"
		648	649	"smooth"
		649	650	"smooth"
		650	651	"smooth"
		651	652	"smooth"
		652	653	"smooth"
		653	654	"smooth"
		654	655	"smooth"
		655	656	"smooth"
		656	657	"smooth"
		657	658	"smooth"
		658	659	"smooth"
		659	660	"smooth"
		660	661	"smooth"
		661	662	"smooth"
		662	612	"smooth"
		663	664	"smooth"
		664	665	"smooth"
		665	666	"smooth"
		666	667	"smooth"
		667	668	"smooth"
		668	669	"smooth"
		669	670	"smooth"
		670	671	"smooth"
		671	672	"smooth"
		672	673	"smooth"
		673	674	"smooth"
		674	675	"smooth"
		675	676	"smooth"
		676	677	"smooth"
		677	678	"smooth"
		678	679	"smooth"
		679	680	"smooth"
		680	681	"smooth"
		681	682	"smooth"
		682	683	"smooth"
		683	684	"smooth"
		684	685	"smooth"
		685	686	"smooth"
		686	687	"smooth"
		687	688	"smooth"
		688	689	"smooth"
		689	690	"smooth"
		690	691	"smooth"
		691	692	"smooth"
		692	693	"smooth"
		693	694	"smooth"
		694	695	"smooth"
		695	696	"smooth"
		696	697	"smooth"
		697	698	"smooth"
		698	699	"smooth"
		699	700	"smooth"
		700	701	"smooth"
		701	702	"smooth"
		702	703	"smooth"
		703	704	"smooth"
		704	705	"smooth"
		705	706	"smooth"
		706	707	"smooth"
		707	708	"smooth"
		708	709	"smooth"
		709	710	"smooth"
		710	711	"smooth"
		711	712	"smooth"
		712	713	"smooth"
		713	663	"smooth"
		714	715	"smooth"
		715	716	"smooth"
		716	717	"smooth"
		717	718	"smooth"
		718	719	"smooth"
		719	720	"smooth"
		720	721	"smooth"
		721	722	"smooth"
		722	723	"smooth"
		723	724	"smooth"
		724	725	"smooth"
		725	726	"smooth"
		726	727	"smooth"
		727	728	"smooth"
		728	729	"smooth"
		729	730	"smooth"
		730	731	"smooth"
		731	732	"smooth"
		732	733	"smooth"
		733	734	"smooth"
		734	735	"smooth"
		735	736	"smooth"
		736	737	"smooth"
		737	738	"smooth"
		738	739	"smooth"
		739	740	"smooth"
		740	741	"smooth"
		741	742	"smooth"
		742	743	"smooth"
		743	744	"smooth"
		744	745	"smooth"
		745	746	"smooth"
		746	747	"smooth"
		747	748	"smooth"
		748	749	"smooth"
		749	750	"smooth"
		750	751	"smooth"
		751	752	"smooth"
		752	753	"smooth"
		753	754	"smooth"
		754	755	"smooth"
		755	756	"smooth"
		756	757	"smooth"
		757	758	"smooth"
		758	759	"smooth"
		759	760	"smooth"
		760	761	"smooth"
		761	762	"smooth"
		762	763	"smooth"
		763	764	"smooth"
		764	714	"smooth"
		765	766	"smooth"
		766	767	"smooth"
		767	768	"smooth"
		768	769	"smooth"
		769	770	"smooth"
		770	771	"smooth"
		771	772	"smooth"
		772	773	"smooth"
		773	774	"smooth"
		774	775	"smooth"
		775	776	"smooth"
		776	777	"smooth"
		777	778	"smooth"
		778	779	"smooth"
		779	780	"smooth"
		780	781	"smooth"
		781	782	"smooth"
		782	783	"smooth"
		783	784	"smooth"
		784	785	"smooth"
		785	786	"smooth"
		786	787	"smooth"
		787	788	"smooth"
		788	789	"smooth"
		789	790	"smooth"
		790	791	"smooth"
		791	792	"smooth"
		792	793	"smooth"
		793	794	"smooth"
		794	795	"smooth"
		795	796	"smooth"
		796	797	"smooth"
		797	798	"smooth"
		798	799	"smooth"
		799	800	"smooth"
		800	801	"smooth"
		801	802	"smooth"
		802	803	"smooth"
		803	804	"smooth"
		804	805	"smooth"
		805	806	"smooth"
		806	807	"smooth"
		807	808	"smooth"
		808	809	"smooth"
		809	810	"smooth"
		810	811	"smooth"
		811	812	"smooth"
		812	813	"smooth"
		813	814	"smooth"
		814	815	"smooth"
		815	765	"smooth"
		816	817	"smooth"
		817	818	"smooth"
		818	819	"smooth"
		819	820	"smooth"
		820	821	"smooth"
		821	822	"smooth"
		822	823	"smooth"
		823	824	"smooth"
		824	825	"smooth"
		825	826	"smooth"
		826	827	"smooth"
		827	828	"smooth"
		828	829	"smooth"
		829	830	"smooth"
		830	831	"smooth"
		831	832	"smooth"
		832	833	"smooth"
		833	834	"smooth"
		834	835	"smooth"
		835	836	"smooth"
		836	837	"smooth"
		837	838	"smooth"
		838	839	"smooth"
		839	840	"smooth"
		840	841	"smooth"
		841	842	"smooth"
		842	843	"smooth"
		843	844	"smooth"
		844	845	"smooth"
		845	846	"smooth"
		846	847	"smooth"
		847	848	"smooth"
		848	849	"smooth"
		849	850	"smooth"
		850	851	"smooth"
		851	852	"smooth"
		852	853	"smooth"
		853	854	"smooth"
		854	855	"smooth"
		855	856	"smooth"
		856	857	"smooth"
		857	858	"smooth"
		858	859	"smooth"
		859	860	"smooth"
		860	861	"smooth"
		861	862	"smooth"
		862	863	"smooth"
		863	864	"smooth"
		864	865	"smooth"
		865	866	"smooth"
		866	816	"smooth"
		867	868	"smooth"
		868	869	"smooth"
		869	870	"smooth"
		870	871	"smooth"
		871	872	"smooth"
		872	873	"smooth"
		873	874	"smooth"
		874	875	"smooth"
		875	876	"smooth"
		876	877	"smooth"
		877	878	"smooth"
		878	879	"smooth"
		879	880	"smooth"
		880	881	"smooth"
		881	882	"smooth"
		882	883	"smooth"
		883	884	"smooth"
		884	885	"smooth"
		885	886	"smooth"
		886	887	"smooth"
		887	888	"smooth"
		888	889	"smooth"
		889	890	"smooth"
		890	891	"smooth"
		891	892	"smooth"
		892	893	"smooth"
		893	894	"smooth"
		894	895	"smooth"
		895	896	"smooth"
		896	897	"smooth"
		897	898	"smooth"
		898	899	"smooth"
		899	900	"smooth"
		900	901	"smooth"
		901	902	"smooth"
		902	903	"smooth"
		903	904	"smooth"
		904	905	"smooth"
		905	906	"smooth"
		906	907	"smooth"
		907	908	"smooth"
		908	909	"smooth"
		909	910	"smooth"
		910	911	"smooth"
		911	912	"smooth"
		912	913	"smooth"
		913	914	"smooth"
		914	915	"smooth"
		915	916	"smooth"
		916	917	"smooth"
		917	867	"smooth"
		918	919	"smooth"
		919	920	"smooth"
		920	921	"smooth"
		921	922	"smooth"
		922	923	"smooth"
		923	924	"smooth"
		924	925	"smooth"
		925	926	"smooth"
		926	927	"smooth"
		927	928	"smooth"
		928	929	"smooth"
		929	930	"smooth"
		930	931	"smooth"
		931	932	"smooth"
		932	933	"smooth"
		933	934	"smooth"
		934	935	"smooth"
		935	936	"smooth"
		936	937	"smooth"
		937	938	"smooth"
		938	939	"smooth"
		939	940	"smooth"
		940	941	"smooth"
		941	942	"smooth"
		942	943	"smooth"
		943	944	"smooth"
		944	945	"smooth"
		945	946	"smooth"
		946	947	"smooth"
		947	948	"smooth"
		948	949	"smooth"
		949	950	"smooth"
		950	951	"smooth"
		951	952	"smooth"
		952	953	"smooth"
		953	954	"smooth"
		954	955	"smooth"
		955	956	"smooth"
		956	957	"smooth"
		957	958	"smooth"
		958	959	"smooth"
		959	960	"smooth"
		960	961	"smooth"
		961	962	"smooth"
		962	963	"smooth"
		963	964	"smooth"
		964	965	"smooth"
		965	966	"smooth"
		966	967	"smooth"
		967	968	"smooth"
		968	918	"smooth"
		969	970	"smooth"
		970	971	"smooth"
		971	972	"smooth"
		972	973	"smooth"
		973	974	"smooth"
		974	975	"smooth"
		975	976	"smooth"
		976	977	"smooth"
		977	978	"smooth"
		978	979	"smooth"
		979	980	"smooth"
		980	981	"smooth"
		981	982	"smooth"
		982	983	"smooth"
		983	984	"smooth"
		984	985	"smooth"
		985	986	"smooth"
		986	987	"smooth"
		987	988	"smooth"
		988	989	"smooth"
		989	990	"smooth"
		990	991	"smooth"
		991	992	"smooth"
		992	993	"smooth"
		993	994	"smooth"
		994	995	"smooth"
		995	996	"smooth"
		996	997	"smooth"
		997	998	"smooth"
		998	999	"smooth"
		999	1000	"smooth"
		1000	1001	"smooth"
		1001	1002	"smooth"
		1002	1003	"smooth"
		1003	1004	"smooth"
		1004	1005	"smooth"
		1005	1006	"smooth"
		1006	1007	"smooth"
		1007	1008	"smooth"
		1008	1009	"smooth"
		1009	1010	"smooth"
		1010	1011	"smooth"
		1011	1012	"smooth"
		1012	1013	"smooth"
		1013	1014	"smooth"
		1014	1015	"smooth"
		1015	1016	"smooth"
		1016	1017	"smooth"
		1017	1018	"smooth"
		1018	1019	"smooth"
		1019	969	"smooth"
		1020	1021	"smooth"
		1021	1022	"smooth"
		1022	1023	"smooth"
		1023	1024	"smooth"
		1024	1025	"smooth"
		1025	1026	"smooth"
		1026	1027	"smooth"
		1027	1028	"smooth"
		1028	1029	"smooth"
		1029	1030	"smooth"
		1030	1031	"smooth"
		1031	1032	"smooth"
		1032	1033	"smooth"
		1033	1034	"smooth"
		1034	1035	"smooth"
		1035	1036	"smooth"
		1036	1037	"smooth"
		1037	1038	"smooth"
		1038	1039	"smooth"
		1039	1040	"smooth"
		1040	1041	"smooth"
		1041	1042	"smooth"
		1042	1043	"smooth"
		1043	1044	"smooth"
		1044	1045	"smooth"
		1045	1046	"smooth"
		1046	1047	"smooth"
		1047	1048	"smooth"
		1048	1049	"smooth"
		1049	1050	"smooth"
		1050	1051	"smooth"
		1051	1052	"smooth"
		1052	1053	"smooth"
		1053	1054	"smooth"
		1054	1055	"smooth"
		1055	1056	"smooth"
		1056	1057	"smooth"
		1057	1058	"smooth"
		1058	1059	"smooth"
		1059	1060	"smooth"
		1060	1061	"smooth"
		1061	1062	"smooth"
		1062	1063	"smooth"
		1063	1064	"smooth"
		1064	1065	"smooth"
		1065	1066	"smooth"
		1066	1067	"smooth"
		1067	1068	"smooth"
		1068	1069	"smooth"
		1069	1070	"smooth"
		1070	1020	"smooth"
		1071	1072	"smooth"
		1072	1073	"smooth"
		1073	1074	"smooth"
		1074	1075	"smooth"
		1075	1076	"smooth"
		1076	1077	"smooth"
		1077	1078	"smooth"
		1078	1079	"smooth"
		1079	1080	"smooth"
		1080	1081	"smooth"
		1081	1082	"smooth"
		1082	1083	"smooth"
		1083	1084	"smooth"
		1084	1085	"smooth"
		1085	1086	"smooth"
		1086	1087	"smooth"
		1087	1088	"smooth"
		1088	1089	"smooth"
		1089	1090	"smooth"
		1090	1091	"smooth"
		1091	1092	"smooth"
		1092	1093	"smooth"
		1093	1094	"smooth"
		1094	1095	"smooth"
		1095	1096	"smooth"
		1096	1097	"smooth"
		1097	1098	"smooth"
		1098	1099	"smooth"
		1099	1100	"smooth"
		1100	1101	"smooth"
		1101	1102	"smooth"
		1102	1103	"smooth"
		1103	1104	"smooth"
		1104	1105	"smooth"
		1105	1106	"smooth"
		1106	1107	"smooth"
		1107	1108	"smooth"
		1108	1109	"smooth"
		1109	1110	"smooth"
		1110	1111	"smooth"
		1111	1112	"smooth"
		1112	1113	"smooth"
		1113	1114	"smooth"
		1114	1115	"smooth"
		1115	1116	"smooth"
		1116	1117	"smooth"
		1117	1118	"smooth"
		1118	1119	"smooth"
		1119	1120	"smooth"
		1120	1121	"smooth"
		1121	1071	"smooth"
		1122	1123	"smooth"
		1123	1124	"smooth"
		1124	1125	"smooth"
		1125	1126	"smooth"
		1126	1127	"smooth"
		1127	1128	"smooth"
		1128	1129	"smooth"
		1129	1130	"smooth"
		1130	1131	"smooth"
		1131	1132	"smooth"
		1132	1133	"smooth"
		1133	1134	"smooth"
		1134	1135	"smooth"
		1135	1136	"smooth"
		1136	1137	"smooth"
		1137	1138	"smooth"
		1138	1139	"smooth"
		1139	1140	"smooth"
		1140	1141	"smooth"
		1141	1142	"smooth"
		1142	1143	"smooth"
		1143	1144	"smooth"
		1144	1145	"smooth"
		1145	1146	"smooth"
		1146	1147	"smooth"
		1147	1148	"smooth"
		1148	1149	"smooth"
		1149	1150	"smooth"
		1150	1151	"smooth"
		1151	1152	"smooth"
		1152	1153	"smooth"
		1153	1154	"smooth"
		1154	1155	"smooth"
		1155	1156	"smooth"
		1156	1157	"smooth"
		1157	1158	"smooth"
		1158	1159	"smooth"
		1159	1160	"smooth"
		1160	1161	"smooth"
		1161	1162	"smooth"
		1162	1163	"smooth"
		1163	1164	"smooth"
		1164	1165	"smooth"
		1165	1166	"smooth"
		1166	1167	"smooth"
		1167	1168	"smooth"
		1168	1169	"smooth"
		1169	1170	"smooth"
		1170	1171	"smooth"
		1171	1172	"smooth"
		1172	1122	"smooth"
		1173	1174	"smooth"
		1174	1175	"smooth"
		1175	1176	"smooth"
		1176	1177	"smooth"
		1177	1178	"smooth"
		1178	1179	"smooth"
		1179	1180	"smooth"
		1180	1181	"smooth"
		1181	1182	"smooth"
		1182	1183	"smooth"
		1183	1184	"smooth"
		1184	1185	"smooth"
		1185	1186	"smooth"
		1186	1187	"smooth"
		1187	1188	"smooth"
		1188	1189	"smooth"
		1189	1190	"smooth"
		1190	1191	"smooth"
		1191	1192	"smooth"
		1192	1193	"smooth"
		1193	1194	"smooth"
		1194	1195	"smooth"
		1195	1196	"smooth"
		1196	1197	"smooth"
		1197	1198	"smooth"
		1198	1199	"smooth"
		1199	1200	"smooth"
		1200	1201	"smooth"
		1201	1202	"smooth"
		1202	1203	"smooth"
		1203	1204	"smooth"
		1204	1205	"smooth"
		1205	1206	"smooth"
		1206	1207	"smooth"
		1207	1208	"smooth"
		1208	1209	"smooth"
		1209	1210	"smooth"
		1210	1211	"smooth"
		1211	1212	"smooth"
		1212	1213	"smooth"
		1213	1214	"smooth"
		1214	1215	"smooth"
		1215	1216	"smooth"
		1216	1217	"smooth"
		1217	1218	"smooth"
		1218	1219	"smooth"
		1219	1220	"smooth"
		1220	1221	"smooth"
		1221	1222	"smooth"
		1222	1223	"smooth"
		1223	1173	"smooth"
		1224	1225	"smooth"
		1225	1226	"smooth"
		1226	1227	"smooth"
		1227	1228	"smooth"
		1228	1229	"smooth"
		1229	1230	"smooth"
		1230	1231	"smooth"
		1231	1232	"smooth"
		1232	1233	"smooth"
		1233	1234	"smooth"
		1234	1235	"smooth"
		1235	1236	"smooth"
		1236	1237	"smooth"
		1237	1238	"smooth"
		1238	1239	"smooth"
		1239	1240	"smooth"
		1240	1241	"smooth"
		1241	1242	"smooth"
		1242	1243	"smooth"
		1243	1244	"smooth"
		1244	1245	"smooth"
		1245	1246	"smooth"
		1246	1247	"smooth"
		1247	1248	"smooth"
		1248	1249	"smooth"
		1249	1250	"smooth"
		1250	1251	"smooth"
		1251	1252	"smooth"
		1252	1253	"smooth"
		1253	1254	"smooth"
		1254	1255	"smooth"
		1255	1256	"smooth"
		1256	1257	"smooth"
		1257	1258	"smooth"
		1258	1259	"smooth"
		1259	1260	"smooth"
		1260	1261	"smooth"
		1261	1262	"smooth"
		1262	1263	"smooth"
		1263	1264	"smooth"
		1264	1265	"smooth"
		1265	1266	"smooth"
		1266	1267	"smooth"
		1267	1268	"smooth"
		1268	1269	"smooth"
		1269	1270	"smooth"
		1270	1271	"smooth"
		1271	1272	"smooth"
		1272	1273	"smooth"
		1273	1274	"smooth"
		1274	1224	"smooth"
		1275	1276	"smooth"
		1276	1277	"smooth"
		1277	1278	"smooth"
		1278	1279	"smooth"
		1279	1280	"smooth"
		1280	1281	"smooth"
		1281	1282	"smooth"
		1282	1283	"smooth"
		1283	1284	"smooth"
		1284	1285	"smooth"
		1285	1286	"smooth"
		1286	1287	"smooth"
		1287	1288	"smooth"
		1288	1289	"smooth"
		1289	1290	"smooth"
		1290	1291	"smooth"
		1291	1292	"smooth"
		1292	1293	"smooth"
		1293	1294	"smooth"
		1294	1295	"smooth"
		1295	1296	"smooth"
		1296	1297	"smooth"
		1297	1298	"smooth"
		1298	1299	"smooth"
		1299	1300	"smooth"
		1300	1301	"smooth"
		1301	1302	"smooth"
		1302	1303	"smooth"
		1303	1304	"smooth"
		1304	1305	"smooth"
		1305	1306	"smooth"
		1306	1307	"smooth"
		1307	1308	"smooth"
		1308	1309	"smooth"
		1309	1310	"smooth"
		1310	1311	"smooth"
		1311	1312	"smooth"
		1312	1313	"smooth"
		1313	1314	"smooth"
		1314	1315	"smooth"
		1315	1316	"smooth"
		1316	1317	"smooth"
		1317	1318	"smooth"
		1318	1319	"smooth"
		1319	1320	"smooth"
		1320	1321	"smooth"
		1321	1322	"smooth"
		1322	1323	"smooth"
		1323	1324	"smooth"
		1324	1325	"smooth"
		1325	1275	"smooth"
		1326	1327	"smooth"
		1327	1328	"smooth"
		1328	1329	"smooth"
		1329	1330	"smooth"
		1330	1331	"smooth"
		1331	1332	"smooth"
		1332	1333	"smooth"
		1333	1334	"smooth"
		1334	1335	"smooth"
		1335	1336	"smooth"
		1336	1337	"smooth"
		1337	1338	"smooth"
		1338	1339	"smooth"
		1339	1340	"smooth"
		1340	1341	"smooth"
		1341	1342	"smooth"
		1342	1343	"smooth"
		1343	1344	"smooth"
		1344	1345	"smooth"
		1345	1346	"smooth"
		1346	1347	"smooth"
		1347	1348	"smooth"
		1348	1349	"smooth"
		1349	1350	"smooth"
		1350	1351	"smooth"
		1351	1352	"smooth"
		1352	1353	"smooth"
		1353	1354	"smooth"
		1354	1355	"smooth"
		1355	1356	"smooth"
		1356	1357	"smooth"
		1357	1358	"smooth"
		1358	1359	"smooth"
		1359	1360	"smooth"
		1360	1361	"smooth"
		1361	1362	"smooth"
		1362	1363	"smooth"
		1363	1364	"smooth"
		1364	1365	"smooth"
		1365	1366	"smooth"
		1366	1367	"smooth"
		1367	1368	"smooth"
		1368	1369	"smooth"
		1369	1370	"smooth"
		1370	1371	"smooth"
		1371	1372	"smooth"
		1372	1373	"smooth"
		1373	1374	"smooth"
		1374	1375	"smooth"
		1375	1376	"smooth"
		1376	1326	"smooth"
		1377	1378	"smooth"
		1378	1379	"smooth"
		1379	1380	"smooth"
		1380	1381	"smooth"
		1381	1382	"smooth"
		1382	1383	"smooth"
		1383	1384	"smooth"
		1384	1385	"smooth"
		1385	1386	"smooth"
		1386	1387	"smooth"
		1387	1388	"smooth"
		1388	1389	"smooth"
		1389	1390	"smooth"
		1390	1391	"smooth"
		1391	1392	"smooth"
		1392	1393	"smooth"
		1393	1394	"smooth"
		1394	1395	"smooth"
		1395	1396	"smooth"
		1396	1397	"smooth"
		1397	1398	"smooth"
		1398	1399	"smooth"
		1399	1400	"smooth"
		1400	1401	"smooth"
		1401	1402	"smooth"
		1402	1403	"smooth"
		1403	1404	"smooth"
		1404	1405	"smooth"
		1405	1406	"smooth"
		1406	1407	"smooth"
		1407	1408	"smooth"
		1408	1409	"smooth"
		1409	1410	"smooth"
		1410	1411	"smooth"
		1411	1412	"smooth"
		1412	1413	"smooth"
		1413	1414	"smooth"
		1414	1415	"smooth"
		1415	1416	"smooth"
		1416	1417	"smooth"
		1417	1418	"smooth"
		1418	1419	"smooth"
		1419	1420	"smooth"
		1420	1421	"smooth"
		1421	1422	"smooth"
		1422	1423	"smooth"
		1423	1424	"smooth"
		1424	1425	"smooth"
		1425	1426	"smooth"
		1426	1427	"smooth"
		1427	1377	"smooth"
		1428	1429	"smooth"
		1429	1430	"smooth"
		1430	1431	"smooth"
		1431	1432	"smooth"
		1432	1433	"smooth"
		1433	1434	"smooth"
		1434	1435	"smooth"
		1435	1436	"smooth"
		1436	1437	"smooth"
		1437	1438	"smooth"
		1438	1439	"smooth"
		1439	1440	"smooth"
		1440	1441	"smooth"
		1441	1442	"smooth"
		1442	1443	"smooth"
		1443	1444	"smooth"
		1444	1445	"smooth"
		1445	1446	"smooth"
		1446	1447	"smooth"
		1447	1448	"smooth"
		1448	1449	"smooth"
		1449	1450	"smooth"
		1450	1451	"smooth"
		1451	1452	"smooth"
		1452	1453	"smooth"
		1453	1454	"smooth"
		1454	1455	"smooth"
		1455	1456	"smooth"
		1456	1457	"smooth"
		1457	1458	"smooth"
		1458	1459	"smooth"
		1459	1460	"smooth"
		1460	1461	"smooth"
		1461	1462	"smooth"
		1462	1463	"smooth"
		1463	1464	"smooth"
		1464	1465	"smooth"
		1465	1466	"smooth"
		1466	1467	"smooth"
		1467	1468	"smooth"
		1468	1469	"smooth"
		1469	1470	"smooth"
		1470	1471	"smooth"
		1471	1472	"smooth"
		1472	1473	"smooth"
		1473	1474	"smooth"
		1474	1475	"smooth"
		1475	1476	"smooth"
		1476	1477	"smooth"
		1477	1478	"smooth"
		1478	1428	"smooth"
		1479	1480	"smooth"
		1480	1481	"smooth"
		1481	1482	"smooth"
		1482	1483	"smooth"
		1483	1484	"smooth"
		1484	1485	"smooth"
		1485	1486	"smooth"
		1486	1487	"smooth"
		1487	1488	"smooth"
		1488	1489	"smooth"
		1489	1490	"smooth"
		1490	1491	"smooth"
		1491	1492	"smooth"
		1492	1493	"smooth"
		1493	1494	"smooth"
		1494	1495	"smooth"
		1495	1496	"smooth"
		1496	1497	"smooth"
		1497	1498	"smooth"
		1498	1499	"smooth"
		1499	1500	"smooth"
		1500	1501	"smooth"
		1501	1502	"smooth"
		1502	1503	"smooth"
		1503	1504	"smooth"
		1504	1505	"smooth"
		1505	1506	"smooth"
		1506	1507	"smooth"
		1507	1508	"smooth"
		1508	1509	"smooth"
		1509	1510	"smooth"
		1510	1511	"smooth"
		1511	1512	"smooth"
		1512	1513	"smooth"
		1513	1514	"smooth"
		1514	1515	"smooth"
		1515	1516	"smooth"
		1516	1517	"smooth"
		1517	1518	"smooth"
		1518	1519	"smooth"
		1519	1520	"smooth"
		1520	1521	"smooth"
		1521	1522	"smooth"
		1522	1523	"smooth"
		1523	1524	"smooth"
		1524	1525	"smooth"
		1525	1526	"smooth"
		1526	1527	"smooth"
		1527	1528	"smooth"
		1528	1529	"smooth"
		1529	1479	"smooth"
		1530	1531	"smooth"
		1531	1532	"smooth"
		1532	1533	"smooth"
		1533	1534	"smooth"
		1534	1535	"smooth"
		1535	1536	"smooth"
		1536	1537	"smooth"
		1537	1538	"smooth"
		1538	1539	"smooth"
		1539	1540	"smooth"
		1540	1541	"smooth"
		1541	1542	"smooth"
		1542	1543	"smooth"
		1543	1544	"smooth"
		1544	1545	"smooth"
		1545	1546	"smooth"
		1546	1547	"smooth"
		1547	1548	"smooth"
		1548	1549	"smooth"
		1549	1550	"smooth"
		1550	1551	"smooth"
		1551	1552	"smooth"
		1552	1553	"smooth"
		1553	1554	"smooth"
		1554	1555	"smooth"
		1555	1556	"smooth"
		1556	1557	"smooth"
		1557	1558	"smooth"
		1558	1559	"smooth"
		1559	1560	"smooth"
		1560	1561	"smooth"
		1561	1562	"smooth"
		1562	1563	"smooth"
		1563	1564	"smooth"
		1564	1565	"smooth"
		1565	1566	"smooth"
		1566	1567	"smooth"
		1567	1568	"smooth"
		1568	1569	"smooth"
		1569	1570	"smooth"
		1570	1571	"smooth"
		1571	1572	"smooth"
		1572	1573	"smooth"
		1573	1574	"smooth"
		1574	1575	"smooth"
		1575	1576	"smooth"
		1576	1577	"smooth"
		1577	1578	"smooth"
		1578	1579	"smooth"
		1579	1580	"smooth"
		1580	1530	"smooth"
		1581	1582	"smooth"
		1582	1583	"smooth"
		1583	1584	"smooth"
		1584	1585	"smooth"
		1585	1586	"smooth"
		1586	1587	"smooth"
		1587	1588	"smooth"
		1588	1589	"smooth"
		1589	1590	"smooth"
		1590	1591	"smooth"
		1591	1592	"smooth"
		1592	1593	"smooth"
		1593	1594	"smooth"
		1594	1595	"smooth"
		1595	1596	"smooth"
		1596	1597	"smooth"
		1597	1598	"smooth"
		1598	1599	"smooth"
		1599	1600	"smooth"
		1600	1601	"smooth"
		1601	1602	"smooth"
		1602	1603	"smooth"
		1603	1604	"smooth"
		1604	1605	"smooth"
		1605	1606	"smooth"
		1606	1607	"smooth"
		1607	1608	"smooth"
		1608	1609	"smooth"
		1609	1610	"smooth"
		1610	1611	"smooth"
		1611	1612	"smooth"
		1612	1613	"smooth"
		1613	1614	"smooth"
		1614	1615	"smooth"
		1615	1616	"smooth"
		1616	1617	"smooth"
		1617	1618	"smooth"
		1618	1619	"smooth"
		1619	1620	"smooth"
		1620	1621	"smooth"
		1621	1622	"smooth"
		1622	1623	"smooth"
		1623	1624	"smooth"
		1624	1625	"smooth"
		1625	1626	"smooth"
		1626	1627	"smooth"
		1627	1628	"smooth"
		1628	1629	"smooth"
		1629	1630	"smooth"
		1630	1631	"smooth"
		1631	1581	"smooth"
		1632	1633	"smooth"
		1633	1634	"smooth"
		1634	1635	"smooth"
		1635	1636	"smooth"
		1636	1637	"smooth"
		1637	1638	"smooth"
		1638	1639	"smooth"
		1639	1640	"smooth"
		1640	1641	"smooth"
		1641	1642	"smooth"
		1642	1643	"smooth"
		1643	1644	"smooth"
		1644	1645	"smooth"
		1645	1646	"smooth"
		1646	1647	"smooth"
		1647	1648	"smooth"
		1648	1649	"smooth"
		1649	1650	"smooth"
		1650	1651	"smooth"
		1651	1652	"smooth"
		1652	1653	"smooth"
		1653	1654	"smooth"
		1654	1655	"smooth"
		1655	1656	"smooth"
		1656	1657	"smooth"
		1657	1658	"smooth"
		1658	1659	"smooth"
		1659	1660	"smooth"
		1660	1661	"smooth"
		1661	1662	"smooth"
		1662	1663	"smooth"
		1663	1664	"smooth"
		1664	1665	"smooth"
		1665	1666	"smooth"
		1666	1667	"smooth"
		1667	1668	"smooth"
		1668	1669	"smooth"
		1669	1670	"smooth"
		1670	1671	"smooth"
		1671	1672	"smooth"
		1672	1673	"smooth"
		1673	1674	"smooth"
		1674	1675	"smooth"
		1675	1676	"smooth"
		1676	1677	"smooth"
		1677	1678	"smooth"
		1678	1679	"smooth"
		1679	1680	"smooth"
		1680	1681	"smooth"
		1681	1682	"smooth"
		1682	1632	"smooth"
		1683	1684	"smooth"
		1684	1685	"smooth"
		1685	1686	"smooth"
		1686	1687	"smooth"
		1687	1688	"smooth"
		1688	1689	"smooth"
		1689	1690	"smooth"
		1690	1691	"smooth"
		1691	1692	"smooth"
		1692	1693	"smooth"
		1693	1694	"smooth"
		1694	1695	"smooth"
		1695	1696	"smooth"
		1696	1697	"smooth"
		1697	1698	"smooth"
		1698	1699	"smooth"
		1699	1700	"smooth"
		1700	1701	"smooth"
		1701	1702	"smooth"
		1702	1703	"smooth"
		1703	1704	"smooth"
		1704	1705	"smooth"
		1705	1706	"smooth"
		1706	1707	"smooth"
		1707	1708	"smooth"
		1708	1709	"smooth"
		1709	1710	"smooth"
		1710	1711	"smooth"
		1711	1712	"smooth"
		1712	1713	"smooth"
		1713	1714	"smooth"
		1714	1715	"smooth"
		1715	1716	"smooth"
		1716	1717	"smooth"
		1717	1718	"smooth"
		1718	1719	"smooth"
		1719	1720	"smooth"
		1720	1721	"smooth"
		1721	1722	"smooth"
		1722	1723	"smooth"
		1723	1724	"smooth"
		1724	1725	"smooth"
		1725	1726	"smooth"
		1726	1727	"smooth"
		1727	1728	"smooth"
		1728	1729	"smooth"
		1729	1730	"smooth"
		1730	1731	"smooth"
		1731	1732	"smooth"
		1732	1733	"smooth"
		1733	1683	"smooth"
		1734	1735	"smooth"
		1735	1736	"smooth"
		1736	1737	"smooth"
		1737	1738	"smooth"
		1738	1739	"smooth"
		1739	1740	"smooth"
		1740	1741	"smooth"
		1741	1742	"smooth"
		1742	1743	"smooth"
		1743	1744	"smooth"
		1744	1745	"smooth"
		1745	1746	"smooth"
		1746	1747	"smooth"
		1747	1748	"smooth"
		1748	1749	"smooth"
		1749	1750	"smooth"
		1750	1751	"smooth"
		1751	1752	"smooth"
		1752	1753	"smooth"
		1753	1754	"smooth"
		1754	1755	"smooth"
		1755	1756	"smooth"
		1756	1757	"smooth"
		1757	1758	"smooth"
		1758	1759	"smooth"
		1759	1760	"smooth"
		1760	1761	"smooth"
		1761	1762	"smooth"
		1762	1763	"smooth"
		1763	1764	"smooth"
		1764	1765	"smooth"
		1765	1766	"smooth"
		1766	1767	"smooth"
		1767	1768	"smooth"
		1768	1769	"smooth"
		1769	1770	"smooth"
		1770	1771	"smooth"
		1771	1772	"smooth"
		1772	1773	"smooth"
		1773	1774	"smooth"
		1774	1775	"smooth"
		1775	1776	"smooth"
		1776	1777	"smooth"
		1777	1778	"smooth"
		1778	1779	"smooth"
		1779	1780	"smooth"
		1780	1781	"smooth"
		1781	1782	"smooth"
		1782	1783	"smooth"
		1783	1784	"smooth"
		1784	1734	"smooth"
		1785	1786	"smooth"
		1786	1787	"smooth"
		1787	1788	"smooth"
		1788	1789	"smooth"
		1789	1790	"smooth"
		1790	1791	"smooth"
		1791	1792	"smooth"
		1792	1793	"smooth"
		1793	1794	"smooth"
		1794	1795	"smooth"
		1795	1796	"smooth"
		1796	1797	"smooth"
		1797	1798	"smooth"
		1798	1799	"smooth"
		1799	1800	"smooth"
		1800	1801	"smooth"
		1801	1802	"smooth"
		1802	1803	"smooth"
		1803	1804	"smooth"
		1804	1805	"smooth"
		1805	1806	"smooth"
		1806	1807	"smooth"
		1807	1808	"smooth"
		1808	1809	"smooth"
		1809	1810	"smooth"
		1810	1811	"smooth"
		1811	1812	"smooth"
		1812	1813	"smooth"
		1813	1814	"smooth"
		1814	1815	"smooth"
		1815	1816	"smooth"
		1816	1817	"smooth"
		1817	1818	"smooth"
		1818	1819	"smooth"
		1819	1820	"smooth"
		1820	1821	"smooth"
		1821	1822	"smooth"
		1822	1823	"smooth"
		1823	1824	"smooth"
		1824	1825	"smooth"
		1825	1826	"smooth"
		1826	1827	"smooth"
		1827	1828	"smooth"
		1828	1829	"smooth"
		1829	1830	"smooth"
		1830	1831	"smooth"
		1831	1832	"smooth"
		1832	1833	"smooth"
		1833	1834	"smooth"
		1834	1835	"smooth"
		1835	1785	"smooth"
		1836	1837	"smooth"
		1837	1838	"smooth"
		1838	1839	"smooth"
		1839	1840	"smooth"
		1840	1841	"smooth"
		1841	1842	"smooth"
		1842	1843	"smooth"
		1843	1844	"smooth"
		1844	1845	"smooth"
		1845	1846	"smooth"
		1846	1847	"smooth"
		1847	1848	"smooth"
		1848	1849	"smooth"
		1849	1850	"smooth"
		1850	1851	"smooth"
		1851	1852	"smooth"
		1852	1853	"smooth"
		1853	1854	"smooth"
		1854	1855	"smooth"
		1855	1856	"smooth"
		1856	1857	"smooth"
		1857	1858	"smooth"
		1858	1859	"smooth"
		1859	1860	"smooth"
		1860	1861	"smooth"
		1861	1862	"smooth"
		1862	1863	"smooth"
		1863	1864	"smooth"
		1864	1865	"smooth"
		1865	1866	"smooth"
		1866	1867	"smooth"
		1867	1868	"smooth"
		1868	1869	"smooth"
		1869	1870	"smooth"
		1870	1871	"smooth"
		1871	1872	"smooth"
		1872	1873	"smooth"
		1873	1874	"smooth"
		1874	1875	"smooth"
		1875	1876	"smooth"
		1876	1877	"smooth"
		1877	1878	"smooth"
		1878	1879	"smooth"
		1879	1880	"smooth"
		1880	1881	"smooth"
		1881	1882	"smooth"
		1882	1883	"smooth"
		1883	1884	"smooth"
		1884	1885	"smooth"
		1885	1886	"smooth"
		1886	1836	"smooth"
		1887	1888	"smooth"
		1888	1889	"smooth"
		1889	1890	"smooth"
		1890	1891	"smooth"
		1891	1892	"smooth"
		1892	1893	"smooth"
		1893	1894	"smooth"
		1894	1895	"smooth"
		1895	1896	"smooth"
		1896	1897	"smooth"
		1897	1898	"smooth"
		1898	1899	"smooth"
		1899	1900	"smooth"
		1900	1901	"smooth"
		1901	1902	"smooth"
		1902	1903	"smooth"
		1903	1904	"smooth"
		1904	1905	"smooth"
		1905	1906	"smooth"
		1906	1907	"smooth"
		1907	1908	"smooth"
		1908	1909	"smooth"
		1909	1910	"smooth"
		1910	1911	"smooth"
		1911	1912	"smooth"
		1912	1913	"smooth"
		1913	1914	"smooth"
		1914	1915	"smooth"
		1915	1916	"smooth"
		1916	1917	"smooth"
		1917	1918	"smooth"
		1918	1919	"smooth"
		1919	1920	"smooth"
		1920	1921	"smooth"
		1921	1922	"smooth"
		1922	1923	"smooth"
		1923	1924	"smooth"
		1924	1925	"smooth"
		1925	1926	"smooth"
		1926	1927	"smooth"
		1927	1928	"smooth"
		1928	1929	"smooth"
		1929	1930	"smooth"
		1930	1931	"smooth"
		1931	1932	"smooth"
		1932	1933	"smooth"
		1933	1934	"smooth"
		1934	1935	"smooth"
		1935	1936	"smooth"
		1936	1937	"smooth"
		1937	1887	"smooth"
		1938	1939	"smooth"
		1939	1940	"smooth"
		1940	1941	"smooth"
		1941	1942	"smooth"
		1942	1943	"smooth"
		1943	1944	"smooth"
		1944	1945	"smooth"
		1945	1946	"smooth"
		1946	1947	"smooth"
		1947	1948	"smooth"
		1948	1949	"smooth"
		1949	1950	"smooth"
		1950	1951	"smooth"
		1951	1952	"smooth"
		1952	1953	"smooth"
		1953	1954	"smooth"
		1954	1955	"smooth"
		1955	1956	"smooth"
		1956	1957	"smooth"
		1957	1958	"smooth"
		1958	1959	"smooth"
		1959	1960	"smooth"
		1960	1961	"smooth"
		1961	1962	"smooth"
		1962	1963	"smooth"
		1963	1964	"smooth"
		1964	1965	"smooth"
		1965	1966	"smooth"
		1966	1967	"smooth"
		1967	1968	"smooth"
		1968	1969	"smooth"
		1969	1970	"smooth"
		1970	1971	"smooth"
		1971	1972	"smooth"
		1972	1973	"smooth"
		1973	1974	"smooth"
		1974	1975	"smooth"
		1975	1976	"smooth"
		1976	1977	"smooth"
		1977	1978	"smooth"
		1978	1979	"smooth"
		1979	1980	"smooth"
		1980	1981	"smooth"
		1981	1982	"smooth"
		1982	1983	"smooth"
		1983	1984	"smooth"
		1984	1985	"smooth"
		1985	1986	"smooth"
		1986	1987	"smooth"
		1987	1988	"smooth"
		1988	1938	"smooth"
		1989	1990	"smooth"
		1990	1991	"smooth"
		1991	1992	"smooth"
		1992	1993	"smooth"
		1993	1994	"smooth"
		1994	1995	"smooth"
		1995	1996	"smooth"
		1996	1997	"smooth"
		1997	1998	"smooth"
		1998	1999	"smooth"
		1999	2000	"smooth"
		2000	2001	"smooth"
		2001	2002	"smooth"
		2002	2003	"smooth"
		2003	2004	"smooth"
		2004	2005	"smooth"
		2005	2006	"smooth"
		2006	2007	"smooth"
		2007	2008	"smooth"
		2008	2009	"smooth"
		2009	2010	"smooth"
		2010	2011	"smooth"
		2011	2012	"smooth"
		2012	2013	"smooth"
		2013	2014	"smooth"
		2014	2015	"smooth"
		2015	2016	"smooth"
		2016	2017	"smooth"
		2017	2018	"smooth"
		2018	2019	"smooth"
		2019	2020	"smooth"
		2020	2021	"smooth"
		2021	2022	"smooth"
		2022	2023	"smooth"
		2023	2024	"smooth"
		2024	2025	"smooth"
		2025	2026	"smooth"
		2026	2027	"smooth"
		2027	2028	"smooth"
		2028	2029	"smooth"
		2029	2030	"smooth"
		2030	2031	"smooth"
		2031	2032	"smooth"
		2032	2033	"smooth"
		2033	2034	"smooth"
		2034	2035	"smooth"
		2035	2036	"smooth"
		2036	2037	"smooth"
		2037	2038	"smooth"
		2038	2039	"smooth"
		2039	1989	"smooth"
		2040	2041	"smooth"
		2041	2042	"smooth"
		2042	2043	"smooth"
		2043	2044	"smooth"
		2044	2045	"smooth"
		2045	2046	"smooth"
		2046	2047	"smooth"
		2047	2048	"smooth"
		2048	2049	"smooth"
		2049	2050	"smooth"
		2050	2051	"smooth"
		2051	2052	"smooth"
		2052	2053	"smooth"
		2053	2054	"smooth"
		2054	2055	"smooth"
		2055	2056	"smooth"
		2056	2057	"smooth"
		2057	2058	"smooth"
		2058	2059	"smooth"
		2059	2060	"smooth"
		2060	2061	"smooth"
		2061	2062	"smooth"
		2062	2063	"smooth"
		2063	2064	"smooth"
		2064	2065	"smooth"
		2065	2066	"smooth"
		2066	2067	"smooth"
		2067	2068	"smooth"
		2068	2069	"smooth"
		2069	2070	"smooth"
		2070	2071	"smooth"
		2071	2072	"smooth"
		2072	2073	"smooth"
		2073	2074	"smooth"
		2074	2075	"smooth"
		2075	2076	"smooth"
		2076	2077	"smooth"
		2077	2078	"smooth"
		2078	2079	"smooth"
		2079	2080	"smooth"
		2080	2081	"smooth"
		2081	2082	"smooth"
		2082	2083	"smooth"
		2083	2084	"smooth"
		2084	2085	"smooth"
		2085	2086	"smooth"
		2086	2087	"smooth"
		2087	2088	"smooth"
		2088	2089	"smooth"
		2089	2090	"smooth"
		2090	2040	"smooth"
		2091	2092	"smooth"
		2092	2093	"smooth"
		2093	2094	"smooth"
		2094	2095	"smooth"
		2095	2096	"smooth"
		2096	2097	"smooth"
		2097	2098	"smooth"
		2098	2099	"smooth"
		2099	2100	"smooth"
		2100	2101	"smooth"
		2101	2102	"smooth"
		2102	2103	"smooth"
		2103	2104	"smooth"
		2104	2105	"smooth"
		2105	2106	"smooth"
		2106	2107	"smooth"
		2107	2108	"smooth"
		2108	2109	"smooth"
		2109	2110	"smooth"
		2110	2111	"smooth"
		2111	2112	"smooth"
		2112	2113	"smooth"
		2113	2114	"smooth"
		2114	2115	"smooth"
		2115	2116	"smooth"
		2116	2117	"smooth"
		2117	2118	"smooth"
		2118	2119	"smooth"
		2119	2120	"smooth"
		2120	2121	"smooth"
		2121	2122	"smooth"
		2122	2123	"smooth"
		2123	2124	"smooth"
		2124	2125	"smooth"
		2125	2126	"smooth"
		2126	2127	"smooth"
		2127	2128	"smooth"
		2128	2129	"smooth"
		2129	2130	"smooth"
		2130	2131	"smooth"
		2131	2132	"smooth"
		2132	2133	"smooth"
		2133	2134	"smooth"
		2134	2135	"smooth"
		2135	2136	"smooth"
		2136	2137	"smooth"
		2137	2138	"smooth"
		2138	2139	"smooth"
		2139	2140	"smooth"
		2140	2141	"smooth"
		2141	2091	"smooth"
		2142	2143	"smooth"
		2143	2144	"smooth"
		2144	2145	"smooth"
		2145	2146	"smooth"
		2146	2147	"smooth"
		2147	2148	"smooth"
		2148	2149	"smooth"
		2149	2150	"smooth"
		2150	2151	"smooth"
		2151	2152	"smooth"
		2152	2153	"smooth"
		2153	2154	"smooth"
		2154	2155	"smooth"
		2155	2156	"smooth"
		2156	2157	"smooth"
		2157	2158	"smooth"
		2158	2159	"smooth"
		2159	2160	"smooth"
		2160	2161	"smooth"
		2161	2162	"smooth"
		2162	2163	"smooth"
		2163	2164	"smooth"
		2164	2165	"smooth"
		2165	2166	"smooth"
		2166	2167	"smooth"
		2167	2168	"smooth"
		2168	2169	"smooth"
		2169	2170	"smooth"
		2170	2171	"smooth"
		2171	2172	"smooth"
		2172	2173	"smooth"
		2173	2174	"smooth"
		2174	2175	"smooth"
		2175	2176	"smooth"
		2176	2177	"smooth"
		2177	2178	"smooth"
		2178	2179	"smooth"
		2179	2180	"smooth"
		2180	2181	"smooth"
		2181	2182	"smooth"
		2182	2183	"smooth"
		2183	2184	"smooth"
		2184	2185	"smooth"
		2185	2186	"smooth"
		2186	2187	"smooth"
		2187	2188	"smooth"
		2188	2189	"smooth"
		2189	2190	"smooth"
		2190	2191	"smooth"
		2191	2192	"smooth"
		2192	2142	"smooth"
		2193	2194	"smooth"
		2194	2195	"smooth"
		2195	2196	"smooth"
		2196	2197	"smooth"
		2197	2198	"smooth"
		2198	2199	"smooth"
		2199	2200	"smooth"
		2200	2201	"smooth"
		2201	2202	"smooth"
		2202	2203	"smooth"
		2203	2204	"smooth"
		2204	2205	"smooth"
		2205	2206	"smooth"
		2206	2207	"smooth"
		2207	2208	"smooth"
		2208	2209	"smooth"
		2209	2210	"smooth"
		2210	2211	"smooth"
		2211	2212	"smooth"
		2212	2213	"smooth"
		2213	2214	"smooth"
		2214	2215	"smooth"
		2215	2216	"smooth"
		2216	2217	"smooth"
		2217	2218	"smooth"
		2218	2219	"smooth"
		2219	2220	"smooth"
		2220	2221	"smooth"
		2221	2222	"smooth"
		2222	2223	"smooth"
		2223	2224	"smooth"
		2224	2225	"smooth"
		2225	2226	"smooth"
		2226	2227	"smooth"
		2227	2228	"smooth"
		2228	2229	"smooth"
		2229	2230	"smooth"
		2230	2231	"smooth"
		2231	2232	"smooth"
		2232	2233	"smooth"
		2233	2234	"smooth"
		2234	2235	"smooth"
		2235	2236	"smooth"
		2236	2237	"smooth"
		2237	2238	"smooth"
		2238	2239	"smooth"
		2239	2240	"smooth"
		2240	2241	"smooth"
		2241	2242	"smooth"
		2242	2243	"smooth"
		2243	2193	"smooth"
		2244	2245	"smooth"
		2245	2246	"smooth"
		2246	2247	"smooth"
		2247	2248	"smooth"
		2248	2249	"smooth"
		2249	2250	"smooth"
		2250	2251	"smooth"
		2251	2252	"smooth"
		2252	2253	"smooth"
		2253	2254	"smooth"
		2254	2255	"smooth"
		2255	2256	"smooth"
		2256	2257	"smooth"
		2257	2258	"smooth"
		2258	2259	"smooth"
		2259	2260	"smooth"
		2260	2261	"smooth"
		2261	2262	"smooth"
		2262	2263	"smooth"
		2263	2264	"smooth"
		2264	2265	"smooth"
		2265	2266	"smooth"
		2266	2267	"smooth"
		2267	2268	"smooth"
		2268	2269	"smooth"
		2269	2270	"smooth"
		2270	2271	"smooth"
		2271	2272	"smooth"
		2272	2273	"smooth"
		2273	2274	"smooth"
		2274	2275	"smooth"
		2275	2276	"smooth"
		2276	2277	"smooth"
		2277	2278	"smooth"
		2278	2279	"smooth"
		2279	2280	"smooth"
		2280	2281	"smooth"
		2281	2282	"smooth"
		2282	2283	"smooth"
		2283	2284	"smooth"
		2284	2285	"smooth"
		2285	2286	"smooth"
		2286	2287	"smooth"
		2287	2288	"smooth"
		2288	2289	"smooth"
		2289	2290	"smooth"
		2290	2291	"smooth"
		2291	2292	"smooth"
		2292	2293	"smooth"
		2293	2294	"smooth"
		2294	2244	"smooth"
		2295	2296	"smooth"
		2296	2297	"smooth"
		2297	2298	"smooth"
		2298	2299	"smooth"
		2299	2300	"smooth"
		2300	2301	"smooth"
		2301	2302	"smooth"
		2302	2303	"smooth"
		2303	2304	"smooth"
		2304	2305	"smooth"
		2305	2306	"smooth"
		2306	2307	"smooth"
		2307	2308	"smooth"
		2308	2309	"smooth"
		2309	2310	"smooth"
		2310	2311	"smooth"
		2311	2312	"smooth"
		2312	2313	"smooth"
		2313	2314	"smooth"
		2314	2315	"smooth"
		2315	2316	"smooth"
		2316	2317	"smooth"
		2317	2318	"smooth"
		2318	2319	"smooth"
		2319	2320	"smooth"
		2320	2321	"smooth"
		2321	2322	"smooth"
		2322	2323	"smooth"
		2323	2324	"smooth"
		2324	2325	"smooth"
		2325	2326	"smooth"
		2326	2327	"smooth"
		2327	2328	"smooth"
		2328	2329	"smooth"
		2329	2330	"smooth"
		2330	2331	"smooth"
		2331	2332	"smooth"
		2332	2333	"smooth"
		2333	2334	"smooth"
		2334	2335	"smooth"
		2335	2336	"smooth"
		2336	2337	"smooth"
		2337	2338	"smooth"
		2338	2339	"smooth"
		2339	2340	"smooth"
		2340	2341	"smooth"
		2341	2342	"smooth"
		2342	2343	"smooth"
		2343	2344	"smooth"
		2344	2345	"smooth"
		2345	2295	"smooth"
		2346	2347	"smooth"
		2347	2348	"smooth"
		2348	2349	"smooth"
		2349	2350	"smooth"
		2350	2351	"smooth"
		2351	2352	"smooth"
		2352	2353	"smooth"
		2353	2354	"smooth"
		2354	2355	"smooth"
		2355	2356	"smooth"
		2356	2357	"smooth"
		2357	2358	"smooth"
		2358	2359	"smooth"
		2359	2360	"smooth"
		2360	2361	"smooth"
		2361	2362	"smooth"
		2362	2363	"smooth"
		2363	2364	"smooth"
		2364	2365	"smooth"
		2365	2366	"smooth"
		2366	2367	"smooth"
		2367	2368	"smooth"
		2368	2369	"smooth"
		2369	2370	"smooth"
		2370	2371	"smooth"
		2371	2372	"smooth"
		2372	2373	"smooth"
		2373	2374	"smooth"
		2374	2375	"smooth"
		2375	2376	"smooth"
		2376	2377	"smooth"
		2377	2378	"smooth"
		2378	2379	"smooth"
		2379	2380	"smooth"
		2380	2381	"smooth"
		2381	2382	"smooth"
		2382	2383	"smooth"
		2383	2384	"smooth"
		2384	2385	"smooth"
		2385	2386	"smooth"
		2386	2387	"smooth"
		2387	2388	"smooth"
		2388	2389	"smooth"
		2389	2390	"smooth"
		2390	2391	"smooth"
		2391	2392	"smooth"
		2392	2393	"smooth"
		2393	2394	"smooth"
		2394	2395	"smooth"
		2395	2396	"smooth"
		2396	2346	"smooth"
		2397	2398	"smooth"
		2398	2399	"smooth"
		2399	2400	"smooth"
		2400	2401	"smooth"
		2401	2402	"smooth"
		2402	2403	"smooth"
		2403	2404	"smooth"
		2404	2405	"smooth"
		2405	2406	"smooth"
		2406	2407	"smooth"
		2407	2408	"smooth"
		2408	2409	"smooth"
		2409	2410	"smooth"
		2410	2411	"smooth"
		2411	2412	"smooth"
		2412	2413	"smooth"
		2413	2414	"smooth"
		2414	2415	"smooth"
		2415	2416	"smooth"
		2416	2417	"smooth"
		2417	2418	"smooth"
		2418	2419	"smooth"
		2419	2420	"smooth"
		2420	2421	"smooth"
		2421	2422	"smooth"
		2422	2423	"smooth"
		2423	2424	"smooth"
		2424	2425	"smooth"
		2425	2426	"smooth"
		2426	2427	"smooth"
		2427	2428	"smooth"
		2428	2429	"smooth"
		2429	2430	"smooth"
		2430	2431	"smooth"
		2431	2432	"smooth"
		2432	2433	"smooth"
		2433	2434	"smooth"
		2434	2435	"smooth"
		2435	2436	"smooth"
		2436	2437	"smooth"
		2437	2438	"smooth"
		2438	2439	"smooth"
		2439	2440	"smooth"
		2440	2441	"smooth"
		2441	2442	"smooth"
		2442	2443	"smooth"
		2443	2444	"smooth"
		2444	2445	"smooth"
		2445	2446	"smooth"
		2446	2447	"smooth"
		2447	2397	"smooth"
		2448	2449	"smooth"
		2449	2450	"smooth"
		2450	2451	"smooth"
		2451	2452	"smooth"
		2452	2453	"smooth"
		2453	2454	"smooth"
		2454	2455	"smooth"
		2455	2456	"smooth"
		2456	2457	"smooth"
		2457	2458	"smooth"
		2458	2459	"smooth"
		2459	2460	"smooth"
		2460	2461	"smooth"
		2461	2462	"smooth"
		2462	2463	"smooth"
		2463	2464	"smooth"
		2464	2465	"smooth"
		2465	2466	"smooth"
		2466	2467	"smooth"
		2467	2468	"smooth"
		2468	2469	"smooth"
		2469	2470	"smooth"
		2470	2471	"smooth"
		2471	2472	"smooth"
		2472	2473	"smooth"
		2473	2474	"smooth"
		2474	2475	"smooth"
		2475	2476	"smooth"
		2476	2477	"smooth"
		2477	2478	"smooth"
		2478	2479	"smooth"
		2479	2480	"smooth"
		2480	2481	"smooth"
		2481	2482	"smooth"
		2482	2483	"smooth"
		2483	2484	"smooth"
		2484	2485	"smooth"
		2485	2486	"smooth"
		2486	2487	"smooth"
		2487	2488	"smooth"
		2488	2489	"smooth"
		2489	2490	"smooth"
		2490	2491	"smooth"
		2491	2492	"smooth"
		2492	2493	"smooth"
		2493	2494	"smooth"
		2494	2495	"smooth"
		2495	2496	"smooth"
		2496	2497	"smooth"
		2497	2498	"smooth"
		2498	2448	"smooth"
		2499	2500	"smooth"
		2500	2501	"smooth"
		2501	2502	"smooth"
		2502	2503	"smooth"
		2503	2504	"smooth"
		2504	2505	"smooth"
		2505	2506	"smooth"
		2506	2507	"smooth"
		2507	2508	"smooth"
		2508	2509	"smooth"
		2509	2510	"smooth"
		2510	2511	"smooth"
		2511	2512	"smooth"
		2512	2513	"smooth"
		2513	2514	"smooth"
		2514	2515	"smooth"
		2515	2516	"smooth"
		2516	2517	"smooth"
		2517	2518	"smooth"
		2518	2519	"smooth"
		2519	2520	"smooth"
		2520	2521	"smooth"
		2521	2522	"smooth"
		2522	2523	"smooth"
		2523	2524	"smooth"
		2524	2525	"smooth"
		2525	2526	"smooth"
		2526	2527	"smooth"
		2527	2528	"smooth"
		2528	2529	"smooth"
		2529	2530	"smooth"
		2530	2531	"smooth"
		2531	2532	"smooth"
		2532	2533	"smooth"
		2533	2534	"smooth"
		2534	2535	"smooth"
		2535	2536	"smooth"
		2536	2537	"smooth"
		2537	2538	"smooth"
		2538	2539	"smooth"
		2539	2540	"smooth"
		2540	2541	"smooth"
		2541	2542	"smooth"
		2542	2543	"smooth"
		2543	2544	"smooth"
		2544	2545	"smooth"
		2545	2546	"smooth"
		2546	2547	"smooth"
		2547	2548	"smooth"
		2548	2549	"smooth"
		2549	2499	"smooth"
		0	51	"smooth"
		1	52	"smooth"
		2	53	"smooth"
		3	54	"smooth"
		4	55	"smooth"
		5	56	"smooth"
		6	57	"smooth"
		7	58	"smooth"
		8	59	"smooth"
		9	60	"smooth"
		10	61	"smooth"
		11	62	"smooth"
		12	63	"smooth"
		13	64	"smooth"
		14	65	"smooth"
		15	66	"smooth"
		16	67	"smooth"
		17	68	"smooth"
		18	69	"smooth"
		19	70	"smooth"
		20	71	"smooth"
		21	72	"smooth"
		22	73	"smooth"
		23	74	"smooth"
		24	75	"smooth"
		25	76	"smooth"
		26	77	"smooth"
		27	78	"smooth"
		28	79	"smooth"
		29	80	"smooth"
		30	81	"smooth"
		31	82	"smooth"
		32	83	"smooth"
		33	84	"smooth"
		34	85	"smooth"
		35	86	"smooth"
		36	87	"smooth"
		37	88	"smooth"
		38	89	"smooth"
		39	90	"smooth"
		40	91	"smooth"
		41	92	"smooth"
		42	93	"smooth"
		43	94	"smooth"
		44	95	"smooth"
		45	96	"smooth"
		46	97	"smooth"
		47	98	"smooth"
		48	99	"smooth"
		49	100	"smooth"
		50	101	"smooth"
		51	102	"smooth"
		52	103	"smooth"
		53	104	"smooth"
		54	105	"smooth"
		55	106	"smooth"
		56	107	"smooth"
		57	108	"smooth"
		58	109	"smooth"
		59	110	"smooth"
		60	111	"smooth"
		61	112	"smooth"
		62	113	"smooth"
		63	114	"smooth"
		64	115	"smooth"
		65	116	"smooth"
		66	117	"smooth"
		67	118	"smooth"
		68	119	"smooth"
		69	120	"smooth"
		70	121	"smooth"
		71	122	"smooth"
		72	123	"smooth"
		73	124	"smooth"
		74	125	"smooth"
		75	126	"smooth"
		76	127	"smooth"
		77	128	"smooth"
		78	129	"smooth"
		79	130	"smooth"
		80	131	"smooth"
		81	132	"smooth"
		82	133	"smooth"
		83	134	"smooth"
		84	135	"smooth"
		85	136	"smooth"
		86	137	"smooth"
		87	138	"smooth"
		88	139	"smooth"
		89	140	"smooth"
		90	141	"smooth"
		91	142	"smooth"
		92	143	"smooth"
		93	144	"smooth"
		94	145	"smooth"
		95	146	"smooth"
		96	147	"smooth"
		97	148	"smooth"
		98	149	"smooth"
		99	150	"smooth"
		100	151	"smooth"
		101	152	"smooth"
		102	153	"smooth"
		103	154	"smooth"
		104	155	"smooth"
		105	156	"smooth"
		106	157	"smooth"
		107	158	"smooth"
		108	159	"smooth"
		109	160	"smooth"
		110	161	"smooth"
		111	162	"smooth"
		112	163	"smooth"
		113	164	"smooth"
		114	165	"smooth"
		115	166	"smooth"
		116	167	"smooth"
		117	168	"smooth"
		118	169	"smooth"
		119	170	"smooth"
		120	171	"smooth"
		121	172	"smooth"
		122	173	"smooth"
		123	174	"smooth"
		124	175	"smooth"
		125	176	"smooth"
		126	177	"smooth"
		127	178	"smooth"
		128	179	"smooth"
		129	180	"smooth"
		130	181	"smooth"
		131	182	"smooth"
		132	183	"smooth"
		133	184	"smooth"
		134	185	"smooth"
		135	186	"smooth"
		136	187	"smooth"
		137	188	"smooth"
		138	189	"smooth"
		139	190	"smooth"
		140	191	"smooth"
		141	192	"smooth"
		142	193	"smooth"
		143	194	"smooth"
		144	195	"smooth"
		145	196	"smooth"
		146	197	"smooth"
		147	198	"smooth"
		148	199	"smooth"
		149	200	"smooth"
		150	201	"smooth"
		151	202	"smooth"
		152	203	"smooth"
		153	204	"smooth"
		154	205	"smooth"
		155	206	"smooth"
		156	207	"smooth"
		157	208	"smooth"
		158	209	"smooth"
		159	210	"smooth"
		160	211	"smooth"
		161	212	"smooth"
		162	213	"smooth"
		163	214	"smooth"
		164	215	"smooth"
		165	216	"smooth"
		166	217	"smooth"
		167	218	"smooth"
		168	219	"smooth"
		169	220	"smooth"
		170	221	"smooth"
		171	222	"smooth"
		172	223	"smooth"
		173	224	"smooth"
		174	225	"smooth"
		175	226	"smooth"
		176	227	"smooth"
		177	228	"smooth"
		178	229	"smooth"
		179	230	"smooth"
		180	231	"smooth"
		181	232	"smooth"
		182	233	"smooth"
		183	234	"smooth"
		184	235	"smooth"
		185	236	"smooth"
		186	237	"smooth"
		187	238	"smooth"
		188	239	"smooth"
		189	240	"smooth"
		190	241	"smooth"
		191	242	"smooth"
		192	243	"smooth"
		193	244	"smooth"
		194	245	"smooth"
		195	246	"smooth"
		196	247	"smooth"
		197	248	"smooth"
		198	249	"smooth"
		199	250	"smooth"
		200	251	"smooth"
		201	252	"smooth"
		202	253	"smooth"
		203	254	"smooth"
		204	255	"smooth"
		205	256	"smooth"
		206	257	"smooth"
		207	258	"smooth"
		208	259	"smooth"
		209	260	"smooth"
		210	261	"smooth"
		211	262	"smooth"
		212	263	"smooth"
		213	264	"smooth"
		214	265	"smooth"
		215	266	"smooth"
		216	267	"smooth"
		217	268	"smooth"
		218	269	"smooth"
		219	270	"smooth"
		220	271	"smooth"
		221	272	"smooth"
		222	273	"smooth"
		223	274	"smooth"
		224	275	"smooth"
		225	276	"smooth"
		226	277	"smooth"
		227	278	"smooth"
		228	279	"smooth"
		229	280	"smooth"
		230	281	"smooth"
		231	282	"smooth"
		232	283	"smooth"
		233	284	"smooth"
		234	285	"smooth"
		235	286	"smooth"
		236	287	"smooth"
		237	288	"smooth"
		238	289	"smooth"
		239	290	"smooth"
		240	291	"smooth"
		241	292	"smooth"
		242	293	"smooth"
		243	294	"smooth"
		244	295	"smooth"
		245	296	"smooth"
		246	297	"smooth"
		247	298	"smooth"
		248	299	"smooth"
		249	300	"smooth"
		250	301	"smooth"
		251	302	"smooth"
		252	303	"smooth"
		253	304	"smooth"
		254	305	"smooth"
		255	306	"smooth"
		256	307	"smooth"
		257	308	"smooth"
		258	309	"smooth"
		259	310	"smooth"
		260	311	"smooth"
		261	312	"smooth"
		262	313	"smooth"
		263	314	"smooth"
		264	315	"smooth"
		265	316	"smooth"
		266	317	"smooth"
		267	318	"smooth"
		268	319	"smooth"
		269	320	"smooth"
		270	321	"smooth"
		271	322	"smooth"
		272	323	"smooth"
		273	324	"smooth"
		274	325	"smooth"
		275	326	"smooth"
		276	327	"smooth"
		277	328	"smooth"
		278	329	"smooth"
		279	330	"smooth"
		280	331	"smooth"
		281	332	"smooth"
		282	333	"smooth"
		283	334	"smooth"
		284	335	"smooth"
		285	336	"smooth"
		286	337	"smooth"
		287	338	"smooth"
		288	339	"smooth"
		289	340	"smooth"
		290	341	"smooth"
		291	342	"smooth"
		292	343	"smooth"
		293	344	"smooth"
		294	345	"smooth"
		295	346	"smooth"
		296	347	"smooth"
		297	348	"smooth"
		298	349	"smooth"
		299	350	"smooth"
		300	351	"smooth"
		301	352	"smooth"
		302	353	"smooth"
		303	354	"smooth"
		304	355	"smooth"
		305	356	"smooth"
		306	357	"smooth"
		307	358	"smooth"
		308	359	"smooth"
		309	360	"smooth"
		310	361	"smooth"
		311	362	"smooth"
		312	363	"smooth"
		313	364	"smooth"
		314	365	"smooth"
		315	366	"smooth"
		316	367	"smooth"
		317	368	"smooth"
		318	369	"smooth"
		319	370	"smooth"
		320	371	"smooth"
		321	372	"smooth"
		322	373	"smooth"
		323	374	"smooth"
		324	375	"smooth"
		325	376	"smooth"
		326	377	"smooth"
		327	378	"smooth"
		328	379	"smooth"
		329	380	"smooth"
		330	381	"smooth"
		331	382	"smooth"
		332	383	"smooth"
		333	384	"smooth"
		334	385	"smooth"
		335	386	"smooth"
		336	387	"smooth"
		337	388	"smooth"
		338	389	"smooth"
		339	390	"smooth"
		340	391	"smooth"
		341	392	"smooth"
		342	393	"smooth"
		343	394	"smooth"
		344	395	"smooth"
		345	396	"smooth"
		346	397	"smooth"
		347	398	"smooth"
		348	399	"smooth"
		349	400	"smooth"
		350	401	"smooth"
		351	402	"smooth"
		352	403	"smooth"
		353	404	"smooth"
		354	405	"smooth"
		355	406	"smooth"
		356	407	"smooth"
		357	408	"smooth"
		358	409	"smooth"
		359	410	"smooth"
		360	411	"smooth"
		361	412	"smooth"
		362	413	"smooth"
		363	414	"smooth"
		364	415	"smooth"
		365	416	"smooth"
		366	417	"smooth"
		367	418	"smooth"
		368	419	"smooth"
		369	420	"smooth"
		370	421	"smooth"
		371	422	"smooth"
		372	423	"smooth"
		373	424	"smooth"
		374	425	"smooth"
		375	426	"smooth"
		376	427	"smooth"
		377	428	"smooth"
		378	429	"smooth"
		379	430	"smooth"
		380	431	"smooth"
		381	432	"smooth"
		382	433	"smooth"
		383	434	"smooth"
		384	435	"smooth"
		385	436	"smooth"
		386	437	"smooth"
		387	438	"smooth"
		388	439	"smooth"
		389	440	"smooth"
		390	441	"smooth"
		391	442	"smooth"
		392	443	"smooth"
		393	444	"smooth"
		394	445	"smooth"
		395	446	"smooth"
		396	447	"smooth"
		397	448	"smooth"
		398	449	"smooth"
		399	450	"smooth"
		400	451	"smooth"
		401	452	"smooth"
		402	453	"smooth"
		403	454	"smooth"
		404	455	"smooth"
		405	456	"smooth"
		406	457	"smooth"
		407	458	"smooth"
		408	459	"smooth"
		409	460	"smooth"
		410	461	"smooth"
		411	462	"smooth"
		412	463	"smooth"
		413	464	"smooth"
		414	465	"smooth"
		415	466	"smooth"
		416	467	"smooth"
		417	468	"smooth"
		418	469	"smooth"
		419	470	"smooth"
		420	471	"smooth"
		421	472	"smooth"
		422	473	"smooth"
		423	474	"smooth"
		424	475	"smooth"
		425	476	"smooth"
		426	477	"smooth"
		427	478	"smooth"
		428	479	"smooth"
		429	480	"smooth"
		430	481	"smooth"
		431	482	"smooth"
		432	483	"smooth"
		433	484	"smooth"
		434	485	"smooth"
		435	486	"smooth"
		436	487	"smooth"
		437	488	"smooth"
		438	489	"smooth"
		439	490	"smooth"
		440	491	"smooth"
		441	492	"smooth"
		442	493	"smooth"
		443	494	"smooth"
		444	495	"smooth"
		445	496	"smooth"
		446	497	"smooth"
		447	498	"smooth"
		448	499	"smooth"
		449	500	"smooth"
		450	501	"smooth"
		451	502	"smooth"
		452	503	"smooth"
		453	504	"smooth"
		454	505	"smooth"
		455	506	"smooth"
		456	507	"smooth"
		457	508	"smooth"
		458	509	"smooth"
		459	510	"smooth"
		460	511	"smooth"
		461	512	"smooth"
		462	513	"smooth"
		463	514	"smooth"
		464	515	"smooth"
		465	516	"smooth"
		466	517	"smooth"
		467	518	"smooth"
		468	519	"smooth"
		469	520	"smooth"
		470	521	"smooth"
		471	522	"smooth"
		472	523	"smooth"
		473	524	"smooth"
		474	525	"smooth"
		475	526	"smooth"
		476	527	"smooth"
		477	528	"smooth"
		478	529	"smooth"
		479	530	"smooth"
		480	531	"smooth"
		481	532	"smooth"
		482	533	"smooth"
		483	534	"smooth"
		484	535	"smooth"
		485	536	"smooth"
		486	537	"smooth"
		487	538	"smooth"
		488	539	"smooth"
		489	540	"smooth"
		490	541	"smooth"
		491	542	"smooth"
		492	543	"smooth"
		493	544	"smooth"
		494	545	"smooth"
		495	546	"smooth"
		496	547	"smooth"
		497	548	"smooth"
		498	549	"smooth"
		499	550	"smooth"
		500	551	"smooth"
		501	552	"smooth"
		502	553	"smooth"
		503	554	"smooth"
		504	555	"smooth"
		505	556	"smooth"
		506	557	"smooth"
		507	558	"smooth"
		508	559	"smooth"
		509	560	"smooth"
		510	561	"smooth"
		511	562	"smooth"
		512	563	"smooth"
		513	564	"smooth"
		514	565	"smooth"
		515	566	"smooth"
		516	567	"smooth"
		517	568	"smooth"
		518	569	"smooth"
		519	570	"smooth"
		520	571	"smooth"
		521	572	"smooth"
		522	573	"smooth"
		523	574	"smooth"
		524	575	"smooth"
		525	576	"smooth"
		526	577	"smooth"
		527	578	"smooth"
		528	579	"smooth"
		529	580	"smooth"
		530	581	"smooth"
		531	582	"smooth"
		532	583	"smooth"
		533	584	"smooth"
		534	585	"smooth"
		535	586	"smooth"
		536	587	"smooth"
		537	588	"smooth"
		538	589	"smooth"
		539	590	"smooth"
		540	591	"smooth"
		541	592	"smooth"
		542	593	"smooth"
		543	594	"smooth"
		544	595	"smooth"
		545	596	"smooth"
		546	597	"smooth"
		547	598	"smooth"
		548	599	"smooth"
		549	600	"smooth"
		550	601	"smooth"
		551	602	"smooth"
		552	603	"smooth"
		553	604	"smooth"
		554	605	"smooth"
		555	606	"smooth"
		556	607	"smooth"
		557	608	"smooth"
		558	609	"smooth"
		559	610	"smooth"
		560	611	"smooth"
		561	612	"smooth"
		562	613	"smooth"
		563	614	"smooth"
		564	615	"smooth"
		565	616	"smooth"
		566	617	"smooth"
		567	618	"smooth"
		568	619	"smooth"
		569	620	"smooth"
		570	621	"smooth"
		571	622	"smooth"
		572	623	"smooth"
		573	624	"smooth"
		574	625	"smooth"
		575	626	"smooth"
		576	627	"smooth"
		577	628	"smooth"
		578	629	"smooth"
		579	630	"smooth"
		580	631	"smooth"
		581	632	"smooth"
		582	633	"smooth"
		583	634	"smooth"
		584	635	"smooth"
		585	636	"smooth"
		586	637	"smooth"
		587	638	"smooth"
		588	639	"smooth"
		589	640	"smooth"
		590	641	"smooth"
		591	642	"smooth"
		592	643	"smooth"
		593	644	"smooth"
		594	645	"smooth"
		595	646	"smooth"
		596	647	"smooth"
		597	648	"smooth"
		598	649	"smooth"
		599	650	"smooth"
		600	651	"smooth"
		601	652	"smooth"
		602	653	"smooth"
		603	654	"smooth"
		604	655	"smooth"
		605	656	"smooth"
		606	657	"smooth"
		607	658	"smooth"
		608	659	"smooth"
		609	660	"smooth"
		610	661	"smooth"
		611	662	"smooth"
		612	663	"smooth"
		613	664	"smooth"
		614	665	"smooth"
		615	666	"smooth"
		616	667	"smooth"
		617	668	"smooth"
		618	669	"smooth"
		619	670	"smooth"
		620	671	"smooth"
		621	672	"smooth"
		622	673	"smooth"
		623	674	"smooth"
		624	675	"smooth"
		625	676	"smooth"
		626	677	"smooth"
		627	678	"smooth"
		628	679	"smooth"
		629	680	"smooth"
		630	681	"smooth"
		631	682	"smooth"
		632	683	"smooth"
		633	684	"smooth"
		634	685	"smooth"
		635	686	"smooth"
		636	687	"smooth"
		637	688	"smooth"
		638	689	"smooth"
		639	690	"smooth"
		640	691	"smooth"
		641	692	"smooth"
		642	693	"smooth"
		643	694	"smooth"
		644	695	"smooth"
		645	696	"smooth"
		646	697	"smooth"
		647	698	"smooth"
		648	699	"smooth"
		649	700	"smooth"
		650	701	"smooth"
		651	702	"smooth"
		652	703	"smooth"
		653	704	"smooth"
		654	705	"smooth"
		655	706	"smooth"
		656	707	"smooth"
		657	708	"smooth"
		658	709	"smooth"
		659	710	"smooth"
		660	711	"smooth"
		661	712	"smooth"
		662	713	"smooth"
		663	714	"smooth"
		664	715	"smooth"
		665	716	"smooth"
		666	717	"smooth"
		667	718	"smooth"
		668	719	"smooth"
		669	720	"smooth"
		670	721	"smooth"
		671	722	"smooth"
		672	723	"smooth"
		673	724	"smooth"
		674	725	"smooth"
		675	726	"smooth"
		676	727	"smooth"
		677	728	"smooth"
		678	729	"smooth"
		679	730	"smooth"
		680	731	"smooth"
		681	732	"smooth"
		682	733	"smooth"
		683	734	"smooth"
		684	735	"smooth"
		685	736	"smooth"
		686	737	"smooth"
		687	738	"smooth"
		688	739	"smooth"
		689	740	"smooth"
		690	741	"smooth"
		691	742	"smooth"
		692	743	"smooth"
		693	744	"smooth"
		694	745	"smooth"
		695	746	"smooth"
		696	747	"smooth"
		697	748	"smooth"
		698	749	"smooth"
		699	750	"smooth"
		700	751	"smooth"
		701	752	"smooth"
		702	753	"smooth"
		703	754	"smooth"
		704	755	"smooth"
		705	756	"smooth"
		706	757	"smooth"
		707	758	"smooth"
		708	759	"smooth"
		709	760	"smooth"
		710	761	"smooth"
		711	762	"smooth"
		712	763	"smooth"
		713	764	"smooth"
		714	765	"smooth"
		715	766	"smooth"
		716	767	"smooth"
		717	768	"smooth"
		718	769	"smooth"
		719	770	"smooth"
		720	771	"smooth"
		721	772	"smooth"
		722	773	"smooth"
		723	774	"smooth"
		724	775	"smooth"
		725	776	"smooth"
		726	777	"smooth"
		727	778	"smooth"
		728	779	"smooth"
		729	780	"smooth"
		730	781	"smooth"
		731	782	"smooth"
		732	783	"smooth"
		733	784	"smooth"
		734	785	"smooth"
		735	786	"smooth"
		736	787	"smooth"
		737	788	"smooth"
		738	789	"smooth"
		739	790	"smooth"
		740	791	"smooth"
		741	792	"smooth"
		742	793	"smooth"
		743	794	"smooth"
		744	795	"smooth"
		745	796	"smooth"
		746	797	"smooth"
		747	798	"smooth"
		748	799	"smooth"
		749	800	"smooth"
		750	801	"smooth"
		751	802	"smooth"
		752	803	"smooth"
		753	804	"smooth"
		754	805	"smooth"
		755	806	"smooth"
		756	807	"smooth"
		757	808	"smooth"
		758	809	"smooth"
		759	810	"smooth"
		760	811	"smooth"
		761	812	"smooth"
		762	813	"smooth"
		763	814	"smooth"
		764	815	"smooth"
		765	816	"smooth"
		766	817	"smooth"
		767	818	"smooth"
		768	819	"smooth"
		769	820	"smooth"
		770	821	"smooth"
		771	822	"smooth"
		772	823	"smooth"
		773	824	"smooth"
		774	825	"smooth"
		775	826	"smooth"
		776	827	"smooth"
		777	828	"smooth"
		778	829	"smooth"
		779	830	"smooth"
		780	831	"smooth"
		781	832	"smooth"
		782	833	"smooth"
		783	834	"smooth"
		784	835	"smooth"
		785	836	"smooth"
		786	837	"smooth"
		787	838	"smooth"
		788	839	"smooth"
		789	840	"smooth"
		790	841	"smooth"
		791	842	"smooth"
		792	843	"smooth"
		793	844	"smooth"
		794	845	"smooth"
		795	846	"smooth"
		796	847	"smooth"
		797	848	"smooth"
		798	849	"smooth"
		799	850	"smooth"
		800	851	"smooth"
		801	852	"smooth"
		802	853	"smooth"
		803	854	"smooth"
		804	855	"smooth"
		805	856	"smooth"
		806	857	"smooth"
		807	858	"smooth"
		808	859	"smooth"
		809	860	"smooth"
		810	861	"smooth"
		811	862	"smooth"
		812	863	"smooth"
		813	864	"smooth"
		814	865	"smooth"
		815	866	"smooth"
		816	867	"smooth"
		817	868	"smooth"
		818	869	"smooth"
		819	870	"smooth"
		820	871	"smooth"
		821	872	"smooth"
		822	873	"smooth"
		823	874	"smooth"
		824	875	"smooth"
		825	876	"smooth"
		826	877	"smooth"
		827	878	"smooth"
		828	879	"smooth"
		829	880	"smooth"
		830	881	"smooth"
		831	882	"smooth"
		832	883	"smooth"
		833	884	"smooth"
		834	885	"smooth"
		835	886	"smooth"
		836	887	"smooth"
		837	888	"smooth"
		838	889	"smooth"
		839	890	"smooth"
		840	891	"smooth"
		841	892	"smooth"
		842	893	"smooth"
		843	894	"smooth"
		844	895	"smooth"
		845	896	"smooth"
		846	897	"smooth"
		847	898	"smooth"
		848	899	"smooth"
		849	900	"smooth"
		850	901	"smooth"
		851	902	"smooth"
		852	903	"smooth"
		853	904	"smooth"
		854	905	"smooth"
		855	906	"smooth"
		856	907	"smooth"
		857	908	"smooth"
		858	909	"smooth"
		859	910	"smooth"
		860	911	"smooth"
		861	912	"smooth"
		862	913	"smooth"
		863	914	"smooth"
		864	915	"smooth"
		865	916	"smooth"
		866	917	"smooth"
		867	918	"smooth"
		868	919	"smooth"
		869	920	"smooth"
		870	921	"smooth"
		871	922	"smooth"
		872	923	"smooth"
		873	924	"smooth"
		874	925	"smooth"
		875	926	"smooth"
		876	927	"smooth"
		877	928	"smooth"
		878	929	"smooth"
		879	930	"smooth"
		880	931	"smooth"
		881	932	"smooth"
		882	933	"smooth"
		883	934	"smooth"
		884	935	"smooth"
		885	936	"smooth"
		886	937	"smooth"
		887	938	"smooth"
		888	939	"smooth"
		889	940	"smooth"
		890	941	"smooth"
		891	942	"smooth"
		892	943	"smooth"
		893	944	"smooth"
		894	945	"smooth"
		895	946	"smooth"
		896	947	"smooth"
		897	948	"smooth"
		898	949	"smooth"
		899	950	"smooth"
		900	951	"smooth"
		901	952	"smooth"
		902	953	"smooth"
		903	954	"smooth"
		904	955	"smooth"
		905	956	"smooth"
		906	957	"smooth"
		907	958	"smooth"
		908	959	"smooth"
		909	960	"smooth"
		910	961	"smooth"
		911	962	"smooth"
		912	963	"smooth"
		913	964	"smooth"
		914	965	"smooth"
		915	966	"smooth"
		916	967	"smooth"
		917	968	"smooth"
		918	969	"smooth"
		919	970	"smooth"
		920	971	"smooth"
		921	972	"smooth"
		922	973	"smooth"
		923	974	"smooth"
		924	975	"smooth"
		925	976	"smooth"
		926	977	"smooth"
		927	978	"smooth"
		928	979	"smooth"
		929	980	"smooth"
		930	981	"smooth"
		931	982	"smooth"
		932	983	"smooth"
		933	984	"smooth"
		934	985	"smooth"
		935	986	"smooth"
		936	987	"smooth"
		937	988	"smooth"
		938	989	"smooth"
		939	990	"smooth"
		940	991	"smooth"
		941	992	"smooth"
		942	993	"smooth"
		943	994	"smooth"
		944	995	"smooth"
		945	996	"smooth"
		946	997	"smooth"
		947	998	"smooth"
		948	999	"smooth"
		949	1000	"smooth"
		950	1001	"smooth"
		951	1002	"smooth"
		952	1003	"smooth"
		953	1004	"smooth"
		954	1005	"smooth"
		955	1006	"smooth"
		956	1007	"smooth"
		957	1008	"smooth"
		958	1009	"smooth"
		959	1010	"smooth"
		960	1011	"smooth"
		961	1012	"smooth"
		962	1013	"smooth"
		963	1014	"smooth"
		964	1015	"smooth"
		965	1016	"smooth"
		966	1017	"smooth"
		967	1018	"smooth"
		968	1019	"smooth"
		969	1020	"smooth"
		970	1021	"smooth"
		971	1022	"smooth"
		972	1023	"smooth"
		973	1024	"smooth"
		974	1025	"smooth"
		975	1026	"smooth"
		976	1027	"smooth"
		977	1028	"smooth"
		978	1029	"smooth"
		979	1030	"smooth"
		980	1031	"smooth"
		981	1032	"smooth"
		982	1033	"smooth"
		983	1034	"smooth"
		984	1035	"smooth"
		985	1036	"smooth"
		986	1037	"smooth"
		987	1038	"smooth"
		988	1039	"smooth"
		989	1040	"smooth"
		990	1041	"smooth"
		991	1042	"smooth"
		992	1043	"smooth"
		993	1044	"smooth"
		994	1045	"smooth"
		995	1046	"smooth"
		996	1047	"smooth"
		997	1048	"smooth"
		998	1049	"smooth"
		999	1050	"smooth"
		1000	1051	"smooth"
		1001	1052	"smooth"
		1002	1053	"smooth"
		1003	1054	"smooth"
		1004	1055	"smooth"
		1005	1056	"smooth"
		1006	1057	"smooth"
		1007	1058	"smooth"
		1008	1059	"smooth"
		1009	1060	"smooth"
		1010	1061	"smooth"
		1011	1062	"smooth"
		1012	1063	"smooth"
		1013	1064	"smooth"
		1014	1065	"smooth"
		1015	1066	"smooth"
		1016	1067	"smooth"
		1017	1068	"smooth"
		1018	1069	"smooth"
		1019	1070	"smooth"
		1020	1071	"smooth"
		1021	1072	"smooth"
		1022	1073	"smooth"
		1023	1074	"smooth"
		1024	1075	"smooth"
		1025	1076	"smooth"
		1026	1077	"smooth"
		1027	1078	"smooth"
		1028	1079	"smooth"
		1029	1080	"smooth"
		1030	1081	"smooth"
		1031	1082	"smooth"
		1032	1083	"smooth"
		1033	1084	"smooth"
		1034	1085	"smooth"
		1035	1086	"smooth"
		1036	1087	"smooth"
		1037	1088	"smooth"
		1038	1089	"smooth"
		1039	1090	"smooth"
		1040	1091	"smooth"
		1041	1092	"smooth"
		1042	1093	"smooth"
		1043	1094	"smooth"
		1044	1095	"smooth"
		1045	1096	"smooth"
		1046	1097	"smooth"
		1047	1098	"smooth"
		1048	1099	"smooth"
		1049	1100	"smooth"
		1050	1101	"smooth"
		1051	1102	"smooth"
		1052	1103	"smooth"
		1053	1104	"smooth"
		1054	1105	"smooth"
		1055	1106	"smooth"
		1056	1107	"smooth"
		1057	1108	"smooth"
		1058	1109	"smooth"
		1059	1110	"smooth"
		1060	1111	"smooth"
		1061	1112	"smooth"
		1062	1113	"smooth"
		1063	1114	"smooth"
		1064	1115	"smooth"
		1065	1116	"smooth"
		1066	1117	"smooth"
		1067	1118	"smooth"
		1068	1119	"smooth"
		1069	1120	"smooth"
		1070	1121	"smooth"
		1071	1122	"smooth"
		1072	1123	"smooth"
		1073	1124	"smooth"
		1074	1125	"smooth"
		1075	1126	"smooth"
		1076	1127	"smooth"
		1077	1128	"smooth"
		1078	1129	"smooth"
		1079	1130	"smooth"
		1080	1131	"smooth"
		1081	1132	"smooth"
		1082	1133	"smooth"
		1083	1134	"smooth"
		1084	1135	"smooth"
		1085	1136	"smooth"
		1086	1137	"smooth"
		1087	1138	"smooth"
		1088	1139	"smooth"
		1089	1140	"smooth"
		1090	1141	"smooth"
		1091	1142	"smooth"
		1092	1143	"smooth"
		1093	1144	"smooth"
		1094	1145	"smooth"
		1095	1146	"smooth"
		1096	1147	"smooth"
		1097	1148	"smooth"
		1098	1149	"smooth"
		1099	1150	"smooth"
		1100	1151	"smooth"
		1101	1152	"smooth"
		1102	1153	"smooth"
		1103	1154	"smooth"
		1104	1155	"smooth"
		1105	1156	"smooth"
		1106	1157	"smooth"
		1107	1158	"smooth"
		1108	1159	"smooth"
		1109	1160	"smooth"
		1110	1161	"smooth"
		1111	1162	"smooth"
		1112	1163	"smooth"
		1113	1164	"smooth"
		1114	1165	"smooth"
		1115	1166	"smooth"
		1116	1167	"smooth"
		1117	1168	"smooth"
		1118	1169	"smooth"
		1119	1170	"smooth"
		1120	1171	"smooth"
		1121	1172	"smooth"
		1122	1173	"smooth"
		1123	1174	"smooth"
		1124	1175	"smooth"
		1125	1176	"smooth"
		1126	1177	"smooth"
		1127	1178	"smooth"
		1128	1179	"smooth"
		1129	1180	"smooth"
		1130	1181	"smooth"
		1131	1182	"smooth"
		1132	1183	"smooth"
		1133	1184	"smooth"
		1134	1185	"smooth"
		1135	1186	"smooth"
		1136	1187	"smooth"
		1137	1188	"smooth"
		1138	1189	"smooth"
		1139	1190	"smooth"
		1140	1191	"smooth"
		1141	1192	"smooth"
		1142	1193	"smooth"
		1143	1194	"smooth"
		1144	1195	"smooth"
		1145	1196	"smooth"
		1146	1197	"smooth"
		1147	1198	"smooth"
		1148	1199	"smooth"
		1149	1200	"smooth"
		1150	1201	"smooth"
		1151	1202	"smooth"
		1152	1203	"smooth"
		1153	1204	"smooth"
		1154	1205	"smooth"
		1155	1206	"smooth"
		1156	1207	"smooth"
		1157	1208	"smooth"
		1158	1209	"smooth"
		1159	1210	"smooth"
		1160	1211	"smooth"
		1161	1212	"smooth"
		1162	1213	"smooth"
		1163	1214	"smooth"
		1164	1215	"smooth"
		1165	1216	"smooth"
		1166	1217	"smooth"
		1167	1218	"smooth"
		1168	1219	"smooth"
		1169	1220	"smooth"
		1170	1221	"smooth"
		1171	1222	"smooth"
		1172	1223	"smooth"
		1173	1224	"smooth"
		1174	1225	"smooth"
		1175	1226	"smooth"
		1176	1227	"smooth"
		1177	1228	"smooth"
		1178	1229	"smooth"
		1179	1230	"smooth"
		1180	1231	"smooth"
		1181	1232	"smooth"
		1182	1233	"smooth"
		1183	1234	"smooth"
		1184	1235	"smooth"
		1185	1236	"smooth"
		1186	1237	"smooth"
		1187	1238	"smooth"
		1188	1239	"smooth"
		1189	1240	"smooth"
		1190	1241	"smooth"
		1191	1242	"smooth"
		1192	1243	"smooth"
		1193	1244	"smooth"
		1194	1245	"smooth"
		1195	1246	"smooth"
		1196	1247	"smooth"
		1197	1248	"smooth"
		1198	1249	"smooth"
		1199	1250	"smooth"
		1200	1251	"smooth"
		1201	1252	"smooth"
		1202	1253	"smooth"
		1203	1254	"smooth"
		1204	1255	"smooth"
		1205	1256	"smooth"
		1206	1257	"smooth"
		1207	1258	"smooth"
		1208	1259	"smooth"
		1209	1260	"smooth"
		1210	1261	"smooth"
		1211	1262	"smooth"
		1212	1263	"smooth"
		1213	1264	"smooth"
		1214	1265	"smooth"
		1215	1266	"smooth"
		1216	1267	"smooth"
		1217	1268	"smooth"
		1218	1269	"smooth"
		1219	1270	"smooth"
		1220	1271	"smooth"
		1221	1272	"smooth"
		1222	1273	"smooth"
		1223	1274	"smooth"
		1224	1275	"smooth"
		1225	1276	"smooth"
		1226	1277	"smooth"
		1227	1278	"smooth"
		1228	1279	"smooth"
		1229	1280	"smooth"
		1230	1281	"smooth"
		1231	1282	"smooth"
		1232	1283	"smooth"
		1233	1284	"smooth"
		1234	1285	"smooth"
		1235	1286	"smooth"
		1236	1287	"smooth"
		1237	1288	"smooth"
		1238	1289	"smooth"
		1239	1290	"smooth"
		1240	1291	"smooth"
		1241	1292	"smooth"
		1242	1293	"smooth"
		1243	1294	"smooth"
		1244	1295	"smooth"
		1245	1296	"smooth"
		1246	1297	"smooth"
		1247	1298	"smooth"
		1248	1299	"smooth"
		1249	1300	"smooth"
		1250	1301	"smooth"
		1251	1302	"smooth"
		1252	1303	"smooth"
		1253	1304	"smooth"
		1254	1305	"smooth"
		1255	1306	"smooth"
		1256	1307	"smooth"
		1257	1308	"smooth"
		1258	1309	"smooth"
		1259	1310	"smooth"
		1260	1311	"smooth"
		1261	1312	"smooth"
		1262	1313	"smooth"
		1263	1314	"smooth"
		1264	1315	"smooth"
		1265	1316	"smooth"
		1266	1317	"smooth"
		1267	1318	"smooth"
		1268	1319	"smooth"
		1269	1320	"smooth"
		1270	1321	"smooth"
		1271	1322	"smooth"
		1272	1323	"smooth"
		1273	1324	"smooth"
		1274	1325	"smooth"
		1275	1326	"smooth"
		1276	1327	"smooth"
		1277	1328	"smooth"
		1278	1329	"smooth"
		1279	1330	"smooth"
		1280	1331	"smooth"
		1281	1332	"smooth"
		1282	1333	"smooth"
		1283	1334	"smooth"
		1284	1335	"smooth"
		1285	1336	"smooth"
		1286	1337	"smooth"
		1287	1338	"smooth"
		1288	1339	"smooth"
		1289	1340	"smooth"
		1290	1341	"smooth"
		1291	1342	"smooth"
		1292	1343	"smooth"
		1293	1344	"smooth"
		1294	1345	"smooth"
		1295	1346	"smooth"
		1296	1347	"smooth"
		1297	1348	"smooth"
		1298	1349	"smooth"
		1299	1350	"smooth"
		1300	1351	"smooth"
		1301	1352	"smooth"
		1302	1353	"smooth"
		1303	1354	"smooth"
		1304	1355	"smooth"
		1305	1356	"smooth"
		1306	1357	"smooth"
		1307	1358	"smooth"
		1308	1359	"smooth"
		1309	1360	"smooth"
		1310	1361	"smooth"
		1311	1362	"smooth"
		1312	1363	"smooth"
		1313	1364	"smooth"
		1314	1365	"smooth"
		1315	1366	"smooth"
		1316	1367	"smooth"
		1317	1368	"smooth"
		1318	1369	"smooth"
		1319	1370	"smooth"
		1320	1371	"smooth"
		1321	1372	"smooth"
		1322	1373	"smooth"
		1323	1374	"smooth"
		1324	1375	"smooth"
		1325	1376	"smooth"
		1326	1377	"smooth"
		1327	1378	"smooth"
		1328	1379	"smooth"
		1329	1380	"smooth"
		1330	1381	"smooth"
		1331	1382	"smooth"
		1332	1383	"smooth"
		1333	1384	"smooth"
		1334	1385	"smooth"
		1335	1386	"smooth"
		1336	1387	"smooth"
		1337	1388	"smooth"
		1338	1389	"smooth"
		1339	1390	"smooth"
		1340	1391	"smooth"
		1341	1392	"smooth"
		1342	1393	"smooth"
		1343	1394	"smooth"
		1344	1395	"smooth"
		1345	1396	"smooth"
		1346	1397	"smooth"
		1347	1398	"smooth"
		1348	1399	"smooth"
		1349	1400	"smooth"
		1350	1401	"smooth"
		1351	1402	"smooth"
		1352	1403	"smooth"
		1353	1404	"smooth"
		1354	1405	"smooth"
		1355	1406	"smooth"
		1356	1407	"smooth"
		1357	1408	"smooth"
		1358	1409	"smooth"
		1359	1410	"smooth"
		1360	1411	"smooth"
		1361	1412	"smooth"
		1362	1413	"smooth"
		1363	1414	"smooth"
		1364	1415	"smooth"
		1365	1416	"smooth"
		1366	1417	"smooth"
		1367	1418	"smooth"
		1368	1419	"smooth"
		1369	1420	"smooth"
		1370	1421	"smooth"
		1371	1422	"smooth"
		1372	1423	"smooth"
		1373	1424	"smooth"
		1374	1425	"smooth"
		1375	1426	"smooth"
		1376	1427	"smooth"
		1377	1428	"smooth"
		1378	1429	"smooth"
		1379	1430	"smooth"
		1380	1431	"smooth"
		1381	1432	"smooth"
		1382	1433	"smooth"
		1383	1434	"smooth"
		1384	1435	"smooth"
		1385	1436	"smooth"
		1386	1437	"smooth"
		1387	1438	"smooth"
		1388	1439	"smooth"
		1389	1440	"smooth"
		1390	1441	"smooth"
		1391	1442	"smooth"
		1392	1443	"smooth"
		1393	1444	"smooth"
		1394	1445	"smooth"
		1395	1446	"smooth"
		1396	1447	"smooth"
		1397	1448	"smooth"
		1398	1449	"smooth"
		1399	1450	"smooth"
		1400	1451	"smooth"
		1401	1452	"smooth"
		1402	1453	"smooth"
		1403	1454	"smooth"
		1404	1455	"smooth"
		1405	1456	"smooth"
		1406	1457	"smooth"
		1407	1458	"smooth"
		1408	1459	"smooth"
		1409	1460	"smooth"
		1410	1461	"smooth"
		1411	1462	"smooth"
		1412	1463	"smooth"
		1413	1464	"smooth"
		1414	1465	"smooth"
		1415	1466	"smooth"
		1416	1467	"smooth"
		1417	1468	"smooth"
		1418	1469	"smooth"
		1419	1470	"smooth"
		1420	1471	"smooth"
		1421	1472	"smooth"
		1422	1473	"smooth"
		1423	1474	"smooth"
		1424	1475	"smooth"
		1425	1476	"smooth"
		1426	1477	"smooth"
		1427	1478	"smooth"
		1428	1479	"smooth"
		1429	1480	"smooth"
		1430	1481	"smooth"
		1431	1482	"smooth"
		1432	1483	"smooth"
		1433	1484	"smooth"
		1434	1485	"smooth"
		1435	1486	"smooth"
		1436	1487	"smooth"
		1437	1488	"smooth"
		1438	1489	"smooth"
		1439	1490	"smooth"
		1440	1491	"smooth"
		1441	1492	"smooth"
		1442	1493	"smooth"
		1443	1494	"smooth"
		1444	1495	"smooth"
		1445	1496	"smooth"
		1446	1497	"smooth"
		1447	1498	"smooth"
		1448	1499	"smooth"
		1449	1500	"smooth"
		1450	1501	"smooth"
		1451	1502	"smooth"
		1452	1503	"smooth"
		1453	1504	"smooth"
		1454	1505	"smooth"
		1455	1506	"smooth"
		1456	1507	"smooth"
		1457	1508	"smooth"
		1458	1509	"smooth"
		1459	1510	"smooth"
		1460	1511	"smooth"
		1461	1512	"smooth"
		1462	1513	"smooth"
		1463	1514	"smooth"
		1464	1515	"smooth"
		1465	1516	"smooth"
		1466	1517	"smooth"
		1467	1518	"smooth"
		1468	1519	"smooth"
		1469	1520	"smooth"
		1470	1521	"smooth"
		1471	1522	"smooth"
		1472	1523	"smooth"
		1473	1524	"smooth"
		1474	1525	"smooth"
		1475	1526	"smooth"
		1476	1527	"smooth"
		1477	1528	"smooth"
		1478	1529	"smooth"
		1479	1530	"smooth"
		1480	1531	"smooth"
		1481	1532	"smooth"
		1482	1533	"smooth"
		1483	1534	"smooth"
		1484	1535	"smooth"
		1485	1536	"smooth"
		1486	1537	"smooth"
		1487	1538	"smooth"
		1488	1539	"smooth"
		1489	1540	"smooth"
		1490	1541	"smooth"
		1491	1542	"smooth"
		1492	1543	"smooth"
		1493	1544	"smooth"
		1494	1545	"smooth"
		1495	1546	"smooth"
		1496	1547	"smooth"
		1497	1548	"smooth"
		1498	1549	"smooth"
		1499	1550	"smooth"
		1500	1551	"smooth"
		1501	1552	"smooth"
		1502	1553	"smooth"
		1503	1554	"smooth"
		1504	1555	"smooth"
		1505	1556	"smooth"
		1506	1557	"smooth"
		1507	1558	"smooth"
		1508	1559	"smooth"
		1509	1560	"smooth"
		1510	1561	"smooth"
		1511	1562	"smooth"
		1512	1563	"smooth"
		1513	1564	"smooth"
		1514	1565	"smooth"
		1515	1566	"smooth"
		1516	1567	"smooth"
		1517	1568	"smooth"
		1518	1569	"smooth"
		1519	1570	"smooth"
		1520	1571	"smooth"
		1521	1572	"smooth"
		1522	1573	"smooth"
		1523	1574	"smooth"
		1524	1575	"smooth"
		1525	1576	"smooth"
		1526	1577	"smooth"
		1527	1578	"smooth"
		1528	1579	"smooth"
		1529	1580	"smooth"
		1530	1581	"smooth"
		1531	1582	"smooth"
		1532	1583	"smooth"
		1533	1584	"smooth"
		1534	1585	"smooth"
		1535	1586	"smooth"
		1536	1587	"smooth"
		1537	1588	"smooth"
		1538	1589	"smooth"
		1539	1590	"smooth"
		1540	1591	"smooth"
		1541	1592	"smooth"
		1542	1593	"smooth"
		1543	1594	"smooth"
		1544	1595	"smooth"
		1545	1596	"smooth"
		1546	1597	"smooth"
		1547	1598	"smooth"
		1548	1599	"smooth"
		1549	1600	"smooth"
		1550	1601	"smooth"
		1551	1602	"smooth"
		1552	1603	"smooth"
		1553	1604	"smooth"
		1554	1605	"smooth"
		1555	1606	"smooth"
		1556	1607	"smooth"
		1557	1608	"smooth"
		1558	1609	"smooth"
		1559	1610	"smooth"
		1560	1611	"smooth"
		1561	1612	"smooth"
		1562	1613	"smooth"
		1563	1614	"smooth"
		1564	1615	"smooth"
		1565	1616	"smooth"
		1566	1617	"smooth"
		1567	1618	"smooth"
		1568	1619	"smooth"
		1569	1620	"smooth"
		1570	1621	"smooth"
		1571	1622	"smooth"
		1572	1623	"smooth"
		1573	1624	"smooth"
		1574	1625	"smooth"
		1575	1626	"smooth"
		1576	1627	"smooth"
		1577	1628	"smooth"
		1578	1629	"smooth"
		1579	1630	"smooth"
		1580	1631	"smooth"
		1581	1632	"smooth"
		1582	1633	"smooth"
		1583	1634	"smooth"
		1584	1635	"smooth"
		1585	1636	"smooth"
		1586	1637	"smooth"
		1587	1638	"smooth"
		1588	1639	"smooth"
		1589	1640	"smooth"
		1590	1641	"smooth"
		1591	1642	"smooth"
		1592	1643	"smooth"
		1593	1644	"smooth"
		1594	1645	"smooth"
		1595	1646	"smooth"
		1596	1647	"smooth"
		1597	1648	"smooth"
		1598	1649	"smooth"
		1599	1650	"smooth"
		1600	1651	"smooth"
		1601	1652	"smooth"
		1602	1653	"smooth"
		1603	1654	"smooth"
		1604	1655	"smooth"
		1605	1656	"smooth"
		1606	1657	"smooth"
		1607	1658	"smooth"
		1608	1659	"smooth"
		1609	1660	"smooth"
		1610	1661	"smooth"
		1611	1662	"smooth"
		1612	1663	"smooth"
		1613	1664	"smooth"
		1614	1665	"smooth"
		1615	1666	"smooth"
		1616	1667	"smooth"
		1617	1668	"smooth"
		1618	1669	"smooth"
		1619	1670	"smooth"
		1620	1671	"smooth"
		1621	1672	"smooth"
		1622	1673	"smooth"
		1623	1674	"smooth"
		1624	1675	"smooth"
		1625	1676	"smooth"
		1626	1677	"smooth"
		1627	1678	"smooth"
		1628	1679	"smooth"
		1629	1680	"smooth"
		1630	1681	"smooth"
		1631	1682	"smooth"
		1632	1683	"smooth"
		1633	1684	"smooth"
		1634	1685	"smooth"
		1635	1686	"smooth"
		1636	1687	"smooth"
		1637	1688	"smooth"
		1638	1689	"smooth"
		1639	1690	"smooth"
		1640	1691	"smooth"
		1641	1692	"smooth"
		1642	1693	"smooth"
		1643	1694	"smooth"
		1644	1695	"smooth"
		1645	1696	"smooth"
		1646	1697	"smooth"
		1647	1698	"smooth"
		1648	1699	"smooth"
		1649	1700	"smooth"
		1650	1701	"smooth"
		1651	1702	"smooth"
		1652	1703	"smooth"
		1653	1704	"smooth"
		1654	1705	"smooth"
		1655	1706	"smooth"
		1656	1707	"smooth"
		1657	1708	"smooth"
		1658	1709	"smooth"
		1659	1710	"smooth"
		1660	1711	"smooth"
		1661	1712	"smooth"
		1662	1713	"smooth"
		1663	1714	"smooth"
		1664	1715	"smooth"
		1665	1716	"smooth"
		1666	1717	"smooth"
		1667	1718	"smooth"
		1668	1719	"smooth"
		1669	1720	"smooth"
		1670	1721	"smooth"
		1671	1722	"smooth"
		1672	1723	"smooth"
		1673	1724	"smooth"
		1674	1725	"smooth"
		1675	1726	"smooth"
		1676	1727	"smooth"
		1677	1728	"smooth"
		1678	1729	"smooth"
		1679	1730	"smooth"
		1680	1731	"smooth"
		1681	1732	"smooth"
		1682	1733	"smooth"
		1683	1734	"smooth"
		1684	1735	"smooth"
		1685	1736	"smooth"
		1686	1737	"smooth"
		1687	1738	"smooth"
		1688	1739	"smooth"
		1689	1740	"smooth"
		1690	1741	"smooth"
		1691	1742	"smooth"
		1692	1743	"smooth"
		1693	1744	"smooth"
		1694	1745	"smooth"
		1695	1746	"smooth"
		1696	1747	"smooth"
		1697	1748	"smooth"
		1698	1749	"smooth"
		1699	1750	"smooth"
		1700	1751	"smooth"
		1701	1752	"smooth"
		1702	1753	"smooth"
		1703	1754	"smooth"
		1704	1755	"smooth"
		1705	1756	"smooth"
		1706	1757	"smooth"
		1707	1758	"smooth"
		1708	1759	"smooth"
		1709	1760	"smooth"
		1710	1761	"smooth"
		1711	1762	"smooth"
		1712	1763	"smooth"
		1713	1764	"smooth"
		1714	1765	"smooth"
		1715	1766	"smooth"
		1716	1767	"smooth"
		1717	1768	"smooth"
		1718	1769	"smooth"
		1719	1770	"smooth"
		1720	1771	"smooth"
		1721	1772	"smooth"
		1722	1773	"smooth"
		1723	1774	"smooth"
		1724	1775	"smooth"
		1725	1776	"smooth"
		1726	1777	"smooth"
		1727	1778	"smooth"
		1728	1779	"smooth"
		1729	1780	"smooth"
		1730	1781	"smooth"
		1731	1782	"smooth"
		1732	1783	"smooth"
		1733	1784	"smooth"
		1734	1785	"smooth"
		1735	1786	"smooth"
		1736	1787	"smooth"
		1737	1788	"smooth"
		1738	1789	"smooth"
		1739	1790	"smooth"
		1740	1791	"smooth"
		1741	1792	"smooth"
		1742	1793	"smooth"
		1743	1794	"smooth"
		1744	1795	"smooth"
		1745	1796	"smooth"
		1746	1797	"smooth"
		1747	1798	"smooth"
		1748	1799	"smooth"
		1749	1800	"smooth"
		1750	1801	"smooth"
		1751	1802	"smooth"
		1752	1803	"smooth"
		1753	1804	"smooth"
		1754	1805	"smooth"
		1755	1806	"smooth"
		1756	1807	"smooth"
		1757	1808	"smooth"
		1758	1809	"smooth"
		1759	1810	"smooth"
		1760	1811	"smooth"
		1761	1812	"smooth"
		1762	1813	"smooth"
		1763	1814	"smooth"
		1764	1815	"smooth"
		1765	1816	"smooth"
		1766	1817	"smooth"
		1767	1818	"smooth"
		1768	1819	"smooth"
		1769	1820	"smooth"
		1770	1821	"smooth"
		1771	1822	"smooth"
		1772	1823	"smooth"
		1773	1824	"smooth"
		1774	1825	"smooth"
		1775	1826	"smooth"
		1776	1827	"smooth"
		1777	1828	"smooth"
		1778	1829	"smooth"
		1779	1830	"smooth"
		1780	1831	"smooth"
		1781	1832	"smooth"
		1782	1833	"smooth"
		1783	1834	"smooth"
		1784	1835	"smooth"
		1785	1836	"smooth"
		1786	1837	"smooth"
		1787	1838	"smooth"
		1788	1839	"smooth"
		1789	1840	"smooth"
		1790	1841	"smooth"
		1791	1842	"smooth"
		1792	1843	"smooth"
		1793	1844	"smooth"
		1794	1845	"smooth"
		1795	1846	"smooth"
		1796	1847	"smooth"
		1797	1848	"smooth"
		1798	1849	"smooth"
		1799	1850	"smooth"
		1800	1851	"smooth"
		1801	1852	"smooth"
		1802	1853	"smooth"
		1803	1854	"smooth"
		1804	1855	"smooth"
		1805	1856	"smooth"
		1806	1857	"smooth"
		1807	1858	"smooth"
		1808	1859	"smooth"
		1809	1860	"smooth"
		1810	1861	"smooth"
		1811	1862	"smooth"
		1812	1863	"smooth"
		1813	1864	"smooth"
		1814	1865	"smooth"
		1815	1866	"smooth"
		1816	1867	"smooth"
		1817	1868	"smooth"
		1818	1869	"smooth"
		1819	1870	"smooth"
		1820	1871	"smooth"
		1821	1872	"smooth"
		1822	1873	"smooth"
		1823	1874	"smooth"
		1824	1875	"smooth"
		1825	1876	"smooth"
		1826	1877	"smooth"
		1827	1878	"smooth"
		1828	1879	"smooth"
		1829	1880	"smooth"
		1830	1881	"smooth"
		1831	1882	"smooth"
		1832	1883	"smooth"
		1833	1884	"smooth"
		1834	1885	"smooth"
		1835	1886	"smooth"
		1836	1887	"smooth"
		1837	1888	"smooth"
		1838	1889	"smooth"
		1839	1890	"smooth"
		1840	1891	"smooth"
		1841	1892	"smooth"
		1842	1893	"smooth"
		1843	1894	"smooth"
		1844	1895	"smooth"
		1845	1896	"smooth"
		1846	1897	"smooth"
		1847	1898	"smooth"
		1848	1899	"smooth"
		1849	1900	"smooth"
		1850	1901	"smooth"
		1851	1902	"smooth"
		1852	1903	"smooth"
		1853	1904	"smooth"
		1854	1905	"smooth"
		1855	1906	"smooth"
		1856	1907	"smooth"
		1857	1908	"smooth"
		1858	1909	"smooth"
		1859	1910	"smooth"
		1860	1911	"smooth"
		1861	1912	"smooth"
		1862	1913	"smooth"
		1863	1914	"smooth"
		1864	1915	"smooth"
		1865	1916	"smooth"
		1866	1917	"smooth"
		1867	1918	"smooth"
		1868	1919	"smooth"
		1869	1920	"smooth"
		1870	1921	"smooth"
		1871	1922	"smooth"
		1872	1923	"smooth"
		1873	1924	"smooth"
		1874	1925	"smooth"
		1875	1926	"smooth"
		1876	1927	"smooth"
		1877	1928	"smooth"
		1878	1929	"smooth"
		1879	1930	"smooth"
		1880	1931	"smooth"
		1881	1932	"smooth"
		1882	1933	"smooth"
		1883	1934	"smooth"
		1884	1935	"smooth"
		1885	1936	"smooth"
		1886	1937	"smooth"
		1887	1938	"smooth"
		1888	1939	"smooth"
		1889	1940	"smooth"
		1890	1941	"smooth"
		1891	1942	"smooth"
		1892	1943	"smooth"
		1893	1944	"smooth"
		1894	1945	"smooth"
		1895	1946	"smooth"
		1896	1947	"smooth"
		1897	1948	"smooth"
		1898	1949	"smooth"
		1899	1950	"smooth"
		1900	1951	"smooth"
		1901	1952	"smooth"
		1902	1953	"smooth"
		1903	1954	"smooth"
		1904	1955	"smooth"
		1905	1956	"smooth"
		1906	1957	"smooth"
		1907	1958	"smooth"
		1908	1959	"smooth"
		1909	1960	"smooth"
		1910	1961	"smooth"
		1911	1962	"smooth"
		1912	1963	"smooth"
		1913	1964	"smooth"
		1914	1965	"smooth"
		1915	1966	"smooth"
		1916	1967	"smooth"
		1917	1968	"smooth"
		1918	1969	"smooth"
		1919	1970	"smooth"
		1920	1971	"smooth"
		1921	1972	"smooth"
		1922	1973	"smooth"
		1923	1974	"smooth"
		1924	1975	"smooth"
		1925	1976	"smooth"
		1926	1977	"smooth"
		1927	1978	"smooth"
		1928	1979	"smooth"
		1929	1980	"smooth"
		1930	1981	"smooth"
		1931	1982	"smooth"
		1932	1983	"smooth"
		1933	1984	"smooth"
		1934	1985	"smooth"
		1935	1986	"smooth"
		1936	1987	"smooth"
		1937	1988	"smooth"
		1938	1989	"smooth"
		1939	1990	"smooth"
		1940	1991	"smooth"
		1941	1992	"smooth"
		1942	1993	"smooth"
		1943	1994	"smooth"
		1944	1995	"smooth"
		1945	1996	"smooth"
		1946	1997	"smooth"
		1947	1998	"smooth"
		1948	1999	"smooth"
		1949	2000	"smooth"
		1950	2001	"smooth"
		1951	2002	"smooth"
		1952	2003	"smooth"
		1953	2004	"smooth"
		1954	2005	"smooth"
		1955	2006	"smooth"
		1956	2007	"smooth"
		1957	2008	"smooth"
		1958	2009	"smooth"
		1959	2010	"smooth"
		1960	2011	"smooth"
		1961	2012	"smooth"
		1962	2013	"smooth"
		1963	2014	"smooth"
		1964	2015	"smooth"
		1965	2016	"smooth"
		1966	2017	"smooth"
		1967	2018	"smooth"
		1968	2019	"smooth"
		1969	2020	"smooth"
		1970	2021	"smooth"
		1971	2022	"smooth"
		1972	2023	"smooth"
		1973	2024	"smooth"
		1974	2025	"smooth"
		1975	2026	"smooth"
		1976	2027	"smooth"
		1977	2028	"smooth"
		1978	2029	"smooth"
		1979	2030	"smooth"
		1980	2031	"smooth"
		1981	2032	"smooth"
		1982	2033	"smooth"
		1983	2034	"smooth"
		1984	2035	"smooth"
		1985	2036	"smooth"
		1986	2037	"smooth"
		1987	2038	"smooth"
		1988	2039	"smooth"
		1989	2040	"smooth"
		1990	2041	"smooth"
		1991	2042	"smooth"
		1992	2043	"smooth"
		1993	2044	"smooth"
		1994	2045	"smooth"
		1995	2046	"smooth"
		1996	2047	"smooth"
		1997	2048	"smooth"
		1998	2049	"smooth"
		1999	2050	"smooth"
		2000	2051	"smooth"
		2001	2052	"smooth"
		2002	2053	"smooth"
		2003	2054	"smooth"
		2004	2055	"smooth"
		2005	2056	"smooth"
		2006	2057	"smooth"
		2007	2058	"smooth"
		2008	2059	"smooth"
		2009	2060	"smooth"
		2010	2061	"smooth"
		2011	2062	"smooth"
		2012	2063	"smooth"
		2013	2064	"smooth"
		2014	2065	"smooth"
		2015	2066	"smooth"
		2016	2067	"smooth"
		2017	2068	"smooth"
		2018	2069	"smooth"
		2019	2070	"smooth"
		2020	2071	"smooth"
		2021	2072	"smooth"
		2022	2073	"smooth"
		2023	2074	"smooth"
		2024	2075	"smooth"
		2025	2076	"smooth"
		2026	2077	"smooth"
		2027	2078	"smooth"
		2028	2079	"smooth"
		2029	2080	"smooth"
		2030	2081	"smooth"
		2031	2082	"smooth"
		2032	2083	"smooth"
		2033	2084	"smooth"
		2034	2085	"smooth"
		2035	2086	"smooth"
		2036	2087	"smooth"
		2037	2088	"smooth"
		2038	2089	"smooth"
		2039	2090	"smooth"
		2040	2091	"smooth"
		2041	2092	"smooth"
		2042	2093	"smooth"
		2043	2094	"smooth"
		2044	2095	"smooth"
		2045	2096	"smooth"
		2046	2097	"smooth"
		2047	2098	"smooth"
		2048	2099	"smooth"
		2049	2100	"smooth"
		2050	2101	"smooth"
		2051	2102	"smooth"
		2052	2103	"smooth"
		2053	2104	"smooth"
		2054	2105	"smooth"
		2055	2106	"smooth"
		2056	2107	"smooth"
		2057	2108	"smooth"
		2058	2109	"smooth"
		2059	2110	"smooth"
		2060	2111	"smooth"
		2061	2112	"smooth"
		2062	2113	"smooth"
		2063	2114	"smooth"
		2064	2115	"smooth"
		2065	2116	"smooth"
		2066	2117	"smooth"
		2067	2118	"smooth"
		2068	2119	"smooth"
		2069	2120	"smooth"
		2070	2121	"smooth"
		2071	2122	"smooth"
		2072	2123	"smooth"
		2073	2124	"smooth"
		2074	2125	"smooth"
		2075	2126	"smooth"
		2076	2127	"smooth"
		2077	2128	"smooth"
		2078	2129	"smooth"
		2079	2130	"smooth"
		2080	2131	"smooth"
		2081	2132	"smooth"
		2082	2133	"smooth"
		2083	2134	"smooth"
		2084	2135	"smooth"
		2085	2136	"smooth"
		2086	2137	"smooth"
		2087	2138	"smooth"
		2088	2139	"smooth"
		2089	2140	"smooth"
		2090	2141	"smooth"
		2091	2142	"smooth"
		2092	2143	"smooth"
		2093	2144	"smooth"
		2094	2145	"smooth"
		2095	2146	"smooth"
		2096	2147	"smooth"
		2097	2148	"smooth"
		2098	2149	"smooth"
		2099	2150	"smooth"
		2100	2151	"smooth"
		2101	2152	"smooth"
		2102	2153	"smooth"
		2103	2154	"smooth"
		2104	2155	"smooth"
		2105	2156	"smooth"
		2106	2157	"smooth"
		2107	2158	"smooth"
		2108	2159	"smooth"
		2109	2160	"smooth"
		2110	2161	"smooth"
		2111	2162	"smooth"
		2112	2163	"smooth"
		2113	2164	"smooth"
		2114	2165	"smooth"
		2115	2166	"smooth"
		2116	2167	"smooth"
		2117	2168	"smooth"
		2118	2169	"smooth"
		2119	2170	"smooth"
		2120	2171	"smooth"
		2121	2172	"smooth"
		2122	2173	"smooth"
		2123	2174	"smooth"
		2124	2175	"smooth"
		2125	2176	"smooth"
		2126	2177	"smooth"
		2127	2178	"smooth"
		2128	2179	"smooth"
		2129	2180	"smooth"
		2130	2181	"smooth"
		2131	2182	"smooth"
		2132	2183	"smooth"
		2133	2184	"smooth"
		2134	2185	"smooth"
		2135	2186	"smooth"
		2136	2187	"smooth"
		2137	2188	"smooth"
		2138	2189	"smooth"
		2139	2190	"smooth"
		2140	2191	"smooth"
		2141	2192	"smooth"
		2142	2193	"smooth"
		2143	2194	"smooth"
		2144	2195	"smooth"
		2145	2196	"smooth"
		2146	2197	"smooth"
		2147	2198	"smooth"
		2148	2199	"smooth"
		2149	2200	"smooth"
		2150	2201	"smooth"
		2151	2202	"smooth"
		2152	2203	"smooth"
		2153	2204	"smooth"
		2154	2205	"smooth"
		2155	2206	"smooth"
		2156	2207	"smooth"
		2157	2208	"smooth"
		2158	2209	"smooth"
		2159	2210	"smooth"
		2160	2211	"smooth"
		2161	2212	"smooth"
		2162	2213	"smooth"
		2163	2214	"smooth"
		2164	2215	"smooth"
		2165	2216	"smooth"
		2166	2217	"smooth"
		2167	2218	"smooth"
		2168	2219	"smooth"
		2169	2220	"smooth"
		2170	2221	"smooth"
		2171	2222	"smooth"
		2172	2223	"smooth"
		2173	2224	"smooth"
		2174	2225	"smooth"
		2175	2226	"smooth"
		2176	2227	"smooth"
		2177	2228	"smooth"
		2178	2229	"smooth"
		2179	2230	"smooth"
		2180	2231	"smooth"
		2181	2232	"smooth"
		2182	2233	"smooth"
		2183	2234	"smooth"
		2184	2235	"smooth"
		2185	2236	"smooth"
		2186	2237	"smooth"
		2187	2238	"smooth"
		2188	2239	"smooth"
		2189	2240	"smooth"
		2190	2241	"smooth"
		2191	2242	"smooth"
		2192	2243	"smooth"
		2193	2244	"smooth"
		2194	2245	"smooth"
		2195	2246	"smooth"
		2196	2247	"smooth"
		2197	2248	"smooth"
		2198	2249	"smooth"
		2199	2250	"smooth"
		2200	2251	"smooth"
		2201	2252	"smooth"
		2202	2253	"smooth"
		2203	2254	"smooth"
		2204	2255	"smooth"
		2205	2256	"smooth"
		2206	2257	"smooth"
		2207	2258	"smooth"
		2208	2259	"smooth"
		2209	2260	"smooth"
		2210	2261	"smooth"
		2211	2262	"smooth"
		2212	2263	"smooth"
		2213	2264	"smooth"
		2214	2265	"smooth"
		2215	2266	"smooth"
		2216	2267	"smooth"
		2217	2268	"smooth"
		2218	2269	"smooth"
		2219	2270	"smooth"
		2220	2271	"smooth"
		2221	2272	"smooth"
		2222	2273	"smooth"
		2223	2274	"smooth"
		2224	2275	"smooth"
		2225	2276	"smooth"
		2226	2277	"smooth"
		2227	2278	"smooth"
		2228	2279	"smooth"
		2229	2280	"smooth"
		2230	2281	"smooth"
		2231	2282	"smooth"
		2232	2283	"smooth"
		2233	2284	"smooth"
		2234	2285	"smooth"
		2235	2286	"smooth"
		2236	2287	"smooth"
		2237	2288	"smooth"
		2238	2289	"smooth"
		2239	2290	"smooth"
		2240	2291	"smooth"
		2241	2292	"smooth"
		2242	2293	"smooth"
		2243	2294	"smooth"
		2244	2295	"smooth"
		2245	2296	"smooth"
		2246	2297	"smooth"
		2247	2298	"smooth"
		2248	2299	"smooth"
		2249	2300	"smooth"
		2250	2301	"smooth"
		2251	2302	"smooth"
		2252	2303	"smooth"
		2253	2304	"smooth"
		2254	2305	"smooth"
		2255	2306	"smooth"
		2256	2307	"smooth"
		2257	2308	"smooth"
		2258	2309	"smooth"
		2259	2310	"smooth"
		2260	2311	"smooth"
		2261	2312	"smooth"
		2262	2313	"smooth"
		2263	2314	"smooth"
		2264	2315	"smooth"
		2265	2316	"smooth"
		2266	2317	"smooth"
		2267	2318	"smooth"
		2268	2319	"smooth"
		2269	2320	"smooth"
		2270	2321	"smooth"
		2271	2322	"smooth"
		2272	2323	"smooth"
		2273	2324	"smooth"
		2274	2325	"smooth"
		2275	2326	"smooth"
		2276	2327	"smooth"
		2277	2328	"smooth"
		2278	2329	"smooth"
		2279	2330	"smooth"
		2280	2331	"smooth"
		2281	2332	"smooth"
		2282	2333	"smooth"
		2283	2334	"smooth"
		2284	2335	"smooth"
		2285	2336	"smooth"
		2286	2337	"smooth"
		2287	2338	"smooth"
		2288	2339	"smooth"
		2289	2340	"smooth"
		2290	2341	"smooth"
		2291	2342	"smooth"
		2292	2343	"smooth"
		2293	2344	"smooth"
		2294	2345	"smooth"
		2295	2346	"smooth"
		2296	2347	"smooth"
		2297	2348	"smooth"
		2298	2349	"smooth"
		2299	2350	"smooth"
		2300	2351	"smooth"
		2301	2352	"smooth"
		2302	2353	"smooth"
		2303	2354	"smooth"
		2304	2355	"smooth"
		2305	2356	"smooth"
		2306	2357	"smooth"
		2307	2358	"smooth"
		2308	2359	"smooth"
		2309	2360	"smooth"
		2310	2361	"smooth"
		2311	2362	"smooth"
		2312	2363	"smooth"
		2313	2364	"smooth"
		2314	2365	"smooth"
		2315	2366	"smooth"
		2316	2367	"smooth"
		2317	2368	"smooth"
		2318	2369	"smooth"
		2319	2370	"smooth"
		2320	2371	"smooth"
		2321	2372	"smooth"
		2322	2373	"smooth"
		2323	2374	"smooth"
		2324	2375	"smooth"
		2325	2376	"smooth"
		2326	2377	"smooth"
		2327	2378	"smooth"
		2328	2379	"smooth"
		2329	2380	"smooth"
		2330	2381	"smooth"
		2331	2382	"smooth"
		2332	2383	"smooth"
		2333	2384	"smooth"
		2334	2385	"smooth"
		2335	2386	"smooth"
		2336	2387	"smooth"
		2337	2388	"smooth"
		2338	2389	"smooth"
		2339	2390	"smooth"
		2340	2391	"smooth"
		2341	2392	"smooth"
		2342	2393	"smooth"
		2343	2394	"smooth"
		2344	2395	"smooth"
		2345	2396	"smooth"
		2346	2397	"smooth"
		2347	2398	"smooth"
		2348	2399	"smooth"
		2349	2400	"smooth"
		2350	2401	"smooth"
		2351	2402	"smooth"
		2352	2403	"smooth"
		2353	2404	"smooth"
		2354	2405	"smooth"
		2355	2406	"smooth"
		2356	2407	"smooth"
		2357	2408	"smooth"
		2358	2409	"smooth"
		2359	2410	"smooth"
		2360	2411	"smooth"
		2361	2412	"smooth"
		2362	2413	"smooth"
		2363	2414	"smooth"
		2364	2415	"smooth"
		2365	2416	"smooth"
		2366	2417	"smooth"
		2367	2418	"smooth"
		2368	2419	"smooth"
		2369	2420	"smooth"
		2370	2421	"smooth"
		2371	2422	"smooth"
		2372	2423	"smooth"
		2373	2424	"smooth"
		2374	2425	"smooth"
		2375	2426	"smooth"
		2376	2427	"smooth"
		2377	2428	"smooth"
		2378	2429	"smooth"
		2379	2430	"smooth"
		2380	2431	"smooth"
		2381	2432	"smooth"
		2382	2433	"smooth"
		2383	2434	"smooth"
		2384	2435	"smooth"
		2385	2436	"smooth"
		2386	2437	"smooth"
		2387	2438	"smooth"
		2388	2439	"smooth"
		2389	2440	"smooth"
		2390	2441	"smooth"
		2391	2442	"smooth"
		2392	2443	"smooth"
		2393	2444	"smooth"
		2394	2445	"smooth"
		2395	2446	"smooth"
		2396	2447	"smooth"
		2397	2448	"smooth"
		2398	2449	"smooth"
		2399	2450	"smooth"
		2400	2451	"smooth"
		2401	2452	"smooth"
		2402	2453	"smooth"
		2403	2454	"smooth"
		2404	2455	"smooth"
		2405	2456	"smooth"
		2406	2457	"smooth"
		2407	2458	"smooth"
		2408	2459	"smooth"
		2409	2460	"smooth"
		2410	2461	"smooth"
		2411	2462	"smooth"
		2412	2463	"smooth"
		2413	2464	"smooth"
		2414	2465	"smooth"
		2415	2466	"smooth"
		2416	2467	"smooth"
		2417	2468	"smooth"
		2418	2469	"smooth"
		2419	2470	"smooth"
		2420	2471	"smooth"
		2421	2472	"smooth"
		2422	2473	"smooth"
		2423	2474	"smooth"
		2424	2475	"smooth"
		2425	2476	"smooth"
		2426	2477	"smooth"
		2427	2478	"smooth"
		2428	2479	"smooth"
		2429	2480	"smooth"
		2430	2481	"smooth"
		2431	2482	"smooth"
		2432	2483	"smooth"
		2433	2484	"smooth"
		2434	2485	"smooth"
		2435	2486	"smooth"
		2436	2487	"smooth"
		2437	2488	"smooth"
		2438	2489	"smooth"
		2439	2490	"smooth"
		2440	2491	"smooth"
		2441	2492	"smooth"
		2442	2493	"smooth"
		2443	2494	"smooth"
		2444	2495	"smooth"
		2445	2496	"smooth"
		2446	2497	"smooth"
		2447	2498	"smooth"
		2448	2499	"smooth"
		2449	2500	"smooth"
		2450	2501	"smooth"
		2451	2502	"smooth"
		2452	2503	"smooth"
		2453	2504	"smooth"
		2454	2505	"smooth"
		2455	2506	"smooth"
		2456	2507	"smooth"
		2457	2508	"smooth"
		2458	2509	"smooth"
		2459	2510	"smooth"
		2460	2511	"smooth"
		2461	2512	"smooth"
		2462	2513	"smooth"
		2463	2514	"smooth"
		2464	2515	"smooth"
		2465	2516	"smooth"
		2466	2517	"smooth"
		2467	2518	"smooth"
		2468	2519	"smooth"
		2469	2520	"smooth"
		2470	2521	"smooth"
		2471	2522	"smooth"
		2472	2523	"smooth"
		2473	2524	"smooth"
		2474	2525	"smooth"
		2475	2526	"smooth"
		2476	2527	"smooth"
		2477	2528	"smooth"
		2478	2529	"smooth"
		2479	2530	"smooth"
		2480	2531	"smooth"
		2481	2532	"smooth"
		2482	2533	"smooth"
		2483	2534	"smooth"
		2484	2535	"smooth"
		2485	2536	"smooth"
		2486	2537	"smooth"
		2487	2538	"smooth"
		2488	2539	"smooth"
		2489	2540	"smooth"
		2490	2541	"smooth"
		2491	2542	"smooth"
		2492	2543	"smooth"
		2493	2544	"smooth"
		2494	2545	"smooth"
		2495	2546	"smooth"
		2496	2547	"smooth"
		2497	2548	"smooth"
		2498	2549	"smooth"
		2550	0	"smooth"
		2550	1	"smooth"
		2550	2	"smooth"
		2550	3	"smooth"
		2550	4	"smooth"
		2550	5	"smooth"
		2550	6	"smooth"
		2550	7	"smooth"
		2550	8	"smooth"
		2550	9	"smooth"
		2550	10	"smooth"
		2550	11	"smooth"
		2550	12	"smooth"
		2550	13	"smooth"
		2550	14	"smooth"
		2550	15	"smooth"
		2550	16	"smooth"
		2550	17	"smooth"
		2550	18	"smooth"
		2550	19	"smooth"
		2550	20	"smooth"
		2550	21	"smooth"
		2550	22	"smooth"
		2550	23	"smooth"
		2550	24	"smooth"
		2550	25	"smooth"
		2550	26	"smooth"
		2550	27	"smooth"
		2550	28	"smooth"
		2550	29	"smooth"
		2550	30	"smooth"
		2550	31	"smooth"
		2550	32	"smooth"
		2550	33	"smooth"
		2550	34	"smooth"
		2550	35	"smooth"
		2550	36	"smooth"
		2550	37	"smooth"
		2550	38	"smooth"
		2550	39	"smooth"
		2550	40	"smooth"
		2550	41	"smooth"
		2550	42	"smooth"
		2550	43	"smooth"
		2550	44	"smooth"
		2550	45	"smooth"
		2550	46	"smooth"
		2550	47	"smooth"
		2550	48	"smooth"
		2550	49	"smooth"
		2550	50	"smooth"
		2499	2551	"smooth"
		2500	2551	"smooth"
		2501	2551	"smooth"
		2502	2551	"smooth"
		2503	2551	"smooth"
		2504	2551	"smooth"
		2505	2551	"smooth"
		2506	2551	"smooth"
		2507	2551	"smooth"
		2508	2551	"smooth"
		2509	2551	"smooth"
		2510	2551	"smooth"
		2511	2551	"smooth"
		2512	2551	"smooth"
		2513	2551	"smooth"
		2514	2551	"smooth"
		2515	2551	"smooth"
		2516	2551	"smooth"
		2517	2551	"smooth"
		2518	2551	"smooth"
		2519	2551	"smooth"
		2520	2551	"smooth"
		2521	2551	"smooth"
		2522	2551	"smooth"
		2523	2551	"smooth"
		2524	2551	"smooth"
		2525	2551	"smooth"
		2526	2551	"smooth"
		2527	2551	"smooth"
		2528	2551	"smooth"
		2529	2551	"smooth"
		2530	2551	"smooth"
		2531	2551	"smooth"
		2532	2551	"smooth"
		2533	2551	"smooth"
		2534	2551	"smooth"
		2535	2551	"smooth"
		2536	2551	"smooth"
		2537	2551	"smooth"
		2538	2551	"smooth"
		2539	2551	"smooth"
		2540	2551	"smooth"
		2541	2551	"smooth"
		2542	2551	"smooth"
		2543	2551	"smooth"
		2544	2551	"smooth"
		2545	2551	"smooth"
		2546	2551	"smooth"
		2547	2551	"smooth"
		2548	2551	"smooth"
		2549	2551	"smooth"

		"face"	
		"l"	4	0	2551	-52	-2551	
		"lt"	4	0	1	53	52	

		"face"	
		"l"	4	1	2552	-53	-2552	
		"lt"	4	1	2	54	53	

		"face"	
		"l"	4	2	2553	-54	-2553	
		"lt"	4	2	3	55	54	

		"face"	
		"l"	4	3	2554	-55	-2554	
		"lt"	4	3	4	56	55	

		"face"	
		"l"	4	4	2555	-56	-2555	
		"lt"	4	4	5	57	56	

		"face"	
		"l"	4	5	2556	-57	-2556	
		"lt"	4	5	6	58	57	

		"face"	
		"l"	4	6	2557	-58	-2557	
		"lt"	4	6	7	59	58	

		"face"	
		"l"	4	7	2558	-59	-2558	
		"lt"	4	7	8	60	59	

		"face"	
		"l"	4	8	2559	-60	-2559	
		"lt"	4	8	9	61	60	

		"face"	
		"l"	4	9	2560	-61	-2560	
		"lt"	4	9	10	62	61	

		"face"	
		"l"	4	10	2561	-62	-2561	
		"lt"	4	10	11	63	62	

		"face"	
		"l"	4	11	2562	-63	-2562	
		"lt"	4	11	12	64	63	

		"face"	
		"l"	4	12	2563	-64	-2563	
		"lt"	4	12	13	65	64	

		"face"	
		"l"	4	13	2564	-65	-2564	
		"lt"	4	13	14	66	65	

		"face"	
		"l"	4	14	2565	-66	-2565	
		"lt"	4	14	15	67	66	

		"face"	
		"l"	4	15	2566	-67	-2566	
		"lt"	4	15	16	68	67	

		"face"	
		"l"	4	16	2567	-68	-2567	
		"lt"	4	16	17	69	68	

		"face"	
		"l"	4	17	2568	-69	-2568	
		"lt"	4	17	18	70	69	

		"face"	
		"l"	4	18	2569	-70	-2569	
		"lt"	4	18	19	71	70	

		"face"	
		"l"	4	19	2570	-71	-2570	
		"lt"	4	19	20	72	71	

		"face"	
		"l"	4	20	2571	-72	-2571	
		"lt"	4	20	21	73	72	

		"face"	
		"l"	4	21	2572	-73	-2572	
		"lt"	4	21	22	74	73	

		"face"	
		"l"	4	22	2573	-74	-2573	
		"lt"	4	22	23	75	74	

		"face"	
		"l"	4	23	2574	-75	-2574	
		"lt"	4	23	24	76	75	

		"face"	
		"l"	4	24	2575	-76	-2575	
		"lt"	4	24	25	77	76	

		"face"	
		"l"	4	25	2576	-77	-2576	
		"lt"	4	25	26	78	77	

		"face"	
		"l"	4	26	2577	-78	-2577	
		"lt"	4	26	27	79	78	

		"face"	
		"l"	4	27	2578	-79	-2578	
		"lt"	4	27	28	80	79	

		"face"	
		"l"	4	28	2579	-80	-2579	
		"lt"	4	28	29	81	80	

		"face"	
		"l"	4	29	2580	-81	-2580	
		"lt"	4	29	30	82	81	

		"face"	
		"l"	4	30	2581	-82	-2581	
		"lt"	4	30	31	83	82	

		"face"	
		"l"	4	31	2582	-83	-2582	
		"lt"	4	31	32	84	83	

		"face"	
		"l"	4	32	2583	-84	-2583	
		"lt"	4	32	33	85	84	

		"face"	
		"l"	4	33	2584	-85	-2584	
		"lt"	4	33	34	86	85	

		"face"	
		"l"	4	34	2585	-86	-2585	
		"lt"	4	34	35	87	86	

		"face"	
		"l"	4	35	2586	-87	-2586	
		"lt"	4	35	36	88	87	

		"face"	
		"l"	4	36	2587	-88	-2587	
		"lt"	4	36	37	89	88	

		"face"	
		"l"	4	37	2588	-89	-2588	
		"lt"	4	37	38	90	89	

		"face"	
		"l"	4	38	2589	-90	-2589	
		"lt"	4	38	39	91	90	

		"face"	
		"l"	4	39	2590	-91	-2590	
		"lt"	4	39	40	92	91	

		"face"	
		"l"	4	40	2591	-92	-2591	
		"lt"	4	40	41	93	92	

		"face"	
		"l"	4	41	2592	-93	-2592	
		"lt"	4	41	42	94	93	

		"face"	
		"l"	4	42	2593	-94	-2593	
		"lt"	4	42	43	95	94	

		"face"	
		"l"	4	43	2594	-95	-2594	
		"lt"	4	43	44	96	95	

		"face"	
		"l"	4	44	2595	-96	-2595	
		"lt"	4	44	45	97	96	

		"face"	
		"l"	4	45	2596	-97	-2596	
		"lt"	4	45	46	98	97	

		"face"	
		"l"	4	46	2597	-98	-2597	
		"lt"	4	46	47	99	98	

		"face"	
		"l"	4	47	2598	-99	-2598	
		"lt"	4	47	48	100	99	

		"face"	
		"l"	4	48	2599	-100	-2599	
		"lt"	4	48	49	101	100	

		"face"	
		"l"	4	49	2600	-101	-2600	
		"lt"	4	49	50	102	101	

		"face"	
		"l"	4	50	2550	-102	-2601	
		"lt"	4	50	51	103	102	

		"face"	
		"l"	4	51	2602	-103	-2602	
		"lt"	4	52	53	105	104	

		"face"	
		"l"	4	52	2603	-104	-2603	
		"lt"	4	53	54	106	105	

		"face"	
		"l"	4	53	2604	-105	-2604	
		"lt"	4	54	55	107	106	

		"face"	
		"l"	4	54	2605	-106	-2605	
		"lt"	4	55	56	108	107	

		"face"	
		"l"	4	55	2606	-107	-2606	
		"lt"	4	56	57	109	108	

		"face"	
		"l"	4	56	2607	-108	-2607	
		"lt"	4	57	58	110	109	

		"face"	
		"l"	4	57	2608	-109	-2608	
		"lt"	4	58	59	111	110	

		"face"	
		"l"	4	58	2609	-110	-2609	
		"lt"	4	59	60	112	111	

		"face"	
		"l"	4	59	2610	-111	-2610	
		"lt"	4	60	61	113	112	

		"face"	
		"l"	4	60	2611	-112	-2611	
		"lt"	4	61	62	114	113	

		"face"	
		"l"	4	61	2612	-113	-2612	
		"lt"	4	62	63	115	114	

		"face"	
		"l"	4	62	2613	-114	-2613	
		"lt"	4	63	64	116	115	

		"face"	
		"l"	4	63	2614	-115	-2614	
		"lt"	4	64	65	117	116	

		"face"	
		"l"	4	64	2615	-116	-2615	
		"lt"	4	65	66	118	117	

		"face"	
		"l"	4	65	2616	-117	-2616	
		"lt"	4	66	67	119	118	

		"face"	
		"l"	4	66	2617	-118	-2617	
		"lt"	4	67	68	120	119	

		"face"	
		"l"	4	67	2618	-119	-2618	
		"lt"	4	68	69	121	120	

		"face"	
		"l"	4	68	2619	-120	-2619	
		"lt"	4	69	70	122	121	

		"face"	
		"l"	4	69	2620	-121	-2620	
		"lt"	4	70	71	123	122	

		"face"	
		"l"	4	70	2621	-122	-2621	
		"lt"	4	71	72	124	123	

		"face"	
		"l"	4	71	2622	-123	-2622	
		"lt"	4	72	73	125	124	

		"face"	
		"l"	4	72	2623	-124	-2623	
		"lt"	4	73	74	126	125	

		"face"	
		"l"	4	73	2624	-125	-2624	
		"lt"	4	74	75	127	126	

		"face"	
		"l"	4	74	2625	-126	-2625	
		"lt"	4	75	76	128	127	

		"face"	
		"l"	4	75	2626	-127	-2626	
		"lt"	4	76	77	129	128	

		"face"	
		"l"	4	76	2627	-128	-2627	
		"lt"	4	77	78	130	129	

		"face"	
		"l"	4	77	2628	-129	-2628	
		"lt"	4	78	79	131	130	

		"face"	
		"l"	4	78	2629	-130	-2629	
		"lt"	4	79	80	132	131	

		"face"	
		"l"	4	79	2630	-131	-2630	
		"lt"	4	80	81	133	132	

		"face"	
		"l"	4	80	2631	-132	-2631	
		"lt"	4	81	82	134	133	

		"face"	
		"l"	4	81	2632	-133	-2632	
		"lt"	4	82	83	135	134	

		"face"	
		"l"	4	82	2633	-134	-2633	
		"lt"	4	83	84	136	135	

		"face"	
		"l"	4	83	2634	-135	-2634	
		"lt"	4	84	85	137	136	

		"face"	
		"l"	4	84	2635	-136	-2635	
		"lt"	4	85	86	138	137	

		"face"	
		"l"	4	85	2636	-137	-2636	
		"lt"	4	86	87	139	138	

		"face"	
		"l"	4	86	2637	-138	-2637	
		"lt"	4	87	88	140	139	

		"face"	
		"l"	4	87	2638	-139	-2638	
		"lt"	4	88	89	141	140	

		"face"	
		"l"	4	88	2639	-140	-2639	
		"lt"	4	89	90	142	141	

		"face"	
		"l"	4	89	2640	-141	-2640	
		"lt"	4	90	91	143	142	

		"face"	
		"l"	4	90	2641	-142	-2641	
		"lt"	4	91	92	144	143	

		"face"	
		"l"	4	91	2642	-143	-2642	
		"lt"	4	92	93	145	144	

		"face"	
		"l"	4	92	2643	-144	-2643	
		"lt"	4	93	94	146	145	

		"face"	
		"l"	4	93	2644	-145	-2644	
		"lt"	4	94	95	147	146	

		"face"	
		"l"	4	94	2645	-146	-2645	
		"lt"	4	95	96	148	147	

		"face"	
		"l"	4	95	2646	-147	-2646	
		"lt"	4	96	97	149	148	

		"face"	
		"l"	4	96	2647	-148	-2647	
		"lt"	4	97	98	150	149	

		"face"	
		"l"	4	97	2648	-149	-2648	
		"lt"	4	98	99	151	150	

		"face"	
		"l"	4	98	2649	-150	-2649	
		"lt"	4	99	100	152	151	

		"face"	
		"l"	4	99	2650	-151	-2650	
		"lt"	4	100	101	153	152	

		"face"	
		"l"	4	100	2651	-152	-2651	
		"lt"	4	101	102	154	153	

		"face"	
		"l"	4	101	2601	-153	-2652	
		"lt"	4	102	103	155	154	

		"face"	
		"l"	4	102	2653	-154	-2653	
		"lt"	4	104	105	157	156	

		"face"	
		"l"	4	103	2654	-155	-2654	
		"lt"	4	105	106	158	157	

		"face"	
		"l"	4	104	2655	-156	-2655	
		"lt"	4	106	107	159	158	

		"face"	
		"l"	4	105	2656	-157	-2656	
		"lt"	4	107	108	160	159	

		"face"	
		"l"	4	106	2657	-158	-2657	
		"lt"	4	108	109	161	160	

		"face"	
		"l"	4	107	2658	-159	-2658	
		"lt"	4	109	110	162	161	

		"face"	
		"l"	4	108	2659	-160	-2659	
		"lt"	4	110	111	163	162	

		"face"	
		"l"	4	109	2660	-161	-2660	
		"lt"	4	111	112	164	163	

		"face"	
		"l"	4	110	2661	-162	-2661	
		"lt"	4	112	113	165	164	

		"face"	
		"l"	4	111	2662	-163	-2662	
		"lt"	4	113	114	166	165	

		"face"	
		"l"	4	112	2663	-164	-2663	
		"lt"	4	114	115	167	166	

		"face"	
		"l"	4	113	2664	-165	-2664	
		"lt"	4	115	116	168	167	

		"face"	
		"l"	4	114	2665	-166	-2665	
		"lt"	4	116	117	169	168	

		"face"	
		"l"	4	115	2666	-167	-2666	
		"lt"	4	117	118	170	169	

		"face"	
		"l"	4	116	2667	-168	-2667	
		"lt"	4	118	119	171	170	

		"face"	
		"l"	4	117	2668	-169	-2668	
		"lt"	4	119	120	172	171	

		"face"	
		"l"	4	118	2669	-170	-2669	
		"lt"	4	120	121	173	172	

		"face"	
		"l"	4	119	2670	-171	-2670	
		"lt"	4	121	122	174	173	

		"face"	
		"l"	4	120	2671	-172	-2671	
		"lt"	4	122	123	175	174	

		"face"	
		"l"	4	121	2672	-173	-2672	
		"lt"	4	123	124	176	175	

		"face"	
		"l"	4	122	2673	-174	-2673	
		"lt"	4	124	125	177	176	

		"face"	
		"l"	4	123	2674	-175	-2674	
		"lt"	4	125	126	178	177	

		"face"	
		"l"	4	124	2675	-176	-2675	
		"lt"	4	126	127	179	178	

		"face"	
		"l"	4	125	2676	-177	-2676	
		"lt"	4	127	128	180	179	

		"face"	
		"l"	4	126	2677	-178	-2677	
		"lt"	4	128	129	181	180	

		"face"	
		"l"	4	127	2678	-179	-2678	
		"lt"	4	129	130	182	181	

		"face"	
		"l"	4	128	2679	-180	-2679	
		"lt"	4	130	131	183	182	

		"face"	
		"l"	4	129	2680	-181	-2680	
		"lt"	4	131	132	184	183	

		"face"	
		"l"	4	130	2681	-182	-2681	
		"lt"	4	132	133	185	184	

		"face"	
		"l"	4	131	2682	-183	-2682	
		"lt"	4	133	134	186	185	

		"face"	
		"l"	4	132	2683	-184	-2683	
		"lt"	4	134	135	187	186	

		"face"	
		"l"	4	133	2684	-185	-2684	
		"lt"	4	135	136	188	187	

		"face"	
		"l"	4	134	2685	-186	-2685	
		"lt"	4	136	137	189	188	

		"face"	
		"l"	4	135	2686	-187	-2686	
		"lt"	4	137	138	190	189	

		"face"	
		"l"	4	136	2687	-188	-2687	
		"lt"	4	138	139	191	190	

		"face"	
		"l"	4	137	2688	-189	-2688	
		"lt"	4	139	140	192	191	

		"face"	
		"l"	4	138	2689	-190	-2689	
		"lt"	4	140	141	193	192	

		"face"	
		"l"	4	139	2690	-191	-2690	
		"lt"	4	141	142	194	193	

		"face"	
		"l"	4	140	2691	-192	-2691	
		"lt"	4	142	143	195	194	

		"face"	
		"l"	4	141	2692	-193	-2692	
		"lt"	4	143	144	196	195	

		"face"	
		"l"	4	142	2693	-194	-2693	
		"lt"	4	144	145	197	196	

		"face"	
		"l"	4	143	2694	-195	-2694	
		"lt"	4	145	146	198	197	

		"face"	
		"l"	4	144	2695	-196	-2695	
		"lt"	4	146	147	199	198	

		"face"	
		"l"	4	145	2696	-197	-2696	
		"lt"	4	147	148	200	199	

		"face"	
		"l"	4	146	2697	-198	-2697	
		"lt"	4	148	149	201	200	

		"face"	
		"l"	4	147	2698	-199	-2698	
		"lt"	4	149	150	202	201	

		"face"	
		"l"	4	148	2699	-200	-2699	
		"lt"	4	150	151	203	202	

		"face"	
		"l"	4	149	2700	-201	-2700	
		"lt"	4	151	152	204	203	

		"face"	
		"l"	4	150	2701	-202	-2701	
		"lt"	4	152	153	205	204	

		"face"	
		"l"	4	151	2702	-203	-2702	
		"lt"	4	153	154	206	205	

		"face"	
		"l"	4	152	2652	-204	-2703	
		"lt"	4	154	155	207	206	

		"face"	
		"l"	4	153	2704	-205	-2704	
		"lt"	4	156	157	209	208	

		"face"	
		"l"	4	154	2705	-206	-2705	
		"lt"	4	157	158	210	209	

		"face"	
		"l"	4	155	2706	-207	-2706	
		"lt"	4	158	159	211	210	

		"face"	
		"l"	4	156	2707	-208	-2707	
		"lt"	4	159	160	212	211	

		"face"	
		"l"	4	157	2708	-209	-2708	
		"lt"	4	160	161	213	212	

		"face"	
		"l"	4	158	2709	-210	-2709	
		"lt"	4	161	162	214	213	

		"face"	
		"l"	4	159	2710	-211	-2710	
		"lt"	4	162	163	215	214	

		"face"	
		"l"	4	160	2711	-212	-2711	
		"lt"	4	163	164	216	215	

		"face"	
		"l"	4	161	2712	-213	-2712	
		"lt"	4	164	165	217	216	

		"face"	
		"l"	4	162	2713	-214	-2713	
		"lt"	4	165	166	218	217	

		"face"	
		"l"	4	163	2714	-215	-2714	
		"lt"	4	166	167	219	218	

		"face"	
		"l"	4	164	2715	-216	-2715	
		"lt"	4	167	168	220	219	

		"face"	
		"l"	4	165	2716	-217	-2716	
		"lt"	4	168	169	221	220	

		"face"	
		"l"	4	166	2717	-218	-2717	
		"lt"	4	169	170	222	221	

		"face"	
		"l"	4	167	2718	-219	-2718	
		"lt"	4	170	171	223	222	

		"face"	
		"l"	4	168	2719	-220	-2719	
		"lt"	4	171	172	224	223	

		"face"	
		"l"	4	169	2720	-221	-2720	
		"lt"	4	172	173	225	224	

		"face"	
		"l"	4	170	2721	-222	-2721	
		"lt"	4	173	174	226	225	

		"face"	
		"l"	4	171	2722	-223	-2722	
		"lt"	4	174	175	227	226	

		"face"	
		"l"	4	172	2723	-224	-2723	
		"lt"	4	175	176	228	227	

		"face"	
		"l"	4	173	2724	-225	-2724	
		"lt"	4	176	177	229	228	

		"face"	
		"l"	4	174	2725	-226	-2725	
		"lt"	4	177	178	230	229	

		"face"	
		"l"	4	175	2726	-227	-2726	
		"lt"	4	178	179	231	230	

		"face"	
		"l"	4	176	2727	-228	-2727	
		"lt"	4	179	180	232	231	

		"face"	
		"l"	4	177	2728	-229	-2728	
		"lt"	4	180	181	233	232	

		"face"	
		"l"	4	178	2729	-230	-2729	
		"lt"	4	181	182	234	233	

		"face"	
		"l"	4	179	2730	-231	-2730	
		"lt"	4	182	183	235	234	

		"face"	
		"l"	4	180	2731	-232	-2731	
		"lt"	4	183	184	236	235	

		"face"	
		"l"	4	181	2732	-233	-2732	
		"lt"	4	184	185	237	236	

		"face"	
		"l"	4	182	2733	-234	-2733	
		"lt"	4	185	186	238	237	

		"face"	
		"l"	4	183	2734	-235	-2734	
		"lt"	4	186	187	239	238	

		"face"	
		"l"	4	184	2735	-236	-2735	
		"lt"	4	187	188	240	239	

		"face"	
		"l"	4	185	2736	-237	-2736	
		"lt"	4	188	189	241	240	

		"face"	
		"l"	4	186	2737	-238	-2737	
		"lt"	4	189	190	242	241	

		"face"	
		"l"	4	187	2738	-239	-2738	
		"lt"	4	190	191	243	242	

		"face"	
		"l"	4	188	2739	-240	-2739	
		"lt"	4	191	192	244	243	

		"face"	
		"l"	4	189	2740	-241	-2740	
		"lt"	4	192	193	245	244	

		"face"	
		"l"	4	190	2741	-242	-2741	
		"lt"	4	193	194	246	245	

		"face"	
		"l"	4	191	2742	-243	-2742	
		"lt"	4	194	195	247	246	

		"face"	
		"l"	4	192	2743	-244	-2743	
		"lt"	4	195	196	248	247	

		"face"	
		"l"	4	193	2744	-245	-2744	
		"lt"	4	196	197	249	248	

		"face"	
		"l"	4	194	2745	-246	-2745	
		"lt"	4	197	198	250	249	

		"face"	
		"l"	4	195	2746	-247	-2746	
		"lt"	4	198	199	251	250	

		"face"	
		"l"	4	196	2747	-248	-2747	
		"lt"	4	199	200	252	251	

		"face"	
		"l"	4	197	2748	-249	-2748	
		"lt"	4	200	201	253	252	

		"face"	
		"l"	4	198	2749	-250	-2749	
		"lt"	4	201	202	254	253	

		"face"	
		"l"	4	199	2750	-251	-2750	
		"lt"	4	202	203	255	254	

		"face"	
		"l"	4	200	2751	-252	-2751	
		"lt"	4	203	204	256	255	

		"face"	
		"l"	4	201	2752	-253	-2752	
		"lt"	4	204	205	257	256	

		"face"	
		"l"	4	202	2753	-254	-2753	
		"lt"	4	205	206	258	257	

		"face"	
		"l"	4	203	2703	-255	-2754	
		"lt"	4	206	207	259	258	

		"face"	
		"l"	4	204	2755	-256	-2755	
		"lt"	4	208	209	261	260	

		"face"	
		"l"	4	205	2756	-257	-2756	
		"lt"	4	209	210	262	261	

		"face"	
		"l"	4	206	2757	-258	-2757	
		"lt"	4	210	211	263	262	

		"face"	
		"l"	4	207	2758	-259	-2758	
		"lt"	4	211	212	264	263	

		"face"	
		"l"	4	208	2759	-260	-2759	
		"lt"	4	212	213	265	264	

		"face"	
		"l"	4	209	2760	-261	-2760	
		"lt"	4	213	214	266	265	

		"face"	
		"l"	4	210	2761	-262	-2761	
		"lt"	4	214	215	267	266	

		"face"	
		"l"	4	211	2762	-263	-2762	
		"lt"	4	215	216	268	267	

		"face"	
		"l"	4	212	2763	-264	-2763	
		"lt"	4	216	217	269	268	

		"face"	
		"l"	4	213	2764	-265	-2764	
		"lt"	4	217	218	270	269	

		"face"	
		"l"	4	214	2765	-266	-2765	
		"lt"	4	218	219	271	270	

		"face"	
		"l"	4	215	2766	-267	-2766	
		"lt"	4	219	220	272	271	

		"face"	
		"l"	4	216	2767	-268	-2767	
		"lt"	4	220	221	273	272	

		"face"	
		"l"	4	217	2768	-269	-2768	
		"lt"	4	221	222	274	273	

		"face"	
		"l"	4	218	2769	-270	-2769	
		"lt"	4	222	223	275	274	

		"face"	
		"l"	4	219	2770	-271	-2770	
		"lt"	4	223	224	276	275	

		"face"	
		"l"	4	220	2771	-272	-2771	
		"lt"	4	224	225	277	276	

		"face"	
		"l"	4	221	2772	-273	-2772	
		"lt"	4	225	226	278	277	

		"face"	
		"l"	4	222	2773	-274	-2773	
		"lt"	4	226	227	279	278	

		"face"	
		"l"	4	223	2774	-275	-2774	
		"lt"	4	227	228	280	279	

		"face"	
		"l"	4	224	2775	-276	-2775	
		"lt"	4	228	229	281	280	

		"face"	
		"l"	4	225	2776	-277	-2776	
		"lt"	4	229	230	282	281	

		"face"	
		"l"	4	226	2777	-278	-2777	
		"lt"	4	230	231	283	282	

		"face"	
		"l"	4	227	2778	-279	-2778	
		"lt"	4	231	232	284	283	

		"face"	
		"l"	4	228	2779	-280	-2779	
		"lt"	4	232	233	285	284	

		"face"	
		"l"	4	229	2780	-281	-2780	
		"lt"	4	233	234	286	285	

		"face"	
		"l"	4	230	2781	-282	-2781	
		"lt"	4	234	235	287	286	

		"face"	
		"l"	4	231	2782	-283	-2782	
		"lt"	4	235	236	288	287	

		"face"	
		"l"	4	232	2783	-284	-2783	
		"lt"	4	236	237	289	288	

		"face"	
		"l"	4	233	2784	-285	-2784	
		"lt"	4	237	238	290	289	

		"face"	
		"l"	4	234	2785	-286	-2785	
		"lt"	4	238	239	291	290	

		"face"	
		"l"	4	235	2786	-287	-2786	
		"lt"	4	239	240	292	291	

		"face"	
		"l"	4	236	2787	-288	-2787	
		"lt"	4	240	241	293	292	

		"face"	
		"l"	4	237	2788	-289	-2788	
		"lt"	4	241	242	294	293	

		"face"	
		"l"	4	238	2789	-290	-2789	
		"lt"	4	242	243	295	294	

		"face"	
		"l"	4	239	2790	-291	-2790	
		"lt"	4	243	244	296	295	

		"face"	
		"l"	4	240	2791	-292	-2791	
		"lt"	4	244	245	297	296	

		"face"	
		"l"	4	241	2792	-293	-2792	
		"lt"	4	245	246	298	297	

		"face"	
		"l"	4	242	2793	-294	-2793	
		"lt"	4	246	247	299	298	

		"face"	
		"l"	4	243	2794	-295	-2794	
		"lt"	4	247	248	300	299	

		"face"	
		"l"	4	244	2795	-296	-2795	
		"lt"	4	248	249	301	300	

		"face"	
		"l"	4	245	2796	-297	-2796	
		"lt"	4	249	250	302	301	

		"face"	
		"l"	4	246	2797	-298	-2797	
		"lt"	4	250	251	303	302	

		"face"	
		"l"	4	247	2798	-299	-2798	
		"lt"	4	251	252	304	303	

		"face"	
		"l"	4	248	2799	-300	-2799	
		"lt"	4	252	253	305	304	

		"face"	
		"l"	4	249	2800	-301	-2800	
		"lt"	4	253	254	306	305	

		"face"	
		"l"	4	250	2801	-302	-2801	
		"lt"	4	254	255	307	306	

		"face"	
		"l"	4	251	2802	-303	-2802	
		"lt"	4	255	256	308	307	

		"face"	
		"l"	4	252	2803	-304	-2803	
		"lt"	4	256	257	309	308	

		"face"	
		"l"	4	253	2804	-305	-2804	
		"lt"	4	257	258	310	309	

		"face"	
		"l"	4	254	2754	-306	-2805	
		"lt"	4	258	259	311	310	

		"face"	
		"l"	4	255	2806	-307	-2806	
		"lt"	4	260	261	313	312	

		"face"	
		"l"	4	256	2807	-308	-2807	
		"lt"	4	261	262	314	313	

		"face"	
		"l"	4	257	2808	-309	-2808	
		"lt"	4	262	263	315	314	

		"face"	
		"l"	4	258	2809	-310	-2809	
		"lt"	4	263	264	316	315	

		"face"	
		"l"	4	259	2810	-311	-2810	
		"lt"	4	264	265	317	316	

		"face"	
		"l"	4	260	2811	-312	-2811	
		"lt"	4	265	266	318	317	

		"face"	
		"l"	4	261	2812	-313	-2812	
		"lt"	4	266	267	319	318	

		"face"	
		"l"	4	262	2813	-314	-2813	
		"lt"	4	267	268	320	319	

		"face"	
		"l"	4	263	2814	-315	-2814	
		"lt"	4	268	269	321	320	

		"face"	
		"l"	4	264	2815	-316	-2815	
		"lt"	4	269	270	322	321	

		"face"	
		"l"	4	265	2816	-317	-2816	
		"lt"	4	270	271	323	322	

		"face"	
		"l"	4	266	2817	-318	-2817	
		"lt"	4	271	272	324	323	

		"face"	
		"l"	4	267	2818	-319	-2818	
		"lt"	4	272	273	325	324	

		"face"	
		"l"	4	268	2819	-320	-2819	
		"lt"	4	273	274	326	325	

		"face"	
		"l"	4	269	2820	-321	-2820	
		"lt"	4	274	275	327	326	

		"face"	
		"l"	4	270	2821	-322	-2821	
		"lt"	4	275	276	328	327	

		"face"	
		"l"	4	271	2822	-323	-2822	
		"lt"	4	276	277	329	328	

		"face"	
		"l"	4	272	2823	-324	-2823	
		"lt"	4	277	278	330	329	

		"face"	
		"l"	4	273	2824	-325	-2824	
		"lt"	4	278	279	331	330	

		"face"	
		"l"	4	274	2825	-326	-2825	
		"lt"	4	279	280	332	331	

		"face"	
		"l"	4	275	2826	-327	-2826	
		"lt"	4	280	281	333	332	

		"face"	
		"l"	4	276	2827	-328	-2827	
		"lt"	4	281	282	334	333	

		"face"	
		"l"	4	277	2828	-329	-2828	
		"lt"	4	282	283	335	334	

		"face"	
		"l"	4	278	2829	-330	-2829	
		"lt"	4	283	284	336	335	

		"face"	
		"l"	4	279	2830	-331	-2830	
		"lt"	4	284	285	337	336	

		"face"	
		"l"	4	280	2831	-332	-2831	
		"lt"	4	285	286	338	337	

		"face"	
		"l"	4	281	2832	-333	-2832	
		"lt"	4	286	287	339	338	

		"face"	
		"l"	4	282	2833	-334	-2833	
		"lt"	4	287	288	340	339	

		"face"	
		"l"	4	283	2834	-335	-2834	
		"lt"	4	288	289	341	340	

		"face"	
		"l"	4	284	2835	-336	-2835	
		"lt"	4	289	290	342	341	

		"face"	
		"l"	4	285	2836	-337	-2836	
		"lt"	4	290	291	343	342	

		"face"	
		"l"	4	286	2837	-338	-2837	
		"lt"	4	291	292	344	343	

		"face"	
		"l"	4	287	2838	-339	-2838	
		"lt"	4	292	293	345	344	

		"face"	
		"l"	4	288	2839	-340	-2839	
		"lt"	4	293	294	346	345	

		"face"	
		"l"	4	289	2840	-341	-2840	
		"lt"	4	294	295	347	346	

		"face"	
		"l"	4	290	2841	-342	-2841	
		"lt"	4	295	296	348	347	

		"face"	
		"l"	4	291	2842	-343	-2842	
		"lt"	4	296	297	349	348	

		"face"	
		"l"	4	292	2843	-344	-2843	
		"lt"	4	297	298	350	349	

		"face"	
		"l"	4	293	2844	-345	-2844	
		"lt"	4	298	299	351	350	

		"face"	
		"l"	4	294	2845	-346	-2845	
		"lt"	4	299	300	352	351	

		"face"	
		"l"	4	295	2846	-347	-2846	
		"lt"	4	300	301	353	352	

		"face"	
		"l"	4	296	2847	-348	-2847	
		"lt"	4	301	302	354	353	

		"face"	
		"l"	4	297	2848	-349	-2848	
		"lt"	4	302	303	355	354	

		"face"	
		"l"	4	298	2849	-350	-2849	
		"lt"	4	303	304	356	355	

		"face"	
		"l"	4	299	2850	-351	-2850	
		"lt"	4	304	305	357	356	

		"face"	
		"l"	4	300	2851	-352	-2851	
		"lt"	4	305	306	358	357	

		"face"	
		"l"	4	301	2852	-353	-2852	
		"lt"	4	306	307	359	358	

		"face"	
		"l"	4	302	2853	-354	-2853	
		"lt"	4	307	308	360	359	

		"face"	
		"l"	4	303	2854	-355	-2854	
		"lt"	4	308	309	361	360	

		"face"	
		"l"	4	304	2855	-356	-2855	
		"lt"	4	309	310	362	361	

		"face"	
		"l"	4	305	2805	-357	-2856	
		"lt"	4	310	311	363	362	

		"face"	
		"l"	4	306	2857	-358	-2857	
		"lt"	4	312	313	365	364	

		"face"	
		"l"	4	307	2858	-359	-2858	
		"lt"	4	313	314	366	365	

		"face"	
		"l"	4	308	2859	-360	-2859	
		"lt"	4	314	315	367	366	

		"face"	
		"l"	4	309	2860	-361	-2860	
		"lt"	4	315	316	368	367	

		"face"	
		"l"	4	310	2861	-362	-2861	
		"lt"	4	316	317	369	368	

		"face"	
		"l"	4	311	2862	-363	-2862	
		"lt"	4	317	318	370	369	

		"face"	
		"l"	4	312	2863	-364	-2863	
		"lt"	4	318	319	371	370	

		"face"	
		"l"	4	313	2864	-365	-2864	
		"lt"	4	319	320	372	371	

		"face"	
		"l"	4	314	2865	-366	-2865	
		"lt"	4	320	321	373	372	

		"face"	
		"l"	4	315	2866	-367	-2866	
		"lt"	4	321	322	374	373	

		"face"	
		"l"	4	316	2867	-368	-2867	
		"lt"	4	322	323	375	374	

		"face"	
		"l"	4	317	2868	-369	-2868	
		"lt"	4	323	324	376	375	

		"face"	
		"l"	4	318	2869	-370	-2869	
		"lt"	4	324	325	377	376	

		"face"	
		"l"	4	319	2870	-371	-2870	
		"lt"	4	325	326	378	377	

		"face"	
		"l"	4	320	2871	-372	-2871	
		"lt"	4	326	327	379	378	

		"face"	
		"l"	4	321	2872	-373	-2872	
		"lt"	4	327	328	380	379	

		"face"	
		"l"	4	322	2873	-374	-2873	
		"lt"	4	328	329	381	380	

		"face"	
		"l"	4	323	2874	-375	-2874	
		"lt"	4	329	330	382	381	

		"face"	
		"l"	4	324	2875	-376	-2875	
		"lt"	4	330	331	383	382	

		"face"	
		"l"	4	325	2876	-377	-2876	
		"lt"	4	331	332	384	383	

		"face"	
		"l"	4	326	2877	-378	-2877	
		"lt"	4	332	333	385	384	

		"face"	
		"l"	4	327	2878	-379	-2878	
		"lt"	4	333	334	386	385	

		"face"	
		"l"	4	328	2879	-380	-2879	
		"lt"	4	334	335	387	386	

		"face"	
		"l"	4	329	2880	-381	-2880	
		"lt"	4	335	336	388	387	

		"face"	
		"l"	4	330	2881	-382	-2881	
		"lt"	4	336	337	389	388	

		"face"	
		"l"	4	331	2882	-383	-2882	
		"lt"	4	337	338	390	389	

		"face"	
		"l"	4	332	2883	-384	-2883	
		"lt"	4	338	339	391	390	

		"face"	
		"l"	4	333	2884	-385	-2884	
		"lt"	4	339	340	392	391	

		"face"	
		"l"	4	334	2885	-386	-2885	
		"lt"	4	340	341	393	392	

		"face"	
		"l"	4	335	2886	-387	-2886	
		"lt"	4	341	342	394	393	

		"face"	
		"l"	4	336	2887	-388	-2887	
		"lt"	4	342	343	395	394	

		"face"	
		"l"	4	337	2888	-389	-2888	
		"lt"	4	343	344	396	395	

		"face"	
		"l"	4	338	2889	-390	-2889	
		"lt"	4	344	345	397	396	

		"face"	
		"l"	4	339	2890	-391	-2890	
		"lt"	4	345	346	398	397	

		"face"	
		"l"	4	340	2891	-392	-2891	
		"lt"	4	346	347	399	398	

		"face"	
		"l"	4	341	2892	-393	-2892	
		"lt"	4	347	348	400	399	

		"face"	
		"l"	4	342	2893	-394	-2893	
		"lt"	4	348	349	401	400	

		"face"	
		"l"	4	343	2894	-395	-2894	
		"lt"	4	349	350	402	401	

		"face"	
		"l"	4	344	2895	-396	-2895	
		"lt"	4	350	351	403	402	

		"face"	
		"l"	4	345	2896	-397	-2896	
		"lt"	4	351	352	404	403	

		"face"	
		"l"	4	346	2897	-398	-2897	
		"lt"	4	352	353	405	404	

		"face"	
		"l"	4	347	2898	-399	-2898	
		"lt"	4	353	354	406	405	

		"face"	
		"l"	4	348	2899	-400	-2899	
		"lt"	4	354	355	407	406	

		"face"	
		"l"	4	349	2900	-401	-2900	
		"lt"	4	355	356	408	407	

		"face"	
		"l"	4	350	2901	-402	-2901	
		"lt"	4	356	357	409	408	

		"face"	
		"l"	4	351	2902	-403	-2902	
		"lt"	4	357	358	410	409	

		"face"	
		"l"	4	352	2903	-404	-2903	
		"lt"	4	358	359	411	410	

		"face"	
		"l"	4	353	2904	-405	-2904	
		"lt"	4	359	360	412	411	

		"face"	
		"l"	4	354	2905	-406	-2905	
		"lt"	4	360	361	413	412	

		"face"	
		"l"	4	355	2906	-407	-2906	
		"lt"	4	361	362	414	413	

		"face"	
		"l"	4	356	2856	-408	-2907	
		"lt"	4	362	363	415	414	

		"face"	
		"l"	4	357	2908	-409	-2908	
		"lt"	4	364	365	417	416	

		"face"	
		"l"	4	358	2909	-410	-2909	
		"lt"	4	365	366	418	417	

		"face"	
		"l"	4	359	2910	-411	-2910	
		"lt"	4	366	367	419	418	

		"face"	
		"l"	4	360	2911	-412	-2911	
		"lt"	4	367	368	420	419	

		"face"	
		"l"	4	361	2912	-413	-2912	
		"lt"	4	368	369	421	420	

		"face"	
		"l"	4	362	2913	-414	-2913	
		"lt"	4	369	370	422	421	

		"face"	
		"l"	4	363	2914	-415	-2914	
		"lt"	4	370	371	423	422	

		"face"	
		"l"	4	364	2915	-416	-2915	
		"lt"	4	371	372	424	423	

		"face"	
		"l"	4	365	2916	-417	-2916	
		"lt"	4	372	373	425	424	

		"face"	
		"l"	4	366	2917	-418	-2917	
		"lt"	4	373	374	426	425	

		"face"	
		"l"	4	367	2918	-419	-2918	
		"lt"	4	374	375	427	426	

		"face"	
		"l"	4	368	2919	-420	-2919	
		"lt"	4	375	376	428	427	

		"face"	
		"l"	4	369	2920	-421	-2920	
		"lt"	4	376	377	429	428	

		"face"	
		"l"	4	370	2921	-422	-2921	
		"lt"	4	377	378	430	429	

		"face"	
		"l"	4	371	2922	-423	-2922	
		"lt"	4	378	379	431	430	

		"face"	
		"l"	4	372	2923	-424	-2923	
		"lt"	4	379	380	432	431	

		"face"	
		"l"	4	373	2924	-425	-2924	
		"lt"	4	380	381	433	432	

		"face"	
		"l"	4	374	2925	-426	-2925	
		"lt"	4	381	382	434	433	

		"face"	
		"l"	4	375	2926	-427	-2926	
		"lt"	4	382	383	435	434	

		"face"	
		"l"	4	376	2927	-428	-2927	
		"lt"	4	383	384	436	435	

		"face"	
		"l"	4	377	2928	-429	-2928	
		"lt"	4	384	385	437	436	

		"face"	
		"l"	4	378	2929	-430	-2929	
		"lt"	4	385	386	438	437	

		"face"	
		"l"	4	379	2930	-431	-2930	
		"lt"	4	386	387	439	438	

		"face"	
		"l"	4	380	2931	-432	-2931	
		"lt"	4	387	388	440	439	

		"face"	
		"l"	4	381	2932	-433	-2932	
		"lt"	4	388	389	441	440	

		"face"	
		"l"	4	382	2933	-434	-2933	
		"lt"	4	389	390	442	441	

		"face"	
		"l"	4	383	2934	-435	-2934	
		"lt"	4	390	391	443	442	

		"face"	
		"l"	4	384	2935	-436	-2935	
		"lt"	4	391	392	444	443	

		"face"	
		"l"	4	385	2936	-437	-2936	
		"lt"	4	392	393	445	444	

		"face"	
		"l"	4	386	2937	-438	-2937	
		"lt"	4	393	394	446	445	

		"face"	
		"l"	4	387	2938	-439	-2938	
		"lt"	4	394	395	447	446	

		"face"	
		"l"	4	388	2939	-440	-2939	
		"lt"	4	395	396	448	447	

		"face"	
		"l"	4	389	2940	-441	-2940	
		"lt"	4	396	397	449	448	

		"face"	
		"l"	4	390	2941	-442	-2941	
		"lt"	4	397	398	450	449	

		"face"	
		"l"	4	391	2942	-443	-2942	
		"lt"	4	398	399	451	450	

		"face"	
		"l"	4	392	2943	-444	-2943	
		"lt"	4	399	400	452	451	

		"face"	
		"l"	4	393	2944	-445	-2944	
		"lt"	4	400	401	453	452	

		"face"	
		"l"	4	394	2945	-446	-2945	
		"lt"	4	401	402	454	453	

		"face"	
		"l"	4	395	2946	-447	-2946	
		"lt"	4	402	403	455	454	

		"face"	
		"l"	4	396	2947	-448	-2947	
		"lt"	4	403	404	456	455	

		"face"	
		"l"	4	397	2948	-449	-2948	
		"lt"	4	404	405	457	456	

		"face"	
		"l"	4	398	2949	-450	-2949	
		"lt"	4	405	406	458	457	

		"face"	
		"l"	4	399	2950	-451	-2950	
		"lt"	4	406	407	459	458	

		"face"	
		"l"	4	400	2951	-452	-2951	
		"lt"	4	407	408	460	459	

		"face"	
		"l"	4	401	2952	-453	-2952	
		"lt"	4	408	409	461	460	

		"face"	
		"l"	4	402	2953	-454	-2953	
		"lt"	4	409	410	462	461	

		"face"	
		"l"	4	403	2954	-455	-2954	
		"lt"	4	410	411	463	462	

		"face"	
		"l"	4	404	2955	-456	-2955	
		"lt"	4	411	412	464	463	

		"face"	
		"l"	4	405	2956	-457	-2956	
		"lt"	4	412	413	465	464	

		"face"	
		"l"	4	406	2957	-458	-2957	
		"lt"	4	413	414	466	465	

		"face"	
		"l"	4	407	2907	-459	-2958	
		"lt"	4	414	415	467	466	

		"face"	
		"l"	4	408	2959	-460	-2959	
		"lt"	4	416	417	469	468	

		"face"	
		"l"	4	409	2960	-461	-2960	
		"lt"	4	417	418	470	469	

		"face"	
		"l"	4	410	2961	-462	-2961	
		"lt"	4	418	419	471	470	

		"face"	
		"l"	4	411	2962	-463	-2962	
		"lt"	4	419	420	472	471	

		"face"	
		"l"	4	412	2963	-464	-2963	
		"lt"	4	420	421	473	472	

		"face"	
		"l"	4	413	2964	-465	-2964	
		"lt"	4	421	422	474	473	

		"face"	
		"l"	4	414	2965	-466	-2965	
		"lt"	4	422	423	475	474	

		"face"	
		"l"	4	415	2966	-467	-2966	
		"lt"	4	423	424	476	475	

		"face"	
		"l"	4	416	2967	-468	-2967	
		"lt"	4	424	425	477	476	

		"face"	
		"l"	4	417	2968	-469	-2968	
		"lt"	4	425	426	478	477	

		"face"	
		"l"	4	418	2969	-470	-2969	
		"lt"	4	426	427	479	478	

		"face"	
		"l"	4	419	2970	-471	-2970	
		"lt"	4	427	428	480	479	

		"face"	
		"l"	4	420	2971	-472	-2971	
		"lt"	4	428	429	481	480	

		"face"	
		"l"	4	421	2972	-473	-2972	
		"lt"	4	429	430	482	481	

		"face"	
		"l"	4	422	2973	-474	-2973	
		"lt"	4	430	431	483	482	

		"face"	
		"l"	4	423	2974	-475	-2974	
		"lt"	4	431	432	484	483	

		"face"	
		"l"	4	424	2975	-476	-2975	
		"lt"	4	432	433	485	484	

		"face"	
		"l"	4	425	2976	-477	-2976	
		"lt"	4	433	434	486	485	

		"face"	
		"l"	4	426	2977	-478	-2977	
		"lt"	4	434	435	487	486	

		"face"	
		"l"	4	427	2978	-479	-2978	
		"lt"	4	435	436	488	487	

		"face"	
		"l"	4	428	2979	-480	-2979	
		"lt"	4	436	437	489	488	

		"face"	
		"l"	4	429	2980	-481	-2980	
		"lt"	4	437	438	490	489	

		"face"	
		"l"	4	430	2981	-482	-2981	
		"lt"	4	438	439	491	490	

		"face"	
		"l"	4	431	2982	-483	-2982	
		"lt"	4	439	440	492	491	

		"face"	
		"l"	4	432	2983	-484	-2983	
		"lt"	4	440	441	493	492	

		"face"	
		"l"	4	433	2984	-485	-2984	
		"lt"	4	441	442	494	493	

		"face"	
		"l"	4	434	2985	-486	-2985	
		"lt"	4	442	443	495	494	

		"face"	
		"l"	4	435	2986	-487	-2986	
		"lt"	4	443	444	496	495	

		"face"	
		"l"	4	436	2987	-488	-2987	
		"lt"	4	444	445	497	496	

		"face"	
		"l"	4	437	2988	-489	-2988	
		"lt"	4	445	446	498	497	

		"face"	
		"l"	4	438	2989	-490	-2989	
		"lt"	4	446	447	499	498	

		"face"	
		"l"	4	439	2990	-491	-2990	
		"lt"	4	447	448	500	499	

		"face"	
		"l"	4	440	2991	-492	-2991	
		"lt"	4	448	449	501	500	

		"face"	
		"l"	4	441	2992	-493	-2992	
		"lt"	4	449	450	502	501	

		"face"	
		"l"	4	442	2993	-494	-2993	
		"lt"	4	450	451	503	502	

		"face"	
		"l"	4	443	2994	-495	-2994	
		"lt"	4	451	452	504	503	

		"face"	
		"l"	4	444	2995	-496	-2995	
		"lt"	4	452	453	505	504	

		"face"	
		"l"	4	445	2996	-497	-2996	
		"lt"	4	453	454	506	505	

		"face"	
		"l"	4	446	2997	-498	-2997	
		"lt"	4	454	455	507	506	

		"face"	
		"l"	4	447	2998	-499	-2998	
		"lt"	4	455	456	508	507	

		"face"	
		"l"	4	448	2999	-500	-2999	
		"lt"	4	456	457	509	508	

		"face"	
		"l"	4	449	3000	-501	-3000	
		"lt"	4	457	458	510	509	

		"face"	
		"l"	4	450	3001	-502	-3001	
		"lt"	4	458	459	511	510	

		"face"	
		"l"	4	451	3002	-503	-3002	
		"lt"	4	459	460	512	511	

		"face"	
		"l"	4	452	3003	-504	-3003	
		"lt"	4	460	461	513	512	

		"face"	
		"l"	4	453	3004	-505	-3004	
		"lt"	4	461	462	514	513	

		"face"	
		"l"	4	454	3005	-506	-3005	
		"lt"	4	462	463	515	514	

		"face"	
		"l"	4	455	3006	-507	-3006	
		"lt"	4	463	464	516	515	

		"face"	
		"l"	4	456	3007	-508	-3007	
		"lt"	4	464	465	517	516	

		"face"	
		"l"	4	457	3008	-509	-3008	
		"lt"	4	465	466	518	517	

		"face"	
		"l"	4	458	2958	-510	-3009	
		"lt"	4	466	467	519	518	

		"face"	
		"l"	4	459	3010	-511	-3010	
		"lt"	4	468	469	521	520	

		"face"	
		"l"	4	460	3011	-512	-3011	
		"lt"	4	469	470	522	521	

		"face"	
		"l"	4	461	3012	-513	-3012	
		"lt"	4	470	471	523	522	

		"face"	
		"l"	4	462	3013	-514	-3013	
		"lt"	4	471	472	524	523	

		"face"	
		"l"	4	463	3014	-515	-3014	
		"lt"	4	472	473	525	524	

		"face"	
		"l"	4	464	3015	-516	-3015	
		"lt"	4	473	474	526	525	

		"face"	
		"l"	4	465	3016	-517	-3016	
		"lt"	4	474	475	527	526	

		"face"	
		"l"	4	466	3017	-518	-3017	
		"lt"	4	475	476	528	527	

		"face"	
		"l"	4	467	3018	-519	-3018	
		"lt"	4	476	477	529	528	

		"face"	
		"l"	4	468	3019	-520	-3019	
		"lt"	4	477	478	530	529	

		"face"	
		"l"	4	469	3020	-521	-3020	
		"lt"	4	478	479	531	530	

		"face"	
		"l"	4	470	3021	-522	-3021	
		"lt"	4	479	480	532	531	

		"face"	
		"l"	4	471	3022	-523	-3022	
		"lt"	4	480	481	533	532	

		"face"	
		"l"	4	472	3023	-524	-3023	
		"lt"	4	481	482	534	533	

		"face"	
		"l"	4	473	3024	-525	-3024	
		"lt"	4	482	483	535	534	

		"face"	
		"l"	4	474	3025	-526	-3025	
		"lt"	4	483	484	536	535	

		"face"	
		"l"	4	475	3026	-527	-3026	
		"lt"	4	484	485	537	536	

		"face"	
		"l"	4	476	3027	-528	-3027	
		"lt"	4	485	486	538	537	

		"face"	
		"l"	4	477	3028	-529	-3028	
		"lt"	4	486	487	539	538	

		"face"	
		"l"	4	478	3029	-530	-3029	
		"lt"	4	487	488	540	539	

		"face"	
		"l"	4	479	3030	-531	-3030	
		"lt"	4	488	489	541	540	

		"face"	
		"l"	4	480	3031	-532	-3031	
		"lt"	4	489	490	542	541	

		"face"	
		"l"	4	481	3032	-533	-3032	
		"lt"	4	490	491	543	542	

		"face"	
		"l"	4	482	3033	-534	-3033	
		"lt"	4	491	492	544	543	

		"face"	
		"l"	4	483	3034	-535	-3034	
		"lt"	4	492	493	545	544	

		"face"	
		"l"	4	484	3035	-536	-3035	
		"lt"	4	493	494	546	545	

		"face"	
		"l"	4	485	3036	-537	-3036	
		"lt"	4	494	495	547	546	

		"face"	
		"l"	4	486	3037	-538	-3037	
		"lt"	4	495	496	548	547	

		"face"	
		"l"	4	487	3038	-539	-3038	
		"lt"	4	496	497	549	548	

		"face"	
		"l"	4	488	3039	-540	-3039	
		"lt"	4	497	498	550	549	

		"face"	
		"l"	4	489	3040	-541	-3040	
		"lt"	4	498	499	551	550	

		"face"	
		"l"	4	490	3041	-542	-3041	
		"lt"	4	499	500	552	551	

		"face"	
		"l"	4	491	3042	-543	-3042	
		"lt"	4	500	501	553	552	

		"face"	
		"l"	4	492	3043	-544	-3043	
		"lt"	4	501	502	554	553	

		"face"	
		"l"	4	493	3044	-545	-3044	
		"lt"	4	502	503	555	554	

		"face"	
		"l"	4	494	3045	-546	-3045	
		"lt"	4	503	504	556	555	

		"face"	
		"l"	4	495	3046	-547	-3046	
		"lt"	4	504	505	557	556	

		"face"	
		"l"	4	496	3047	-548	-3047	
		"lt"	4	505	506	558	557	

		"face"	
		"l"	4	497	3048	-549	-3048	
		"lt"	4	506	507	559	558	

		"face"	
		"l"	4	498	3049	-550	-3049	
		"lt"	4	507	508	560	559	

		"face"	
		"l"	4	499	3050	-551	-3050	
		"lt"	4	508	509	561	560	

		"face"	
		"l"	4	500	3051	-552	-3051	
		"lt"	4	509	510	562	561	

		"face"	
		"l"	4	501	3052	-553	-3052	
		"lt"	4	510	511	563	562	

		"face"	
		"l"	4	502	3053	-554	-3053	
		"lt"	4	511	512	564	563	

		"face"	
		"l"	4	503	3054	-555	-3054	
		"lt"	4	512	513	565	564	

		"face"	
		"l"	4	504	3055	-556	-3055	
		"lt"	4	513	514	566	565	

		"face"	
		"l"	4	505	3056	-557	-3056	
		"lt"	4	514	515	567	566	

		"face"	
		"l"	4	506	3057	-558	-3057	
		"lt"	4	515	516	568	567	

		"face"	
		"l"	4	507	3058	-559	-3058	
		"lt"	4	516	517	569	568	

		"face"	
		"l"	4	508	3059	-560	-3059	
		"lt"	4	517	518	570	569	

		"face"	
		"l"	4	509	3009	-561	-3060	
		"lt"	4	518	519	571	570	

		"face"	
		"l"	4	510	3061	-562	-3061	
		"lt"	4	520	521	573	572	

		"face"	
		"l"	4	511	3062	-563	-3062	
		"lt"	4	521	522	574	573	

		"face"	
		"l"	4	512	3063	-564	-3063	
		"lt"	4	522	523	575	574	

		"face"	
		"l"	4	513	3064	-565	-3064	
		"lt"	4	523	524	576	575	

		"face"	
		"l"	4	514	3065	-566	-3065	
		"lt"	4	524	525	577	576	

		"face"	
		"l"	4	515	3066	-567	-3066	
		"lt"	4	525	526	578	577	

		"face"	
		"l"	4	516	3067	-568	-3067	
		"lt"	4	526	527	579	578	

		"face"	
		"l"	4	517	3068	-569	-3068	
		"lt"	4	527	528	580	579	

		"face"	
		"l"	4	518	3069	-570	-3069	
		"lt"	4	528	529	581	580	

		"face"	
		"l"	4	519	3070	-571	-3070	
		"lt"	4	529	530	582	581	

		"face"	
		"l"	4	520	3071	-572	-3071	
		"lt"	4	530	531	583	582	

		"face"	
		"l"	4	521	3072	-573	-3072	
		"lt"	4	531	532	584	583	

		"face"	
		"l"	4	522	3073	-574	-3073	
		"lt"	4	532	533	585	584	

		"face"	
		"l"	4	523	3074	-575	-3074	
		"lt"	4	533	534	586	585	

		"face"	
		"l"	4	524	3075	-576	-3075	
		"lt"	4	534	535	587	586	

		"face"	
		"l"	4	525	3076	-577	-3076	
		"lt"	4	535	536	588	587	

		"face"	
		"l"	4	526	3077	-578	-3077	
		"lt"	4	536	537	589	588	

		"face"	
		"l"	4	527	3078	-579	-3078	
		"lt"	4	537	538	590	589	

		"face"	
		"l"	4	528	3079	-580	-3079	
		"lt"	4	538	539	591	590	

		"face"	
		"l"	4	529	3080	-581	-3080	
		"lt"	4	539	540	592	591	

		"face"	
		"l"	4	530	3081	-582	-3081	
		"lt"	4	540	541	593	592	

		"face"	
		"l"	4	531	3082	-583	-3082	
		"lt"	4	541	542	594	593	

		"face"	
		"l"	4	532	3083	-584	-3083	
		"lt"	4	542	543	595	594	

		"face"	
		"l"	4	533	3084	-585	-3084	
		"lt"	4	543	544	596	595	

		"face"	
		"l"	4	534	3085	-586	-3085	
		"lt"	4	544	545	597	596	

		"face"	
		"l"	4	535	3086	-587	-3086	
		"lt"	4	545	546	598	597	

		"face"	
		"l"	4	536	3087	-588	-3087	
		"lt"	4	546	547	599	598	

		"face"	
		"l"	4	537	3088	-589	-3088	
		"lt"	4	547	548	600	599	

		"face"	
		"l"	4	538	3089	-590	-3089	
		"lt"	4	548	549	601	600	

		"face"	
		"l"	4	539	3090	-591	-3090	
		"lt"	4	549	550	602	601	

		"face"	
		"l"	4	540	3091	-592	-3091	
		"lt"	4	550	551	603	602	

		"face"	
		"l"	4	541	3092	-593	-3092	
		"lt"	4	551	552	604	603	

		"face"	
		"l"	4	542	3093	-594	-3093	
		"lt"	4	552	553	605	604	

		"face"	
		"l"	4	543	3094	-595	-3094	
		"lt"	4	553	554	606	605	

		"face"	
		"l"	4	544	3095	-596	-3095	
		"lt"	4	554	555	607	606	

		"face"	
		"l"	4	545	3096	-597	-3096	
		"lt"	4	555	556	608	607	

		"face"	
		"l"	4	546	3097	-598	-3097	
		"lt"	4	556	557	609	608	

		"face"	
		"l"	4	547	3098	-599	-3098	
		"lt"	4	557	558	610	609	

		"face"	
		"l"	4	548	3099	-600	-3099	
		"lt"	4	558	559	611	610	

		"face"	
		"l"	4	549	3100	-601	-3100	
		"lt"	4	559	560	612	611	

		"face"	
		"l"	4	550	3101	-602	-3101	
		"lt"	4	560	561	613	612	

		"face"	
		"l"	4	551	3102	-603	-3102	
		"lt"	4	561	562	614	613	

		"face"	
		"l"	4	552	3103	-604	-3103	
		"lt"	4	562	563	615	614	

		"face"	
		"l"	4	553	3104	-605	-3104	
		"lt"	4	563	564	616	615	

		"face"	
		"l"	4	554	3105	-606	-3105	
		"lt"	4	564	565	617	616	

		"face"	
		"l"	4	555	3106	-607	-3106	
		"lt"	4	565	566	618	617	

		"face"	
		"l"	4	556	3107	-608	-3107	
		"lt"	4	566	567	619	618	

		"face"	
		"l"	4	557	3108	-609	-3108	
		"lt"	4	567	568	620	619	

		"face"	
		"l"	4	558	3109	-610	-3109	
		"lt"	4	568	569	621	620	

		"face"	
		"l"	4	559	3110	-611	-3110	
		"lt"	4	569	570	622	621	

		"face"	
		"l"	4	560	3060	-612	-3111	
		"lt"	4	570	571	623	622	

		"face"	
		"l"	4	561	3112	-613	-3112	
		"lt"	4	572	573	625	624	

		"face"	
		"l"	4	562	3113	-614	-3113	
		"lt"	4	573	574	626	625	

		"face"	
		"l"	4	563	3114	-615	-3114	
		"lt"	4	574	575	627	626	

		"face"	
		"l"	4	564	3115	-616	-3115	
		"lt"	4	575	576	628	627	

		"face"	
		"l"	4	565	3116	-617	-3116	
		"lt"	4	576	577	629	628	

		"face"	
		"l"	4	566	3117	-618	-3117	
		"lt"	4	577	578	630	629	

		"face"	
		"l"	4	567	3118	-619	-3118	
		"lt"	4	578	579	631	630	

		"face"	
		"l"	4	568	3119	-620	-3119	
		"lt"	4	579	580	632	631	

		"face"	
		"l"	4	569	3120	-621	-3120	
		"lt"	4	580	581	633	632	

		"face"	
		"l"	4	570	3121	-622	-3121	
		"lt"	4	581	582	634	633	

		"face"	
		"l"	4	571	3122	-623	-3122	
		"lt"	4	582	583	635	634	

		"face"	
		"l"	4	572	3123	-624	-3123	
		"lt"	4	583	584	636	635	

		"face"	
		"l"	4	573	3124	-625	-3124	
		"lt"	4	584	585	637	636	

		"face"	
		"l"	4	574	3125	-626	-3125	
		"lt"	4	585	586	638	637	

		"face"	
		"l"	4	575	3126	-627	-3126	
		"lt"	4	586	587	639	638	

		"face"	
		"l"	4	576	3127	-628	-3127	
		"lt"	4	587	588	640	639	

		"face"	
		"l"	4	577	3128	-629	-3128	
		"lt"	4	588	589	641	640	

		"face"	
		"l"	4	578	3129	-630	-3129	
		"lt"	4	589	590	642	641	

		"face"	
		"l"	4	579	3130	-631	-3130	
		"lt"	4	590	591	643	642	

		"face"	
		"l"	4	580	3131	-632	-3131	
		"lt"	4	591	592	644	643	

		"face"	
		"l"	4	581	3132	-633	-3132	
		"lt"	4	592	593	645	644	

		"face"	
		"l"	4	582	3133	-634	-3133	
		"lt"	4	593	594	646	645	

		"face"	
		"l"	4	583	3134	-635	-3134	
		"lt"	4	594	595	647	646	

		"face"	
		"l"	4	584	3135	-636	-3135	
		"lt"	4	595	596	648	647	

		"face"	
		"l"	4	585	3136	-637	-3136	
		"lt"	4	596	597	649	648	

		"face"	
		"l"	4	586	3137	-638	-3137	
		"lt"	4	597	598	650	649	

		"face"	
		"l"	4	587	3138	-639	-3138	
		"lt"	4	598	599	651	650	

		"face"	
		"l"	4	588	3139	-640	-3139	
		"lt"	4	599	600	652	651	

		"face"	
		"l"	4	589	3140	-641	-3140	
		"lt"	4	600	601	653	652	

		"face"	
		"l"	4	590	3141	-642	-3141	
		"lt"	4	601	602	654	653	

		"face"	
		"l"	4	591	3142	-643	-3142	
		"lt"	4	602	603	655	654	

		"face"	
		"l"	4	592	3143	-644	-3143	
		"lt"	4	603	604	656	655	

		"face"	
		"l"	4	593	3144	-645	-3144	
		"lt"	4	604	605	657	656	

		"face"	
		"l"	4	594	3145	-646	-3145	
		"lt"	4	605	606	658	657	

		"face"	
		"l"	4	595	3146	-647	-3146	
		"lt"	4	606	607	659	658	

		"face"	
		"l"	4	596	3147	-648	-3147	
		"lt"	4	607	608	660	659	

		"face"	
		"l"	4	597	3148	-649	-3148	
		"lt"	4	608	609	661	660	

		"face"	
		"l"	4	598	3149	-650	-3149	
		"lt"	4	609	610	662	661	

		"face"	
		"l"	4	599	3150	-651	-3150	
		"lt"	4	610	611	663	662	

		"face"	
		"l"	4	600	3151	-652	-3151	
		"lt"	4	611	612	664	663	

		"face"	
		"l"	4	601	3152	-653	-3152	
		"lt"	4	612	613	665	664	

		"face"	
		"l"	4	602	3153	-654	-3153	
		"lt"	4	613	614	666	665	

		"face"	
		"l"	4	603	3154	-655	-3154	
		"lt"	4	614	615	667	666	

		"face"	
		"l"	4	604	3155	-656	-3155	
		"lt"	4	615	616	668	667	

		"face"	
		"l"	4	605	3156	-657	-3156	
		"lt"	4	616	617	669	668	

		"face"	
		"l"	4	606	3157	-658	-3157	
		"lt"	4	617	618	670	669	

		"face"	
		"l"	4	607	3158	-659	-3158	
		"lt"	4	618	619	671	670	

		"face"	
		"l"	4	608	3159	-660	-3159	
		"lt"	4	619	620	672	671	

		"face"	
		"l"	4	609	3160	-661	-3160	
		"lt"	4	620	621	673	672	

		"face"	
		"l"	4	610	3161	-662	-3161	
		"lt"	4	621	622	674	673	

		"face"	
		"l"	4	611	3111	-663	-3162	
		"lt"	4	622	623	675	674	

		"face"	
		"l"	4	612	3163	-664	-3163	
		"lt"	4	624	625	677	676	

		"face"	
		"l"	4	613	3164	-665	-3164	
		"lt"	4	625	626	678	677	

		"face"	
		"l"	4	614	3165	-666	-3165	
		"lt"	4	626	627	679	678	

		"face"	
		"l"	4	615	3166	-667	-3166	
		"lt"	4	627	628	680	679	

		"face"	
		"l"	4	616	3167	-668	-3167	
		"lt"	4	628	629	681	680	

		"face"	
		"l"	4	617	3168	-669	-3168	
		"lt"	4	629	630	682	681	

		"face"	
		"l"	4	618	3169	-670	-3169	
		"lt"	4	630	631	683	682	

		"face"	
		"l"	4	619	3170	-671	-3170	
		"lt"	4	631	632	684	683	

		"face"	
		"l"	4	620	3171	-672	-3171	
		"lt"	4	632	633	685	684	

		"face"	
		"l"	4	621	3172	-673	-3172	
		"lt"	4	633	634	686	685	

		"face"	
		"l"	4	622	3173	-674	-3173	
		"lt"	4	634	635	687	686	

		"face"	
		"l"	4	623	3174	-675	-3174	
		"lt"	4	635	636	688	687	

		"face"	
		"l"	4	624	3175	-676	-3175	
		"lt"	4	636	637	689	688	

		"face"	
		"l"	4	625	3176	-677	-3176	
		"lt"	4	637	638	690	689	

		"face"	
		"l"	4	626	3177	-678	-3177	
		"lt"	4	638	639	691	690	

		"face"	
		"l"	4	627	3178	-679	-3178	
		"lt"	4	639	640	692	691	

		"face"	
		"l"	4	628	3179	-680	-3179	
		"lt"	4	640	641	693	692	

		"face"	
		"l"	4	629	3180	-681	-3180	
		"lt"	4	641	642	694	693	

		"face"	
		"l"	4	630	3181	-682	-3181	
		"lt"	4	642	643	695	694	

		"face"	
		"l"	4	631	3182	-683	-3182	
		"lt"	4	643	644	696	695	

		"face"	
		"l"	4	632	3183	-684	-3183	
		"lt"	4	644	645	697	696	

		"face"	
		"l"	4	633	3184	-685	-3184	
		"lt"	4	645	646	698	697	

		"face"	
		"l"	4	634	3185	-686	-3185	
		"lt"	4	646	647	699	698	

		"face"	
		"l"	4	635	3186	-687	-3186	
		"lt"	4	647	648	700	699	

		"face"	
		"l"	4	636	3187	-688	-3187	
		"lt"	4	648	649	701	700	

		"face"	
		"l"	4	637	3188	-689	-3188	
		"lt"	4	649	650	702	701	

		"face"	
		"l"	4	638	3189	-690	-3189	
		"lt"	4	650	651	703	702	

		"face"	
		"l"	4	639	3190	-691	-3190	
		"lt"	4	651	652	704	703	

		"face"	
		"l"	4	640	3191	-692	-3191	
		"lt"	4	652	653	705	704	

		"face"	
		"l"	4	641	3192	-693	-3192	
		"lt"	4	653	654	706	705	

		"face"	
		"l"	4	642	3193	-694	-3193	
		"lt"	4	654	655	707	706	

		"face"	
		"l"	4	643	3194	-695	-3194	
		"lt"	4	655	656	708	707	

		"face"	
		"l"	4	644	3195	-696	-3195	
		"lt"	4	656	657	709	708	

		"face"	
		"l"	4	645	3196	-697	-3196	
		"lt"	4	657	658	710	709	

		"face"	
		"l"	4	646	3197	-698	-3197	
		"lt"	4	658	659	711	710	

		"face"	
		"l"	4	647	3198	-699	-3198	
		"lt"	4	659	660	712	711	

		"face"	
		"l"	4	648	3199	-700	-3199	
		"lt"	4	660	661	713	712	

		"face"	
		"l"	4	649	3200	-701	-3200	
		"lt"	4	661	662	714	713	

		"face"	
		"l"	4	650	3201	-702	-3201	
		"lt"	4	662	663	715	714	

		"face"	
		"l"	4	651	3202	-703	-3202	
		"lt"	4	663	664	716	715	

		"face"	
		"l"	4	652	3203	-704	-3203	
		"lt"	4	664	665	717	716	

		"face"	
		"l"	4	653	3204	-705	-3204	
		"lt"	4	665	666	718	717	

		"face"	
		"l"	4	654	3205	-706	-3205	
		"lt"	4	666	667	719	718	

		"face"	
		"l"	4	655	3206	-707	-3206	
		"lt"	4	667	668	720	719	

		"face"	
		"l"	4	656	3207	-708	-3207	
		"lt"	4	668	669	721	720	

		"face"	
		"l"	4	657	3208	-709	-3208	
		"lt"	4	669	670	722	721	

		"face"	
		"l"	4	658	3209	-710	-3209	
		"lt"	4	670	671	723	722	

		"face"	
		"l"	4	659	3210	-711	-3210	
		"lt"	4	671	672	724	723	

		"face"	
		"l"	4	660	3211	-712	-3211	
		"lt"	4	672	673	725	724	

		"face"	
		"l"	4	661	3212	-713	-3212	
		"lt"	4	673	674	726	725	

		"face"	
		"l"	4	662	3162	-714	-3213	
		"lt"	4	674	675	727	726	

		"face"	
		"l"	4	663	3214	-715	-3214	
		"lt"	4	676	677	729	728	

		"face"	
		"l"	4	664	3215	-716	-3215	
		"lt"	4	677	678	730	729	

		"face"	
		"l"	4	665	3216	-717	-3216	
		"lt"	4	678	679	731	730	

		"face"	
		"l"	4	666	3217	-718	-3217	
		"lt"	4	679	680	732	731	

		"face"	
		"l"	4	667	3218	-719	-3218	
		"lt"	4	680	681	733	732	

		"face"	
		"l"	4	668	3219	-720	-3219	
		"lt"	4	681	682	734	733	

		"face"	
		"l"	4	669	3220	-721	-3220	
		"lt"	4	682	683	735	734	

		"face"	
		"l"	4	670	3221	-722	-3221	
		"lt"	4	683	684	736	735	

		"face"	
		"l"	4	671	3222	-723	-3222	
		"lt"	4	684	685	737	736	

		"face"	
		"l"	4	672	3223	-724	-3223	
		"lt"	4	685	686	738	737	

		"face"	
		"l"	4	673	3224	-725	-3224	
		"lt"	4	686	687	739	738	

		"face"	
		"l"	4	674	3225	-726	-3225	
		"lt"	4	687	688	740	739	

		"face"	
		"l"	4	675	3226	-727	-3226	
		"lt"	4	688	689	741	740	

		"face"	
		"l"	4	676	3227	-728	-3227	
		"lt"	4	689	690	742	741	

		"face"	
		"l"	4	677	3228	-729	-3228	
		"lt"	4	690	691	743	742	

		"face"	
		"l"	4	678	3229	-730	-3229	
		"lt"	4	691	692	744	743	

		"face"	
		"l"	4	679	3230	-731	-3230	
		"lt"	4	692	693	745	744	

		"face"	
		"l"	4	680	3231	-732	-3231	
		"lt"	4	693	694	746	745	

		"face"	
		"l"	4	681	3232	-733	-3232	
		"lt"	4	694	695	747	746	

		"face"	
		"l"	4	682	3233	-734	-3233	
		"lt"	4	695	696	748	747	

		"face"	
		"l"	4	683	3234	-735	-3234	
		"lt"	4	696	697	749	748	

		"face"	
		"l"	4	684	3235	-736	-3235	
		"lt"	4	697	698	750	749	

		"face"	
		"l"	4	685	3236	-737	-3236	
		"lt"	4	698	699	751	750	

		"face"	
		"l"	4	686	3237	-738	-3237	
		"lt"	4	699	700	752	751	

		"face"	
		"l"	4	687	3238	-739	-3238	
		"lt"	4	700	701	753	752	

		"face"	
		"l"	4	688	3239	-740	-3239	
		"lt"	4	701	702	754	753	

		"face"	
		"l"	4	689	3240	-741	-3240	
		"lt"	4	702	703	755	754	

		"face"	
		"l"	4	690	3241	-742	-3241	
		"lt"	4	703	704	756	755	

		"face"	
		"l"	4	691	3242	-743	-3242	
		"lt"	4	704	705	757	756	

		"face"	
		"l"	4	692	3243	-744	-3243	
		"lt"	4	705	706	758	757	

		"face"	
		"l"	4	693	3244	-745	-3244	
		"lt"	4	706	707	759	758	

		"face"	
		"l"	4	694	3245	-746	-3245	
		"lt"	4	707	708	760	759	

		"face"	
		"l"	4	695	3246	-747	-3246	
		"lt"	4	708	709	761	760	

		"face"	
		"l"	4	696	3247	-748	-3247	
		"lt"	4	709	710	762	761	

		"face"	
		"l"	4	697	3248	-749	-3248	
		"lt"	4	710	711	763	762	

		"face"	
		"l"	4	698	3249	-750	-3249	
		"lt"	4	711	712	764	763	

		"face"	
		"l"	4	699	3250	-751	-3250	
		"lt"	4	712	713	765	764	

		"face"	
		"l"	4	700	3251	-752	-3251	
		"lt"	4	713	714	766	765	

		"face"	
		"l"	4	701	3252	-753	-3252	
		"lt"	4	714	715	767	766	

		"face"	
		"l"	4	702	3253	-754	-3253	
		"lt"	4	715	716	768	767	

		"face"	
		"l"	4	703	3254	-755	-3254	
		"lt"	4	716	717	769	768	

		"face"	
		"l"	4	704	3255	-756	-3255	
		"lt"	4	717	718	770	769	

		"face"	
		"l"	4	705	3256	-757	-3256	
		"lt"	4	718	719	771	770	

		"face"	
		"l"	4	706	3257	-758	-3257	
		"lt"	4	719	720	772	771	

		"face"	
		"l"	4	707	3258	-759	-3258	
		"lt"	4	720	721	773	772	

		"face"	
		"l"	4	708	3259	-760	-3259	
		"lt"	4	721	722	774	773	

		"face"	
		"l"	4	709	3260	-761	-3260	
		"lt"	4	722	723	775	774	

		"face"	
		"l"	4	710	3261	-762	-3261	
		"lt"	4	723	724	776	775	

		"face"	
		"l"	4	711	3262	-763	-3262	
		"lt"	4	724	725	777	776	

		"face"	
		"l"	4	712	3263	-764	-3263	
		"lt"	4	725	726	778	777	

		"face"	
		"l"	4	713	3213	-765	-3264	
		"lt"	4	726	727	779	778	

		"face"	
		"l"	4	714	3265	-766	-3265	
		"lt"	4	728	729	781	780	

		"face"	
		"l"	4	715	3266	-767	-3266	
		"lt"	4	729	730	782	781	

		"face"	
		"l"	4	716	3267	-768	-3267	
		"lt"	4	730	731	783	782	

		"face"	
		"l"	4	717	3268	-769	-3268	
		"lt"	4	731	732	784	783	

		"face"	
		"l"	4	718	3269	-770	-3269	
		"lt"	4	732	733	785	784	

		"face"	
		"l"	4	719	3270	-771	-3270	
		"lt"	4	733	734	786	785	

		"face"	
		"l"	4	720	3271	-772	-3271	
		"lt"	4	734	735	787	786	

		"face"	
		"l"	4	721	3272	-773	-3272	
		"lt"	4	735	736	788	787	

		"face"	
		"l"	4	722	3273	-774	-3273	
		"lt"	4	736	737	789	788	

		"face"	
		"l"	4	723	3274	-775	-3274	
		"lt"	4	737	738	790	789	

		"face"	
		"l"	4	724	3275	-776	-3275	
		"lt"	4	738	739	791	790	

		"face"	
		"l"	4	725	3276	-777	-3276	
		"lt"	4	739	740	792	791	

		"face"	
		"l"	4	726	3277	-778	-3277	
		"lt"	4	740	741	793	792	

		"face"	
		"l"	4	727	3278	-779	-3278	
		"lt"	4	741	742	794	793	

		"face"	
		"l"	4	728	3279	-780	-3279	
		"lt"	4	742	743	795	794	

		"face"	
		"l"	4	729	3280	-781	-3280	
		"lt"	4	743	744	796	795	

		"face"	
		"l"	4	730	3281	-782	-3281	
		"lt"	4	744	745	797	796	

		"face"	
		"l"	4	731	3282	-783	-3282	
		"lt"	4	745	746	798	797	

		"face"	
		"l"	4	732	3283	-784	-3283	
		"lt"	4	746	747	799	798	

		"face"	
		"l"	4	733	3284	-785	-3284	
		"lt"	4	747	748	800	799	

		"face"	
		"l"	4	734	3285	-786	-3285	
		"lt"	4	748	749	801	800	

		"face"	
		"l"	4	735	3286	-787	-3286	
		"lt"	4	749	750	802	801	

		"face"	
		"l"	4	736	3287	-788	-3287	
		"lt"	4	750	751	803	802	

		"face"	
		"l"	4	737	3288	-789	-3288	
		"lt"	4	751	752	804	803	

		"face"	
		"l"	4	738	3289	-790	-3289	
		"lt"	4	752	753	805	804	

		"face"	
		"l"	4	739	3290	-791	-3290	
		"lt"	4	753	754	806	805	

		"face"	
		"l"	4	740	3291	-792	-3291	
		"lt"	4	754	755	807	806	

		"face"	
		"l"	4	741	3292	-793	-3292	
		"lt"	4	755	756	808	807	

		"face"	
		"l"	4	742	3293	-794	-3293	
		"lt"	4	756	757	809	808	

		"face"	
		"l"	4	743	3294	-795	-3294	
		"lt"	4	757	758	810	809	

		"face"	
		"l"	4	744	3295	-796	-3295	
		"lt"	4	758	759	811	810	

		"face"	
		"l"	4	745	3296	-797	-3296	
		"lt"	4	759	760	812	811	

		"face"	
		"l"	4	746	3297	-798	-3297	
		"lt"	4	760	761	813	812	

		"face"	
		"l"	4	747	3298	-799	-3298	
		"lt"	4	761	762	814	813	

		"face"	
		"l"	4	748	3299	-800	-3299	
		"lt"	4	762	763	815	814	

		"face"	
		"l"	4	749	3300	-801	-3300	
		"lt"	4	763	764	816	815	

		"face"	
		"l"	4	750	3301	-802	-3301	
		"lt"	4	764	765	817	816	

		"face"	
		"l"	4	751	3302	-803	-3302	
		"lt"	4	765	766	818	817	

		"face"	
		"l"	4	752	3303	-804	-3303	
		"lt"	4	766	767	819	818	

		"face"	
		"l"	4	753	3304	-805	-3304	
		"lt"	4	767	768	820	819	

		"face"	
		"l"	4	754	3305	-806	-3305	
		"lt"	4	768	769	821	820	

		"face"	
		"l"	4	755	3306	-807	-3306	
		"lt"	4	769	770	822	821	

		"face"	
		"l"	4	756	3307	-808	-3307	
		"lt"	4	770	771	823	822	

		"face"	
		"l"	4	757	3308	-809	-3308	
		"lt"	4	771	772	824	823	

		"face"	
		"l"	4	758	3309	-810	-3309	
		"lt"	4	772	773	825	824	

		"face"	
		"l"	4	759	3310	-811	-3310	
		"lt"	4	773	774	826	825	

		"face"	
		"l"	4	760	3311	-812	-3311	
		"lt"	4	774	775	827	826	

		"face"	
		"l"	4	761	3312	-813	-3312	
		"lt"	4	775	776	828	827	

		"face"	
		"l"	4	762	3313	-814	-3313	
		"lt"	4	776	777	829	828	

		"face"	
		"l"	4	763	3314	-815	-3314	
		"lt"	4	777	778	830	829	

		"face"	
		"l"	4	764	3264	-816	-3315	
		"lt"	4	778	779	831	830	

		"face"	
		"l"	4	765	3316	-817	-3316	
		"lt"	4	780	781	833	832	

		"face"	
		"l"	4	766	3317	-818	-3317	
		"lt"	4	781	782	834	833	

		"face"	
		"l"	4	767	3318	-819	-3318	
		"lt"	4	782	783	835	834	

		"face"	
		"l"	4	768	3319	-820	-3319	
		"lt"	4	783	784	836	835	

		"face"	
		"l"	4	769	3320	-821	-3320	
		"lt"	4	784	785	837	836	

		"face"	
		"l"	4	770	3321	-822	-3321	
		"lt"	4	785	786	838	837	

		"face"	
		"l"	4	771	3322	-823	-3322	
		"lt"	4	786	787	839	838	

		"face"	
		"l"	4	772	3323	-824	-3323	
		"lt"	4	787	788	840	839	

		"face"	
		"l"	4	773	3324	-825	-3324	
		"lt"	4	788	789	841	840	

		"face"	
		"l"	4	774	3325	-826	-3325	
		"lt"	4	789	790	842	841	

		"face"	
		"l"	4	775	3326	-827	-3326	
		"lt"	4	790	791	843	842	

		"face"	
		"l"	4	776	3327	-828	-3327	
		"lt"	4	791	792	844	843	

		"face"	
		"l"	4	777	3328	-829	-3328	
		"lt"	4	792	793	845	844	

		"face"	
		"l"	4	778	3329	-830	-3329	
		"lt"	4	793	794	846	845	

		"face"	
		"l"	4	779	3330	-831	-3330	
		"lt"	4	794	795	847	846	

		"face"	
		"l"	4	780	3331	-832	-3331	
		"lt"	4	795	796	848	847	

		"face"	
		"l"	4	781	3332	-833	-3332	
		"lt"	4	796	797	849	848	

		"face"	
		"l"	4	782	3333	-834	-3333	
		"lt"	4	797	798	850	849	

		"face"	
		"l"	4	783	3334	-835	-3334	
		"lt"	4	798	799	851	850	

		"face"	
		"l"	4	784	3335	-836	-3335	
		"lt"	4	799	800	852	851	

		"face"	
		"l"	4	785	3336	-837	-3336	
		"lt"	4	800	801	853	852	

		"face"	
		"l"	4	786	3337	-838	-3337	
		"lt"	4	801	802	854	853	

		"face"	
		"l"	4	787	3338	-839	-3338	
		"lt"	4	802	803	855	854	

		"face"	
		"l"	4	788	3339	-840	-3339	
		"lt"	4	803	804	856	855	

		"face"	
		"l"	4	789	3340	-841	-3340	
		"lt"	4	804	805	857	856	

		"face"	
		"l"	4	790	3341	-842	-3341	
		"lt"	4	805	806	858	857	

		"face"	
		"l"	4	791	3342	-843	-3342	
		"lt"	4	806	807	859	858	

		"face"	
		"l"	4	792	3343	-844	-3343	
		"lt"	4	807	808	860	859	

		"face"	
		"l"	4	793	3344	-845	-3344	
		"lt"	4	808	809	861	860	

		"face"	
		"l"	4	794	3345	-846	-3345	
		"lt"	4	809	810	862	861	

		"face"	
		"l"	4	795	3346	-847	-3346	
		"lt"	4	810	811	863	862	

		"face"	
		"l"	4	796	3347	-848	-3347	
		"lt"	4	811	812	864	863	

		"face"	
		"l"	4	797	3348	-849	-3348	
		"lt"	4	812	813	865	864	

		"face"	
		"l"	4	798	3349	-850	-3349	
		"lt"	4	813	814	866	865	

		"face"	
		"l"	4	799	3350	-851	-3350	
		"lt"	4	814	815	867	866	

		"face"	
		"l"	4	800	3351	-852	-3351	
		"lt"	4	815	816	868	867	

		"face"	
		"l"	4	801	3352	-853	-3352	
		"lt"	4	816	817	869	868	

		"face"	
		"l"	4	802	3353	-854	-3353	
		"lt"	4	817	818	870	869	

		"face"	
		"l"	4	803	3354	-855	-3354	
		"lt"	4	818	819	871	870	

		"face"	
		"l"	4	804	3355	-856	-3355	
		"lt"	4	819	820	872	871	

		"face"	
		"l"	4	805	3356	-857	-3356	
		"lt"	4	820	821	873	872	

		"face"	
		"l"	4	806	3357	-858	-3357	
		"lt"	4	821	822	874	873	

		"face"	
		"l"	4	807	3358	-859	-3358	
		"lt"	4	822	823	875	874	

		"face"	
		"l"	4	808	3359	-860	-3359	
		"lt"	4	823	824	876	875	

		"face"	
		"l"	4	809	3360	-861	-3360	
		"lt"	4	824	825	877	876	

		"face"	
		"l"	4	810	3361	-862	-3361	
		"lt"	4	825	826	878	877	

		"face"	
		"l"	4	811	3362	-863	-3362	
		"lt"	4	826	827	879	878	

		"face"	
		"l"	4	812	3363	-864	-3363	
		"lt"	4	827	828	880	879	

		"face"	
		"l"	4	813	3364	-865	-3364	
		"lt"	4	828	829	881	880	

		"face"	
		"l"	4	814	3365	-866	-3365	
		"lt"	4	829	830	882	881	

		"face"	
		"l"	4	815	3315	-867	-3366	
		"lt"	4	830	831	883	882	

		"face"	
		"l"	4	816	3367	-868	-3367	
		"lt"	4	832	833	885	884	

		"face"	
		"l"	4	817	3368	-869	-3368	
		"lt"	4	833	834	886	885	

		"face"	
		"l"	4	818	3369	-870	-3369	
		"lt"	4	834	835	887	886	

		"face"	
		"l"	4	819	3370	-871	-3370	
		"lt"	4	835	836	888	887	

		"face"	
		"l"	4	820	3371	-872	-3371	
		"lt"	4	836	837	889	888	

		"face"	
		"l"	4	821	3372	-873	-3372	
		"lt"	4	837	838	890	889	

		"face"	
		"l"	4	822	3373	-874	-3373	
		"lt"	4	838	839	891	890	

		"face"	
		"l"	4	823	3374	-875	-3374	
		"lt"	4	839	840	892	891	

		"face"	
		"l"	4	824	3375	-876	-3375	
		"lt"	4	840	841	893	892	

		"face"	
		"l"	4	825	3376	-877	-3376	
		"lt"	4	841	842	894	893	

		"face"	
		"l"	4	826	3377	-878	-3377	
		"lt"	4	842	843	895	894	

		"face"	
		"l"	4	827	3378	-879	-3378	
		"lt"	4	843	844	896	895	

		"face"	
		"l"	4	828	3379	-880	-3379	
		"lt"	4	844	845	897	896	

		"face"	
		"l"	4	829	3380	-881	-3380	
		"lt"	4	845	846	898	897	

		"face"	
		"l"	4	830	3381	-882	-3381	
		"lt"	4	846	847	899	898	

		"face"	
		"l"	4	831	3382	-883	-3382	
		"lt"	4	847	848	900	899	

		"face"	
		"l"	4	832	3383	-884	-3383	
		"lt"	4	848	849	901	900	

		"face"	
		"l"	4	833	3384	-885	-3384	
		"lt"	4	849	850	902	901	

		"face"	
		"l"	4	834	3385	-886	-3385	
		"lt"	4	850	851	903	902	

		"face"	
		"l"	4	835	3386	-887	-3386	
		"lt"	4	851	852	904	903	

		"face"	
		"l"	4	836	3387	-888	-3387	
		"lt"	4	852	853	905	904	

		"face"	
		"l"	4	837	3388	-889	-3388	
		"lt"	4	853	854	906	905	

		"face"	
		"l"	4	838	3389	-890	-3389	
		"lt"	4	854	855	907	906	

		"face"	
		"l"	4	839	3390	-891	-3390	
		"lt"	4	855	856	908	907	

		"face"	
		"l"	4	840	3391	-892	-3391	
		"lt"	4	856	857	909	908	

		"face"	
		"l"	4	841	3392	-893	-3392	
		"lt"	4	857	858	910	909	

		"face"	
		"l"	4	842	3393	-894	-3393	
		"lt"	4	858	859	911	910	

		"face"	
		"l"	4	843	3394	-895	-3394	
		"lt"	4	859	860	912	911	

		"face"	
		"l"	4	844	3395	-896	-3395	
		"lt"	4	860	861	913	912	

		"face"	
		"l"	4	845	3396	-897	-3396	
		"lt"	4	861	862	914	913	

		"face"	
		"l"	4	846	3397	-898	-3397	
		"lt"	4	862	863	915	914	

		"face"	
		"l"	4	847	3398	-899	-3398	
		"lt"	4	863	864	916	915	

		"face"	
		"l"	4	848	3399	-900	-3399	
		"lt"	4	864	865	917	916	

		"face"	
		"l"	4	849	3400	-901	-3400	
		"lt"	4	865	866	918	917	

		"face"	
		"l"	4	850	3401	-902	-3401	
		"lt"	4	866	867	919	918	

		"face"	
		"l"	4	851	3402	-903	-3402	
		"lt"	4	867	868	920	919	

		"face"	
		"l"	4	852	3403	-904	-3403	
		"lt"	4	868	869	921	920	

		"face"	
		"l"	4	853	3404	-905	-3404	
		"lt"	4	869	870	922	921	

		"face"	
		"l"	4	854	3405	-906	-3405	
		"lt"	4	870	871	923	922	

		"face"	
		"l"	4	855	3406	-907	-3406	
		"lt"	4	871	872	924	923	

		"face"	
		"l"	4	856	3407	-908	-3407	
		"lt"	4	872	873	925	924	

		"face"	
		"l"	4	857	3408	-909	-3408	
		"lt"	4	873	874	926	925	

		"face"	
		"l"	4	858	3409	-910	-3409	
		"lt"	4	874	875	927	926	

		"face"	
		"l"	4	859	3410	-911	-3410	
		"lt"	4	875	876	928	927	

		"face"	
		"l"	4	860	3411	-912	-3411	
		"lt"	4	876	877	929	928	

		"face"	
		"l"	4	861	3412	-913	-3412	
		"lt"	4	877	878	930	929	

		"face"	
		"l"	4	862	3413	-914	-3413	
		"lt"	4	878	879	931	930	

		"face"	
		"l"	4	863	3414	-915	-3414	
		"lt"	4	879	880	932	931	

		"face"	
		"l"	4	864	3415	-916	-3415	
		"lt"	4	880	881	933	932	

		"face"	
		"l"	4	865	3416	-917	-3416	
		"lt"	4	881	882	934	933	

		"face"	
		"l"	4	866	3366	-918	-3417	
		"lt"	4	882	883	935	934	

		"face"	
		"l"	4	867	3418	-919	-3418	
		"lt"	4	884	885	937	936	

		"face"	
		"l"	4	868	3419	-920	-3419	
		"lt"	4	885	886	938	937	

		"face"	
		"l"	4	869	3420	-921	-3420	
		"lt"	4	886	887	939	938	

		"face"	
		"l"	4	870	3421	-922	-3421	
		"lt"	4	887	888	940	939	

		"face"	
		"l"	4	871	3422	-923	-3422	
		"lt"	4	888	889	941	940	

		"face"	
		"l"	4	872	3423	-924	-3423	
		"lt"	4	889	890	942	941	

		"face"	
		"l"	4	873	3424	-925	-3424	
		"lt"	4	890	891	943	942	

		"face"	
		"l"	4	874	3425	-926	-3425	
		"lt"	4	891	892	944	943	

		"face"	
		"l"	4	875	3426	-927	-3426	
		"lt"	4	892	893	945	944	

		"face"	
		"l"	4	876	3427	-928	-3427	
		"lt"	4	893	894	946	945	

		"face"	
		"l"	4	877	3428	-929	-3428	
		"lt"	4	894	895	947	946	

		"face"	
		"l"	4	878	3429	-930	-3429	
		"lt"	4	895	896	948	947	

		"face"	
		"l"	4	879	3430	-931	-3430	
		"lt"	4	896	897	949	948	

		"face"	
		"l"	4	880	3431	-932	-3431	
		"lt"	4	897	898	950	949	

		"face"	
		"l"	4	881	3432	-933	-3432	
		"lt"	4	898	899	951	950	

		"face"	
		"l"	4	882	3433	-934	-3433	
		"lt"	4	899	900	952	951	

		"face"	
		"l"	4	883	3434	-935	-3434	
		"lt"	4	900	901	953	952	

		"face"	
		"l"	4	884	3435	-936	-3435	
		"lt"	4	901	902	954	953	

		"face"	
		"l"	4	885	3436	-937	-3436	
		"lt"	4	902	903	955	954	

		"face"	
		"l"	4	886	3437	-938	-3437	
		"lt"	4	903	904	956	955	

		"face"	
		"l"	4	887	3438	-939	-3438	
		"lt"	4	904	905	957	956	

		"face"	
		"l"	4	888	3439	-940	-3439	
		"lt"	4	905	906	958	957	

		"face"	
		"l"	4	889	3440	-941	-3440	
		"lt"	4	906	907	959	958	

		"face"	
		"l"	4	890	3441	-942	-3441	
		"lt"	4	907	908	960	959	

		"face"	
		"l"	4	891	3442	-943	-3442	
		"lt"	4	908	909	961	960	

		"face"	
		"l"	4	892	3443	-944	-3443	
		"lt"	4	909	910	962	961	

		"face"	
		"l"	4	893	3444	-945	-3444	
		"lt"	4	910	911	963	962	

		"face"	
		"l"	4	894	3445	-946	-3445	
		"lt"	4	911	912	964	963	

		"face"	
		"l"	4	895	3446	-947	-3446	
		"lt"	4	912	913	965	964	

		"face"	
		"l"	4	896	3447	-948	-3447	
		"lt"	4	913	914	966	965	

		"face"	
		"l"	4	897	3448	-949	-3448	
		"lt"	4	914	915	967	966	

		"face"	
		"l"	4	898	3449	-950	-3449	
		"lt"	4	915	916	968	967	

		"face"	
		"l"	4	899	3450	-951	-3450	
		"lt"	4	916	917	969	968	

		"face"	
		"l"	4	900	3451	-952	-3451	
		"lt"	4	917	918	970	969	

		"face"	
		"l"	4	901	3452	-953	-3452	
		"lt"	4	918	919	971	970	

		"face"	
		"l"	4	902	3453	-954	-3453	
		"lt"	4	919	920	972	971	

		"face"	
		"l"	4	903	3454	-955	-3454	
		"lt"	4	920	921	973	972	

		"face"	
		"l"	4	904	3455	-956	-3455	
		"lt"	4	921	922	974	973	

		"face"	
		"l"	4	905	3456	-957	-3456	
		"lt"	4	922	923	975	974	

		"face"	
		"l"	4	906	3457	-958	-3457	
		"lt"	4	923	924	976	975	

		"face"	
		"l"	4	907	3458	-959	-3458	
		"lt"	4	924	925	977	976	

		"face"	
		"l"	4	908	3459	-960	-3459	
		"lt"	4	925	926	978	977	

		"face"	
		"l"	4	909	3460	-961	-3460	
		"lt"	4	926	927	979	978	

		"face"	
		"l"	4	910	3461	-962	-3461	
		"lt"	4	927	928	980	979	

		"face"	
		"l"	4	911	3462	-963	-3462	
		"lt"	4	928	929	981	980	

		"face"	
		"l"	4	912	3463	-964	-3463	
		"lt"	4	929	930	982	981	

		"face"	
		"l"	4	913	3464	-965	-3464	
		"lt"	4	930	931	983	982	

		"face"	
		"l"	4	914	3465	-966	-3465	
		"lt"	4	931	932	984	983	

		"face"	
		"l"	4	915	3466	-967	-3466	
		"lt"	4	932	933	985	984	

		"face"	
		"l"	4	916	3467	-968	-3467	
		"lt"	4	933	934	986	985	

		"face"	
		"l"	4	917	3417	-969	-3468	
		"lt"	4	934	935	987	986	

		"face"	
		"l"	4	918	3469	-970	-3469	
		"lt"	4	936	937	989	988	

		"face"	
		"l"	4	919	3470	-971	-3470	
		"lt"	4	937	938	990	989	

		"face"	
		"l"	4	920	3471	-972	-3471	
		"lt"	4	938	939	991	990	

		"face"	
		"l"	4	921	3472	-973	-3472	
		"lt"	4	939	940	992	991	

		"face"	
		"l"	4	922	3473	-974	-3473	
		"lt"	4	940	941	993	992	

		"face"	
		"l"	4	923	3474	-975	-3474	
		"lt"	4	941	942	994	993	

		"face"	
		"l"	4	924	3475	-976	-3475	
		"lt"	4	942	943	995	994	

		"face"	
		"l"	4	925	3476	-977	-3476	
		"lt"	4	943	944	996	995	

		"face"	
		"l"	4	926	3477	-978	-3477	
		"lt"	4	944	945	997	996	

		"face"	
		"l"	4	927	3478	-979	-3478	
		"lt"	4	945	946	998	997	

		"face"	
		"l"	4	928	3479	-980	-3479	
		"lt"	4	946	947	999	998	

		"face"	
		"l"	4	929	3480	-981	-3480	
		"lt"	4	947	948	1000	999	

		"face"	
		"l"	4	930	3481	-982	-3481	
		"lt"	4	948	949	1001	1000	

		"face"	
		"l"	4	931	3482	-983	-3482	
		"lt"	4	949	950	1002	1001	

		"face"	
		"l"	4	932	3483	-984	-3483	
		"lt"	4	950	951	1003	1002	

		"face"	
		"l"	4	933	3484	-985	-3484	
		"lt"	4	951	952	1004	1003	

		"face"	
		"l"	4	934	3485	-986	-3485	
		"lt"	4	952	953	1005	1004	

		"face"	
		"l"	4	935	3486	-987	-3486	
		"lt"	4	953	954	1006	1005	

		"face"	
		"l"	4	936	3487	-988	-3487	
		"lt"	4	954	955	1007	1006	

		"face"	
		"l"	4	937	3488	-989	-3488	
		"lt"	4	955	956	1008	1007	

		"face"	
		"l"	4	938	3489	-990	-3489	
		"lt"	4	956	957	1009	1008	

		"face"	
		"l"	4	939	3490	-991	-3490	
		"lt"	4	957	958	1010	1009	

		"face"	
		"l"	4	940	3491	-992	-3491	
		"lt"	4	958	959	1011	1010	

		"face"	
		"l"	4	941	3492	-993	-3492	
		"lt"	4	959	960	1012	1011	

		"face"	
		"l"	4	942	3493	-994	-3493	
		"lt"	4	960	961	1013	1012	

		"face"	
		"l"	4	943	3494	-995	-3494	
		"lt"	4	961	962	1014	1013	

		"face"	
		"l"	4	944	3495	-996	-3495	
		"lt"	4	962	963	1015	1014	

		"face"	
		"l"	4	945	3496	-997	-3496	
		"lt"	4	963	964	1016	1015	

		"face"	
		"l"	4	946	3497	-998	-3497	
		"lt"	4	964	965	1017	1016	

		"face"	
		"l"	4	947	3498	-999	-3498	
		"lt"	4	965	966	1018	1017	

		"face"	
		"l"	4	948	3499	-1000	-3499	
		"lt"	4	966	967	1019	1018	

		"face"	
		"l"	4	949	3500	-1001	-3500	
		"lt"	4	967	968	1020	1019	

		"face"	
		"l"	4	950	3501	-1002	-3501	
		"lt"	4	968	969	1021	1020	

		"face"	
		"l"	4	951	3502	-1003	-3502	
		"lt"	4	969	970	1022	1021	

		"face"	
		"l"	4	952	3503	-1004	-3503	
		"lt"	4	970	971	1023	1022	

		"face"	
		"l"	4	953	3504	-1005	-3504	
		"lt"	4	971	972	1024	1023	

		"face"	
		"l"	4	954	3505	-1006	-3505	
		"lt"	4	972	973	1025	1024	

		"face"	
		"l"	4	955	3506	-1007	-3506	
		"lt"	4	973	974	1026	1025	

		"face"	
		"l"	4	956	3507	-1008	-3507	
		"lt"	4	974	975	1027	1026	

		"face"	
		"l"	4	957	3508	-1009	-3508	
		"lt"	4	975	976	1028	1027	

		"face"	
		"l"	4	958	3509	-1010	-3509	
		"lt"	4	976	977	1029	1028	

		"face"	
		"l"	4	959	3510	-1011	-3510	
		"lt"	4	977	978	1030	1029	

		"face"	
		"l"	4	960	3511	-1012	-3511	
		"lt"	4	978	979	1031	1030	

		"face"	
		"l"	4	961	3512	-1013	-3512	
		"lt"	4	979	980	1032	1031	

		"face"	
		"l"	4	962	3513	-1014	-3513	
		"lt"	4	980	981	1033	1032	

		"face"	
		"l"	4	963	3514	-1015	-3514	
		"lt"	4	981	982	1034	1033	

		"face"	
		"l"	4	964	3515	-1016	-3515	
		"lt"	4	982	983	1035	1034	

		"face"	
		"l"	4	965	3516	-1017	-3516	
		"lt"	4	983	984	1036	1035	

		"face"	
		"l"	4	966	3517	-1018	-3517	
		"lt"	4	984	985	1037	1036	

		"face"	
		"l"	4	967	3518	-1019	-3518	
		"lt"	4	985	986	1038	1037	

		"face"	
		"l"	4	968	3468	-1020	-3519	
		"lt"	4	986	987	1039	1038	

		"face"	
		"l"	4	969	3520	-1021	-3520	
		"lt"	4	988	989	1041	1040	

		"face"	
		"l"	4	970	3521	-1022	-3521	
		"lt"	4	989	990	1042	1041	

		"face"	
		"l"	4	971	3522	-1023	-3522	
		"lt"	4	990	991	1043	1042	

		"face"	
		"l"	4	972	3523	-1024	-3523	
		"lt"	4	991	992	1044	1043	

		"face"	
		"l"	4	973	3524	-1025	-3524	
		"lt"	4	992	993	1045	1044	

		"face"	
		"l"	4	974	3525	-1026	-3525	
		"lt"	4	993	994	1046	1045	

		"face"	
		"l"	4	975	3526	-1027	-3526	
		"lt"	4	994	995	1047	1046	

		"face"	
		"l"	4	976	3527	-1028	-3527	
		"lt"	4	995	996	1048	1047	

		"face"	
		"l"	4	977	3528	-1029	-3528	
		"lt"	4	996	997	1049	1048	

		"face"	
		"l"	4	978	3529	-1030	-3529	
		"lt"	4	997	998	1050	1049	

		"face"	
		"l"	4	979	3530	-1031	-3530	
		"lt"	4	998	999	1051	1050	

		"face"	
		"l"	4	980	3531	-1032	-3531	
		"lt"	4	999	1000	1052	1051	

		"face"	
		"l"	4	981	3532	-1033	-3532	
		"lt"	4	1000	1001	1053	1052	

		"face"	
		"l"	4	982	3533	-1034	-3533	
		"lt"	4	1001	1002	1054	1053	

		"face"	
		"l"	4	983	3534	-1035	-3534	
		"lt"	4	1002	1003	1055	1054	

		"face"	
		"l"	4	984	3535	-1036	-3535	
		"lt"	4	1003	1004	1056	1055	

		"face"	
		"l"	4	985	3536	-1037	-3536	
		"lt"	4	1004	1005	1057	1056	

		"face"	
		"l"	4	986	3537	-1038	-3537	
		"lt"	4	1005	1006	1058	1057	

		"face"	
		"l"	4	987	3538	-1039	-3538	
		"lt"	4	1006	1007	1059	1058	

		"face"	
		"l"	4	988	3539	-1040	-3539	
		"lt"	4	1007	1008	1060	1059	

		"face"	
		"l"	4	989	3540	-1041	-3540	
		"lt"	4	1008	1009	1061	1060	

		"face"	
		"l"	4	990	3541	-1042	-3541	
		"lt"	4	1009	1010	1062	1061	

		"face"	
		"l"	4	991	3542	-1043	-3542	
		"lt"	4	1010	1011	1063	1062	

		"face"	
		"l"	4	992	3543	-1044	-3543	
		"lt"	4	1011	1012	1064	1063	

		"face"	
		"l"	4	993	3544	-1045	-3544	
		"lt"	4	1012	1013	1065	1064	

		"face"	
		"l"	4	994	3545	-1046	-3545	
		"lt"	4	1013	1014	1066	1065	

		"face"	
		"l"	4	995	3546	-1047	-3546	
		"lt"	4	1014	1015	1067	1066	

		"face"	
		"l"	4	996	3547	-1048	-3547	
		"lt"	4	1015	1016	1068	1067	

		"face"	
		"l"	4	997	3548	-1049	-3548	
		"lt"	4	1016	1017	1069	1068	

		"face"	
		"l"	4	998	3549	-1050	-3549	
		"lt"	4	1017	1018	1070	1069	

		"face"	
		"l"	4	999	3550	-1051	-3550	
		"lt"	4	1018	1019	1071	1070	

		"face"	
		"l"	4	1000	3551	-1052	-3551	
		"lt"	4	1019	1020	1072	1071	

		"face"	
		"l"	4	1001	3552	-1053	-3552	
		"lt"	4	1020	1021	1073	1072	

		"face"	
		"l"	4	1002	3553	-1054	-3553	
		"lt"	4	1021	1022	1074	1073	

		"face"	
		"l"	4	1003	3554	-1055	-3554	
		"lt"	4	1022	1023	1075	1074	

		"face"	
		"l"	4	1004	3555	-1056	-3555	
		"lt"	4	1023	1024	1076	1075	

		"face"	
		"l"	4	1005	3556	-1057	-3556	
		"lt"	4	1024	1025	1077	1076	

		"face"	
		"l"	4	1006	3557	-1058	-3557	
		"lt"	4	1025	1026	1078	1077	

		"face"	
		"l"	4	1007	3558	-1059	-3558	
		"lt"	4	1026	1027	1079	1078	

		"face"	
		"l"	4	1008	3559	-1060	-3559	
		"lt"	4	1027	1028	1080	1079	

		"face"	
		"l"	4	1009	3560	-1061	-3560	
		"lt"	4	1028	1029	1081	1080	

		"face"	
		"l"	4	1010	3561	-1062	-3561	
		"lt"	4	1029	1030	1082	1081	

		"face"	
		"l"	4	1011	3562	-1063	-3562	
		"lt"	4	1030	1031	1083	1082	

		"face"	
		"l"	4	1012	3563	-1064	-3563	
		"lt"	4	1031	1032	1084	1083	

		"face"	
		"l"	4	1013	3564	-1065	-3564	
		"lt"	4	1032	1033	1085	1084	

		"face"	
		"l"	4	1014	3565	-1066	-3565	
		"lt"	4	1033	1034	1086	1085	

		"face"	
		"l"	4	1015	3566	-1067	-3566	
		"lt"	4	1034	1035	1087	1086	

		"face"	
		"l"	4	1016	3567	-1068	-3567	
		"lt"	4	1035	1036	1088	1087	

		"face"	
		"l"	4	1017	3568	-1069	-3568	
		"lt"	4	1036	1037	1089	1088	

		"face"	
		"l"	4	1018	3569	-1070	-3569	
		"lt"	4	1037	1038	1090	1089	

		"face"	
		"l"	4	1019	3519	-1071	-3570	
		"lt"	4	1038	1039	1091	1090	

		"face"	
		"l"	4	1020	3571	-1072	-3571	
		"lt"	4	1040	1041	1093	1092	

		"face"	
		"l"	4	1021	3572	-1073	-3572	
		"lt"	4	1041	1042	1094	1093	

		"face"	
		"l"	4	1022	3573	-1074	-3573	
		"lt"	4	1042	1043	1095	1094	

		"face"	
		"l"	4	1023	3574	-1075	-3574	
		"lt"	4	1043	1044	1096	1095	

		"face"	
		"l"	4	1024	3575	-1076	-3575	
		"lt"	4	1044	1045	1097	1096	

		"face"	
		"l"	4	1025	3576	-1077	-3576	
		"lt"	4	1045	1046	1098	1097	

		"face"	
		"l"	4	1026	3577	-1078	-3577	
		"lt"	4	1046	1047	1099	1098	

		"face"	
		"l"	4	1027	3578	-1079	-3578	
		"lt"	4	1047	1048	1100	1099	

		"face"	
		"l"	4	1028	3579	-1080	-3579	
		"lt"	4	1048	1049	1101	1100	

		"face"	
		"l"	4	1029	3580	-1081	-3580	
		"lt"	4	1049	1050	1102	1101	

		"face"	
		"l"	4	1030	3581	-1082	-3581	
		"lt"	4	1050	1051	1103	1102	

		"face"	
		"l"	4	1031	3582	-1083	-3582	
		"lt"	4	1051	1052	1104	1103	

		"face"	
		"l"	4	1032	3583	-1084	-3583	
		"lt"	4	1052	1053	1105	1104	

		"face"	
		"l"	4	1033	3584	-1085	-3584	
		"lt"	4	1053	1054	1106	1105	

		"face"	
		"l"	4	1034	3585	-1086	-3585	
		"lt"	4	1054	1055	1107	1106	

		"face"	
		"l"	4	1035	3586	-1087	-3586	
		"lt"	4	1055	1056	1108	1107	

		"face"	
		"l"	4	1036	3587	-1088	-3587	
		"lt"	4	1056	1057	1109	1108	

		"face"	
		"l"	4	1037	3588	-1089	-3588	
		"lt"	4	1057	1058	1110	1109	

		"face"	
		"l"	4	1038	3589	-1090	-3589	
		"lt"	4	1058	1059	1111	1110	

		"face"	
		"l"	4	1039	3590	-1091	-3590	
		"lt"	4	1059	1060	1112	1111	

		"face"	
		"l"	4	1040	3591	-1092	-3591	
		"lt"	4	1060	1061	1113	1112	

		"face"	
		"l"	4	1041	3592	-1093	-3592	
		"lt"	4	1061	1062	1114	1113	

		"face"	
		"l"	4	1042	3593	-1094	-3593	
		"lt"	4	1062	1063	1115	1114	

		"face"	
		"l"	4	1043	3594	-1095	-3594	
		"lt"	4	1063	1064	1116	1115	

		"face"	
		"l"	4	1044	3595	-1096	-3595	
		"lt"	4	1064	1065	1117	1116	

		"face"	
		"l"	4	1045	3596	-1097	-3596	
		"lt"	4	1065	1066	1118	1117	

		"face"	
		"l"	4	1046	3597	-1098	-3597	
		"lt"	4	1066	1067	1119	1118	

		"face"	
		"l"	4	1047	3598	-1099	-3598	
		"lt"	4	1067	1068	1120	1119	

		"face"	
		"l"	4	1048	3599	-1100	-3599	
		"lt"	4	1068	1069	1121	1120	

		"face"	
		"l"	4	1049	3600	-1101	-3600	
		"lt"	4	1069	1070	1122	1121	

		"face"	
		"l"	4	1050	3601	-1102	-3601	
		"lt"	4	1070	1071	1123	1122	

		"face"	
		"l"	4	1051	3602	-1103	-3602	
		"lt"	4	1071	1072	1124	1123	

		"face"	
		"l"	4	1052	3603	-1104	-3603	
		"lt"	4	1072	1073	1125	1124	

		"face"	
		"l"	4	1053	3604	-1105	-3604	
		"lt"	4	1073	1074	1126	1125	

		"face"	
		"l"	4	1054	3605	-1106	-3605	
		"lt"	4	1074	1075	1127	1126	

		"face"	
		"l"	4	1055	3606	-1107	-3606	
		"lt"	4	1075	1076	1128	1127	

		"face"	
		"l"	4	1056	3607	-1108	-3607	
		"lt"	4	1076	1077	1129	1128	

		"face"	
		"l"	4	1057	3608	-1109	-3608	
		"lt"	4	1077	1078	1130	1129	

		"face"	
		"l"	4	1058	3609	-1110	-3609	
		"lt"	4	1078	1079	1131	1130	

		"face"	
		"l"	4	1059	3610	-1111	-3610	
		"lt"	4	1079	1080	1132	1131	

		"face"	
		"l"	4	1060	3611	-1112	-3611	
		"lt"	4	1080	1081	1133	1132	

		"face"	
		"l"	4	1061	3612	-1113	-3612	
		"lt"	4	1081	1082	1134	1133	

		"face"	
		"l"	4	1062	3613	-1114	-3613	
		"lt"	4	1082	1083	1135	1134	

		"face"	
		"l"	4	1063	3614	-1115	-3614	
		"lt"	4	1083	1084	1136	1135	

		"face"	
		"l"	4	1064	3615	-1116	-3615	
		"lt"	4	1084	1085	1137	1136	

		"face"	
		"l"	4	1065	3616	-1117	-3616	
		"lt"	4	1085	1086	1138	1137	

		"face"	
		"l"	4	1066	3617	-1118	-3617	
		"lt"	4	1086	1087	1139	1138	

		"face"	
		"l"	4	1067	3618	-1119	-3618	
		"lt"	4	1087	1088	1140	1139	

		"face"	
		"l"	4	1068	3619	-1120	-3619	
		"lt"	4	1088	1089	1141	1140	

		"face"	
		"l"	4	1069	3620	-1121	-3620	
		"lt"	4	1089	1090	1142	1141	

		"face"	
		"l"	4	1070	3570	-1122	-3621	
		"lt"	4	1090	1091	1143	1142	

		"face"	
		"l"	4	1071	3622	-1123	-3622	
		"lt"	4	1092	1093	1145	1144	

		"face"	
		"l"	4	1072	3623	-1124	-3623	
		"lt"	4	1093	1094	1146	1145	

		"face"	
		"l"	4	1073	3624	-1125	-3624	
		"lt"	4	1094	1095	1147	1146	

		"face"	
		"l"	4	1074	3625	-1126	-3625	
		"lt"	4	1095	1096	1148	1147	

		"face"	
		"l"	4	1075	3626	-1127	-3626	
		"lt"	4	1096	1097	1149	1148	

		"face"	
		"l"	4	1076	3627	-1128	-3627	
		"lt"	4	1097	1098	1150	1149	

		"face"	
		"l"	4	1077	3628	-1129	-3628	
		"lt"	4	1098	1099	1151	1150	

		"face"	
		"l"	4	1078	3629	-1130	-3629	
		"lt"	4	1099	1100	1152	1151	

		"face"	
		"l"	4	1079	3630	-1131	-3630	
		"lt"	4	1100	1101	1153	1152	

		"face"	
		"l"	4	1080	3631	-1132	-3631	
		"lt"	4	1101	1102	1154	1153	

		"face"	
		"l"	4	1081	3632	-1133	-3632	
		"lt"	4	1102	1103	1155	1154	

		"face"	
		"l"	4	1082	3633	-1134	-3633	
		"lt"	4	1103	1104	1156	1155	

		"face"	
		"l"	4	1083	3634	-1135	-3634	
		"lt"	4	1104	1105	1157	1156	

		"face"	
		"l"	4	1084	3635	-1136	-3635	
		"lt"	4	1105	1106	1158	1157	

		"face"	
		"l"	4	1085	3636	-1137	-3636	
		"lt"	4	1106	1107	1159	1158	

		"face"	
		"l"	4	1086	3637	-1138	-3637	
		"lt"	4	1107	1108	1160	1159	

		"face"	
		"l"	4	1087	3638	-1139	-3638	
		"lt"	4	1108	1109	1161	1160	

		"face"	
		"l"	4	1088	3639	-1140	-3639	
		"lt"	4	1109	1110	1162	1161	

		"face"	
		"l"	4	1089	3640	-1141	-3640	
		"lt"	4	1110	1111	1163	1162	

		"face"	
		"l"	4	1090	3641	-1142	-3641	
		"lt"	4	1111	1112	1164	1163	

		"face"	
		"l"	4	1091	3642	-1143	-3642	
		"lt"	4	1112	1113	1165	1164	

		"face"	
		"l"	4	1092	3643	-1144	-3643	
		"lt"	4	1113	1114	1166	1165	

		"face"	
		"l"	4	1093	3644	-1145	-3644	
		"lt"	4	1114	1115	1167	1166	

		"face"	
		"l"	4	1094	3645	-1146	-3645	
		"lt"	4	1115	1116	1168	1167	

		"face"	
		"l"	4	1095	3646	-1147	-3646	
		"lt"	4	1116	1117	1169	1168	

		"face"	
		"l"	4	1096	3647	-1148	-3647	
		"lt"	4	1117	1118	1170	1169	

		"face"	
		"l"	4	1097	3648	-1149	-3648	
		"lt"	4	1118	1119	1171	1170	

		"face"	
		"l"	4	1098	3649	-1150	-3649	
		"lt"	4	1119	1120	1172	1171	

		"face"	
		"l"	4	1099	3650	-1151	-3650	
		"lt"	4	1120	1121	1173	1172	

		"face"	
		"l"	4	1100	3651	-1152	-3651	
		"lt"	4	1121	1122	1174	1173	

		"face"	
		"l"	4	1101	3652	-1153	-3652	
		"lt"	4	1122	1123	1175	1174	

		"face"	
		"l"	4	1102	3653	-1154	-3653	
		"lt"	4	1123	1124	1176	1175	

		"face"	
		"l"	4	1103	3654	-1155	-3654	
		"lt"	4	1124	1125	1177	1176	

		"face"	
		"l"	4	1104	3655	-1156	-3655	
		"lt"	4	1125	1126	1178	1177	

		"face"	
		"l"	4	1105	3656	-1157	-3656	
		"lt"	4	1126	1127	1179	1178	

		"face"	
		"l"	4	1106	3657	-1158	-3657	
		"lt"	4	1127	1128	1180	1179	

		"face"	
		"l"	4	1107	3658	-1159	-3658	
		"lt"	4	1128	1129	1181	1180	

		"face"	
		"l"	4	1108	3659	-1160	-3659	
		"lt"	4	1129	1130	1182	1181	

		"face"	
		"l"	4	1109	3660	-1161	-3660	
		"lt"	4	1130	1131	1183	1182	

		"face"	
		"l"	4	1110	3661	-1162	-3661	
		"lt"	4	1131	1132	1184	1183	

		"face"	
		"l"	4	1111	3662	-1163	-3662	
		"lt"	4	1132	1133	1185	1184	

		"face"	
		"l"	4	1112	3663	-1164	-3663	
		"lt"	4	1133	1134	1186	1185	

		"face"	
		"l"	4	1113	3664	-1165	-3664	
		"lt"	4	1134	1135	1187	1186	

		"face"	
		"l"	4	1114	3665	-1166	-3665	
		"lt"	4	1135	1136	1188	1187	

		"face"	
		"l"	4	1115	3666	-1167	-3666	
		"lt"	4	1136	1137	1189	1188	

		"face"	
		"l"	4	1116	3667	-1168	-3667	
		"lt"	4	1137	1138	1190	1189	

		"face"	
		"l"	4	1117	3668	-1169	-3668	
		"lt"	4	1138	1139	1191	1190	

		"face"	
		"l"	4	1118	3669	-1170	-3669	
		"lt"	4	1139	1140	1192	1191	

		"face"	
		"l"	4	1119	3670	-1171	-3670	
		"lt"	4	1140	1141	1193	1192	

		"face"	
		"l"	4	1120	3671	-1172	-3671	
		"lt"	4	1141	1142	1194	1193	

		"face"	
		"l"	4	1121	3621	-1173	-3672	
		"lt"	4	1142	1143	1195	1194	

		"face"	
		"l"	4	1122	3673	-1174	-3673	
		"lt"	4	1144	1145	1197	1196	

		"face"	
		"l"	4	1123	3674	-1175	-3674	
		"lt"	4	1145	1146	1198	1197	

		"face"	
		"l"	4	1124	3675	-1176	-3675	
		"lt"	4	1146	1147	1199	1198	

		"face"	
		"l"	4	1125	3676	-1177	-3676	
		"lt"	4	1147	1148	1200	1199	

		"face"	
		"l"	4	1126	3677	-1178	-3677	
		"lt"	4	1148	1149	1201	1200	

		"face"	
		"l"	4	1127	3678	-1179	-3678	
		"lt"	4	1149	1150	1202	1201	

		"face"	
		"l"	4	1128	3679	-1180	-3679	
		"lt"	4	1150	1151	1203	1202	

		"face"	
		"l"	4	1129	3680	-1181	-3680	
		"lt"	4	1151	1152	1204	1203	

		"face"	
		"l"	4	1130	3681	-1182	-3681	
		"lt"	4	1152	1153	1205	1204	

		"face"	
		"l"	4	1131	3682	-1183	-3682	
		"lt"	4	1153	1154	1206	1205	

		"face"	
		"l"	4	1132	3683	-1184	-3683	
		"lt"	4	1154	1155	1207	1206	

		"face"	
		"l"	4	1133	3684	-1185	-3684	
		"lt"	4	1155	1156	1208	1207	

		"face"	
		"l"	4	1134	3685	-1186	-3685	
		"lt"	4	1156	1157	1209	1208	

		"face"	
		"l"	4	1135	3686	-1187	-3686	
		"lt"	4	1157	1158	1210	1209	

		"face"	
		"l"	4	1136	3687	-1188	-3687	
		"lt"	4	1158	1159	1211	1210	

		"face"	
		"l"	4	1137	3688	-1189	-3688	
		"lt"	4	1159	1160	1212	1211	

		"face"	
		"l"	4	1138	3689	-1190	-3689	
		"lt"	4	1160	1161	1213	1212	

		"face"	
		"l"	4	1139	3690	-1191	-3690	
		"lt"	4	1161	1162	1214	1213	

		"face"	
		"l"	4	1140	3691	-1192	-3691	
		"lt"	4	1162	1163	1215	1214	

		"face"	
		"l"	4	1141	3692	-1193	-3692	
		"lt"	4	1163	1164	1216	1215	

		"face"	
		"l"	4	1142	3693	-1194	-3693	
		"lt"	4	1164	1165	1217	1216	

		"face"	
		"l"	4	1143	3694	-1195	-3694	
		"lt"	4	1165	1166	1218	1217	

		"face"	
		"l"	4	1144	3695	-1196	-3695	
		"lt"	4	1166	1167	1219	1218	

		"face"	
		"l"	4	1145	3696	-1197	-3696	
		"lt"	4	1167	1168	1220	1219	

		"face"	
		"l"	4	1146	3697	-1198	-3697	
		"lt"	4	1168	1169	1221	1220	

		"face"	
		"l"	4	1147	3698	-1199	-3698	
		"lt"	4	1169	1170	1222	1221	

		"face"	
		"l"	4	1148	3699	-1200	-3699	
		"lt"	4	1170	1171	1223	1222	

		"face"	
		"l"	4	1149	3700	-1201	-3700	
		"lt"	4	1171	1172	1224	1223	

		"face"	
		"l"	4	1150	3701	-1202	-3701	
		"lt"	4	1172	1173	1225	1224	

		"face"	
		"l"	4	1151	3702	-1203	-3702	
		"lt"	4	1173	1174	1226	1225	

		"face"	
		"l"	4	1152	3703	-1204	-3703	
		"lt"	4	1174	1175	1227	1226	

		"face"	
		"l"	4	1153	3704	-1205	-3704	
		"lt"	4	1175	1176	1228	1227	

		"face"	
		"l"	4	1154	3705	-1206	-3705	
		"lt"	4	1176	1177	1229	1228	

		"face"	
		"l"	4	1155	3706	-1207	-3706	
		"lt"	4	1177	1178	1230	1229	

		"face"	
		"l"	4	1156	3707	-1208	-3707	
		"lt"	4	1178	1179	1231	1230	

		"face"	
		"l"	4	1157	3708	-1209	-3708	
		"lt"	4	1179	1180	1232	1231	

		"face"	
		"l"	4	1158	3709	-1210	-3709	
		"lt"	4	1180	1181	1233	1232	

		"face"	
		"l"	4	1159	3710	-1211	-3710	
		"lt"	4	1181	1182	1234	1233	

		"face"	
		"l"	4	1160	3711	-1212	-3711	
		"lt"	4	1182	1183	1235	1234	

		"face"	
		"l"	4	1161	3712	-1213	-3712	
		"lt"	4	1183	1184	1236	1235	

		"face"	
		"l"	4	1162	3713	-1214	-3713	
		"lt"	4	1184	1185	1237	1236	

		"face"	
		"l"	4	1163	3714	-1215	-3714	
		"lt"	4	1185	1186	1238	1237	

		"face"	
		"l"	4	1164	3715	-1216	-3715	
		"lt"	4	1186	1187	1239	1238	

		"face"	
		"l"	4	1165	3716	-1217	-3716	
		"lt"	4	1187	1188	1240	1239	

		"face"	
		"l"	4	1166	3717	-1218	-3717	
		"lt"	4	1188	1189	1241	1240	

		"face"	
		"l"	4	1167	3718	-1219	-3718	
		"lt"	4	1189	1190	1242	1241	

		"face"	
		"l"	4	1168	3719	-1220	-3719	
		"lt"	4	1190	1191	1243	1242	

		"face"	
		"l"	4	1169	3720	-1221	-3720	
		"lt"	4	1191	1192	1244	1243	

		"face"	
		"l"	4	1170	3721	-1222	-3721	
		"lt"	4	1192	1193	1245	1244	

		"face"	
		"l"	4	1171	3722	-1223	-3722	
		"lt"	4	1193	1194	1246	1245	

		"face"	
		"l"	4	1172	3672	-1224	-3723	
		"lt"	4	1194	1195	1247	1246	

		"face"	
		"l"	4	1173	3724	-1225	-3724	
		"lt"	4	1196	1197	1249	1248	

		"face"	
		"l"	4	1174	3725	-1226	-3725	
		"lt"	4	1197	1198	1250	1249	

		"face"	
		"l"	4	1175	3726	-1227	-3726	
		"lt"	4	1198	1199	1251	1250	

		"face"	
		"l"	4	1176	3727	-1228	-3727	
		"lt"	4	1199	1200	1252	1251	

		"face"	
		"l"	4	1177	3728	-1229	-3728	
		"lt"	4	1200	1201	1253	1252	

		"face"	
		"l"	4	1178	3729	-1230	-3729	
		"lt"	4	1201	1202	1254	1253	

		"face"	
		"l"	4	1179	3730	-1231	-3730	
		"lt"	4	1202	1203	1255	1254	

		"face"	
		"l"	4	1180	3731	-1232	-3731	
		"lt"	4	1203	1204	1256	1255	

		"face"	
		"l"	4	1181	3732	-1233	-3732	
		"lt"	4	1204	1205	1257	1256	

		"face"	
		"l"	4	1182	3733	-1234	-3733	
		"lt"	4	1205	1206	1258	1257	

		"face"	
		"l"	4	1183	3734	-1235	-3734	
		"lt"	4	1206	1207	1259	1258	

		"face"	
		"l"	4	1184	3735	-1236	-3735	
		"lt"	4	1207	1208	1260	1259	

		"face"	
		"l"	4	1185	3736	-1237	-3736	
		"lt"	4	1208	1209	1261	1260	

		"face"	
		"l"	4	1186	3737	-1238	-3737	
		"lt"	4	1209	1210	1262	1261	

		"face"	
		"l"	4	1187	3738	-1239	-3738	
		"lt"	4	1210	1211	1263	1262	

		"face"	
		"l"	4	1188	3739	-1240	-3739	
		"lt"	4	1211	1212	1264	1263	

		"face"	
		"l"	4	1189	3740	-1241	-3740	
		"lt"	4	1212	1213	1265	1264	

		"face"	
		"l"	4	1190	3741	-1242	-3741	
		"lt"	4	1213	1214	1266	1265	

		"face"	
		"l"	4	1191	3742	-1243	-3742	
		"lt"	4	1214	1215	1267	1266	

		"face"	
		"l"	4	1192	3743	-1244	-3743	
		"lt"	4	1215	1216	1268	1267	

		"face"	
		"l"	4	1193	3744	-1245	-3744	
		"lt"	4	1216	1217	1269	1268	

		"face"	
		"l"	4	1194	3745	-1246	-3745	
		"lt"	4	1217	1218	1270	1269	

		"face"	
		"l"	4	1195	3746	-1247	-3746	
		"lt"	4	1218	1219	1271	1270	

		"face"	
		"l"	4	1196	3747	-1248	-3747	
		"lt"	4	1219	1220	1272	1271	

		"face"	
		"l"	4	1197	3748	-1249	-3748	
		"lt"	4	1220	1221	1273	1272	

		"face"	
		"l"	4	1198	3749	-1250	-3749	
		"lt"	4	1221	1222	1274	1273	

		"face"	
		"l"	4	1199	3750	-1251	-3750	
		"lt"	4	1222	1223	1275	1274	

		"face"	
		"l"	4	1200	3751	-1252	-3751	
		"lt"	4	1223	1224	1276	1275	

		"face"	
		"l"	4	1201	3752	-1253	-3752	
		"lt"	4	1224	1225	1277	1276	

		"face"	
		"l"	4	1202	3753	-1254	-3753	
		"lt"	4	1225	1226	1278	1277	

		"face"	
		"l"	4	1203	3754	-1255	-3754	
		"lt"	4	1226	1227	1279	1278	

		"face"	
		"l"	4	1204	3755	-1256	-3755	
		"lt"	4	1227	1228	1280	1279	

		"face"	
		"l"	4	1205	3756	-1257	-3756	
		"lt"	4	1228	1229	1281	1280	

		"face"	
		"l"	4	1206	3757	-1258	-3757	
		"lt"	4	1229	1230	1282	1281	

		"face"	
		"l"	4	1207	3758	-1259	-3758	
		"lt"	4	1230	1231	1283	1282	

		"face"	
		"l"	4	1208	3759	-1260	-3759	
		"lt"	4	1231	1232	1284	1283	

		"face"	
		"l"	4	1209	3760	-1261	-3760	
		"lt"	4	1232	1233	1285	1284	

		"face"	
		"l"	4	1210	3761	-1262	-3761	
		"lt"	4	1233	1234	1286	1285	

		"face"	
		"l"	4	1211	3762	-1263	-3762	
		"lt"	4	1234	1235	1287	1286	

		"face"	
		"l"	4	1212	3763	-1264	-3763	
		"lt"	4	1235	1236	1288	1287	

		"face"	
		"l"	4	1213	3764	-1265	-3764	
		"lt"	4	1236	1237	1289	1288	

		"face"	
		"l"	4	1214	3765	-1266	-3765	
		"lt"	4	1237	1238	1290	1289	

		"face"	
		"l"	4	1215	3766	-1267	-3766	
		"lt"	4	1238	1239	1291	1290	

		"face"	
		"l"	4	1216	3767	-1268	-3767	
		"lt"	4	1239	1240	1292	1291	

		"face"	
		"l"	4	1217	3768	-1269	-3768	
		"lt"	4	1240	1241	1293	1292	

		"face"	
		"l"	4	1218	3769	-1270	-3769	
		"lt"	4	1241	1242	1294	1293	

		"face"	
		"l"	4	1219	3770	-1271	-3770	
		"lt"	4	1242	1243	1295	1294	

		"face"	
		"l"	4	1220	3771	-1272	-3771	
		"lt"	4	1243	1244	1296	1295	

		"face"	
		"l"	4	1221	3772	-1273	-3772	
		"lt"	4	1244	1245	1297	1296	

		"face"	
		"l"	4	1222	3773	-1274	-3773	
		"lt"	4	1245	1246	1298	1297	

		"face"	
		"l"	4	1223	3723	-1275	-3774	
		"lt"	4	1246	1247	1299	1298	

		"face"	
		"l"	4	1224	3775	-1276	-3775	
		"lt"	4	1248	1249	1301	1300	

		"face"	
		"l"	4	1225	3776	-1277	-3776	
		"lt"	4	1249	1250	1302	1301	

		"face"	
		"l"	4	1226	3777	-1278	-3777	
		"lt"	4	1250	1251	1303	1302	

		"face"	
		"l"	4	1227	3778	-1279	-3778	
		"lt"	4	1251	1252	1304	1303	

		"face"	
		"l"	4	1228	3779	-1280	-3779	
		"lt"	4	1252	1253	1305	1304	

		"face"	
		"l"	4	1229	3780	-1281	-3780	
		"lt"	4	1253	1254	1306	1305	

		"face"	
		"l"	4	1230	3781	-1282	-3781	
		"lt"	4	1254	1255	1307	1306	

		"face"	
		"l"	4	1231	3782	-1283	-3782	
		"lt"	4	1255	1256	1308	1307	

		"face"	
		"l"	4	1232	3783	-1284	-3783	
		"lt"	4	1256	1257	1309	1308	

		"face"	
		"l"	4	1233	3784	-1285	-3784	
		"lt"	4	1257	1258	1310	1309	

		"face"	
		"l"	4	1234	3785	-1286	-3785	
		"lt"	4	1258	1259	1311	1310	

		"face"	
		"l"	4	1235	3786	-1287	-3786	
		"lt"	4	1259	1260	1312	1311	

		"face"	
		"l"	4	1236	3787	-1288	-3787	
		"lt"	4	1260	1261	1313	1312	

		"face"	
		"l"	4	1237	3788	-1289	-3788	
		"lt"	4	1261	1262	1314	1313	

		"face"	
		"l"	4	1238	3789	-1290	-3789	
		"lt"	4	1262	1263	1315	1314	

		"face"	
		"l"	4	1239	3790	-1291	-3790	
		"lt"	4	1263	1264	1316	1315	

		"face"	
		"l"	4	1240	3791	-1292	-3791	
		"lt"	4	1264	1265	1317	1316	

		"face"	
		"l"	4	1241	3792	-1293	-3792	
		"lt"	4	1265	1266	1318	1317	

		"face"	
		"l"	4	1242	3793	-1294	-3793	
		"lt"	4	1266	1267	1319	1318	

		"face"	
		"l"	4	1243	3794	-1295	-3794	
		"lt"	4	1267	1268	1320	1319	

		"face"	
		"l"	4	1244	3795	-1296	-3795	
		"lt"	4	1268	1269	1321	1320	

		"face"	
		"l"	4	1245	3796	-1297	-3796	
		"lt"	4	1269	1270	1322	1321	

		"face"	
		"l"	4	1246	3797	-1298	-3797	
		"lt"	4	1270	1271	1323	1322	

		"face"	
		"l"	4	1247	3798	-1299	-3798	
		"lt"	4	1271	1272	1324	1323	

		"face"	
		"l"	4	1248	3799	-1300	-3799	
		"lt"	4	1272	1273	1325	1324	

		"face"	
		"l"	4	1249	3800	-1301	-3800	
		"lt"	4	1273	1274	1326	1325	

		"face"	
		"l"	4	1250	3801	-1302	-3801	
		"lt"	4	1274	1275	1327	1326	

		"face"	
		"l"	4	1251	3802	-1303	-3802	
		"lt"	4	1275	1276	1328	1327	

		"face"	
		"l"	4	1252	3803	-1304	-3803	
		"lt"	4	1276	1277	1329	1328	

		"face"	
		"l"	4	1253	3804	-1305	-3804	
		"lt"	4	1277	1278	1330	1329	

		"face"	
		"l"	4	1254	3805	-1306	-3805	
		"lt"	4	1278	1279	1331	1330	

		"face"	
		"l"	4	1255	3806	-1307	-3806	
		"lt"	4	1279	1280	1332	1331	

		"face"	
		"l"	4	1256	3807	-1308	-3807	
		"lt"	4	1280	1281	1333	1332	

		"face"	
		"l"	4	1257	3808	-1309	-3808	
		"lt"	4	1281	1282	1334	1333	

		"face"	
		"l"	4	1258	3809	-1310	-3809	
		"lt"	4	1282	1283	1335	1334	

		"face"	
		"l"	4	1259	3810	-1311	-3810	
		"lt"	4	1283	1284	1336	1335	

		"face"	
		"l"	4	1260	3811	-1312	-3811	
		"lt"	4	1284	1285	1337	1336	

		"face"	
		"l"	4	1261	3812	-1313	-3812	
		"lt"	4	1285	1286	1338	1337	

		"face"	
		"l"	4	1262	3813	-1314	-3813	
		"lt"	4	1286	1287	1339	1338	

		"face"	
		"l"	4	1263	3814	-1315	-3814	
		"lt"	4	1287	1288	1340	1339	

		"face"	
		"l"	4	1264	3815	-1316	-3815	
		"lt"	4	1288	1289	1341	1340	

		"face"	
		"l"	4	1265	3816	-1317	-3816	
		"lt"	4	1289	1290	1342	1341	

		"face"	
		"l"	4	1266	3817	-1318	-3817	
		"lt"	4	1290	1291	1343	1342	

		"face"	
		"l"	4	1267	3818	-1319	-3818	
		"lt"	4	1291	1292	1344	1343	

		"face"	
		"l"	4	1268	3819	-1320	-3819	
		"lt"	4	1292	1293	1345	1344	

		"face"	
		"l"	4	1269	3820	-1321	-3820	
		"lt"	4	1293	1294	1346	1345	

		"face"	
		"l"	4	1270	3821	-1322	-3821	
		"lt"	4	1294	1295	1347	1346	

		"face"	
		"l"	4	1271	3822	-1323	-3822	
		"lt"	4	1295	1296	1348	1347	

		"face"	
		"l"	4	1272	3823	-1324	-3823	
		"lt"	4	1296	1297	1349	1348	

		"face"	
		"l"	4	1273	3824	-1325	-3824	
		"lt"	4	1297	1298	1350	1349	

		"face"	
		"l"	4	1274	3774	-1326	-3825	
		"lt"	4	1298	1299	1351	1350	

		"face"	
		"l"	4	1275	3826	-1327	-3826	
		"lt"	4	1300	1301	1353	1352	

		"face"	
		"l"	4	1276	3827	-1328	-3827	
		"lt"	4	1301	1302	1354	1353	

		"face"	
		"l"	4	1277	3828	-1329	-3828	
		"lt"	4	1302	1303	1355	1354	

		"face"	
		"l"	4	1278	3829	-1330	-3829	
		"lt"	4	1303	1304	1356	1355	

		"face"	
		"l"	4	1279	3830	-1331	-3830	
		"lt"	4	1304	1305	1357	1356	

		"face"	
		"l"	4	1280	3831	-1332	-3831	
		"lt"	4	1305	1306	1358	1357	

		"face"	
		"l"	4	1281	3832	-1333	-3832	
		"lt"	4	1306	1307	1359	1358	

		"face"	
		"l"	4	1282	3833	-1334	-3833	
		"lt"	4	1307	1308	1360	1359	

		"face"	
		"l"	4	1283	3834	-1335	-3834	
		"lt"	4	1308	1309	1361	1360	

		"face"	
		"l"	4	1284	3835	-1336	-3835	
		"lt"	4	1309	1310	1362	1361	

		"face"	
		"l"	4	1285	3836	-1337	-3836	
		"lt"	4	1310	1311	1363	1362	

		"face"	
		"l"	4	1286	3837	-1338	-3837	
		"lt"	4	1311	1312	1364	1363	

		"face"	
		"l"	4	1287	3838	-1339	-3838	
		"lt"	4	1312	1313	1365	1364	

		"face"	
		"l"	4	1288	3839	-1340	-3839	
		"lt"	4	1313	1314	1366	1365	

		"face"	
		"l"	4	1289	3840	-1341	-3840	
		"lt"	4	1314	1315	1367	1366	

		"face"	
		"l"	4	1290	3841	-1342	-3841	
		"lt"	4	1315	1316	1368	1367	

		"face"	
		"l"	4	1291	3842	-1343	-3842	
		"lt"	4	1316	1317	1369	1368	

		"face"	
		"l"	4	1292	3843	-1344	-3843	
		"lt"	4	1317	1318	1370	1369	

		"face"	
		"l"	4	1293	3844	-1345	-3844	
		"lt"	4	1318	1319	1371	1370	

		"face"	
		"l"	4	1294	3845	-1346	-3845	
		"lt"	4	1319	1320	1372	1371	

		"face"	
		"l"	4	1295	3846	-1347	-3846	
		"lt"	4	1320	1321	1373	1372	

		"face"	
		"l"	4	1296	3847	-1348	-3847	
		"lt"	4	1321	1322	1374	1373	

		"face"	
		"l"	4	1297	3848	-1349	-3848	
		"lt"	4	1322	1323	1375	1374	

		"face"	
		"l"	4	1298	3849	-1350	-3849	
		"lt"	4	1323	1324	1376	1375	

		"face"	
		"l"	4	1299	3850	-1351	-3850	
		"lt"	4	1324	1325	1377	1376	

		"face"	
		"l"	4	1300	3851	-1352	-3851	
		"lt"	4	1325	1326	1378	1377	

		"face"	
		"l"	4	1301	3852	-1353	-3852	
		"lt"	4	1326	1327	1379	1378	

		"face"	
		"l"	4	1302	3853	-1354	-3853	
		"lt"	4	1327	1328	1380	1379	

		"face"	
		"l"	4	1303	3854	-1355	-3854	
		"lt"	4	1328	1329	1381	1380	

		"face"	
		"l"	4	1304	3855	-1356	-3855	
		"lt"	4	1329	1330	1382	1381	

		"face"	
		"l"	4	1305	3856	-1357	-3856	
		"lt"	4	1330	1331	1383	1382	

		"face"	
		"l"	4	1306	3857	-1358	-3857	
		"lt"	4	1331	1332	1384	1383	

		"face"	
		"l"	4	1307	3858	-1359	-3858	
		"lt"	4	1332	1333	1385	1384	

		"face"	
		"l"	4	1308	3859	-1360	-3859	
		"lt"	4	1333	1334	1386	1385	

		"face"	
		"l"	4	1309	3860	-1361	-3860	
		"lt"	4	1334	1335	1387	1386	

		"face"	
		"l"	4	1310	3861	-1362	-3861	
		"lt"	4	1335	1336	1388	1387	

		"face"	
		"l"	4	1311	3862	-1363	-3862	
		"lt"	4	1336	1337	1389	1388	

		"face"	
		"l"	4	1312	3863	-1364	-3863	
		"lt"	4	1337	1338	1390	1389	

		"face"	
		"l"	4	1313	3864	-1365	-3864	
		"lt"	4	1338	1339	1391	1390	

		"face"	
		"l"	4	1314	3865	-1366	-3865	
		"lt"	4	1339	1340	1392	1391	

		"face"	
		"l"	4	1315	3866	-1367	-3866	
		"lt"	4	1340	1341	1393	1392	

		"face"	
		"l"	4	1316	3867	-1368	-3867	
		"lt"	4	1341	1342	1394	1393	

		"face"	
		"l"	4	1317	3868	-1369	-3868	
		"lt"	4	1342	1343	1395	1394	

		"face"	
		"l"	4	1318	3869	-1370	-3869	
		"lt"	4	1343	1344	1396	1395	

		"face"	
		"l"	4	1319	3870	-1371	-3870	
		"lt"	4	1344	1345	1397	1396	

		"face"	
		"l"	4	1320	3871	-1372	-3871	
		"lt"	4	1345	1346	1398	1397	

		"face"	
		"l"	4	1321	3872	-1373	-3872	
		"lt"	4	1346	1347	1399	1398	

		"face"	
		"l"	4	1322	3873	-1374	-3873	
		"lt"	4	1347	1348	1400	1399	

		"face"	
		"l"	4	1323	3874	-1375	-3874	
		"lt"	4	1348	1349	1401	1400	

		"face"	
		"l"	4	1324	3875	-1376	-3875	
		"lt"	4	1349	1350	1402	1401	

		"face"	
		"l"	4	1325	3825	-1377	-3876	
		"lt"	4	1350	1351	1403	1402	

		"face"	
		"l"	4	1326	3877	-1378	-3877	
		"lt"	4	1352	1353	1405	1404	

		"face"	
		"l"	4	1327	3878	-1379	-3878	
		"lt"	4	1353	1354	1406	1405	

		"face"	
		"l"	4	1328	3879	-1380	-3879	
		"lt"	4	1354	1355	1407	1406	

		"face"	
		"l"	4	1329	3880	-1381	-3880	
		"lt"	4	1355	1356	1408	1407	

		"face"	
		"l"	4	1330	3881	-1382	-3881	
		"lt"	4	1356	1357	1409	1408	

		"face"	
		"l"	4	1331	3882	-1383	-3882	
		"lt"	4	1357	1358	1410	1409	

		"face"	
		"l"	4	1332	3883	-1384	-3883	
		"lt"	4	1358	1359	1411	1410	

		"face"	
		"l"	4	1333	3884	-1385	-3884	
		"lt"	4	1359	1360	1412	1411	

		"face"	
		"l"	4	1334	3885	-1386	-3885	
		"lt"	4	1360	1361	1413	1412	

		"face"	
		"l"	4	1335	3886	-1387	-3886	
		"lt"	4	1361	1362	1414	1413	

		"face"	
		"l"	4	1336	3887	-1388	-3887	
		"lt"	4	1362	1363	1415	1414	

		"face"	
		"l"	4	1337	3888	-1389	-3888	
		"lt"	4	1363	1364	1416	1415	

		"face"	
		"l"	4	1338	3889	-1390	-3889	
		"lt"	4	1364	1365	1417	1416	

		"face"	
		"l"	4	1339	3890	-1391	-3890	
		"lt"	4	1365	1366	1418	1417	

		"face"	
		"l"	4	1340	3891	-1392	-3891	
		"lt"	4	1366	1367	1419	1418	

		"face"	
		"l"	4	1341	3892	-1393	-3892	
		"lt"	4	1367	1368	1420	1419	

		"face"	
		"l"	4	1342	3893	-1394	-3893	
		"lt"	4	1368	1369	1421	1420	

		"face"	
		"l"	4	1343	3894	-1395	-3894	
		"lt"	4	1369	1370	1422	1421	

		"face"	
		"l"	4	1344	3895	-1396	-3895	
		"lt"	4	1370	1371	1423	1422	

		"face"	
		"l"	4	1345	3896	-1397	-3896	
		"lt"	4	1371	1372	1424	1423	

		"face"	
		"l"	4	1346	3897	-1398	-3897	
		"lt"	4	1372	1373	1425	1424	

		"face"	
		"l"	4	1347	3898	-1399	-3898	
		"lt"	4	1373	1374	1426	1425	

		"face"	
		"l"	4	1348	3899	-1400	-3899	
		"lt"	4	1374	1375	1427	1426	

		"face"	
		"l"	4	1349	3900	-1401	-3900	
		"lt"	4	1375	1376	1428	1427	

		"face"	
		"l"	4	1350	3901	-1402	-3901	
		"lt"	4	1376	1377	1429	1428	

		"face"	
		"l"	4	1351	3902	-1403	-3902	
		"lt"	4	1377	1378	1430	1429	

		"face"	
		"l"	4	1352	3903	-1404	-3903	
		"lt"	4	1378	1379	1431	1430	

		"face"	
		"l"	4	1353	3904	-1405	-3904	
		"lt"	4	1379	1380	1432	1431	

		"face"	
		"l"	4	1354	3905	-1406	-3905	
		"lt"	4	1380	1381	1433	1432	

		"face"	
		"l"	4	1355	3906	-1407	-3906	
		"lt"	4	1381	1382	1434	1433	

		"face"	
		"l"	4	1356	3907	-1408	-3907	
		"lt"	4	1382	1383	1435	1434	

		"face"	
		"l"	4	1357	3908	-1409	-3908	
		"lt"	4	1383	1384	1436	1435	

		"face"	
		"l"	4	1358	3909	-1410	-3909	
		"lt"	4	1384	1385	1437	1436	

		"face"	
		"l"	4	1359	3910	-1411	-3910	
		"lt"	4	1385	1386	1438	1437	

		"face"	
		"l"	4	1360	3911	-1412	-3911	
		"lt"	4	1386	1387	1439	1438	

		"face"	
		"l"	4	1361	3912	-1413	-3912	
		"lt"	4	1387	1388	1440	1439	

		"face"	
		"l"	4	1362	3913	-1414	-3913	
		"lt"	4	1388	1389	1441	1440	

		"face"	
		"l"	4	1363	3914	-1415	-3914	
		"lt"	4	1389	1390	1442	1441	

		"face"	
		"l"	4	1364	3915	-1416	-3915	
		"lt"	4	1390	1391	1443	1442	

		"face"	
		"l"	4	1365	3916	-1417	-3916	
		"lt"	4	1391	1392	1444	1443	

		"face"	
		"l"	4	1366	3917	-1418	-3917	
		"lt"	4	1392	1393	1445	1444	

		"face"	
		"l"	4	1367	3918	-1419	-3918	
		"lt"	4	1393	1394	1446	1445	

		"face"	
		"l"	4	1368	3919	-1420	-3919	
		"lt"	4	1394	1395	1447	1446	

		"face"	
		"l"	4	1369	3920	-1421	-3920	
		"lt"	4	1395	1396	1448	1447	

		"face"	
		"l"	4	1370	3921	-1422	-3921	
		"lt"	4	1396	1397	1449	1448	

		"face"	
		"l"	4	1371	3922	-1423	-3922	
		"lt"	4	1397	1398	1450	1449	

		"face"	
		"l"	4	1372	3923	-1424	-3923	
		"lt"	4	1398	1399	1451	1450	

		"face"	
		"l"	4	1373	3924	-1425	-3924	
		"lt"	4	1399	1400	1452	1451	

		"face"	
		"l"	4	1374	3925	-1426	-3925	
		"lt"	4	1400	1401	1453	1452	

		"face"	
		"l"	4	1375	3926	-1427	-3926	
		"lt"	4	1401	1402	1454	1453	

		"face"	
		"l"	4	1376	3876	-1428	-3927	
		"lt"	4	1402	1403	1455	1454	

		"face"	
		"l"	4	1377	3928	-1429	-3928	
		"lt"	4	1404	1405	1457	1456	

		"face"	
		"l"	4	1378	3929	-1430	-3929	
		"lt"	4	1405	1406	1458	1457	

		"face"	
		"l"	4	1379	3930	-1431	-3930	
		"lt"	4	1406	1407	1459	1458	

		"face"	
		"l"	4	1380	3931	-1432	-3931	
		"lt"	4	1407	1408	1460	1459	

		"face"	
		"l"	4	1381	3932	-1433	-3932	
		"lt"	4	1408	1409	1461	1460	

		"face"	
		"l"	4	1382	3933	-1434	-3933	
		"lt"	4	1409	1410	1462	1461	

		"face"	
		"l"	4	1383	3934	-1435	-3934	
		"lt"	4	1410	1411	1463	1462	

		"face"	
		"l"	4	1384	3935	-1436	-3935	
		"lt"	4	1411	1412	1464	1463	

		"face"	
		"l"	4	1385	3936	-1437	-3936	
		"lt"	4	1412	1413	1465	1464	

		"face"	
		"l"	4	1386	3937	-1438	-3937	
		"lt"	4	1413	1414	1466	1465	

		"face"	
		"l"	4	1387	3938	-1439	-3938	
		"lt"	4	1414	1415	1467	1466	

		"face"	
		"l"	4	1388	3939	-1440	-3939	
		"lt"	4	1415	1416	1468	1467	

		"face"	
		"l"	4	1389	3940	-1441	-3940	
		"lt"	4	1416	1417	1469	1468	

		"face"	
		"l"	4	1390	3941	-1442	-3941	
		"lt"	4	1417	1418	1470	1469	

		"face"	
		"l"	4	1391	3942	-1443	-3942	
		"lt"	4	1418	1419	1471	1470	

		"face"	
		"l"	4	1392	3943	-1444	-3943	
		"lt"	4	1419	1420	1472	1471	

		"face"	
		"l"	4	1393	3944	-1445	-3944	
		"lt"	4	1420	1421	1473	1472	

		"face"	
		"l"	4	1394	3945	-1446	-3945	
		"lt"	4	1421	1422	1474	1473	

		"face"	
		"l"	4	1395	3946	-1447	-3946	
		"lt"	4	1422	1423	1475	1474	

		"face"	
		"l"	4	1396	3947	-1448	-3947	
		"lt"	4	1423	1424	1476	1475	

		"face"	
		"l"	4	1397	3948	-1449	-3948	
		"lt"	4	1424	1425	1477	1476	

		"face"	
		"l"	4	1398	3949	-1450	-3949	
		"lt"	4	1425	1426	1478	1477	

		"face"	
		"l"	4	1399	3950	-1451	-3950	
		"lt"	4	1426	1427	1479	1478	

		"face"	
		"l"	4	1400	3951	-1452	-3951	
		"lt"	4	1427	1428	1480	1479	

		"face"	
		"l"	4	1401	3952	-1453	-3952	
		"lt"	4	1428	1429	1481	1480	

		"face"	
		"l"	4	1402	3953	-1454	-3953	
		"lt"	4	1429	1430	1482	1481	

		"face"	
		"l"	4	1403	3954	-1455	-3954	
		"lt"	4	1430	1431	1483	1482	

		"face"	
		"l"	4	1404	3955	-1456	-3955	
		"lt"	4	1431	1432	1484	1483	

		"face"	
		"l"	4	1405	3956	-1457	-3956	
		"lt"	4	1432	1433	1485	1484	

		"face"	
		"l"	4	1406	3957	-1458	-3957	
		"lt"	4	1433	1434	1486	1485	

		"face"	
		"l"	4	1407	3958	-1459	-3958	
		"lt"	4	1434	1435	1487	1486	

		"face"	
		"l"	4	1408	3959	-1460	-3959	
		"lt"	4	1435	1436	1488	1487	

		"face"	
		"l"	4	1409	3960	-1461	-3960	
		"lt"	4	1436	1437	1489	1488	

		"face"	
		"l"	4	1410	3961	-1462	-3961	
		"lt"	4	1437	1438	1490	1489	

		"face"	
		"l"	4	1411	3962	-1463	-3962	
		"lt"	4	1438	1439	1491	1490	

		"face"	
		"l"	4	1412	3963	-1464	-3963	
		"lt"	4	1439	1440	1492	1491	

		"face"	
		"l"	4	1413	3964	-1465	-3964	
		"lt"	4	1440	1441	1493	1492	

		"face"	
		"l"	4	1414	3965	-1466	-3965	
		"lt"	4	1441	1442	1494	1493	

		"face"	
		"l"	4	1415	3966	-1467	-3966	
		"lt"	4	1442	1443	1495	1494	

		"face"	
		"l"	4	1416	3967	-1468	-3967	
		"lt"	4	1443	1444	1496	1495	

		"face"	
		"l"	4	1417	3968	-1469	-3968	
		"lt"	4	1444	1445	1497	1496	

		"face"	
		"l"	4	1418	3969	-1470	-3969	
		"lt"	4	1445	1446	1498	1497	

		"face"	
		"l"	4	1419	3970	-1471	-3970	
		"lt"	4	1446	1447	1499	1498	

		"face"	
		"l"	4	1420	3971	-1472	-3971	
		"lt"	4	1447	1448	1500	1499	

		"face"	
		"l"	4	1421	3972	-1473	-3972	
		"lt"	4	1448	1449	1501	1500	

		"face"	
		"l"	4	1422	3973	-1474	-3973	
		"lt"	4	1449	1450	1502	1501	

		"face"	
		"l"	4	1423	3974	-1475	-3974	
		"lt"	4	1450	1451	1503	1502	

		"face"	
		"l"	4	1424	3975	-1476	-3975	
		"lt"	4	1451	1452	1504	1503	

		"face"	
		"l"	4	1425	3976	-1477	-3976	
		"lt"	4	1452	1453	1505	1504	

		"face"	
		"l"	4	1426	3977	-1478	-3977	
		"lt"	4	1453	1454	1506	1505	

		"face"	
		"l"	4	1427	3927	-1479	-3978	
		"lt"	4	1454	1455	1507	1506	

		"face"	
		"l"	4	1428	3979	-1480	-3979	
		"lt"	4	1456	1457	1509	1508	

		"face"	
		"l"	4	1429	3980	-1481	-3980	
		"lt"	4	1457	1458	1510	1509	

		"face"	
		"l"	4	1430	3981	-1482	-3981	
		"lt"	4	1458	1459	1511	1510	

		"face"	
		"l"	4	1431	3982	-1483	-3982	
		"lt"	4	1459	1460	1512	1511	

		"face"	
		"l"	4	1432	3983	-1484	-3983	
		"lt"	4	1460	1461	1513	1512	

		"face"	
		"l"	4	1433	3984	-1485	-3984	
		"lt"	4	1461	1462	1514	1513	

		"face"	
		"l"	4	1434	3985	-1486	-3985	
		"lt"	4	1462	1463	1515	1514	

		"face"	
		"l"	4	1435	3986	-1487	-3986	
		"lt"	4	1463	1464	1516	1515	

		"face"	
		"l"	4	1436	3987	-1488	-3987	
		"lt"	4	1464	1465	1517	1516	

		"face"	
		"l"	4	1437	3988	-1489	-3988	
		"lt"	4	1465	1466	1518	1517	

		"face"	
		"l"	4	1438	3989	-1490	-3989	
		"lt"	4	1466	1467	1519	1518	

		"face"	
		"l"	4	1439	3990	-1491	-3990	
		"lt"	4	1467	1468	1520	1519	

		"face"	
		"l"	4	1440	3991	-1492	-3991	
		"lt"	4	1468	1469	1521	1520	

		"face"	
		"l"	4	1441	3992	-1493	-3992	
		"lt"	4	1469	1470	1522	1521	

		"face"	
		"l"	4	1442	3993	-1494	-3993	
		"lt"	4	1470	1471	1523	1522	

		"face"	
		"l"	4	1443	3994	-1495	-3994	
		"lt"	4	1471	1472	1524	1523	

		"face"	
		"l"	4	1444	3995	-1496	-3995	
		"lt"	4	1472	1473	1525	1524	

		"face"	
		"l"	4	1445	3996	-1497	-3996	
		"lt"	4	1473	1474	1526	1525	

		"face"	
		"l"	4	1446	3997	-1498	-3997	
		"lt"	4	1474	1475	1527	1526	

		"face"	
		"l"	4	1447	3998	-1499	-3998	
		"lt"	4	1475	1476	1528	1527	

		"face"	
		"l"	4	1448	3999	-1500	-3999	
		"lt"	4	1476	1477	1529	1528	

		"face"	
		"l"	4	1449	4000	-1501	-4000	
		"lt"	4	1477	1478	1530	1529	

		"face"	
		"l"	4	1450	4001	-1502	-4001	
		"lt"	4	1478	1479	1531	1530	

		"face"	
		"l"	4	1451	4002	-1503	-4002	
		"lt"	4	1479	1480	1532	1531	

		"face"	
		"l"	4	1452	4003	-1504	-4003	
		"lt"	4	1480	1481	1533	1532	

		"face"	
		"l"	4	1453	4004	-1505	-4004	
		"lt"	4	1481	1482	1534	1533	

		"face"	
		"l"	4	1454	4005	-1506	-4005	
		"lt"	4	1482	1483	1535	1534	

		"face"	
		"l"	4	1455	4006	-1507	-4006	
		"lt"	4	1483	1484	1536	1535	

		"face"	
		"l"	4	1456	4007	-1508	-4007	
		"lt"	4	1484	1485	1537	1536	

		"face"	
		"l"	4	1457	4008	-1509	-4008	
		"lt"	4	1485	1486	1538	1537	

		"face"	
		"l"	4	1458	4009	-1510	-4009	
		"lt"	4	1486	1487	1539	1538	

		"face"	
		"l"	4	1459	4010	-1511	-4010	
		"lt"	4	1487	1488	1540	1539	

		"face"	
		"l"	4	1460	4011	-1512	-4011	
		"lt"	4	1488	1489	1541	1540	

		"face"	
		"l"	4	1461	4012	-1513	-4012	
		"lt"	4	1489	1490	1542	1541	

		"face"	
		"l"	4	1462	4013	-1514	-4013	
		"lt"	4	1490	1491	1543	1542	

		"face"	
		"l"	4	1463	4014	-1515	-4014	
		"lt"	4	1491	1492	1544	1543	

		"face"	
		"l"	4	1464	4015	-1516	-4015	
		"lt"	4	1492	1493	1545	1544	

		"face"	
		"l"	4	1465	4016	-1517	-4016	
		"lt"	4	1493	1494	1546	1545	

		"face"	
		"l"	4	1466	4017	-1518	-4017	
		"lt"	4	1494	1495	1547	1546	

		"face"	
		"l"	4	1467	4018	-1519	-4018	
		"lt"	4	1495	1496	1548	1547	

		"face"	
		"l"	4	1468	4019	-1520	-4019	
		"lt"	4	1496	1497	1549	1548	

		"face"	
		"l"	4	1469	4020	-1521	-4020	
		"lt"	4	1497	1498	1550	1549	

		"face"	
		"l"	4	1470	4021	-1522	-4021	
		"lt"	4	1498	1499	1551	1550	

		"face"	
		"l"	4	1471	4022	-1523	-4022	
		"lt"	4	1499	1500	1552	1551	

		"face"	
		"l"	4	1472	4023	-1524	-4023	
		"lt"	4	1500	1501	1553	1552	

		"face"	
		"l"	4	1473	4024	-1525	-4024	
		"lt"	4	1501	1502	1554	1553	

		"face"	
		"l"	4	1474	4025	-1526	-4025	
		"lt"	4	1502	1503	1555	1554	

		"face"	
		"l"	4	1475	4026	-1527	-4026	
		"lt"	4	1503	1504	1556	1555	

		"face"	
		"l"	4	1476	4027	-1528	-4027	
		"lt"	4	1504	1505	1557	1556	

		"face"	
		"l"	4	1477	4028	-1529	-4028	
		"lt"	4	1505	1506	1558	1557	

		"face"	
		"l"	4	1478	3978	-1530	-4029	
		"lt"	4	1506	1507	1559	1558	

		"face"	
		"l"	4	1479	4030	-1531	-4030	
		"lt"	4	1508	1509	1561	1560	

		"face"	
		"l"	4	1480	4031	-1532	-4031	
		"lt"	4	1509	1510	1562	1561	

		"face"	
		"l"	4	1481	4032	-1533	-4032	
		"lt"	4	1510	1511	1563	1562	

		"face"	
		"l"	4	1482	4033	-1534	-4033	
		"lt"	4	1511	1512	1564	1563	

		"face"	
		"l"	4	1483	4034	-1535	-4034	
		"lt"	4	1512	1513	1565	1564	

		"face"	
		"l"	4	1484	4035	-1536	-4035	
		"lt"	4	1513	1514	1566	1565	

		"face"	
		"l"	4	1485	4036	-1537	-4036	
		"lt"	4	1514	1515	1567	1566	

		"face"	
		"l"	4	1486	4037	-1538	-4037	
		"lt"	4	1515	1516	1568	1567	

		"face"	
		"l"	4	1487	4038	-1539	-4038	
		"lt"	4	1516	1517	1569	1568	

		"face"	
		"l"	4	1488	4039	-1540	-4039	
		"lt"	4	1517	1518	1570	1569	

		"face"	
		"l"	4	1489	4040	-1541	-4040	
		"lt"	4	1518	1519	1571	1570	

		"face"	
		"l"	4	1490	4041	-1542	-4041	
		"lt"	4	1519	1520	1572	1571	

		"face"	
		"l"	4	1491	4042	-1543	-4042	
		"lt"	4	1520	1521	1573	1572	

		"face"	
		"l"	4	1492	4043	-1544	-4043	
		"lt"	4	1521	1522	1574	1573	

		"face"	
		"l"	4	1493	4044	-1545	-4044	
		"lt"	4	1522	1523	1575	1574	

		"face"	
		"l"	4	1494	4045	-1546	-4045	
		"lt"	4	1523	1524	1576	1575	

		"face"	
		"l"	4	1495	4046	-1547	-4046	
		"lt"	4	1524	1525	1577	1576	

		"face"	
		"l"	4	1496	4047	-1548	-4047	
		"lt"	4	1525	1526	1578	1577	

		"face"	
		"l"	4	1497	4048	-1549	-4048	
		"lt"	4	1526	1527	1579	1578	

		"face"	
		"l"	4	1498	4049	-1550	-4049	
		"lt"	4	1527	1528	1580	1579	

		"face"	
		"l"	4	1499	4050	-1551	-4050	
		"lt"	4	1528	1529	1581	1580	

		"face"	
		"l"	4	1500	4051	-1552	-4051	
		"lt"	4	1529	1530	1582	1581	

		"face"	
		"l"	4	1501	4052	-1553	-4052	
		"lt"	4	1530	1531	1583	1582	

		"face"	
		"l"	4	1502	4053	-1554	-4053	
		"lt"	4	1531	1532	1584	1583	

		"face"	
		"l"	4	1503	4054	-1555	-4054	
		"lt"	4	1532	1533	1585	1584	

		"face"	
		"l"	4	1504	4055	-1556	-4055	
		"lt"	4	1533	1534	1586	1585	

		"face"	
		"l"	4	1505	4056	-1557	-4056	
		"lt"	4	1534	1535	1587	1586	

		"face"	
		"l"	4	1506	4057	-1558	-4057	
		"lt"	4	1535	1536	1588	1587	

		"face"	
		"l"	4	1507	4058	-1559	-4058	
		"lt"	4	1536	1537	1589	1588	

		"face"	
		"l"	4	1508	4059	-1560	-4059	
		"lt"	4	1537	1538	1590	1589	

		"face"	
		"l"	4	1509	4060	-1561	-4060	
		"lt"	4	1538	1539	1591	1590	

		"face"	
		"l"	4	1510	4061	-1562	-4061	
		"lt"	4	1539	1540	1592	1591	

		"face"	
		"l"	4	1511	4062	-1563	-4062	
		"lt"	4	1540	1541	1593	1592	

		"face"	
		"l"	4	1512	4063	-1564	-4063	
		"lt"	4	1541	1542	1594	1593	

		"face"	
		"l"	4	1513	4064	-1565	-4064	
		"lt"	4	1542	1543	1595	1594	

		"face"	
		"l"	4	1514	4065	-1566	-4065	
		"lt"	4	1543	1544	1596	1595	

		"face"	
		"l"	4	1515	4066	-1567	-4066	
		"lt"	4	1544	1545	1597	1596	

		"face"	
		"l"	4	1516	4067	-1568	-4067	
		"lt"	4	1545	1546	1598	1597	

		"face"	
		"l"	4	1517	4068	-1569	-4068	
		"lt"	4	1546	1547	1599	1598	

		"face"	
		"l"	4	1518	4069	-1570	-4069	
		"lt"	4	1547	1548	1600	1599	

		"face"	
		"l"	4	1519	4070	-1571	-4070	
		"lt"	4	1548	1549	1601	1600	

		"face"	
		"l"	4	1520	4071	-1572	-4071	
		"lt"	4	1549	1550	1602	1601	

		"face"	
		"l"	4	1521	4072	-1573	-4072	
		"lt"	4	1550	1551	1603	1602	

		"face"	
		"l"	4	1522	4073	-1574	-4073	
		"lt"	4	1551	1552	1604	1603	

		"face"	
		"l"	4	1523	4074	-1575	-4074	
		"lt"	4	1552	1553	1605	1604	

		"face"	
		"l"	4	1524	4075	-1576	-4075	
		"lt"	4	1553	1554	1606	1605	

		"face"	
		"l"	4	1525	4076	-1577	-4076	
		"lt"	4	1554	1555	1607	1606	

		"face"	
		"l"	4	1526	4077	-1578	-4077	
		"lt"	4	1555	1556	1608	1607	

		"face"	
		"l"	4	1527	4078	-1579	-4078	
		"lt"	4	1556	1557	1609	1608	

		"face"	
		"l"	4	1528	4079	-1580	-4079	
		"lt"	4	1557	1558	1610	1609	

		"face"	
		"l"	4	1529	4029	-1581	-4080	
		"lt"	4	1558	1559	1611	1610	

		"face"	
		"l"	4	1530	4081	-1582	-4081	
		"lt"	4	1560	1561	1613	1612	

		"face"	
		"l"	4	1531	4082	-1583	-4082	
		"lt"	4	1561	1562	1614	1613	

		"face"	
		"l"	4	1532	4083	-1584	-4083	
		"lt"	4	1562	1563	1615	1614	

		"face"	
		"l"	4	1533	4084	-1585	-4084	
		"lt"	4	1563	1564	1616	1615	

		"face"	
		"l"	4	1534	4085	-1586	-4085	
		"lt"	4	1564	1565	1617	1616	

		"face"	
		"l"	4	1535	4086	-1587	-4086	
		"lt"	4	1565	1566	1618	1617	

		"face"	
		"l"	4	1536	4087	-1588	-4087	
		"lt"	4	1566	1567	1619	1618	

		"face"	
		"l"	4	1537	4088	-1589	-4088	
		"lt"	4	1567	1568	1620	1619	

		"face"	
		"l"	4	1538	4089	-1590	-4089	
		"lt"	4	1568	1569	1621	1620	

		"face"	
		"l"	4	1539	4090	-1591	-4090	
		"lt"	4	1569	1570	1622	1621	

		"face"	
		"l"	4	1540	4091	-1592	-4091	
		"lt"	4	1570	1571	1623	1622	

		"face"	
		"l"	4	1541	4092	-1593	-4092	
		"lt"	4	1571	1572	1624	1623	

		"face"	
		"l"	4	1542	4093	-1594	-4093	
		"lt"	4	1572	1573	1625	1624	

		"face"	
		"l"	4	1543	4094	-1595	-4094	
		"lt"	4	1573	1574	1626	1625	

		"face"	
		"l"	4	1544	4095	-1596	-4095	
		"lt"	4	1574	1575	1627	1626	

		"face"	
		"l"	4	1545	4096	-1597	-4096	
		"lt"	4	1575	1576	1628	1627	

		"face"	
		"l"	4	1546	4097	-1598	-4097	
		"lt"	4	1576	1577	1629	1628	

		"face"	
		"l"	4	1547	4098	-1599	-4098	
		"lt"	4	1577	1578	1630	1629	

		"face"	
		"l"	4	1548	4099	-1600	-4099	
		"lt"	4	1578	1579	1631	1630	

		"face"	
		"l"	4	1549	4100	-1601	-4100	
		"lt"	4	1579	1580	1632	1631	

		"face"	
		"l"	4	1550	4101	-1602	-4101	
		"lt"	4	1580	1581	1633	1632	

		"face"	
		"l"	4	1551	4102	-1603	-4102	
		"lt"	4	1581	1582	1634	1633	

		"face"	
		"l"	4	1552	4103	-1604	-4103	
		"lt"	4	1582	1583	1635	1634	

		"face"	
		"l"	4	1553	4104	-1605	-4104	
		"lt"	4	1583	1584	1636	1635	

		"face"	
		"l"	4	1554	4105	-1606	-4105	
		"lt"	4	1584	1585	1637	1636	

		"face"	
		"l"	4	1555	4106	-1607	-4106	
		"lt"	4	1585	1586	1638	1637	

		"face"	
		"l"	4	1556	4107	-1608	-4107	
		"lt"	4	1586	1587	1639	1638	

		"face"	
		"l"	4	1557	4108	-1609	-4108	
		"lt"	4	1587	1588	1640	1639	

		"face"	
		"l"	4	1558	4109	-1610	-4109	
		"lt"	4	1588	1589	1641	1640	

		"face"	
		"l"	4	1559	4110	-1611	-4110	
		"lt"	4	1589	1590	1642	1641	

		"face"	
		"l"	4	1560	4111	-1612	-4111	
		"lt"	4	1590	1591	1643	1642	

		"face"	
		"l"	4	1561	4112	-1613	-4112	
		"lt"	4	1591	1592	1644	1643	

		"face"	
		"l"	4	1562	4113	-1614	-4113	
		"lt"	4	1592	1593	1645	1644	

		"face"	
		"l"	4	1563	4114	-1615	-4114	
		"lt"	4	1593	1594	1646	1645	

		"face"	
		"l"	4	1564	4115	-1616	-4115	
		"lt"	4	1594	1595	1647	1646	

		"face"	
		"l"	4	1565	4116	-1617	-4116	
		"lt"	4	1595	1596	1648	1647	

		"face"	
		"l"	4	1566	4117	-1618	-4117	
		"lt"	4	1596	1597	1649	1648	

		"face"	
		"l"	4	1567	4118	-1619	-4118	
		"lt"	4	1597	1598	1650	1649	

		"face"	
		"l"	4	1568	4119	-1620	-4119	
		"lt"	4	1598	1599	1651	1650	

		"face"	
		"l"	4	1569	4120	-1621	-4120	
		"lt"	4	1599	1600	1652	1651	

		"face"	
		"l"	4	1570	4121	-1622	-4121	
		"lt"	4	1600	1601	1653	1652	

		"face"	
		"l"	4	1571	4122	-1623	-4122	
		"lt"	4	1601	1602	1654	1653	

		"face"	
		"l"	4	1572	4123	-1624	-4123	
		"lt"	4	1602	1603	1655	1654	

		"face"	
		"l"	4	1573	4124	-1625	-4124	
		"lt"	4	1603	1604	1656	1655	

		"face"	
		"l"	4	1574	4125	-1626	-4125	
		"lt"	4	1604	1605	1657	1656	

		"face"	
		"l"	4	1575	4126	-1627	-4126	
		"lt"	4	1605	1606	1658	1657	

		"face"	
		"l"	4	1576	4127	-1628	-4127	
		"lt"	4	1606	1607	1659	1658	

		"face"	
		"l"	4	1577	4128	-1629	-4128	
		"lt"	4	1607	1608	1660	1659	

		"face"	
		"l"	4	1578	4129	-1630	-4129	
		"lt"	4	1608	1609	1661	1660	

		"face"	
		"l"	4	1579	4130	-1631	-4130	
		"lt"	4	1609	1610	1662	1661	

		"face"	
		"l"	4	1580	4080	-1632	-4131	
		"lt"	4	1610	1611	1663	1662	

		"face"	
		"l"	4	1581	4132	-1633	-4132	
		"lt"	4	1612	1613	1665	1664	

		"face"	
		"l"	4	1582	4133	-1634	-4133	
		"lt"	4	1613	1614	1666	1665	

		"face"	
		"l"	4	1583	4134	-1635	-4134	
		"lt"	4	1614	1615	1667	1666	

		"face"	
		"l"	4	1584	4135	-1636	-4135	
		"lt"	4	1615	1616	1668	1667	

		"face"	
		"l"	4	1585	4136	-1637	-4136	
		"lt"	4	1616	1617	1669	1668	

		"face"	
		"l"	4	1586	4137	-1638	-4137	
		"lt"	4	1617	1618	1670	1669	

		"face"	
		"l"	4	1587	4138	-1639	-4138	
		"lt"	4	1618	1619	1671	1670	

		"face"	
		"l"	4	1588	4139	-1640	-4139	
		"lt"	4	1619	1620	1672	1671	

		"face"	
		"l"	4	1589	4140	-1641	-4140	
		"lt"	4	1620	1621	1673	1672	

		"face"	
		"l"	4	1590	4141	-1642	-4141	
		"lt"	4	1621	1622	1674	1673	

		"face"	
		"l"	4	1591	4142	-1643	-4142	
		"lt"	4	1622	1623	1675	1674	

		"face"	
		"l"	4	1592	4143	-1644	-4143	
		"lt"	4	1623	1624	1676	1675	

		"face"	
		"l"	4	1593	4144	-1645	-4144	
		"lt"	4	1624	1625	1677	1676	

		"face"	
		"l"	4	1594	4145	-1646	-4145	
		"lt"	4	1625	1626	1678	1677	

		"face"	
		"l"	4	1595	4146	-1647	-4146	
		"lt"	4	1626	1627	1679	1678	

		"face"	
		"l"	4	1596	4147	-1648	-4147	
		"lt"	4	1627	1628	1680	1679	

		"face"	
		"l"	4	1597	4148	-1649	-4148	
		"lt"	4	1628	1629	1681	1680	

		"face"	
		"l"	4	1598	4149	-1650	-4149	
		"lt"	4	1629	1630	1682	1681	

		"face"	
		"l"	4	1599	4150	-1651	-4150	
		"lt"	4	1630	1631	1683	1682	

		"face"	
		"l"	4	1600	4151	-1652	-4151	
		"lt"	4	1631	1632	1684	1683	

		"face"	
		"l"	4	1601	4152	-1653	-4152	
		"lt"	4	1632	1633	1685	1684	

		"face"	
		"l"	4	1602	4153	-1654	-4153	
		"lt"	4	1633	1634	1686	1685	

		"face"	
		"l"	4	1603	4154	-1655	-4154	
		"lt"	4	1634	1635	1687	1686	

		"face"	
		"l"	4	1604	4155	-1656	-4155	
		"lt"	4	1635	1636	1688	1687	

		"face"	
		"l"	4	1605	4156	-1657	-4156	
		"lt"	4	1636	1637	1689	1688	

		"face"	
		"l"	4	1606	4157	-1658	-4157	
		"lt"	4	1637	1638	1690	1689	

		"face"	
		"l"	4	1607	4158	-1659	-4158	
		"lt"	4	1638	1639	1691	1690	

		"face"	
		"l"	4	1608	4159	-1660	-4159	
		"lt"	4	1639	1640	1692	1691	

		"face"	
		"l"	4	1609	4160	-1661	-4160	
		"lt"	4	1640	1641	1693	1692	

		"face"	
		"l"	4	1610	4161	-1662	-4161	
		"lt"	4	1641	1642	1694	1693	

		"face"	
		"l"	4	1611	4162	-1663	-4162	
		"lt"	4	1642	1643	1695	1694	

		"face"	
		"l"	4	1612	4163	-1664	-4163	
		"lt"	4	1643	1644	1696	1695	

		"face"	
		"l"	4	1613	4164	-1665	-4164	
		"lt"	4	1644	1645	1697	1696	

		"face"	
		"l"	4	1614	4165	-1666	-4165	
		"lt"	4	1645	1646	1698	1697	

		"face"	
		"l"	4	1615	4166	-1667	-4166	
		"lt"	4	1646	1647	1699	1698	

		"face"	
		"l"	4	1616	4167	-1668	-4167	
		"lt"	4	1647	1648	1700	1699	

		"face"	
		"l"	4	1617	4168	-1669	-4168	
		"lt"	4	1648	1649	1701	1700	

		"face"	
		"l"	4	1618	4169	-1670	-4169	
		"lt"	4	1649	1650	1702	1701	

		"face"	
		"l"	4	1619	4170	-1671	-4170	
		"lt"	4	1650	1651	1703	1702	

		"face"	
		"l"	4	1620	4171	-1672	-4171	
		"lt"	4	1651	1652	1704	1703	

		"face"	
		"l"	4	1621	4172	-1673	-4172	
		"lt"	4	1652	1653	1705	1704	

		"face"	
		"l"	4	1622	4173	-1674	-4173	
		"lt"	4	1653	1654	1706	1705	

		"face"	
		"l"	4	1623	4174	-1675	-4174	
		"lt"	4	1654	1655	1707	1706	

		"face"	
		"l"	4	1624	4175	-1676	-4175	
		"lt"	4	1655	1656	1708	1707	

		"face"	
		"l"	4	1625	4176	-1677	-4176	
		"lt"	4	1656	1657	1709	1708	

		"face"	
		"l"	4	1626	4177	-1678	-4177	
		"lt"	4	1657	1658	1710	1709	

		"face"	
		"l"	4	1627	4178	-1679	-4178	
		"lt"	4	1658	1659	1711	1710	

		"face"	
		"l"	4	1628	4179	-1680	-4179	
		"lt"	4	1659	1660	1712	1711	

		"face"	
		"l"	4	1629	4180	-1681	-4180	
		"lt"	4	1660	1661	1713	1712	

		"face"	
		"l"	4	1630	4181	-1682	-4181	
		"lt"	4	1661	1662	1714	1713	

		"face"	
		"l"	4	1631	4131	-1683	-4182	
		"lt"	4	1662	1663	1715	1714	

		"face"	
		"l"	4	1632	4183	-1684	-4183	
		"lt"	4	1664	1665	1717	1716	

		"face"	
		"l"	4	1633	4184	-1685	-4184	
		"lt"	4	1665	1666	1718	1717	

		"face"	
		"l"	4	1634	4185	-1686	-4185	
		"lt"	4	1666	1667	1719	1718	

		"face"	
		"l"	4	1635	4186	-1687	-4186	
		"lt"	4	1667	1668	1720	1719	

		"face"	
		"l"	4	1636	4187	-1688	-4187	
		"lt"	4	1668	1669	1721	1720	

		"face"	
		"l"	4	1637	4188	-1689	-4188	
		"lt"	4	1669	1670	1722	1721	

		"face"	
		"l"	4	1638	4189	-1690	-4189	
		"lt"	4	1670	1671	1723	1722	

		"face"	
		"l"	4	1639	4190	-1691	-4190	
		"lt"	4	1671	1672	1724	1723	

		"face"	
		"l"	4	1640	4191	-1692	-4191	
		"lt"	4	1672	1673	1725	1724	

		"face"	
		"l"	4	1641	4192	-1693	-4192	
		"lt"	4	1673	1674	1726	1725	

		"face"	
		"l"	4	1642	4193	-1694	-4193	
		"lt"	4	1674	1675	1727	1726	

		"face"	
		"l"	4	1643	4194	-1695	-4194	
		"lt"	4	1675	1676	1728	1727	

		"face"	
		"l"	4	1644	4195	-1696	-4195	
		"lt"	4	1676	1677	1729	1728	

		"face"	
		"l"	4	1645	4196	-1697	-4196	
		"lt"	4	1677	1678	1730	1729	

		"face"	
		"l"	4	1646	4197	-1698	-4197	
		"lt"	4	1678	1679	1731	1730	

		"face"	
		"l"	4	1647	4198	-1699	-4198	
		"lt"	4	1679	1680	1732	1731	

		"face"	
		"l"	4	1648	4199	-1700	-4199	
		"lt"	4	1680	1681	1733	1732	

		"face"	
		"l"	4	1649	4200	-1701	-4200	
		"lt"	4	1681	1682	1734	1733	

		"face"	
		"l"	4	1650	4201	-1702	-4201	
		"lt"	4	1682	1683	1735	1734	

		"face"	
		"l"	4	1651	4202	-1703	-4202	
		"lt"	4	1683	1684	1736	1735	

		"face"	
		"l"	4	1652	4203	-1704	-4203	
		"lt"	4	1684	1685	1737	1736	

		"face"	
		"l"	4	1653	4204	-1705	-4204	
		"lt"	4	1685	1686	1738	1737	

		"face"	
		"l"	4	1654	4205	-1706	-4205	
		"lt"	4	1686	1687	1739	1738	

		"face"	
		"l"	4	1655	4206	-1707	-4206	
		"lt"	4	1687	1688	1740	1739	

		"face"	
		"l"	4	1656	4207	-1708	-4207	
		"lt"	4	1688	1689	1741	1740	

		"face"	
		"l"	4	1657	4208	-1709	-4208	
		"lt"	4	1689	1690	1742	1741	

		"face"	
		"l"	4	1658	4209	-1710	-4209	
		"lt"	4	1690	1691	1743	1742	

		"face"	
		"l"	4	1659	4210	-1711	-4210	
		"lt"	4	1691	1692	1744	1743	

		"face"	
		"l"	4	1660	4211	-1712	-4211	
		"lt"	4	1692	1693	1745	1744	

		"face"	
		"l"	4	1661	4212	-1713	-4212	
		"lt"	4	1693	1694	1746	1745	

		"face"	
		"l"	4	1662	4213	-1714	-4213	
		"lt"	4	1694	1695	1747	1746	

		"face"	
		"l"	4	1663	4214	-1715	-4214	
		"lt"	4	1695	1696	1748	1747	

		"face"	
		"l"	4	1664	4215	-1716	-4215	
		"lt"	4	1696	1697	1749	1748	

		"face"	
		"l"	4	1665	4216	-1717	-4216	
		"lt"	4	1697	1698	1750	1749	

		"face"	
		"l"	4	1666	4217	-1718	-4217	
		"lt"	4	1698	1699	1751	1750	

		"face"	
		"l"	4	1667	4218	-1719	-4218	
		"lt"	4	1699	1700	1752	1751	

		"face"	
		"l"	4	1668	4219	-1720	-4219	
		"lt"	4	1700	1701	1753	1752	

		"face"	
		"l"	4	1669	4220	-1721	-4220	
		"lt"	4	1701	1702	1754	1753	

		"face"	
		"l"	4	1670	4221	-1722	-4221	
		"lt"	4	1702	1703	1755	1754	

		"face"	
		"l"	4	1671	4222	-1723	-4222	
		"lt"	4	1703	1704	1756	1755	

		"face"	
		"l"	4	1672	4223	-1724	-4223	
		"lt"	4	1704	1705	1757	1756	

		"face"	
		"l"	4	1673	4224	-1725	-4224	
		"lt"	4	1705	1706	1758	1757	

		"face"	
		"l"	4	1674	4225	-1726	-4225	
		"lt"	4	1706	1707	1759	1758	

		"face"	
		"l"	4	1675	4226	-1727	-4226	
		"lt"	4	1707	1708	1760	1759	

		"face"	
		"l"	4	1676	4227	-1728	-4227	
		"lt"	4	1708	1709	1761	1760	

		"face"	
		"l"	4	1677	4228	-1729	-4228	
		"lt"	4	1709	1710	1762	1761	

		"face"	
		"l"	4	1678	4229	-1730	-4229	
		"lt"	4	1710	1711	1763	1762	

		"face"	
		"l"	4	1679	4230	-1731	-4230	
		"lt"	4	1711	1712	1764	1763	

		"face"	
		"l"	4	1680	4231	-1732	-4231	
		"lt"	4	1712	1713	1765	1764	

		"face"	
		"l"	4	1681	4232	-1733	-4232	
		"lt"	4	1713	1714	1766	1765	

		"face"	
		"l"	4	1682	4182	-1734	-4233	
		"lt"	4	1714	1715	1767	1766	

		"face"	
		"l"	4	1683	4234	-1735	-4234	
		"lt"	4	1716	1717	1769	1768	

		"face"	
		"l"	4	1684	4235	-1736	-4235	
		"lt"	4	1717	1718	1770	1769	

		"face"	
		"l"	4	1685	4236	-1737	-4236	
		"lt"	4	1718	1719	1771	1770	

		"face"	
		"l"	4	1686	4237	-1738	-4237	
		"lt"	4	1719	1720	1772	1771	

		"face"	
		"l"	4	1687	4238	-1739	-4238	
		"lt"	4	1720	1721	1773	1772	

		"face"	
		"l"	4	1688	4239	-1740	-4239	
		"lt"	4	1721	1722	1774	1773	

		"face"	
		"l"	4	1689	4240	-1741	-4240	
		"lt"	4	1722	1723	1775	1774	

		"face"	
		"l"	4	1690	4241	-1742	-4241	
		"lt"	4	1723	1724	1776	1775	

		"face"	
		"l"	4	1691	4242	-1743	-4242	
		"lt"	4	1724	1725	1777	1776	

		"face"	
		"l"	4	1692	4243	-1744	-4243	
		"lt"	4	1725	1726	1778	1777	

		"face"	
		"l"	4	1693	4244	-1745	-4244	
		"lt"	4	1726	1727	1779	1778	

		"face"	
		"l"	4	1694	4245	-1746	-4245	
		"lt"	4	1727	1728	1780	1779	

		"face"	
		"l"	4	1695	4246	-1747	-4246	
		"lt"	4	1728	1729	1781	1780	

		"face"	
		"l"	4	1696	4247	-1748	-4247	
		"lt"	4	1729	1730	1782	1781	

		"face"	
		"l"	4	1697	4248	-1749	-4248	
		"lt"	4	1730	1731	1783	1782	

		"face"	
		"l"	4	1698	4249	-1750	-4249	
		"lt"	4	1731	1732	1784	1783	

		"face"	
		"l"	4	1699	4250	-1751	-4250	
		"lt"	4	1732	1733	1785	1784	

		"face"	
		"l"	4	1700	4251	-1752	-4251	
		"lt"	4	1733	1734	1786	1785	

		"face"	
		"l"	4	1701	4252	-1753	-4252	
		"lt"	4	1734	1735	1787	1786	

		"face"	
		"l"	4	1702	4253	-1754	-4253	
		"lt"	4	1735	1736	1788	1787	

		"face"	
		"l"	4	1703	4254	-1755	-4254	
		"lt"	4	1736	1737	1789	1788	

		"face"	
		"l"	4	1704	4255	-1756	-4255	
		"lt"	4	1737	1738	1790	1789	

		"face"	
		"l"	4	1705	4256	-1757	-4256	
		"lt"	4	1738	1739	1791	1790	

		"face"	
		"l"	4	1706	4257	-1758	-4257	
		"lt"	4	1739	1740	1792	1791	

		"face"	
		"l"	4	1707	4258	-1759	-4258	
		"lt"	4	1740	1741	1793	1792	

		"face"	
		"l"	4	1708	4259	-1760	-4259	
		"lt"	4	1741	1742	1794	1793	

		"face"	
		"l"	4	1709	4260	-1761	-4260	
		"lt"	4	1742	1743	1795	1794	

		"face"	
		"l"	4	1710	4261	-1762	-4261	
		"lt"	4	1743	1744	1796	1795	

		"face"	
		"l"	4	1711	4262	-1763	-4262	
		"lt"	4	1744	1745	1797	1796	

		"face"	
		"l"	4	1712	4263	-1764	-4263	
		"lt"	4	1745	1746	1798	1797	

		"face"	
		"l"	4	1713	4264	-1765	-4264	
		"lt"	4	1746	1747	1799	1798	

		"face"	
		"l"	4	1714	4265	-1766	-4265	
		"lt"	4	1747	1748	1800	1799	

		"face"	
		"l"	4	1715	4266	-1767	-4266	
		"lt"	4	1748	1749	1801	1800	

		"face"	
		"l"	4	1716	4267	-1768	-4267	
		"lt"	4	1749	1750	1802	1801	

		"face"	
		"l"	4	1717	4268	-1769	-4268	
		"lt"	4	1750	1751	1803	1802	

		"face"	
		"l"	4	1718	4269	-1770	-4269	
		"lt"	4	1751	1752	1804	1803	

		"face"	
		"l"	4	1719	4270	-1771	-4270	
		"lt"	4	1752	1753	1805	1804	

		"face"	
		"l"	4	1720	4271	-1772	-4271	
		"lt"	4	1753	1754	1806	1805	

		"face"	
		"l"	4	1721	4272	-1773	-4272	
		"lt"	4	1754	1755	1807	1806	

		"face"	
		"l"	4	1722	4273	-1774	-4273	
		"lt"	4	1755	1756	1808	1807	

		"face"	
		"l"	4	1723	4274	-1775	-4274	
		"lt"	4	1756	1757	1809	1808	

		"face"	
		"l"	4	1724	4275	-1776	-4275	
		"lt"	4	1757	1758	1810	1809	

		"face"	
		"l"	4	1725	4276	-1777	-4276	
		"lt"	4	1758	1759	1811	1810	

		"face"	
		"l"	4	1726	4277	-1778	-4277	
		"lt"	4	1759	1760	1812	1811	

		"face"	
		"l"	4	1727	4278	-1779	-4278	
		"lt"	4	1760	1761	1813	1812	

		"face"	
		"l"	4	1728	4279	-1780	-4279	
		"lt"	4	1761	1762	1814	1813	

		"face"	
		"l"	4	1729	4280	-1781	-4280	
		"lt"	4	1762	1763	1815	1814	

		"face"	
		"l"	4	1730	4281	-1782	-4281	
		"lt"	4	1763	1764	1816	1815	

		"face"	
		"l"	4	1731	4282	-1783	-4282	
		"lt"	4	1764	1765	1817	1816	

		"face"	
		"l"	4	1732	4283	-1784	-4283	
		"lt"	4	1765	1766	1818	1817	

		"face"	
		"l"	4	1733	4233	-1785	-4284	
		"lt"	4	1766	1767	1819	1818	

		"face"	
		"l"	4	1734	4285	-1786	-4285	
		"lt"	4	1768	1769	1821	1820	

		"face"	
		"l"	4	1735	4286	-1787	-4286	
		"lt"	4	1769	1770	1822	1821	

		"face"	
		"l"	4	1736	4287	-1788	-4287	
		"lt"	4	1770	1771	1823	1822	

		"face"	
		"l"	4	1737	4288	-1789	-4288	
		"lt"	4	1771	1772	1824	1823	

		"face"	
		"l"	4	1738	4289	-1790	-4289	
		"lt"	4	1772	1773	1825	1824	

		"face"	
		"l"	4	1739	4290	-1791	-4290	
		"lt"	4	1773	1774	1826	1825	

		"face"	
		"l"	4	1740	4291	-1792	-4291	
		"lt"	4	1774	1775	1827	1826	

		"face"	
		"l"	4	1741	4292	-1793	-4292	
		"lt"	4	1775	1776	1828	1827	

		"face"	
		"l"	4	1742	4293	-1794	-4293	
		"lt"	4	1776	1777	1829	1828	

		"face"	
		"l"	4	1743	4294	-1795	-4294	
		"lt"	4	1777	1778	1830	1829	

		"face"	
		"l"	4	1744	4295	-1796	-4295	
		"lt"	4	1778	1779	1831	1830	

		"face"	
		"l"	4	1745	4296	-1797	-4296	
		"lt"	4	1779	1780	1832	1831	

		"face"	
		"l"	4	1746	4297	-1798	-4297	
		"lt"	4	1780	1781	1833	1832	

		"face"	
		"l"	4	1747	4298	-1799	-4298	
		"lt"	4	1781	1782	1834	1833	

		"face"	
		"l"	4	1748	4299	-1800	-4299	
		"lt"	4	1782	1783	1835	1834	

		"face"	
		"l"	4	1749	4300	-1801	-4300	
		"lt"	4	1783	1784	1836	1835	

		"face"	
		"l"	4	1750	4301	-1802	-4301	
		"lt"	4	1784	1785	1837	1836	

		"face"	
		"l"	4	1751	4302	-1803	-4302	
		"lt"	4	1785	1786	1838	1837	

		"face"	
		"l"	4	1752	4303	-1804	-4303	
		"lt"	4	1786	1787	1839	1838	

		"face"	
		"l"	4	1753	4304	-1805	-4304	
		"lt"	4	1787	1788	1840	1839	

		"face"	
		"l"	4	1754	4305	-1806	-4305	
		"lt"	4	1788	1789	1841	1840	

		"face"	
		"l"	4	1755	4306	-1807	-4306	
		"lt"	4	1789	1790	1842	1841	

		"face"	
		"l"	4	1756	4307	-1808	-4307	
		"lt"	4	1790	1791	1843	1842	

		"face"	
		"l"	4	1757	4308	-1809	-4308	
		"lt"	4	1791	1792	1844	1843	

		"face"	
		"l"	4	1758	4309	-1810	-4309	
		"lt"	4	1792	1793	1845	1844	

		"face"	
		"l"	4	1759	4310	-1811	-4310	
		"lt"	4	1793	1794	1846	1845	

		"face"	
		"l"	4	1760	4311	-1812	-4311	
		"lt"	4	1794	1795	1847	1846	

		"face"	
		"l"	4	1761	4312	-1813	-4312	
		"lt"	4	1795	1796	1848	1847	

		"face"	
		"l"	4	1762	4313	-1814	-4313	
		"lt"	4	1796	1797	1849	1848	

		"face"	
		"l"	4	1763	4314	-1815	-4314	
		"lt"	4	1797	1798	1850	1849	

		"face"	
		"l"	4	1764	4315	-1816	-4315	
		"lt"	4	1798	1799	1851	1850	

		"face"	
		"l"	4	1765	4316	-1817	-4316	
		"lt"	4	1799	1800	1852	1851	

		"face"	
		"l"	4	1766	4317	-1818	-4317	
		"lt"	4	1800	1801	1853	1852	

		"face"	
		"l"	4	1767	4318	-1819	-4318	
		"lt"	4	1801	1802	1854	1853	

		"face"	
		"l"	4	1768	4319	-1820	-4319	
		"lt"	4	1802	1803	1855	1854	

		"face"	
		"l"	4	1769	4320	-1821	-4320	
		"lt"	4	1803	1804	1856	1855	

		"face"	
		"l"	4	1770	4321	-1822	-4321	
		"lt"	4	1804	1805	1857	1856	

		"face"	
		"l"	4	1771	4322	-1823	-4322	
		"lt"	4	1805	1806	1858	1857	

		"face"	
		"l"	4	1772	4323	-1824	-4323	
		"lt"	4	1806	1807	1859	1858	

		"face"	
		"l"	4	1773	4324	-1825	-4324	
		"lt"	4	1807	1808	1860	1859	

		"face"	
		"l"	4	1774	4325	-1826	-4325	
		"lt"	4	1808	1809	1861	1860	

		"face"	
		"l"	4	1775	4326	-1827	-4326	
		"lt"	4	1809	1810	1862	1861	

		"face"	
		"l"	4	1776	4327	-1828	-4327	
		"lt"	4	1810	1811	1863	1862	

		"face"	
		"l"	4	1777	4328	-1829	-4328	
		"lt"	4	1811	1812	1864	1863	

		"face"	
		"l"	4	1778	4329	-1830	-4329	
		"lt"	4	1812	1813	1865	1864	

		"face"	
		"l"	4	1779	4330	-1831	-4330	
		"lt"	4	1813	1814	1866	1865	

		"face"	
		"l"	4	1780	4331	-1832	-4331	
		"lt"	4	1814	1815	1867	1866	

		"face"	
		"l"	4	1781	4332	-1833	-4332	
		"lt"	4	1815	1816	1868	1867	

		"face"	
		"l"	4	1782	4333	-1834	-4333	
		"lt"	4	1816	1817	1869	1868	

		"face"	
		"l"	4	1783	4334	-1835	-4334	
		"lt"	4	1817	1818	1870	1869	

		"face"	
		"l"	4	1784	4284	-1836	-4335	
		"lt"	4	1818	1819	1871	1870	

		"face"	
		"l"	4	1785	4336	-1837	-4336	
		"lt"	4	1820	1821	1873	1872	

		"face"	
		"l"	4	1786	4337	-1838	-4337	
		"lt"	4	1821	1822	1874	1873	

		"face"	
		"l"	4	1787	4338	-1839	-4338	
		"lt"	4	1822	1823	1875	1874	

		"face"	
		"l"	4	1788	4339	-1840	-4339	
		"lt"	4	1823	1824	1876	1875	

		"face"	
		"l"	4	1789	4340	-1841	-4340	
		"lt"	4	1824	1825	1877	1876	

		"face"	
		"l"	4	1790	4341	-1842	-4341	
		"lt"	4	1825	1826	1878	1877	

		"face"	
		"l"	4	1791	4342	-1843	-4342	
		"lt"	4	1826	1827	1879	1878	

		"face"	
		"l"	4	1792	4343	-1844	-4343	
		"lt"	4	1827	1828	1880	1879	

		"face"	
		"l"	4	1793	4344	-1845	-4344	
		"lt"	4	1828	1829	1881	1880	

		"face"	
		"l"	4	1794	4345	-1846	-4345	
		"lt"	4	1829	1830	1882	1881	

		"face"	
		"l"	4	1795	4346	-1847	-4346	
		"lt"	4	1830	1831	1883	1882	

		"face"	
		"l"	4	1796	4347	-1848	-4347	
		"lt"	4	1831	1832	1884	1883	

		"face"	
		"l"	4	1797	4348	-1849	-4348	
		"lt"	4	1832	1833	1885	1884	

		"face"	
		"l"	4	1798	4349	-1850	-4349	
		"lt"	4	1833	1834	1886	1885	

		"face"	
		"l"	4	1799	4350	-1851	-4350	
		"lt"	4	1834	1835	1887	1886	

		"face"	
		"l"	4	1800	4351	-1852	-4351	
		"lt"	4	1835	1836	1888	1887	

		"face"	
		"l"	4	1801	4352	-1853	-4352	
		"lt"	4	1836	1837	1889	1888	

		"face"	
		"l"	4	1802	4353	-1854	-4353	
		"lt"	4	1837	1838	1890	1889	

		"face"	
		"l"	4	1803	4354	-1855	-4354	
		"lt"	4	1838	1839	1891	1890	

		"face"	
		"l"	4	1804	4355	-1856	-4355	
		"lt"	4	1839	1840	1892	1891	

		"face"	
		"l"	4	1805	4356	-1857	-4356	
		"lt"	4	1840	1841	1893	1892	

		"face"	
		"l"	4	1806	4357	-1858	-4357	
		"lt"	4	1841	1842	1894	1893	

		"face"	
		"l"	4	1807	4358	-1859	-4358	
		"lt"	4	1842	1843	1895	1894	

		"face"	
		"l"	4	1808	4359	-1860	-4359	
		"lt"	4	1843	1844	1896	1895	

		"face"	
		"l"	4	1809	4360	-1861	-4360	
		"lt"	4	1844	1845	1897	1896	

		"face"	
		"l"	4	1810	4361	-1862	-4361	
		"lt"	4	1845	1846	1898	1897	

		"face"	
		"l"	4	1811	4362	-1863	-4362	
		"lt"	4	1846	1847	1899	1898	

		"face"	
		"l"	4	1812	4363	-1864	-4363	
		"lt"	4	1847	1848	1900	1899	

		"face"	
		"l"	4	1813	4364	-1865	-4364	
		"lt"	4	1848	1849	1901	1900	

		"face"	
		"l"	4	1814	4365	-1866	-4365	
		"lt"	4	1849	1850	1902	1901	

		"face"	
		"l"	4	1815	4366	-1867	-4366	
		"lt"	4	1850	1851	1903	1902	

		"face"	
		"l"	4	1816	4367	-1868	-4367	
		"lt"	4	1851	1852	1904	1903	

		"face"	
		"l"	4	1817	4368	-1869	-4368	
		"lt"	4	1852	1853	1905	1904	

		"face"	
		"l"	4	1818	4369	-1870	-4369	
		"lt"	4	1853	1854	1906	1905	

		"face"	
		"l"	4	1819	4370	-1871	-4370	
		"lt"	4	1854	1855	1907	1906	

		"face"	
		"l"	4	1820	4371	-1872	-4371	
		"lt"	4	1855	1856	1908	1907	

		"face"	
		"l"	4	1821	4372	-1873	-4372	
		"lt"	4	1856	1857	1909	1908	

		"face"	
		"l"	4	1822	4373	-1874	-4373	
		"lt"	4	1857	1858	1910	1909	

		"face"	
		"l"	4	1823	4374	-1875	-4374	
		"lt"	4	1858	1859	1911	1910	

		"face"	
		"l"	4	1824	4375	-1876	-4375	
		"lt"	4	1859	1860	1912	1911	

		"face"	
		"l"	4	1825	4376	-1877	-4376	
		"lt"	4	1860	1861	1913	1912	

		"face"	
		"l"	4	1826	4377	-1878	-4377	
		"lt"	4	1861	1862	1914	1913	

		"face"	
		"l"	4	1827	4378	-1879	-4378	
		"lt"	4	1862	1863	1915	1914	

		"face"	
		"l"	4	1828	4379	-1880	-4379	
		"lt"	4	1863	1864	1916	1915	

		"face"	
		"l"	4	1829	4380	-1881	-4380	
		"lt"	4	1864	1865	1917	1916	

		"face"	
		"l"	4	1830	4381	-1882	-4381	
		"lt"	4	1865	1866	1918	1917	

		"face"	
		"l"	4	1831	4382	-1883	-4382	
		"lt"	4	1866	1867	1919	1918	

		"face"	
		"l"	4	1832	4383	-1884	-4383	
		"lt"	4	1867	1868	1920	1919	

		"face"	
		"l"	4	1833	4384	-1885	-4384	
		"lt"	4	1868	1869	1921	1920	

		"face"	
		"l"	4	1834	4385	-1886	-4385	
		"lt"	4	1869	1870	1922	1921	

		"face"	
		"l"	4	1835	4335	-1887	-4386	
		"lt"	4	1870	1871	1923	1922	

		"face"	
		"l"	4	1836	4387	-1888	-4387	
		"lt"	4	1872	1873	1925	1924	

		"face"	
		"l"	4	1837	4388	-1889	-4388	
		"lt"	4	1873	1874	1926	1925	

		"face"	
		"l"	4	1838	4389	-1890	-4389	
		"lt"	4	1874	1875	1927	1926	

		"face"	
		"l"	4	1839	4390	-1891	-4390	
		"lt"	4	1875	1876	1928	1927	

		"face"	
		"l"	4	1840	4391	-1892	-4391	
		"lt"	4	1876	1877	1929	1928	

		"face"	
		"l"	4	1841	4392	-1893	-4392	
		"lt"	4	1877	1878	1930	1929	

		"face"	
		"l"	4	1842	4393	-1894	-4393	
		"lt"	4	1878	1879	1931	1930	

		"face"	
		"l"	4	1843	4394	-1895	-4394	
		"lt"	4	1879	1880	1932	1931	

		"face"	
		"l"	4	1844	4395	-1896	-4395	
		"lt"	4	1880	1881	1933	1932	

		"face"	
		"l"	4	1845	4396	-1897	-4396	
		"lt"	4	1881	1882	1934	1933	

		"face"	
		"l"	4	1846	4397	-1898	-4397	
		"lt"	4	1882	1883	1935	1934	

		"face"	
		"l"	4	1847	4398	-1899	-4398	
		"lt"	4	1883	1884	1936	1935	

		"face"	
		"l"	4	1848	4399	-1900	-4399	
		"lt"	4	1884	1885	1937	1936	

		"face"	
		"l"	4	1849	4400	-1901	-4400	
		"lt"	4	1885	1886	1938	1937	

		"face"	
		"l"	4	1850	4401	-1902	-4401	
		"lt"	4	1886	1887	1939	1938	

		"face"	
		"l"	4	1851	4402	-1903	-4402	
		"lt"	4	1887	1888	1940	1939	

		"face"	
		"l"	4	1852	4403	-1904	-4403	
		"lt"	4	1888	1889	1941	1940	

		"face"	
		"l"	4	1853	4404	-1905	-4404	
		"lt"	4	1889	1890	1942	1941	

		"face"	
		"l"	4	1854	4405	-1906	-4405	
		"lt"	4	1890	1891	1943	1942	

		"face"	
		"l"	4	1855	4406	-1907	-4406	
		"lt"	4	1891	1892	1944	1943	

		"face"	
		"l"	4	1856	4407	-1908	-4407	
		"lt"	4	1892	1893	1945	1944	

		"face"	
		"l"	4	1857	4408	-1909	-4408	
		"lt"	4	1893	1894	1946	1945	

		"face"	
		"l"	4	1858	4409	-1910	-4409	
		"lt"	4	1894	1895	1947	1946	

		"face"	
		"l"	4	1859	4410	-1911	-4410	
		"lt"	4	1895	1896	1948	1947	

		"face"	
		"l"	4	1860	4411	-1912	-4411	
		"lt"	4	1896	1897	1949	1948	

		"face"	
		"l"	4	1861	4412	-1913	-4412	
		"lt"	4	1897	1898	1950	1949	

		"face"	
		"l"	4	1862	4413	-1914	-4413	
		"lt"	4	1898	1899	1951	1950	

		"face"	
		"l"	4	1863	4414	-1915	-4414	
		"lt"	4	1899	1900	1952	1951	

		"face"	
		"l"	4	1864	4415	-1916	-4415	
		"lt"	4	1900	1901	1953	1952	

		"face"	
		"l"	4	1865	4416	-1917	-4416	
		"lt"	4	1901	1902	1954	1953	

		"face"	
		"l"	4	1866	4417	-1918	-4417	
		"lt"	4	1902	1903	1955	1954	

		"face"	
		"l"	4	1867	4418	-1919	-4418	
		"lt"	4	1903	1904	1956	1955	

		"face"	
		"l"	4	1868	4419	-1920	-4419	
		"lt"	4	1904	1905	1957	1956	

		"face"	
		"l"	4	1869	4420	-1921	-4420	
		"lt"	4	1905	1906	1958	1957	

		"face"	
		"l"	4	1870	4421	-1922	-4421	
		"lt"	4	1906	1907	1959	1958	

		"face"	
		"l"	4	1871	4422	-1923	-4422	
		"lt"	4	1907	1908	1960	1959	

		"face"	
		"l"	4	1872	4423	-1924	-4423	
		"lt"	4	1908	1909	1961	1960	

		"face"	
		"l"	4	1873	4424	-1925	-4424	
		"lt"	4	1909	1910	1962	1961	

		"face"	
		"l"	4	1874	4425	-1926	-4425	
		"lt"	4	1910	1911	1963	1962	

		"face"	
		"l"	4	1875	4426	-1927	-4426	
		"lt"	4	1911	1912	1964	1963	

		"face"	
		"l"	4	1876	4427	-1928	-4427	
		"lt"	4	1912	1913	1965	1964	

		"face"	
		"l"	4	1877	4428	-1929	-4428	
		"lt"	4	1913	1914	1966	1965	

		"face"	
		"l"	4	1878	4429	-1930	-4429	
		"lt"	4	1914	1915	1967	1966	

		"face"	
		"l"	4	1879	4430	-1931	-4430	
		"lt"	4	1915	1916	1968	1967	

		"face"	
		"l"	4	1880	4431	-1932	-4431	
		"lt"	4	1916	1917	1969	1968	

		"face"	
		"l"	4	1881	4432	-1933	-4432	
		"lt"	4	1917	1918	1970	1969	

		"face"	
		"l"	4	1882	4433	-1934	-4433	
		"lt"	4	1918	1919	1971	1970	

		"face"	
		"l"	4	1883	4434	-1935	-4434	
		"lt"	4	1919	1920	1972	1971	

		"face"	
		"l"	4	1884	4435	-1936	-4435	
		"lt"	4	1920	1921	1973	1972	

		"face"	
		"l"	4	1885	4436	-1937	-4436	
		"lt"	4	1921	1922	1974	1973	

		"face"	
		"l"	4	1886	4386	-1938	-4437	
		"lt"	4	1922	1923	1975	1974	

		"face"	
		"l"	4	1887	4438	-1939	-4438	
		"lt"	4	1924	1925	1977	1976	

		"face"	
		"l"	4	1888	4439	-1940	-4439	
		"lt"	4	1925	1926	1978	1977	

		"face"	
		"l"	4	1889	4440	-1941	-4440	
		"lt"	4	1926	1927	1979	1978	

		"face"	
		"l"	4	1890	4441	-1942	-4441	
		"lt"	4	1927	1928	1980	1979	

		"face"	
		"l"	4	1891	4442	-1943	-4442	
		"lt"	4	1928	1929	1981	1980	

		"face"	
		"l"	4	1892	4443	-1944	-4443	
		"lt"	4	1929	1930	1982	1981	

		"face"	
		"l"	4	1893	4444	-1945	-4444	
		"lt"	4	1930	1931	1983	1982	

		"face"	
		"l"	4	1894	4445	-1946	-4445	
		"lt"	4	1931	1932	1984	1983	

		"face"	
		"l"	4	1895	4446	-1947	-4446	
		"lt"	4	1932	1933	1985	1984	

		"face"	
		"l"	4	1896	4447	-1948	-4447	
		"lt"	4	1933	1934	1986	1985	

		"face"	
		"l"	4	1897	4448	-1949	-4448	
		"lt"	4	1934	1935	1987	1986	

		"face"	
		"l"	4	1898	4449	-1950	-4449	
		"lt"	4	1935	1936	1988	1987	

		"face"	
		"l"	4	1899	4450	-1951	-4450	
		"lt"	4	1936	1937	1989	1988	

		"face"	
		"l"	4	1900	4451	-1952	-4451	
		"lt"	4	1937	1938	1990	1989	

		"face"	
		"l"	4	1901	4452	-1953	-4452	
		"lt"	4	1938	1939	1991	1990	

		"face"	
		"l"	4	1902	4453	-1954	-4453	
		"lt"	4	1939	1940	1992	1991	

		"face"	
		"l"	4	1903	4454	-1955	-4454	
		"lt"	4	1940	1941	1993	1992	

		"face"	
		"l"	4	1904	4455	-1956	-4455	
		"lt"	4	1941	1942	1994	1993	

		"face"	
		"l"	4	1905	4456	-1957	-4456	
		"lt"	4	1942	1943	1995	1994	

		"face"	
		"l"	4	1906	4457	-1958	-4457	
		"lt"	4	1943	1944	1996	1995	

		"face"	
		"l"	4	1907	4458	-1959	-4458	
		"lt"	4	1944	1945	1997	1996	

		"face"	
		"l"	4	1908	4459	-1960	-4459	
		"lt"	4	1945	1946	1998	1997	

		"face"	
		"l"	4	1909	4460	-1961	-4460	
		"lt"	4	1946	1947	1999	1998	

		"face"	
		"l"	4	1910	4461	-1962	-4461	
		"lt"	4	1947	1948	2000	1999	

		"face"	
		"l"	4	1911	4462	-1963	-4462	
		"lt"	4	1948	1949	2001	2000	

		"face"	
		"l"	4	1912	4463	-1964	-4463	
		"lt"	4	1949	1950	2002	2001	

		"face"	
		"l"	4	1913	4464	-1965	-4464	
		"lt"	4	1950	1951	2003	2002	

		"face"	
		"l"	4	1914	4465	-1966	-4465	
		"lt"	4	1951	1952	2004	2003	

		"face"	
		"l"	4	1915	4466	-1967	-4466	
		"lt"	4	1952	1953	2005	2004	

		"face"	
		"l"	4	1916	4467	-1968	-4467	
		"lt"	4	1953	1954	2006	2005	

		"face"	
		"l"	4	1917	4468	-1969	-4468	
		"lt"	4	1954	1955	2007	2006	

		"face"	
		"l"	4	1918	4469	-1970	-4469	
		"lt"	4	1955	1956	2008	2007	

		"face"	
		"l"	4	1919	4470	-1971	-4470	
		"lt"	4	1956	1957	2009	2008	

		"face"	
		"l"	4	1920	4471	-1972	-4471	
		"lt"	4	1957	1958	2010	2009	

		"face"	
		"l"	4	1921	4472	-1973	-4472	
		"lt"	4	1958	1959	2011	2010	

		"face"	
		"l"	4	1922	4473	-1974	-4473	
		"lt"	4	1959	1960	2012	2011	

		"face"	
		"l"	4	1923	4474	-1975	-4474	
		"lt"	4	1960	1961	2013	2012	

		"face"	
		"l"	4	1924	4475	-1976	-4475	
		"lt"	4	1961	1962	2014	2013	

		"face"	
		"l"	4	1925	4476	-1977	-4476	
		"lt"	4	1962	1963	2015	2014	

		"face"	
		"l"	4	1926	4477	-1978	-4477	
		"lt"	4	1963	1964	2016	2015	

		"face"	
		"l"	4	1927	4478	-1979	-4478	
		"lt"	4	1964	1965	2017	2016	

		"face"	
		"l"	4	1928	4479	-1980	-4479	
		"lt"	4	1965	1966	2018	2017	

		"face"	
		"l"	4	1929	4480	-1981	-4480	
		"lt"	4	1966	1967	2019	2018	

		"face"	
		"l"	4	1930	4481	-1982	-4481	
		"lt"	4	1967	1968	2020	2019	

		"face"	
		"l"	4	1931	4482	-1983	-4482	
		"lt"	4	1968	1969	2021	2020	

		"face"	
		"l"	4	1932	4483	-1984	-4483	
		"lt"	4	1969	1970	2022	2021	

		"face"	
		"l"	4	1933	4484	-1985	-4484	
		"lt"	4	1970	1971	2023	2022	

		"face"	
		"l"	4	1934	4485	-1986	-4485	
		"lt"	4	1971	1972	2024	2023	

		"face"	
		"l"	4	1935	4486	-1987	-4486	
		"lt"	4	1972	1973	2025	2024	

		"face"	
		"l"	4	1936	4487	-1988	-4487	
		"lt"	4	1973	1974	2026	2025	

		"face"	
		"l"	4	1937	4437	-1989	-4488	
		"lt"	4	1974	1975	2027	2026	

		"face"	
		"l"	4	1938	4489	-1990	-4489	
		"lt"	4	1976	1977	2029	2028	

		"face"	
		"l"	4	1939	4490	-1991	-4490	
		"lt"	4	1977	1978	2030	2029	

		"face"	
		"l"	4	1940	4491	-1992	-4491	
		"lt"	4	1978	1979	2031	2030	

		"face"	
		"l"	4	1941	4492	-1993	-4492	
		"lt"	4	1979	1980	2032	2031	

		"face"	
		"l"	4	1942	4493	-1994	-4493	
		"lt"	4	1980	1981	2033	2032	

		"face"	
		"l"	4	1943	4494	-1995	-4494	
		"lt"	4	1981	1982	2034	2033	

		"face"	
		"l"	4	1944	4495	-1996	-4495	
		"lt"	4	1982	1983	2035	2034	

		"face"	
		"l"	4	1945	4496	-1997	-4496	
		"lt"	4	1983	1984	2036	2035	

		"face"	
		"l"	4	1946	4497	-1998	-4497	
		"lt"	4	1984	1985	2037	2036	

		"face"	
		"l"	4	1947	4498	-1999	-4498	
		"lt"	4	1985	1986	2038	2037	

		"face"	
		"l"	4	1948	4499	-2000	-4499	
		"lt"	4	1986	1987	2039	2038	

		"face"	
		"l"	4	1949	4500	-2001	-4500	
		"lt"	4	1987	1988	2040	2039	

		"face"	
		"l"	4	1950	4501	-2002	-4501	
		"lt"	4	1988	1989	2041	2040	

		"face"	
		"l"	4	1951	4502	-2003	-4502	
		"lt"	4	1989	1990	2042	2041	

		"face"	
		"l"	4	1952	4503	-2004	-4503	
		"lt"	4	1990	1991	2043	2042	

		"face"	
		"l"	4	1953	4504	-2005	-4504	
		"lt"	4	1991	1992	2044	2043	

		"face"	
		"l"	4	1954	4505	-2006	-4505	
		"lt"	4	1992	1993	2045	2044	

		"face"	
		"l"	4	1955	4506	-2007	-4506	
		"lt"	4	1993	1994	2046	2045	

		"face"	
		"l"	4	1956	4507	-2008	-4507	
		"lt"	4	1994	1995	2047	2046	

		"face"	
		"l"	4	1957	4508	-2009	-4508	
		"lt"	4	1995	1996	2048	2047	

		"face"	
		"l"	4	1958	4509	-2010	-4509	
		"lt"	4	1996	1997	2049	2048	

		"face"	
		"l"	4	1959	4510	-2011	-4510	
		"lt"	4	1997	1998	2050	2049	

		"face"	
		"l"	4	1960	4511	-2012	-4511	
		"lt"	4	1998	1999	2051	2050	

		"face"	
		"l"	4	1961	4512	-2013	-4512	
		"lt"	4	1999	2000	2052	2051	

		"face"	
		"l"	4	1962	4513	-2014	-4513	
		"lt"	4	2000	2001	2053	2052	

		"face"	
		"l"	4	1963	4514	-2015	-4514	
		"lt"	4	2001	2002	2054	2053	

		"face"	
		"l"	4	1964	4515	-2016	-4515	
		"lt"	4	2002	2003	2055	2054	

		"face"	
		"l"	4	1965	4516	-2017	-4516	
		"lt"	4	2003	2004	2056	2055	

		"face"	
		"l"	4	1966	4517	-2018	-4517	
		"lt"	4	2004	2005	2057	2056	

		"face"	
		"l"	4	1967	4518	-2019	-4518	
		"lt"	4	2005	2006	2058	2057	

		"face"	
		"l"	4	1968	4519	-2020	-4519	
		"lt"	4	2006	2007	2059	2058	

		"face"	
		"l"	4	1969	4520	-2021	-4520	
		"lt"	4	2007	2008	2060	2059	

		"face"	
		"l"	4	1970	4521	-2022	-4521	
		"lt"	4	2008	2009	2061	2060	

		"face"	
		"l"	4	1971	4522	-2023	-4522	
		"lt"	4	2009	2010	2062	2061	

		"face"	
		"l"	4	1972	4523	-2024	-4523	
		"lt"	4	2010	2011	2063	2062	

		"face"	
		"l"	4	1973	4524	-2025	-4524	
		"lt"	4	2011	2012	2064	2063	

		"face"	
		"l"	4	1974	4525	-2026	-4525	
		"lt"	4	2012	2013	2065	2064	

		"face"	
		"l"	4	1975	4526	-2027	-4526	
		"lt"	4	2013	2014	2066	2065	

		"face"	
		"l"	4	1976	4527	-2028	-4527	
		"lt"	4	2014	2015	2067	2066	

		"face"	
		"l"	4	1977	4528	-2029	-4528	
		"lt"	4	2015	2016	2068	2067	

		"face"	
		"l"	4	1978	4529	-2030	-4529	
		"lt"	4	2016	2017	2069	2068	

		"face"	
		"l"	4	1979	4530	-2031	-4530	
		"lt"	4	2017	2018	2070	2069	

		"face"	
		"l"	4	1980	4531	-2032	-4531	
		"lt"	4	2018	2019	2071	2070	

		"face"	
		"l"	4	1981	4532	-2033	-4532	
		"lt"	4	2019	2020	2072	2071	

		"face"	
		"l"	4	1982	4533	-2034	-4533	
		"lt"	4	2020	2021	2073	2072	

		"face"	
		"l"	4	1983	4534	-2035	-4534	
		"lt"	4	2021	2022	2074	2073	

		"face"	
		"l"	4	1984	4535	-2036	-4535	
		"lt"	4	2022	2023	2075	2074	

		"face"	
		"l"	4	1985	4536	-2037	-4536	
		"lt"	4	2023	2024	2076	2075	

		"face"	
		"l"	4	1986	4537	-2038	-4537	
		"lt"	4	2024	2025	2077	2076	

		"face"	
		"l"	4	1987	4538	-2039	-4538	
		"lt"	4	2025	2026	2078	2077	

		"face"	
		"l"	4	1988	4488	-2040	-4539	
		"lt"	4	2026	2027	2079	2078	

		"face"	
		"l"	4	1989	4540	-2041	-4540	
		"lt"	4	2028	2029	2081	2080	

		"face"	
		"l"	4	1990	4541	-2042	-4541	
		"lt"	4	2029	2030	2082	2081	

		"face"	
		"l"	4	1991	4542	-2043	-4542	
		"lt"	4	2030	2031	2083	2082	

		"face"	
		"l"	4	1992	4543	-2044	-4543	
		"lt"	4	2031	2032	2084	2083	

		"face"	
		"l"	4	1993	4544	-2045	-4544	
		"lt"	4	2032	2033	2085	2084	

		"face"	
		"l"	4	1994	4545	-2046	-4545	
		"lt"	4	2033	2034	2086	2085	

		"face"	
		"l"	4	1995	4546	-2047	-4546	
		"lt"	4	2034	2035	2087	2086	

		"face"	
		"l"	4	1996	4547	-2048	-4547	
		"lt"	4	2035	2036	2088	2087	

		"face"	
		"l"	4	1997	4548	-2049	-4548	
		"lt"	4	2036	2037	2089	2088	

		"face"	
		"l"	4	1998	4549	-2050	-4549	
		"lt"	4	2037	2038	2090	2089	

		"face"	
		"l"	4	1999	4550	-2051	-4550	
		"lt"	4	2038	2039	2091	2090	

		"face"	
		"l"	4	2000	4551	-2052	-4551	
		"lt"	4	2039	2040	2092	2091	

		"face"	
		"l"	4	2001	4552	-2053	-4552	
		"lt"	4	2040	2041	2093	2092	

		"face"	
		"l"	4	2002	4553	-2054	-4553	
		"lt"	4	2041	2042	2094	2093	

		"face"	
		"l"	4	2003	4554	-2055	-4554	
		"lt"	4	2042	2043	2095	2094	

		"face"	
		"l"	4	2004	4555	-2056	-4555	
		"lt"	4	2043	2044	2096	2095	

		"face"	
		"l"	4	2005	4556	-2057	-4556	
		"lt"	4	2044	2045	2097	2096	

		"face"	
		"l"	4	2006	4557	-2058	-4557	
		"lt"	4	2045	2046	2098	2097	

		"face"	
		"l"	4	2007	4558	-2059	-4558	
		"lt"	4	2046	2047	2099	2098	

		"face"	
		"l"	4	2008	4559	-2060	-4559	
		"lt"	4	2047	2048	2100	2099	

		"face"	
		"l"	4	2009	4560	-2061	-4560	
		"lt"	4	2048	2049	2101	2100	

		"face"	
		"l"	4	2010	4561	-2062	-4561	
		"lt"	4	2049	2050	2102	2101	

		"face"	
		"l"	4	2011	4562	-2063	-4562	
		"lt"	4	2050	2051	2103	2102	

		"face"	
		"l"	4	2012	4563	-2064	-4563	
		"lt"	4	2051	2052	2104	2103	

		"face"	
		"l"	4	2013	4564	-2065	-4564	
		"lt"	4	2052	2053	2105	2104	

		"face"	
		"l"	4	2014	4565	-2066	-4565	
		"lt"	4	2053	2054	2106	2105	

		"face"	
		"l"	4	2015	4566	-2067	-4566	
		"lt"	4	2054	2055	2107	2106	

		"face"	
		"l"	4	2016	4567	-2068	-4567	
		"lt"	4	2055	2056	2108	2107	

		"face"	
		"l"	4	2017	4568	-2069	-4568	
		"lt"	4	2056	2057	2109	2108	

		"face"	
		"l"	4	2018	4569	-2070	-4569	
		"lt"	4	2057	2058	2110	2109	

		"face"	
		"l"	4	2019	4570	-2071	-4570	
		"lt"	4	2058	2059	2111	2110	

		"face"	
		"l"	4	2020	4571	-2072	-4571	
		"lt"	4	2059	2060	2112	2111	

		"face"	
		"l"	4	2021	4572	-2073	-4572	
		"lt"	4	2060	2061	2113	2112	

		"face"	
		"l"	4	2022	4573	-2074	-4573	
		"lt"	4	2061	2062	2114	2113	

		"face"	
		"l"	4	2023	4574	-2075	-4574	
		"lt"	4	2062	2063	2115	2114	

		"face"	
		"l"	4	2024	4575	-2076	-4575	
		"lt"	4	2063	2064	2116	2115	

		"face"	
		"l"	4	2025	4576	-2077	-4576	
		"lt"	4	2064	2065	2117	2116	

		"face"	
		"l"	4	2026	4577	-2078	-4577	
		"lt"	4	2065	2066	2118	2117	

		"face"	
		"l"	4	2027	4578	-2079	-4578	
		"lt"	4	2066	2067	2119	2118	

		"face"	
		"l"	4	2028	4579	-2080	-4579	
		"lt"	4	2067	2068	2120	2119	

		"face"	
		"l"	4	2029	4580	-2081	-4580	
		"lt"	4	2068	2069	2121	2120	

		"face"	
		"l"	4	2030	4581	-2082	-4581	
		"lt"	4	2069	2070	2122	2121	

		"face"	
		"l"	4	2031	4582	-2083	-4582	
		"lt"	4	2070	2071	2123	2122	

		"face"	
		"l"	4	2032	4583	-2084	-4583	
		"lt"	4	2071	2072	2124	2123	

		"face"	
		"l"	4	2033	4584	-2085	-4584	
		"lt"	4	2072	2073	2125	2124	

		"face"	
		"l"	4	2034	4585	-2086	-4585	
		"lt"	4	2073	2074	2126	2125	

		"face"	
		"l"	4	2035	4586	-2087	-4586	
		"lt"	4	2074	2075	2127	2126	

		"face"	
		"l"	4	2036	4587	-2088	-4587	
		"lt"	4	2075	2076	2128	2127	

		"face"	
		"l"	4	2037	4588	-2089	-4588	
		"lt"	4	2076	2077	2129	2128	

		"face"	
		"l"	4	2038	4589	-2090	-4589	
		"lt"	4	2077	2078	2130	2129	

		"face"	
		"l"	4	2039	4539	-2091	-4590	
		"lt"	4	2078	2079	2131	2130	

		"face"	
		"l"	4	2040	4591	-2092	-4591	
		"lt"	4	2080	2081	2133	2132	

		"face"	
		"l"	4	2041	4592	-2093	-4592	
		"lt"	4	2081	2082	2134	2133	

		"face"	
		"l"	4	2042	4593	-2094	-4593	
		"lt"	4	2082	2083	2135	2134	

		"face"	
		"l"	4	2043	4594	-2095	-4594	
		"lt"	4	2083	2084	2136	2135	

		"face"	
		"l"	4	2044	4595	-2096	-4595	
		"lt"	4	2084	2085	2137	2136	

		"face"	
		"l"	4	2045	4596	-2097	-4596	
		"lt"	4	2085	2086	2138	2137	

		"face"	
		"l"	4	2046	4597	-2098	-4597	
		"lt"	4	2086	2087	2139	2138	

		"face"	
		"l"	4	2047	4598	-2099	-4598	
		"lt"	4	2087	2088	2140	2139	

		"face"	
		"l"	4	2048	4599	-2100	-4599	
		"lt"	4	2088	2089	2141	2140	

		"face"	
		"l"	4	2049	4600	-2101	-4600	
		"lt"	4	2089	2090	2142	2141	

		"face"	
		"l"	4	2050	4601	-2102	-4601	
		"lt"	4	2090	2091	2143	2142	

		"face"	
		"l"	4	2051	4602	-2103	-4602	
		"lt"	4	2091	2092	2144	2143	

		"face"	
		"l"	4	2052	4603	-2104	-4603	
		"lt"	4	2092	2093	2145	2144	

		"face"	
		"l"	4	2053	4604	-2105	-4604	
		"lt"	4	2093	2094	2146	2145	

		"face"	
		"l"	4	2054	4605	-2106	-4605	
		"lt"	4	2094	2095	2147	2146	

		"face"	
		"l"	4	2055	4606	-2107	-4606	
		"lt"	4	2095	2096	2148	2147	

		"face"	
		"l"	4	2056	4607	-2108	-4607	
		"lt"	4	2096	2097	2149	2148	

		"face"	
		"l"	4	2057	4608	-2109	-4608	
		"lt"	4	2097	2098	2150	2149	

		"face"	
		"l"	4	2058	4609	-2110	-4609	
		"lt"	4	2098	2099	2151	2150	

		"face"	
		"l"	4	2059	4610	-2111	-4610	
		"lt"	4	2099	2100	2152	2151	

		"face"	
		"l"	4	2060	4611	-2112	-4611	
		"lt"	4	2100	2101	2153	2152	

		"face"	
		"l"	4	2061	4612	-2113	-4612	
		"lt"	4	2101	2102	2154	2153	

		"face"	
		"l"	4	2062	4613	-2114	-4613	
		"lt"	4	2102	2103	2155	2154	

		"face"	
		"l"	4	2063	4614	-2115	-4614	
		"lt"	4	2103	2104	2156	2155	

		"face"	
		"l"	4	2064	4615	-2116	-4615	
		"lt"	4	2104	2105	2157	2156	

		"face"	
		"l"	4	2065	4616	-2117	-4616	
		"lt"	4	2105	2106	2158	2157	

		"face"	
		"l"	4	2066	4617	-2118	-4617	
		"lt"	4	2106	2107	2159	2158	

		"face"	
		"l"	4	2067	4618	-2119	-4618	
		"lt"	4	2107	2108	2160	2159	

		"face"	
		"l"	4	2068	4619	-2120	-4619	
		"lt"	4	2108	2109	2161	2160	

		"face"	
		"l"	4	2069	4620	-2121	-4620	
		"lt"	4	2109	2110	2162	2161	

		"face"	
		"l"	4	2070	4621	-2122	-4621	
		"lt"	4	2110	2111	2163	2162	

		"face"	
		"l"	4	2071	4622	-2123	-4622	
		"lt"	4	2111	2112	2164	2163	

		"face"	
		"l"	4	2072	4623	-2124	-4623	
		"lt"	4	2112	2113	2165	2164	

		"face"	
		"l"	4	2073	4624	-2125	-4624	
		"lt"	4	2113	2114	2166	2165	

		"face"	
		"l"	4	2074	4625	-2126	-4625	
		"lt"	4	2114	2115	2167	2166	

		"face"	
		"l"	4	2075	4626	-2127	-4626	
		"lt"	4	2115	2116	2168	2167	

		"face"	
		"l"	4	2076	4627	-2128	-4627	
		"lt"	4	2116	2117	2169	2168	

		"face"	
		"l"	4	2077	4628	-2129	-4628	
		"lt"	4	2117	2118	2170	2169	

		"face"	
		"l"	4	2078	4629	-2130	-4629	
		"lt"	4	2118	2119	2171	2170	

		"face"	
		"l"	4	2079	4630	-2131	-4630	
		"lt"	4	2119	2120	2172	2171	

		"face"	
		"l"	4	2080	4631	-2132	-4631	
		"lt"	4	2120	2121	2173	2172	

		"face"	
		"l"	4	2081	4632	-2133	-4632	
		"lt"	4	2121	2122	2174	2173	

		"face"	
		"l"	4	2082	4633	-2134	-4633	
		"lt"	4	2122	2123	2175	2174	

		"face"	
		"l"	4	2083	4634	-2135	-4634	
		"lt"	4	2123	2124	2176	2175	

		"face"	
		"l"	4	2084	4635	-2136	-4635	
		"lt"	4	2124	2125	2177	2176	

		"face"	
		"l"	4	2085	4636	-2137	-4636	
		"lt"	4	2125	2126	2178	2177	

		"face"	
		"l"	4	2086	4637	-2138	-4637	
		"lt"	4	2126	2127	2179	2178	

		"face"	
		"l"	4	2087	4638	-2139	-4638	
		"lt"	4	2127	2128	2180	2179	

		"face"	
		"l"	4	2088	4639	-2140	-4639	
		"lt"	4	2128	2129	2181	2180	

		"face"	
		"l"	4	2089	4640	-2141	-4640	
		"lt"	4	2129	2130	2182	2181	

		"face"	
		"l"	4	2090	4590	-2142	-4641	
		"lt"	4	2130	2131	2183	2182	

		"face"	
		"l"	4	2091	4642	-2143	-4642	
		"lt"	4	2132	2133	2185	2184	

		"face"	
		"l"	4	2092	4643	-2144	-4643	
		"lt"	4	2133	2134	2186	2185	

		"face"	
		"l"	4	2093	4644	-2145	-4644	
		"lt"	4	2134	2135	2187	2186	

		"face"	
		"l"	4	2094	4645	-2146	-4645	
		"lt"	4	2135	2136	2188	2187	

		"face"	
		"l"	4	2095	4646	-2147	-4646	
		"lt"	4	2136	2137	2189	2188	

		"face"	
		"l"	4	2096	4647	-2148	-4647	
		"lt"	4	2137	2138	2190	2189	

		"face"	
		"l"	4	2097	4648	-2149	-4648	
		"lt"	4	2138	2139	2191	2190	

		"face"	
		"l"	4	2098	4649	-2150	-4649	
		"lt"	4	2139	2140	2192	2191	

		"face"	
		"l"	4	2099	4650	-2151	-4650	
		"lt"	4	2140	2141	2193	2192	

		"face"	
		"l"	4	2100	4651	-2152	-4651	
		"lt"	4	2141	2142	2194	2193	

		"face"	
		"l"	4	2101	4652	-2153	-4652	
		"lt"	4	2142	2143	2195	2194	

		"face"	
		"l"	4	2102	4653	-2154	-4653	
		"lt"	4	2143	2144	2196	2195	

		"face"	
		"l"	4	2103	4654	-2155	-4654	
		"lt"	4	2144	2145	2197	2196	

		"face"	
		"l"	4	2104	4655	-2156	-4655	
		"lt"	4	2145	2146	2198	2197	

		"face"	
		"l"	4	2105	4656	-2157	-4656	
		"lt"	4	2146	2147	2199	2198	

		"face"	
		"l"	4	2106	4657	-2158	-4657	
		"lt"	4	2147	2148	2200	2199	

		"face"	
		"l"	4	2107	4658	-2159	-4658	
		"lt"	4	2148	2149	2201	2200	

		"face"	
		"l"	4	2108	4659	-2160	-4659	
		"lt"	4	2149	2150	2202	2201	

		"face"	
		"l"	4	2109	4660	-2161	-4660	
		"lt"	4	2150	2151	2203	2202	

		"face"	
		"l"	4	2110	4661	-2162	-4661	
		"lt"	4	2151	2152	2204	2203	

		"face"	
		"l"	4	2111	4662	-2163	-4662	
		"lt"	4	2152	2153	2205	2204	

		"face"	
		"l"	4	2112	4663	-2164	-4663	
		"lt"	4	2153	2154	2206	2205	

		"face"	
		"l"	4	2113	4664	-2165	-4664	
		"lt"	4	2154	2155	2207	2206	

		"face"	
		"l"	4	2114	4665	-2166	-4665	
		"lt"	4	2155	2156	2208	2207	

		"face"	
		"l"	4	2115	4666	-2167	-4666	
		"lt"	4	2156	2157	2209	2208	

		"face"	
		"l"	4	2116	4667	-2168	-4667	
		"lt"	4	2157	2158	2210	2209	

		"face"	
		"l"	4	2117	4668	-2169	-4668	
		"lt"	4	2158	2159	2211	2210	

		"face"	
		"l"	4	2118	4669	-2170	-4669	
		"lt"	4	2159	2160	2212	2211	

		"face"	
		"l"	4	2119	4670	-2171	-4670	
		"lt"	4	2160	2161	2213	2212	

		"face"	
		"l"	4	2120	4671	-2172	-4671	
		"lt"	4	2161	2162	2214	2213	

		"face"	
		"l"	4	2121	4672	-2173	-4672	
		"lt"	4	2162	2163	2215	2214	

		"face"	
		"l"	4	2122	4673	-2174	-4673	
		"lt"	4	2163	2164	2216	2215	

		"face"	
		"l"	4	2123	4674	-2175	-4674	
		"lt"	4	2164	2165	2217	2216	

		"face"	
		"l"	4	2124	4675	-2176	-4675	
		"lt"	4	2165	2166	2218	2217	

		"face"	
		"l"	4	2125	4676	-2177	-4676	
		"lt"	4	2166	2167	2219	2218	

		"face"	
		"l"	4	2126	4677	-2178	-4677	
		"lt"	4	2167	2168	2220	2219	

		"face"	
		"l"	4	2127	4678	-2179	-4678	
		"lt"	4	2168	2169	2221	2220	

		"face"	
		"l"	4	2128	4679	-2180	-4679	
		"lt"	4	2169	2170	2222	2221	

		"face"	
		"l"	4	2129	4680	-2181	-4680	
		"lt"	4	2170	2171	2223	2222	

		"face"	
		"l"	4	2130	4681	-2182	-4681	
		"lt"	4	2171	2172	2224	2223	

		"face"	
		"l"	4	2131	4682	-2183	-4682	
		"lt"	4	2172	2173	2225	2224	

		"face"	
		"l"	4	2132	4683	-2184	-4683	
		"lt"	4	2173	2174	2226	2225	

		"face"	
		"l"	4	2133	4684	-2185	-4684	
		"lt"	4	2174	2175	2227	2226	

		"face"	
		"l"	4	2134	4685	-2186	-4685	
		"lt"	4	2175	2176	2228	2227	

		"face"	
		"l"	4	2135	4686	-2187	-4686	
		"lt"	4	2176	2177	2229	2228	

		"face"	
		"l"	4	2136	4687	-2188	-4687	
		"lt"	4	2177	2178	2230	2229	

		"face"	
		"l"	4	2137	4688	-2189	-4688	
		"lt"	4	2178	2179	2231	2230	

		"face"	
		"l"	4	2138	4689	-2190	-4689	
		"lt"	4	2179	2180	2232	2231	

		"face"	
		"l"	4	2139	4690	-2191	-4690	
		"lt"	4	2180	2181	2233	2232	

		"face"	
		"l"	4	2140	4691	-2192	-4691	
		"lt"	4	2181	2182	2234	2233	

		"face"	
		"l"	4	2141	4641	-2193	-4692	
		"lt"	4	2182	2183	2235	2234	

		"face"	
		"l"	4	2142	4693	-2194	-4693	
		"lt"	4	2184	2185	2237	2236	

		"face"	
		"l"	4	2143	4694	-2195	-4694	
		"lt"	4	2185	2186	2238	2237	

		"face"	
		"l"	4	2144	4695	-2196	-4695	
		"lt"	4	2186	2187	2239	2238	

		"face"	
		"l"	4	2145	4696	-2197	-4696	
		"lt"	4	2187	2188	2240	2239	

		"face"	
		"l"	4	2146	4697	-2198	-4697	
		"lt"	4	2188	2189	2241	2240	

		"face"	
		"l"	4	2147	4698	-2199	-4698	
		"lt"	4	2189	2190	2242	2241	

		"face"	
		"l"	4	2148	4699	-2200	-4699	
		"lt"	4	2190	2191	2243	2242	

		"face"	
		"l"	4	2149	4700	-2201	-4700	
		"lt"	4	2191	2192	2244	2243	

		"face"	
		"l"	4	2150	4701	-2202	-4701	
		"lt"	4	2192	2193	2245	2244	

		"face"	
		"l"	4	2151	4702	-2203	-4702	
		"lt"	4	2193	2194	2246	2245	

		"face"	
		"l"	4	2152	4703	-2204	-4703	
		"lt"	4	2194	2195	2247	2246	

		"face"	
		"l"	4	2153	4704	-2205	-4704	
		"lt"	4	2195	2196	2248	2247	

		"face"	
		"l"	4	2154	4705	-2206	-4705	
		"lt"	4	2196	2197	2249	2248	

		"face"	
		"l"	4	2155	4706	-2207	-4706	
		"lt"	4	2197	2198	2250	2249	

		"face"	
		"l"	4	2156	4707	-2208	-4707	
		"lt"	4	2198	2199	2251	2250	

		"face"	
		"l"	4	2157	4708	-2209	-4708	
		"lt"	4	2199	2200	2252	2251	

		"face"	
		"l"	4	2158	4709	-2210	-4709	
		"lt"	4	2200	2201	2253	2252	

		"face"	
		"l"	4	2159	4710	-2211	-4710	
		"lt"	4	2201	2202	2254	2253	

		"face"	
		"l"	4	2160	4711	-2212	-4711	
		"lt"	4	2202	2203	2255	2254	

		"face"	
		"l"	4	2161	4712	-2213	-4712	
		"lt"	4	2203	2204	2256	2255	

		"face"	
		"l"	4	2162	4713	-2214	-4713	
		"lt"	4	2204	2205	2257	2256	

		"face"	
		"l"	4	2163	4714	-2215	-4714	
		"lt"	4	2205	2206	2258	2257	

		"face"	
		"l"	4	2164	4715	-2216	-4715	
		"lt"	4	2206	2207	2259	2258	

		"face"	
		"l"	4	2165	4716	-2217	-4716	
		"lt"	4	2207	2208	2260	2259	

		"face"	
		"l"	4	2166	4717	-2218	-4717	
		"lt"	4	2208	2209	2261	2260	

		"face"	
		"l"	4	2167	4718	-2219	-4718	
		"lt"	4	2209	2210	2262	2261	

		"face"	
		"l"	4	2168	4719	-2220	-4719	
		"lt"	4	2210	2211	2263	2262	

		"face"	
		"l"	4	2169	4720	-2221	-4720	
		"lt"	4	2211	2212	2264	2263	

		"face"	
		"l"	4	2170	4721	-2222	-4721	
		"lt"	4	2212	2213	2265	2264	

		"face"	
		"l"	4	2171	4722	-2223	-4722	
		"lt"	4	2213	2214	2266	2265	

		"face"	
		"l"	4	2172	4723	-2224	-4723	
		"lt"	4	2214	2215	2267	2266	

		"face"	
		"l"	4	2173	4724	-2225	-4724	
		"lt"	4	2215	2216	2268	2267	

		"face"	
		"l"	4	2174	4725	-2226	-4725	
		"lt"	4	2216	2217	2269	2268	

		"face"	
		"l"	4	2175	4726	-2227	-4726	
		"lt"	4	2217	2218	2270	2269	

		"face"	
		"l"	4	2176	4727	-2228	-4727	
		"lt"	4	2218	2219	2271	2270	

		"face"	
		"l"	4	2177	4728	-2229	-4728	
		"lt"	4	2219	2220	2272	2271	

		"face"	
		"l"	4	2178	4729	-2230	-4729	
		"lt"	4	2220	2221	2273	2272	

		"face"	
		"l"	4	2179	4730	-2231	-4730	
		"lt"	4	2221	2222	2274	2273	

		"face"	
		"l"	4	2180	4731	-2232	-4731	
		"lt"	4	2222	2223	2275	2274	

		"face"	
		"l"	4	2181	4732	-2233	-4732	
		"lt"	4	2223	2224	2276	2275	

		"face"	
		"l"	4	2182	4733	-2234	-4733	
		"lt"	4	2224	2225	2277	2276	

		"face"	
		"l"	4	2183	4734	-2235	-4734	
		"lt"	4	2225	2226	2278	2277	

		"face"	
		"l"	4	2184	4735	-2236	-4735	
		"lt"	4	2226	2227	2279	2278	

		"face"	
		"l"	4	2185	4736	-2237	-4736	
		"lt"	4	2227	2228	2280	2279	

		"face"	
		"l"	4	2186	4737	-2238	-4737	
		"lt"	4	2228	2229	2281	2280	

		"face"	
		"l"	4	2187	4738	-2239	-4738	
		"lt"	4	2229	2230	2282	2281	

		"face"	
		"l"	4	2188	4739	-2240	-4739	
		"lt"	4	2230	2231	2283	2282	

		"face"	
		"l"	4	2189	4740	-2241	-4740	
		"lt"	4	2231	2232	2284	2283	

		"face"	
		"l"	4	2190	4741	-2242	-4741	
		"lt"	4	2232	2233	2285	2284	

		"face"	
		"l"	4	2191	4742	-2243	-4742	
		"lt"	4	2233	2234	2286	2285	

		"face"	
		"l"	4	2192	4692	-2244	-4743	
		"lt"	4	2234	2235	2287	2286	

		"face"	
		"l"	4	2193	4744	-2245	-4744	
		"lt"	4	2236	2237	2289	2288	

		"face"	
		"l"	4	2194	4745	-2246	-4745	
		"lt"	4	2237	2238	2290	2289	

		"face"	
		"l"	4	2195	4746	-2247	-4746	
		"lt"	4	2238	2239	2291	2290	

		"face"	
		"l"	4	2196	4747	-2248	-4747	
		"lt"	4	2239	2240	2292	2291	

		"face"	
		"l"	4	2197	4748	-2249	-4748	
		"lt"	4	2240	2241	2293	2292	

		"face"	
		"l"	4	2198	4749	-2250	-4749	
		"lt"	4	2241	2242	2294	2293	

		"face"	
		"l"	4	2199	4750	-2251	-4750	
		"lt"	4	2242	2243	2295	2294	

		"face"	
		"l"	4	2200	4751	-2252	-4751	
		"lt"	4	2243	2244	2296	2295	

		"face"	
		"l"	4	2201	4752	-2253	-4752	
		"lt"	4	2244	2245	2297	2296	

		"face"	
		"l"	4	2202	4753	-2254	-4753	
		"lt"	4	2245	2246	2298	2297	

		"face"	
		"l"	4	2203	4754	-2255	-4754	
		"lt"	4	2246	2247	2299	2298	

		"face"	
		"l"	4	2204	4755	-2256	-4755	
		"lt"	4	2247	2248	2300	2299	

		"face"	
		"l"	4	2205	4756	-2257	-4756	
		"lt"	4	2248	2249	2301	2300	

		"face"	
		"l"	4	2206	4757	-2258	-4757	
		"lt"	4	2249	2250	2302	2301	

		"face"	
		"l"	4	2207	4758	-2259	-4758	
		"lt"	4	2250	2251	2303	2302	

		"face"	
		"l"	4	2208	4759	-2260	-4759	
		"lt"	4	2251	2252	2304	2303	

		"face"	
		"l"	4	2209	4760	-2261	-4760	
		"lt"	4	2252	2253	2305	2304	

		"face"	
		"l"	4	2210	4761	-2262	-4761	
		"lt"	4	2253	2254	2306	2305	

		"face"	
		"l"	4	2211	4762	-2263	-4762	
		"lt"	4	2254	2255	2307	2306	

		"face"	
		"l"	4	2212	4763	-2264	-4763	
		"lt"	4	2255	2256	2308	2307	

		"face"	
		"l"	4	2213	4764	-2265	-4764	
		"lt"	4	2256	2257	2309	2308	

		"face"	
		"l"	4	2214	4765	-2266	-4765	
		"lt"	4	2257	2258	2310	2309	

		"face"	
		"l"	4	2215	4766	-2267	-4766	
		"lt"	4	2258	2259	2311	2310	

		"face"	
		"l"	4	2216	4767	-2268	-4767	
		"lt"	4	2259	2260	2312	2311	

		"face"	
		"l"	4	2217	4768	-2269	-4768	
		"lt"	4	2260	2261	2313	2312	

		"face"	
		"l"	4	2218	4769	-2270	-4769	
		"lt"	4	2261	2262	2314	2313	

		"face"	
		"l"	4	2219	4770	-2271	-4770	
		"lt"	4	2262	2263	2315	2314	

		"face"	
		"l"	4	2220	4771	-2272	-4771	
		"lt"	4	2263	2264	2316	2315	

		"face"	
		"l"	4	2221	4772	-2273	-4772	
		"lt"	4	2264	2265	2317	2316	

		"face"	
		"l"	4	2222	4773	-2274	-4773	
		"lt"	4	2265	2266	2318	2317	

		"face"	
		"l"	4	2223	4774	-2275	-4774	
		"lt"	4	2266	2267	2319	2318	

		"face"	
		"l"	4	2224	4775	-2276	-4775	
		"lt"	4	2267	2268	2320	2319	

		"face"	
		"l"	4	2225	4776	-2277	-4776	
		"lt"	4	2268	2269	2321	2320	

		"face"	
		"l"	4	2226	4777	-2278	-4777	
		"lt"	4	2269	2270	2322	2321	

		"face"	
		"l"	4	2227	4778	-2279	-4778	
		"lt"	4	2270	2271	2323	2322	

		"face"	
		"l"	4	2228	4779	-2280	-4779	
		"lt"	4	2271	2272	2324	2323	

		"face"	
		"l"	4	2229	4780	-2281	-4780	
		"lt"	4	2272	2273	2325	2324	

		"face"	
		"l"	4	2230	4781	-2282	-4781	
		"lt"	4	2273	2274	2326	2325	

		"face"	
		"l"	4	2231	4782	-2283	-4782	
		"lt"	4	2274	2275	2327	2326	

		"face"	
		"l"	4	2232	4783	-2284	-4783	
		"lt"	4	2275	2276	2328	2327	

		"face"	
		"l"	4	2233	4784	-2285	-4784	
		"lt"	4	2276	2277	2329	2328	

		"face"	
		"l"	4	2234	4785	-2286	-4785	
		"lt"	4	2277	2278	2330	2329	

		"face"	
		"l"	4	2235	4786	-2287	-4786	
		"lt"	4	2278	2279	2331	2330	

		"face"	
		"l"	4	2236	4787	-2288	-4787	
		"lt"	4	2279	2280	2332	2331	

		"face"	
		"l"	4	2237	4788	-2289	-4788	
		"lt"	4	2280	2281	2333	2332	

		"face"	
		"l"	4	2238	4789	-2290	-4789	
		"lt"	4	2281	2282	2334	2333	

		"face"	
		"l"	4	2239	4790	-2291	-4790	
		"lt"	4	2282	2283	2335	2334	

		"face"	
		"l"	4	2240	4791	-2292	-4791	
		"lt"	4	2283	2284	2336	2335	

		"face"	
		"l"	4	2241	4792	-2293	-4792	
		"lt"	4	2284	2285	2337	2336	

		"face"	
		"l"	4	2242	4793	-2294	-4793	
		"lt"	4	2285	2286	2338	2337	

		"face"	
		"l"	4	2243	4743	-2295	-4794	
		"lt"	4	2286	2287	2339	2338	

		"face"	
		"l"	4	2244	4795	-2296	-4795	
		"lt"	4	2288	2289	2341	2340	

		"face"	
		"l"	4	2245	4796	-2297	-4796	
		"lt"	4	2289	2290	2342	2341	

		"face"	
		"l"	4	2246	4797	-2298	-4797	
		"lt"	4	2290	2291	2343	2342	

		"face"	
		"l"	4	2247	4798	-2299	-4798	
		"lt"	4	2291	2292	2344	2343	

		"face"	
		"l"	4	2248	4799	-2300	-4799	
		"lt"	4	2292	2293	2345	2344	

		"face"	
		"l"	4	2249	4800	-2301	-4800	
		"lt"	4	2293	2294	2346	2345	

		"face"	
		"l"	4	2250	4801	-2302	-4801	
		"lt"	4	2294	2295	2347	2346	

		"face"	
		"l"	4	2251	4802	-2303	-4802	
		"lt"	4	2295	2296	2348	2347	

		"face"	
		"l"	4	2252	4803	-2304	-4803	
		"lt"	4	2296	2297	2349	2348	

		"face"	
		"l"	4	2253	4804	-2305	-4804	
		"lt"	4	2297	2298	2350	2349	

		"face"	
		"l"	4	2254	4805	-2306	-4805	
		"lt"	4	2298	2299	2351	2350	

		"face"	
		"l"	4	2255	4806	-2307	-4806	
		"lt"	4	2299	2300	2352	2351	

		"face"	
		"l"	4	2256	4807	-2308	-4807	
		"lt"	4	2300	2301	2353	2352	

		"face"	
		"l"	4	2257	4808	-2309	-4808	
		"lt"	4	2301	2302	2354	2353	

		"face"	
		"l"	4	2258	4809	-2310	-4809	
		"lt"	4	2302	2303	2355	2354	

		"face"	
		"l"	4	2259	4810	-2311	-4810	
		"lt"	4	2303	2304	2356	2355	

		"face"	
		"l"	4	2260	4811	-2312	-4811	
		"lt"	4	2304	2305	2357	2356	

		"face"	
		"l"	4	2261	4812	-2313	-4812	
		"lt"	4	2305	2306	2358	2357	

		"face"	
		"l"	4	2262	4813	-2314	-4813	
		"lt"	4	2306	2307	2359	2358	

		"face"	
		"l"	4	2263	4814	-2315	-4814	
		"lt"	4	2307	2308	2360	2359	

		"face"	
		"l"	4	2264	4815	-2316	-4815	
		"lt"	4	2308	2309	2361	2360	

		"face"	
		"l"	4	2265	4816	-2317	-4816	
		"lt"	4	2309	2310	2362	2361	

		"face"	
		"l"	4	2266	4817	-2318	-4817	
		"lt"	4	2310	2311	2363	2362	

		"face"	
		"l"	4	2267	4818	-2319	-4818	
		"lt"	4	2311	2312	2364	2363	

		"face"	
		"l"	4	2268	4819	-2320	-4819	
		"lt"	4	2312	2313	2365	2364	

		"face"	
		"l"	4	2269	4820	-2321	-4820	
		"lt"	4	2313	2314	2366	2365	

		"face"	
		"l"	4	2270	4821	-2322	-4821	
		"lt"	4	2314	2315	2367	2366	

		"face"	
		"l"	4	2271	4822	-2323	-4822	
		"lt"	4	2315	2316	2368	2367	

		"face"	
		"l"	4	2272	4823	-2324	-4823	
		"lt"	4	2316	2317	2369	2368	

		"face"	
		"l"	4	2273	4824	-2325	-4824	
		"lt"	4	2317	2318	2370	2369	

		"face"	
		"l"	4	2274	4825	-2326	-4825	
		"lt"	4	2318	2319	2371	2370	

		"face"	
		"l"	4	2275	4826	-2327	-4826	
		"lt"	4	2319	2320	2372	2371	

		"face"	
		"l"	4	2276	4827	-2328	-4827	
		"lt"	4	2320	2321	2373	2372	

		"face"	
		"l"	4	2277	4828	-2329	-4828	
		"lt"	4	2321	2322	2374	2373	

		"face"	
		"l"	4	2278	4829	-2330	-4829	
		"lt"	4	2322	2323	2375	2374	

		"face"	
		"l"	4	2279	4830	-2331	-4830	
		"lt"	4	2323	2324	2376	2375	

		"face"	
		"l"	4	2280	4831	-2332	-4831	
		"lt"	4	2324	2325	2377	2376	

		"face"	
		"l"	4	2281	4832	-2333	-4832	
		"lt"	4	2325	2326	2378	2377	

		"face"	
		"l"	4	2282	4833	-2334	-4833	
		"lt"	4	2326	2327	2379	2378	

		"face"	
		"l"	4	2283	4834	-2335	-4834	
		"lt"	4	2327	2328	2380	2379	

		"face"	
		"l"	4	2284	4835	-2336	-4835	
		"lt"	4	2328	2329	2381	2380	

		"face"	
		"l"	4	2285	4836	-2337	-4836	
		"lt"	4	2329	2330	2382	2381	

		"face"	
		"l"	4	2286	4837	-2338	-4837	
		"lt"	4	2330	2331	2383	2382	

		"face"	
		"l"	4	2287	4838	-2339	-4838	
		"lt"	4	2331	2332	2384	2383	

		"face"	
		"l"	4	2288	4839	-2340	-4839	
		"lt"	4	2332	2333	2385	2384	

		"face"	
		"l"	4	2289	4840	-2341	-4840	
		"lt"	4	2333	2334	2386	2385	

		"face"	
		"l"	4	2290	4841	-2342	-4841	
		"lt"	4	2334	2335	2387	2386	

		"face"	
		"l"	4	2291	4842	-2343	-4842	
		"lt"	4	2335	2336	2388	2387	

		"face"	
		"l"	4	2292	4843	-2344	-4843	
		"lt"	4	2336	2337	2389	2388	

		"face"	
		"l"	4	2293	4844	-2345	-4844	
		"lt"	4	2337	2338	2390	2389	

		"face"	
		"l"	4	2294	4794	-2346	-4845	
		"lt"	4	2338	2339	2391	2390	

		"face"	
		"l"	4	2295	4846	-2347	-4846	
		"lt"	4	2340	2341	2393	2392	

		"face"	
		"l"	4	2296	4847	-2348	-4847	
		"lt"	4	2341	2342	2394	2393	

		"face"	
		"l"	4	2297	4848	-2349	-4848	
		"lt"	4	2342	2343	2395	2394	

		"face"	
		"l"	4	2298	4849	-2350	-4849	
		"lt"	4	2343	2344	2396	2395	

		"face"	
		"l"	4	2299	4850	-2351	-4850	
		"lt"	4	2344	2345	2397	2396	

		"face"	
		"l"	4	2300	4851	-2352	-4851	
		"lt"	4	2345	2346	2398	2397	

		"face"	
		"l"	4	2301	4852	-2353	-4852	
		"lt"	4	2346	2347	2399	2398	

		"face"	
		"l"	4	2302	4853	-2354	-4853	
		"lt"	4	2347	2348	2400	2399	

		"face"	
		"l"	4	2303	4854	-2355	-4854	
		"lt"	4	2348	2349	2401	2400	

		"face"	
		"l"	4	2304	4855	-2356	-4855	
		"lt"	4	2349	2350	2402	2401	

		"face"	
		"l"	4	2305	4856	-2357	-4856	
		"lt"	4	2350	2351	2403	2402	

		"face"	
		"l"	4	2306	4857	-2358	-4857	
		"lt"	4	2351	2352	2404	2403	

		"face"	
		"l"	4	2307	4858	-2359	-4858	
		"lt"	4	2352	2353	2405	2404	

		"face"	
		"l"	4	2308	4859	-2360	-4859	
		"lt"	4	2353	2354	2406	2405	

		"face"	
		"l"	4	2309	4860	-2361	-4860	
		"lt"	4	2354	2355	2407	2406	

		"face"	
		"l"	4	2310	4861	-2362	-4861	
		"lt"	4	2355	2356	2408	2407	

		"face"	
		"l"	4	2311	4862	-2363	-4862	
		"lt"	4	2356	2357	2409	2408	

		"face"	
		"l"	4	2312	4863	-2364	-4863	
		"lt"	4	2357	2358	2410	2409	

		"face"	
		"l"	4	2313	4864	-2365	-4864	
		"lt"	4	2358	2359	2411	2410	

		"face"	
		"l"	4	2314	4865	-2366	-4865	
		"lt"	4	2359	2360	2412	2411	

		"face"	
		"l"	4	2315	4866	-2367	-4866	
		"lt"	4	2360	2361	2413	2412	

		"face"	
		"l"	4	2316	4867	-2368	-4867	
		"lt"	4	2361	2362	2414	2413	

		"face"	
		"l"	4	2317	4868	-2369	-4868	
		"lt"	4	2362	2363	2415	2414	

		"face"	
		"l"	4	2318	4869	-2370	-4869	
		"lt"	4	2363	2364	2416	2415	

		"face"	
		"l"	4	2319	4870	-2371	-4870	
		"lt"	4	2364	2365	2417	2416	

		"face"	
		"l"	4	2320	4871	-2372	-4871	
		"lt"	4	2365	2366	2418	2417	

		"face"	
		"l"	4	2321	4872	-2373	-4872	
		"lt"	4	2366	2367	2419	2418	

		"face"	
		"l"	4	2322	4873	-2374	-4873	
		"lt"	4	2367	2368	2420	2419	

		"face"	
		"l"	4	2323	4874	-2375	-4874	
		"lt"	4	2368	2369	2421	2420	

		"face"	
		"l"	4	2324	4875	-2376	-4875	
		"lt"	4	2369	2370	2422	2421	

		"face"	
		"l"	4	2325	4876	-2377	-4876	
		"lt"	4	2370	2371	2423	2422	

		"face"	
		"l"	4	2326	4877	-2378	-4877	
		"lt"	4	2371	2372	2424	2423	

		"face"	
		"l"	4	2327	4878	-2379	-4878	
		"lt"	4	2372	2373	2425	2424	

		"face"	
		"l"	4	2328	4879	-2380	-4879	
		"lt"	4	2373	2374	2426	2425	

		"face"	
		"l"	4	2329	4880	-2381	-4880	
		"lt"	4	2374	2375	2427	2426	

		"face"	
		"l"	4	2330	4881	-2382	-4881	
		"lt"	4	2375	2376	2428	2427	

		"face"	
		"l"	4	2331	4882	-2383	-4882	
		"lt"	4	2376	2377	2429	2428	

		"face"	
		"l"	4	2332	4883	-2384	-4883	
		"lt"	4	2377	2378	2430	2429	

		"face"	
		"l"	4	2333	4884	-2385	-4884	
		"lt"	4	2378	2379	2431	2430	

		"face"	
		"l"	4	2334	4885	-2386	-4885	
		"lt"	4	2379	2380	2432	2431	

		"face"	
		"l"	4	2335	4886	-2387	-4886	
		"lt"	4	2380	2381	2433	2432	

		"face"	
		"l"	4	2336	4887	-2388	-4887	
		"lt"	4	2381	2382	2434	2433	

		"face"	
		"l"	4	2337	4888	-2389	-4888	
		"lt"	4	2382	2383	2435	2434	

		"face"	
		"l"	4	2338	4889	-2390	-4889	
		"lt"	4	2383	2384	2436	2435	

		"face"	
		"l"	4	2339	4890	-2391	-4890	
		"lt"	4	2384	2385	2437	2436	

		"face"	
		"l"	4	2340	4891	-2392	-4891	
		"lt"	4	2385	2386	2438	2437	

		"face"	
		"l"	4	2341	4892	-2393	-4892	
		"lt"	4	2386	2387	2439	2438	

		"face"	
		"l"	4	2342	4893	-2394	-4893	
		"lt"	4	2387	2388	2440	2439	

		"face"	
		"l"	4	2343	4894	-2395	-4894	
		"lt"	4	2388	2389	2441	2440	

		"face"	
		"l"	4	2344	4895	-2396	-4895	
		"lt"	4	2389	2390	2442	2441	

		"face"	
		"l"	4	2345	4845	-2397	-4896	
		"lt"	4	2390	2391	2443	2442	

		"face"	
		"l"	4	2346	4897	-2398	-4897	
		"lt"	4	2392	2393	2445	2444	

		"face"	
		"l"	4	2347	4898	-2399	-4898	
		"lt"	4	2393	2394	2446	2445	

		"face"	
		"l"	4	2348	4899	-2400	-4899	
		"lt"	4	2394	2395	2447	2446	

		"face"	
		"l"	4	2349	4900	-2401	-4900	
		"lt"	4	2395	2396	2448	2447	

		"face"	
		"l"	4	2350	4901	-2402	-4901	
		"lt"	4	2396	2397	2449	2448	

		"face"	
		"l"	4	2351	4902	-2403	-4902	
		"lt"	4	2397	2398	2450	2449	

		"face"	
		"l"	4	2352	4903	-2404	-4903	
		"lt"	4	2398	2399	2451	2450	

		"face"	
		"l"	4	2353	4904	-2405	-4904	
		"lt"	4	2399	2400	2452	2451	

		"face"	
		"l"	4	2354	4905	-2406	-4905	
		"lt"	4	2400	2401	2453	2452	

		"face"	
		"l"	4	2355	4906	-2407	-4906	
		"lt"	4	2401	2402	2454	2453	

		"face"	
		"l"	4	2356	4907	-2408	-4907	
		"lt"	4	2402	2403	2455	2454	

		"face"	
		"l"	4	2357	4908	-2409	-4908	
		"lt"	4	2403	2404	2456	2455	

		"face"	
		"l"	4	2358	4909	-2410	-4909	
		"lt"	4	2404	2405	2457	2456	

		"face"	
		"l"	4	2359	4910	-2411	-4910	
		"lt"	4	2405	2406	2458	2457	

		"face"	
		"l"	4	2360	4911	-2412	-4911	
		"lt"	4	2406	2407	2459	2458	

		"face"	
		"l"	4	2361	4912	-2413	-4912	
		"lt"	4	2407	2408	2460	2459	

		"face"	
		"l"	4	2362	4913	-2414	-4913	
		"lt"	4	2408	2409	2461	2460	

		"face"	
		"l"	4	2363	4914	-2415	-4914	
		"lt"	4	2409	2410	2462	2461	

		"face"	
		"l"	4	2364	4915	-2416	-4915	
		"lt"	4	2410	2411	2463	2462	

		"face"	
		"l"	4	2365	4916	-2417	-4916	
		"lt"	4	2411	2412	2464	2463	

		"face"	
		"l"	4	2366	4917	-2418	-4917	
		"lt"	4	2412	2413	2465	2464	

		"face"	
		"l"	4	2367	4918	-2419	-4918	
		"lt"	4	2413	2414	2466	2465	

		"face"	
		"l"	4	2368	4919	-2420	-4919	
		"lt"	4	2414	2415	2467	2466	

		"face"	
		"l"	4	2369	4920	-2421	-4920	
		"lt"	4	2415	2416	2468	2467	

		"face"	
		"l"	4	2370	4921	-2422	-4921	
		"lt"	4	2416	2417	2469	2468	

		"face"	
		"l"	4	2371	4922	-2423	-4922	
		"lt"	4	2417	2418	2470	2469	

		"face"	
		"l"	4	2372	4923	-2424	-4923	
		"lt"	4	2418	2419	2471	2470	

		"face"	
		"l"	4	2373	4924	-2425	-4924	
		"lt"	4	2419	2420	2472	2471	

		"face"	
		"l"	4	2374	4925	-2426	-4925	
		"lt"	4	2420	2421	2473	2472	

		"face"	
		"l"	4	2375	4926	-2427	-4926	
		"lt"	4	2421	2422	2474	2473	

		"face"	
		"l"	4	2376	4927	-2428	-4927	
		"lt"	4	2422	2423	2475	2474	

		"face"	
		"l"	4	2377	4928	-2429	-4928	
		"lt"	4	2423	2424	2476	2475	

		"face"	
		"l"	4	2378	4929	-2430	-4929	
		"lt"	4	2424	2425	2477	2476	

		"face"	
		"l"	4	2379	4930	-2431	-4930	
		"lt"	4	2425	2426	2478	2477	

		"face"	
		"l"	4	2380	4931	-2432	-4931	
		"lt"	4	2426	2427	2479	2478	

		"face"	
		"l"	4	2381	4932	-2433	-4932	
		"lt"	4	2427	2428	2480	2479	

		"face"	
		"l"	4	2382	4933	-2434	-4933	
		"lt"	4	2428	2429	2481	2480	

		"face"	
		"l"	4	2383	4934	-2435	-4934	
		"lt"	4	2429	2430	2482	2481	

		"face"	
		"l"	4	2384	4935	-2436	-4935	
		"lt"	4	2430	2431	2483	2482	

		"face"	
		"l"	4	2385	4936	-2437	-4936	
		"lt"	4	2431	2432	2484	2483	

		"face"	
		"l"	4	2386	4937	-2438	-4937	
		"lt"	4	2432	2433	2485	2484	

		"face"	
		"l"	4	2387	4938	-2439	-4938	
		"lt"	4	2433	2434	2486	2485	

		"face"	
		"l"	4	2388	4939	-2440	-4939	
		"lt"	4	2434	2435	2487	2486	

		"face"	
		"l"	4	2389	4940	-2441	-4940	
		"lt"	4	2435	2436	2488	2487	

		"face"	
		"l"	4	2390	4941	-2442	-4941	
		"lt"	4	2436	2437	2489	2488	

		"face"	
		"l"	4	2391	4942	-2443	-4942	
		"lt"	4	2437	2438	2490	2489	

		"face"	
		"l"	4	2392	4943	-2444	-4943	
		"lt"	4	2438	2439	2491	2490	

		"face"	
		"l"	4	2393	4944	-2445	-4944	
		"lt"	4	2439	2440	2492	2491	

		"face"	
		"l"	4	2394	4945	-2446	-4945	
		"lt"	4	2440	2441	2493	2492	

		"face"	
		"l"	4	2395	4946	-2447	-4946	
		"lt"	4	2441	2442	2494	2493	

		"face"	
		"l"	4	2396	4896	-2448	-4947	
		"lt"	4	2442	2443	2495	2494	

		"face"	
		"l"	4	2397	4948	-2449	-4948	
		"lt"	4	2444	2445	2497	2496	

		"face"	
		"l"	4	2398	4949	-2450	-4949	
		"lt"	4	2445	2446	2498	2497	

		"face"	
		"l"	4	2399	4950	-2451	-4950	
		"lt"	4	2446	2447	2499	2498	

		"face"	
		"l"	4	2400	4951	-2452	-4951	
		"lt"	4	2447	2448	2500	2499	

		"face"	
		"l"	4	2401	4952	-2453	-4952	
		"lt"	4	2448	2449	2501	2500	

		"face"	
		"l"	4	2402	4953	-2454	-4953	
		"lt"	4	2449	2450	2502	2501	

		"face"	
		"l"	4	2403	4954	-2455	-4954	
		"lt"	4	2450	2451	2503	2502	

		"face"	
		"l"	4	2404	4955	-2456	-4955	
		"lt"	4	2451	2452	2504	2503	

		"face"	
		"l"	4	2405	4956	-2457	-4956	
		"lt"	4	2452	2453	2505	2504	

		"face"	
		"l"	4	2406	4957	-2458	-4957	
		"lt"	4	2453	2454	2506	2505	

		"face"	
		"l"	4	2407	4958	-2459	-4958	
		"lt"	4	2454	2455	2507	2506	

		"face"	
		"l"	4	2408	4959	-2460	-4959	
		"lt"	4	2455	2456	2508	2507	

		"face"	
		"l"	4	2409	4960	-2461	-4960	
		"lt"	4	2456	2457	2509	2508	

		"face"	
		"l"	4	2410	4961	-2462	-4961	
		"lt"	4	2457	2458	2510	2509	

		"face"	
		"l"	4	2411	4962	-2463	-4962	
		"lt"	4	2458	2459	2511	2510	

		"face"	
		"l"	4	2412	4963	-2464	-4963	
		"lt"	4	2459	2460	2512	2511	

		"face"	
		"l"	4	2413	4964	-2465	-4964	
		"lt"	4	2460	2461	2513	2512	

		"face"	
		"l"	4	2414	4965	-2466	-4965	
		"lt"	4	2461	2462	2514	2513	

		"face"	
		"l"	4	2415	4966	-2467	-4966	
		"lt"	4	2462	2463	2515	2514	

		"face"	
		"l"	4	2416	4967	-2468	-4967	
		"lt"	4	2463	2464	2516	2515	

		"face"	
		"l"	4	2417	4968	-2469	-4968	
		"lt"	4	2464	2465	2517	2516	

		"face"	
		"l"	4	2418	4969	-2470	-4969	
		"lt"	4	2465	2466	2518	2517	

		"face"	
		"l"	4	2419	4970	-2471	-4970	
		"lt"	4	2466	2467	2519	2518	

		"face"	
		"l"	4	2420	4971	-2472	-4971	
		"lt"	4	2467	2468	2520	2519	

		"face"	
		"l"	4	2421	4972	-2473	-4972	
		"lt"	4	2468	2469	2521	2520	

		"face"	
		"l"	4	2422	4973	-2474	-4973	
		"lt"	4	2469	2470	2522	2521	

		"face"	
		"l"	4	2423	4974	-2475	-4974	
		"lt"	4	2470	2471	2523	2522	

		"face"	
		"l"	4	2424	4975	-2476	-4975	
		"lt"	4	2471	2472	2524	2523	

		"face"	
		"l"	4	2425	4976	-2477	-4976	
		"lt"	4	2472	2473	2525	2524	

		"face"	
		"l"	4	2426	4977	-2478	-4977	
		"lt"	4	2473	2474	2526	2525	

		"face"	
		"l"	4	2427	4978	-2479	-4978	
		"lt"	4	2474	2475	2527	2526	

		"face"	
		"l"	4	2428	4979	-2480	-4979	
		"lt"	4	2475	2476	2528	2527	

		"face"	
		"l"	4	2429	4980	-2481	-4980	
		"lt"	4	2476	2477	2529	2528	

		"face"	
		"l"	4	2430	4981	-2482	-4981	
		"lt"	4	2477	2478	2530	2529	

		"face"	
		"l"	4	2431	4982	-2483	-4982	
		"lt"	4	2478	2479	2531	2530	

		"face"	
		"l"	4	2432	4983	-2484	-4983	
		"lt"	4	2479	2480	2532	2531	

		"face"	
		"l"	4	2433	4984	-2485	-4984	
		"lt"	4	2480	2481	2533	2532	

		"face"	
		"l"	4	2434	4985	-2486	-4985	
		"lt"	4	2481	2482	2534	2533	

		"face"	
		"l"	4	2435	4986	-2487	-4986	
		"lt"	4	2482	2483	2535	2534	

		"face"	
		"l"	4	2436	4987	-2488	-4987	
		"lt"	4	2483	2484	2536	2535	

		"face"	
		"l"	4	2437	4988	-2489	-4988	
		"lt"	4	2484	2485	2537	2536	

		"face"	
		"l"	4	2438	4989	-2490	-4989	
		"lt"	4	2485	2486	2538	2537	

		"face"	
		"l"	4	2439	4990	-2491	-4990	
		"lt"	4	2486	2487	2539	2538	

		"face"	
		"l"	4	2440	4991	-2492	-4991	
		"lt"	4	2487	2488	2540	2539	

		"face"	
		"l"	4	2441	4992	-2493	-4992	
		"lt"	4	2488	2489	2541	2540	

		"face"	
		"l"	4	2442	4993	-2494	-4993	
		"lt"	4	2489	2490	2542	2541	

		"face"	
		"l"	4	2443	4994	-2495	-4994	
		"lt"	4	2490	2491	2543	2542	

		"face"	
		"l"	4	2444	4995	-2496	-4995	
		"lt"	4	2491	2492	2544	2543	

		"face"	
		"l"	4	2445	4996	-2497	-4996	
		"lt"	4	2492	2493	2545	2544	

		"face"	
		"l"	4	2446	4997	-2498	-4997	
		"lt"	4	2493	2494	2546	2545	

		"face"	
		"l"	4	2447	4947	-2499	-4998	
		"lt"	4	2494	2495	2547	2546	

		"face"	
		"l"	4	2448	4999	-2500	-4999	
		"lt"	4	2496	2497	2549	2548	

		"face"	
		"l"	4	2449	5000	-2501	-5000	
		"lt"	4	2497	2498	2550	2549	

		"face"	
		"l"	4	2450	5001	-2502	-5001	
		"lt"	4	2498	2499	2551	2550	

		"face"	
		"l"	4	2451	5002	-2503	-5002	
		"lt"	4	2499	2500	2552	2551	

		"face"	
		"l"	4	2452	5003	-2504	-5003	
		"lt"	4	2500	2501	2553	2552	

		"face"	
		"l"	4	2453	5004	-2505	-5004	
		"lt"	4	2501	2502	2554	2553	

		"face"	
		"l"	4	2454	5005	-2506	-5005	
		"lt"	4	2502	2503	2555	2554	

		"face"	
		"l"	4	2455	5006	-2507	-5006	
		"lt"	4	2503	2504	2556	2555	

		"face"	
		"l"	4	2456	5007	-2508	-5007	
		"lt"	4	2504	2505	2557	2556	

		"face"	
		"l"	4	2457	5008	-2509	-5008	
		"lt"	4	2505	2506	2558	2557	

		"face"	
		"l"	4	2458	5009	-2510	-5009	
		"lt"	4	2506	2507	2559	2558	

		"face"	
		"l"	4	2459	5010	-2511	-5010	
		"lt"	4	2507	2508	2560	2559	

		"face"	
		"l"	4	2460	5011	-2512	-5011	
		"lt"	4	2508	2509	2561	2560	

		"face"	
		"l"	4	2461	5012	-2513	-5012	
		"lt"	4	2509	2510	2562	2561	

		"face"	
		"l"	4	2462	5013	-2514	-5013	
		"lt"	4	2510	2511	2563	2562	

		"face"	
		"l"	4	2463	5014	-2515	-5014	
		"lt"	4	2511	2512	2564	2563	

		"face"	
		"l"	4	2464	5015	-2516	-5015	
		"lt"	4	2512	2513	2565	2564	

		"face"	
		"l"	4	2465	5016	-2517	-5016	
		"lt"	4	2513	2514	2566	2565	

		"face"	
		"l"	4	2466	5017	-2518	-5017	
		"lt"	4	2514	2515	2567	2566	

		"face"	
		"l"	4	2467	5018	-2519	-5018	
		"lt"	4	2515	2516	2568	2567	

		"face"	
		"l"	4	2468	5019	-2520	-5019	
		"lt"	4	2516	2517	2569	2568	

		"face"	
		"l"	4	2469	5020	-2521	-5020	
		"lt"	4	2517	2518	2570	2569	

		"face"	
		"l"	4	2470	5021	-2522	-5021	
		"lt"	4	2518	2519	2571	2570	

		"face"	
		"l"	4	2471	5022	-2523	-5022	
		"lt"	4	2519	2520	2572	2571	

		"face"	
		"l"	4	2472	5023	-2524	-5023	
		"lt"	4	2520	2521	2573	2572	

		"face"	
		"l"	4	2473	5024	-2525	-5024	
		"lt"	4	2521	2522	2574	2573	

		"face"	
		"l"	4	2474	5025	-2526	-5025	
		"lt"	4	2522	2523	2575	2574	

		"face"	
		"l"	4	2475	5026	-2527	-5026	
		"lt"	4	2523	2524	2576	2575	

		"face"	
		"l"	4	2476	5027	-2528	-5027	
		"lt"	4	2524	2525	2577	2576	

		"face"	
		"l"	4	2477	5028	-2529	-5028	
		"lt"	4	2525	2526	2578	2577	

		"face"	
		"l"	4	2478	5029	-2530	-5029	
		"lt"	4	2526	2527	2579	2578	

		"face"	
		"l"	4	2479	5030	-2531	-5030	
		"lt"	4	2527	2528	2580	2579	

		"face"	
		"l"	4	2480	5031	-2532	-5031	
		"lt"	4	2528	2529	2581	2580	

		"face"	
		"l"	4	2481	5032	-2533	-5032	
		"lt"	4	2529	2530	2582	2581	

		"face"	
		"l"	4	2482	5033	-2534	-5033	
		"lt"	4	2530	2531	2583	2582	

		"face"	
		"l"	4	2483	5034	-2535	-5034	
		"lt"	4	2531	2532	2584	2583	

		"face"	
		"l"	4	2484	5035	-2536	-5035	
		"lt"	4	2532	2533	2585	2584	

		"face"	
		"l"	4	2485	5036	-2537	-5036	
		"lt"	4	2533	2534	2586	2585	

		"face"	
		"l"	4	2486	5037	-2538	-5037	
		"lt"	4	2534	2535	2587	2586	

		"face"	
		"l"	4	2487	5038	-2539	-5038	
		"lt"	4	2535	2536	2588	2587	

		"face"	
		"l"	4	2488	5039	-2540	-5039	
		"lt"	4	2536	2537	2589	2588	

		"face"	
		"l"	4	2489	5040	-2541	-5040	
		"lt"	4	2537	2538	2590	2589	

		"face"	
		"l"	4	2490	5041	-2542	-5041	
		"lt"	4	2538	2539	2591	2590	

		"face"	
		"l"	4	2491	5042	-2543	-5042	
		"lt"	4	2539	2540	2592	2591	

		"face"	
		"l"	4	2492	5043	-2544	-5043	
		"lt"	4	2540	2541	2593	2592	

		"face"	
		"l"	4	2493	5044	-2545	-5044	
		"lt"	4	2541	2542	2594	2593	

		"face"	
		"l"	4	2494	5045	-2546	-5045	
		"lt"	4	2542	2543	2595	2594	

		"face"	
		"l"	4	2495	5046	-2547	-5046	
		"lt"	4	2543	2544	2596	2595	

		"face"	
		"l"	4	2496	5047	-2548	-5047	
		"lt"	4	2544	2545	2597	2596	

		"face"	
		"l"	4	2497	5048	-2549	-5048	
		"lt"	4	2545	2546	2598	2597	

		"face"	
		"l"	4	2498	4998	-2550	-5049	
		"lt"	4	2546	2547	2599	2598	

		"face"	
		"l"	3	-1	-5050	5050	
		"lt"	3	1	0	2600	

		"face"	
		"l"	3	-2	-5051	5051	
		"lt"	3	2	1	2601	

		"face"	
		"l"	3	-3	-5052	5052	
		"lt"	3	3	2	2602	

		"face"	
		"l"	3	-4	-5053	5053	
		"lt"	3	4	3	2603	

		"face"	
		"l"	3	-5	-5054	5054	
		"lt"	3	5	4	2604	

		"face"	
		"l"	3	-6	-5055	5055	
		"lt"	3	6	5	2605	

		"face"	
		"l"	3	-7	-5056	5056	
		"lt"	3	7	6	2606	

		"face"	
		"l"	3	-8	-5057	5057	
		"lt"	3	8	7	2607	

		"face"	
		"l"	3	-9	-5058	5058	
		"lt"	3	9	8	2608	

		"face"	
		"l"	3	-10	-5059	5059	
		"lt"	3	10	9	2609	

		"face"	
		"l"	3	-11	-5060	5060	
		"lt"	3	11	10	2610	

		"face"	
		"l"	3	-12	-5061	5061	
		"lt"	3	12	11	2611	

		"face"	
		"l"	3	-13	-5062	5062	
		"lt"	3	13	12	2612	

		"face"	
		"l"	3	-14	-5063	5063	
		"lt"	3	14	13	2613	

		"face"	
		"l"	3	-15	-5064	5064	
		"lt"	3	15	14	2614	

		"face"	
		"l"	3	-16	-5065	5065	
		"lt"	3	16	15	2615	

		"face"	
		"l"	3	-17	-5066	5066	
		"lt"	3	17	16	2616	

		"face"	
		"l"	3	-18	-5067	5067	
		"lt"	3	18	17	2617	

		"face"	
		"l"	3	-19	-5068	5068	
		"lt"	3	19	18	2618	

		"face"	
		"l"	3	-20	-5069	5069	
		"lt"	3	20	19	2619	

		"face"	
		"l"	3	-21	-5070	5070	
		"lt"	3	21	20	2620	

		"face"	
		"l"	3	-22	-5071	5071	
		"lt"	3	22	21	2621	

		"face"	
		"l"	3	-23	-5072	5072	
		"lt"	3	23	22	2622	

		"face"	
		"l"	3	-24	-5073	5073	
		"lt"	3	24	23	2623	

		"face"	
		"l"	3	-25	-5074	5074	
		"lt"	3	25	24	2624	

		"face"	
		"l"	3	-26	-5075	5075	
		"lt"	3	26	25	2625	

		"face"	
		"l"	3	-27	-5076	5076	
		"lt"	3	27	26	2626	

		"face"	
		"l"	3	-28	-5077	5077	
		"lt"	3	28	27	2627	

		"face"	
		"l"	3	-29	-5078	5078	
		"lt"	3	29	28	2628	

		"face"	
		"l"	3	-30	-5079	5079	
		"lt"	3	30	29	2629	

		"face"	
		"l"	3	-31	-5080	5080	
		"lt"	3	31	30	2630	

		"face"	
		"l"	3	-32	-5081	5081	
		"lt"	3	32	31	2631	

		"face"	
		"l"	3	-33	-5082	5082	
		"lt"	3	33	32	2632	

		"face"	
		"l"	3	-34	-5083	5083	
		"lt"	3	34	33	2633	

		"face"	
		"l"	3	-35	-5084	5084	
		"lt"	3	35	34	2634	

		"face"	
		"l"	3	-36	-5085	5085	
		"lt"	3	36	35	2635	

		"face"	
		"l"	3	-37	-5086	5086	
		"lt"	3	37	36	2636	

		"face"	
		"l"	3	-38	-5087	5087	
		"lt"	3	38	37	2637	

		"face"	
		"l"	3	-39	-5088	5088	
		"lt"	3	39	38	2638	

		"face"	
		"l"	3	-40	-5089	5089	
		"lt"	3	40	39	2639	

		"face"	
		"l"	3	-41	-5090	5090	
		"lt"	3	41	40	2640	

		"face"	
		"l"	3	-42	-5091	5091	
		"lt"	3	42	41	2641	

		"face"	
		"l"	3	-43	-5092	5092	
		"lt"	3	43	42	2642	

		"face"	
		"l"	3	-44	-5093	5093	
		"lt"	3	44	43	2643	

		"face"	
		"l"	3	-45	-5094	5094	
		"lt"	3	45	44	2644	

		"face"	
		"l"	3	-46	-5095	5095	
		"lt"	3	46	45	2645	

		"face"	
		"l"	3	-47	-5096	5096	
		"lt"	3	47	46	2646	

		"face"	
		"l"	3	-48	-5097	5097	
		"lt"	3	48	47	2647	

		"face"	
		"l"	3	-49	-5098	5098	
		"lt"	3	49	48	2648	

		"face"	
		"l"	3	-50	-5099	5099	
		"lt"	3	50	49	2649	

		"face"	
		"l"	3	-51	-5100	5049	
		"lt"	3	51	50	2650	

		"face"	
		"l"	3	2499	5101	-5101	
		"lt"	3	2548	2549	2651	

		"face"	
		"l"	3	2500	5102	-5102	
		"lt"	3	2549	2550	2652	

		"face"	
		"l"	3	2501	5103	-5103	
		"lt"	3	2550	2551	2653	

		"face"	
		"l"	3	2502	5104	-5104	
		"lt"	3	2551	2552	2654	

		"face"	
		"l"	3	2503	5105	-5105	
		"lt"	3	2552	2553	2655	

		"face"	
		"l"	3	2504	5106	-5106	
		"lt"	3	2553	2554	2656	

		"face"	
		"l"	3	2505	5107	-5107	
		"lt"	3	2554	2555	2657	

		"face"	
		"l"	3	2506	5108	-5108	
		"lt"	3	2555	2556	2658	

		"face"	
		"l"	3	2507	5109	-5109	
		"lt"	3	2556	2557	2659	

		"face"	
		"l"	3	2508	5110	-5110	
		"lt"	3	2557	2558	2660	

		"face"	
		"l"	3	2509	5111	-5111	
		"lt"	3	2558	2559	2661	

		"face"	
		"l"	3	2510	5112	-5112	
		"lt"	3	2559	2560	2662	

		"face"	
		"l"	3	2511	5113	-5113	
		"lt"	3	2560	2561	2663	

		"face"	
		"l"	3	2512	5114	-5114	
		"lt"	3	2561	2562	2664	

		"face"	
		"l"	3	2513	5115	-5115	
		"lt"	3	2562	2563	2665	

		"face"	
		"l"	3	2514	5116	-5116	
		"lt"	3	2563	2564	2666	

		"face"	
		"l"	3	2515	5117	-5117	
		"lt"	3	2564	2565	2667	

		"face"	
		"l"	3	2516	5118	-5118	
		"lt"	3	2565	2566	2668	

		"face"	
		"l"	3	2517	5119	-5119	
		"lt"	3	2566	2567	2669	

		"face"	
		"l"	3	2518	5120	-5120	
		"lt"	3	2567	2568	2670	

		"face"	
		"l"	3	2519	5121	-5121	
		"lt"	3	2568	2569	2671	

		"face"	
		"l"	3	2520	5122	-5122	
		"lt"	3	2569	2570	2672	

		"face"	
		"l"	3	2521	5123	-5123	
		"lt"	3	2570	2571	2673	

		"face"	
		"l"	3	2522	5124	-5124	
		"lt"	3	2571	2572	2674	

		"face"	
		"l"	3	2523	5125	-5125	
		"lt"	3	2572	2573	2675	

		"face"	
		"l"	3	2524	5126	-5126	
		"lt"	3	2573	2574	2676	

		"face"	
		"l"	3	2525	5127	-5127	
		"lt"	3	2574	2575	2677	

		"face"	
		"l"	3	2526	5128	-5128	
		"lt"	3	2575	2576	2678	

		"face"	
		"l"	3	2527	5129	-5129	
		"lt"	3	2576	2577	2679	

		"face"	
		"l"	3	2528	5130	-5130	
		"lt"	3	2577	2578	2680	

		"face"	
		"l"	3	2529	5131	-5131	
		"lt"	3	2578	2579	2681	

		"face"	
		"l"	3	2530	5132	-5132	
		"lt"	3	2579	2580	2682	

		"face"	
		"l"	3	2531	5133	-5133	
		"lt"	3	2580	2581	2683	

		"face"	
		"l"	3	2532	5134	-5134	
		"lt"	3	2581	2582	2684	

		"face"	
		"l"	3	2533	5135	-5135	
		"lt"	3	2582	2583	2685	

		"face"	
		"l"	3	2534	5136	-5136	
		"lt"	3	2583	2584	2686	

		"face"	
		"l"	3	2535	5137	-5137	
		"lt"	3	2584	2585	2687	

		"face"	
		"l"	3	2536	5138	-5138	
		"lt"	3	2585	2586	2688	

		"face"	
		"l"	3	2537	5139	-5139	
		"lt"	3	2586	2587	2689	

		"face"	
		"l"	3	2538	5140	-5140	
		"lt"	3	2587	2588	2690	

		"face"	
		"l"	3	2539	5141	-5141	
		"lt"	3	2588	2589	2691	

		"face"	
		"l"	3	2540	5142	-5142	
		"lt"	3	2589	2590	2692	

		"face"	
		"l"	3	2541	5143	-5143	
		"lt"	3	2590	2591	2693	

		"face"	
		"l"	3	2542	5144	-5144	
		"lt"	3	2591	2592	2694	

		"face"	
		"l"	3	2543	5145	-5145	
		"lt"	3	2592	2593	2695	

		"face"	
		"l"	3	2544	5146	-5146	
		"lt"	3	2593	2594	2696	

		"face"	
		"l"	3	2545	5147	-5147	
		"lt"	3	2594	2595	2697	

		"face"	
		"l"	3	2546	5148	-5148	
		"lt"	3	2595	2596	2698	

		"face"	
		"l"	3	2547	5149	-5149	
		"lt"	3	2596	2597	2699	

		"face"	
		"l"	3	2548	5150	-5150	
		"lt"	3	2597	2598	2700	

		"face"	
		"l"	3	2549	5100	-5151	
		"lt"	3	2598	2599	2701	;
	setAttr ".en" 1;
	setAttr ".svd" -type "string" (
		"{\"version\":\"1010000\",\"nodes\":[{\"name\":\"DGNode\",\"members\":[{\"name\":\"factor\",\"type\":\"Scalar\",\"persistence\":true,\"default\":\"0.800000011920929\"},{\"name\":\"mesh0\",\"type\":\"PolygonMesh\"},{\"name\":\"target\",\"type\":\"PolygonMesh\"}],\"dependencies\":{},\"bindings\":[{\"operator\":{\"name\":\"raycastOp\",\"entry\":\"raycastOp\",\"filename\":\"raycastOp.kl\",\"kl\":\"require Scalar;\\nrequire PolygonMesh;\\n\\noperator task<<<index>>>(io PolygonMesh mesh0, io PolygonMesh target, Scalar factor) {\\n  Vec3 pos = mesh0.getPointPosition(index);\\n  Ray ray(pos, pos.unit().negate());\\n  PolygonMeshLocation location = target.raycast(ray, true);\\n  if(!location.isValid())\\n    return;\\n  pos = pos.linearInterpolate(target.getPositionAtLocation(location), factor);\\n  mesh0.setPointPosition(index, pos);\\n}\\n\\noperator raycastOp(Scalar factor, io PolygonMesh mesh0, io PolygonMesh target) {\\n  \\n  target.buildSpatialQueryAcceleration(mesh0.pointCount());\\n  task<<<mesh0.pointCount()>>>(mesh0, target, factor);\\n  \\n}\\n\",\"portmap\":{}}}]}],\"ports\":[{\"name\":\"factor\",\"node\":\"DGNode\",\"graph\":\"mayaGraph\",\"type\":\"Scalar\",\"autoInitObjects\":true,\"member\":\"factor\",\"mode\":\"in\"},{\"name\":\"mesh0\",\"node\":\"DGNode\",\"graph\":\"mayaGraph\",\"type\":\"PolygonMesh\",\"autoInitObjects\":true,\"member\":\"mesh0\",\"mode\":\"io\",\"options\":{\"action\":\"addIOPort\",\"dataType\":\"PolygonMesh\",\"portName\":\"mesh0\",\"reference\":\"spliceMayaDeformer1\"}},{\"name\":\"target\",\"node\":\"DGNode\",\"graph\":\"mayaGraph\",\"type\":\"PolygonMesh\",\"autoInitObjects\":true,\"member\":\"target\",\"mode\":\"in\"}]}");
	setAttr ".mesh0" -type "SpliceMayaData" ;
	setAttr ".target" -type "mesh" 


		"v"	98
		-2.5	-2.5	2.5
		-1.25	-2.5	2.5
		0	-2.5	2.5
		1.25	-2.5	2.5
		2.5	-2.5	2.5
		-2.5	-1.25	2.5
		-1.25	-1.25	2.5
		0	-1.25	2.5
		1.25	-1.25	2.5
		2.5	-1.25	2.5
		-2.5	0	2.5
		-1.25	0	2.5
		0	0	2.5
		1.25	0	2.5
		2.5	0	2.5
		-2.5	1.25	2.5
		-1.25	1.25	2.5
		0	1.25	2.5
		1.25	1.25	2.5
		2.5	1.25	2.5
		-2.5	2.5	2.5
		-1.25	2.5	2.5
		0	2.5	2.5
		1.25	2.5	2.5
		2.5	2.5	2.5
		-2.5	2.5	1.25
		-1.25	2.5	1.25
		0	2.5	1.25
		1.25	2.5	1.25
		2.5	2.5	1.25
		-2.5	2.5	0
		-1.25	2.5	0
		0	2.5	0
		1.25	2.5	0
		2.5	2.5	0
		-2.5	2.5	-1.25
		-1.25	2.5	-1.25
		0	2.5	-1.25
		1.25	2.5	-1.25
		2.5	2.5	-1.25
		-2.5	2.5	-2.5
		-1.25	2.5	-2.5
		0	2.5	-2.5
		1.25	2.5	-2.5
		2.5	2.5	-2.5
		-2.5	1.25	-2.5
		-1.25	1.25	-2.5
		0	1.25	-2.5
		1.25	1.25	-2.5
		2.5	1.25	-2.5
		-2.5	0	-2.5
		-1.25	0	-2.5
		0	0	-2.5
		1.25	0	-2.5
		2.5	0	-2.5
		-2.5	-1.25	-2.5
		-1.25	-1.25	-2.5
		0	-1.25	-2.5
		1.25	-1.25	-2.5
		2.5	-1.25	-2.5
		-2.5	-2.5	-2.5
		-1.25	-2.5	-2.5
		0	-2.5	-2.5
		1.25	-2.5	-2.5
		2.5	-2.5	-2.5
		-2.5	-2.5	-1.25
		-1.25	-2.5	-1.25
		0	-2.5	-1.25
		1.25	-2.5	-1.25
		2.5	-2.5	-1.25
		-2.5	-2.5	0
		-1.25	-2.5	0
		0	-2.5	0
		1.25	-2.5	0
		2.5	-2.5	0
		-2.5	-2.5	1.25
		-1.25	-2.5	1.25
		0	-2.5	1.25
		1.25	-2.5	1.25
		2.5	-2.5	1.25
		2.5	-1.25	-1.25
		2.5	-1.25	0
		2.5	-1.25	1.25
		2.5	0	-1.25
		2.5	0	0
		2.5	0	1.25
		2.5	1.25	-1.25
		2.5	1.25	0
		2.5	1.25	1.25
		-2.5	-1.25	-1.25
		-2.5	-1.25	0
		-2.5	-1.25	1.25
		-2.5	0	-1.25
		-2.5	0	0
		-2.5	0	1.25
		-2.5	1.25	-1.25
		-2.5	1.25	0
		-2.5	1.25	1.25

		"vt"	125
		0.375	0
		0.4375	0
		0.5	0
		0.5625	0
		0.625	0
		0.375	0.0625
		0.4375	0.0625
		0.5	0.0625
		0.5625	0.0625
		0.625	0.0625
		0.375	0.125
		0.4375	0.125
		0.5	0.125
		0.5625	0.125
		0.625	0.125
		0.375	0.1875
		0.4375	0.1875
		0.5	0.1875
		0.5625	0.1875
		0.625	0.1875
		0.375	0.25
		0.4375	0.25
		0.5	0.25
		0.5625	0.25
		0.625	0.25
		0.375	0.3125
		0.4375	0.3125
		0.5	0.3125
		0.5625	0.3125
		0.625	0.3125
		0.375	0.375
		0.4375	0.375
		0.5	0.375
		0.5625	0.375
		0.625	0.375
		0.375	0.4375
		0.4375	0.4375
		0.5	0.4375
		0.5625	0.4375
		0.625	0.4375
		0.375	0.5
		0.4375	0.5
		0.5	0.5
		0.5625	0.5
		0.625	0.5
		0.375	0.5625
		0.4375	0.5625
		0.5	0.5625
		0.5625	0.5625
		0.625	0.5625
		0.375	0.625
		0.4375	0.625
		0.5	0.625
		0.5625	0.625
		0.625	0.625
		0.375	0.6875
		0.4375	0.6875
		0.5	0.6875
		0.5625	0.6875
		0.625	0.6875
		0.375	0.75
		0.4375	0.75
		0.5	0.75
		0.5625	0.75
		0.625	0.75
		0.375	0.8125
		0.4375	0.8125
		0.5	0.8125
		0.5625	0.8125
		0.625	0.8125
		0.375	0.875
		0.4375	0.875
		0.5	0.875
		0.5625	0.875
		0.625	0.875
		0.375	0.9375
		0.4375	0.9375
		0.5	0.9375
		0.5625	0.9375
		0.625	0.9375
		0.375	1
		0.4375	1
		0.5	1
		0.5625	1
		0.625	1
		0.875	0
		0.8125	0
		0.75	0
		0.6875	0
		0.875	0.0625
		0.8125	0.0625
		0.75	0.0625
		0.6875	0.0625
		0.875	0.125
		0.8125	0.125
		0.75	0.125
		0.6875	0.125
		0.875	0.1875
		0.8125	0.1875
		0.75	0.1875
		0.6875	0.1875
		0.875	0.25
		0.8125	0.25
		0.75	0.25
		0.6875	0.25
		0.125	0
		0.1875	0
		0.25	0
		0.3125	0
		0.125	0.0625
		0.1875	0.0625
		0.25	0.0625
		0.3125	0.0625
		0.125	0.125
		0.1875	0.125
		0.25	0.125
		0.3125	0.125
		0.125	0.1875
		0.1875	0.1875
		0.25	0.1875
		0.3125	0.1875
		0.125	0.25
		0.1875	0.25
		0.25	0.25
		0.3125	0.25

		"e"	192
		0	1	"hard"
		1	2	"hard"
		2	3	"hard"
		3	4	"hard"
		5	6	"smooth"
		6	7	"smooth"
		7	8	"smooth"
		8	9	"smooth"
		10	11	"smooth"
		11	12	"smooth"
		12	13	"smooth"
		13	14	"smooth"
		15	16	"smooth"
		16	17	"smooth"
		17	18	"smooth"
		18	19	"smooth"
		20	21	"hard"
		21	22	"hard"
		22	23	"hard"
		23	24	"hard"
		25	26	"smooth"
		26	27	"smooth"
		27	28	"smooth"
		28	29	"smooth"
		30	31	"smooth"
		31	32	"smooth"
		32	33	"smooth"
		33	34	"smooth"
		35	36	"smooth"
		36	37	"smooth"
		37	38	"smooth"
		38	39	"smooth"
		40	41	"hard"
		41	42	"hard"
		42	43	"hard"
		43	44	"hard"
		45	46	"smooth"
		46	47	"smooth"
		47	48	"smooth"
		48	49	"smooth"
		50	51	"smooth"
		51	52	"smooth"
		52	53	"smooth"
		53	54	"smooth"
		55	56	"smooth"
		56	57	"smooth"
		57	58	"smooth"
		58	59	"smooth"
		60	61	"hard"
		61	62	"hard"
		62	63	"hard"
		63	64	"hard"
		65	66	"smooth"
		66	67	"smooth"
		67	68	"smooth"
		68	69	"smooth"
		70	71	"smooth"
		71	72	"smooth"
		72	73	"smooth"
		73	74	"smooth"
		75	76	"smooth"
		76	77	"smooth"
		77	78	"smooth"
		78	79	"smooth"
		0	5	"hard"
		1	6	"smooth"
		2	7	"smooth"
		3	8	"smooth"
		4	9	"hard"
		5	10	"hard"
		6	11	"smooth"
		7	12	"smooth"
		8	13	"smooth"
		9	14	"hard"
		10	15	"hard"
		11	16	"smooth"
		12	17	"smooth"
		13	18	"smooth"
		14	19	"hard"
		15	20	"hard"
		16	21	"smooth"
		17	22	"smooth"
		18	23	"smooth"
		19	24	"hard"
		20	25	"hard"
		21	26	"smooth"
		22	27	"smooth"
		23	28	"smooth"
		24	29	"hard"
		25	30	"hard"
		26	31	"smooth"
		27	32	"smooth"
		28	33	"smooth"
		29	34	"hard"
		30	35	"hard"
		31	36	"smooth"
		32	37	"smooth"
		33	38	"smooth"
		34	39	"hard"
		35	40	"hard"
		36	41	"smooth"
		37	42	"smooth"
		38	43	"smooth"
		39	44	"hard"
		40	45	"hard"
		41	46	"smooth"
		42	47	"smooth"
		43	48	"smooth"
		44	49	"hard"
		45	50	"hard"
		46	51	"smooth"
		47	52	"smooth"
		48	53	"smooth"
		49	54	"hard"
		50	55	"hard"
		51	56	"smooth"
		52	57	"smooth"
		53	58	"smooth"
		54	59	"hard"
		55	60	"hard"
		56	61	"smooth"
		57	62	"smooth"
		58	63	"smooth"
		59	64	"hard"
		60	65	"hard"
		61	66	"smooth"
		62	67	"smooth"
		63	68	"smooth"
		64	69	"hard"
		65	70	"hard"
		66	71	"smooth"
		67	72	"smooth"
		68	73	"smooth"
		69	74	"hard"
		70	75	"hard"
		71	76	"smooth"
		72	77	"smooth"
		73	78	"smooth"
		74	79	"hard"
		75	0	"hard"
		76	1	"smooth"
		77	2	"smooth"
		78	3	"smooth"
		79	4	"hard"
		59	80	"smooth"
		80	81	"smooth"
		81	82	"smooth"
		82	9	"smooth"
		54	83	"smooth"
		83	84	"smooth"
		84	85	"smooth"
		85	14	"smooth"
		49	86	"smooth"
		86	87	"smooth"
		87	88	"smooth"
		88	19	"smooth"
		69	80	"smooth"
		74	81	"smooth"
		79	82	"smooth"
		80	83	"smooth"
		81	84	"smooth"
		82	85	"smooth"
		83	86	"smooth"
		84	87	"smooth"
		85	88	"smooth"
		86	39	"smooth"
		87	34	"smooth"
		88	29	"smooth"
		55	89	"smooth"
		89	90	"smooth"
		90	91	"smooth"
		91	5	"smooth"
		50	92	"smooth"
		92	93	"smooth"
		93	94	"smooth"
		94	10	"smooth"
		45	95	"smooth"
		95	96	"smooth"
		96	97	"smooth"
		97	15	"smooth"
		65	89	"smooth"
		70	90	"smooth"
		75	91	"smooth"
		89	92	"smooth"
		90	93	"smooth"
		91	94	"smooth"
		92	95	"smooth"
		93	96	"smooth"
		94	97	"smooth"
		95	35	"smooth"
		96	30	"smooth"
		97	25	"smooth"

		"face"	
		"l"	4	0	65	-5	-65	
		"lt"	4	0	1	6	5	

		"face"	
		"l"	4	1	66	-6	-66	
		"lt"	4	1	2	7	6	

		"face"	
		"l"	4	2	67	-7	-67	
		"lt"	4	2	3	8	7	

		"face"	
		"l"	4	3	68	-8	-68	
		"lt"	4	3	4	9	8	

		"face"	
		"l"	4	4	70	-9	-70	
		"lt"	4	5	6	11	10	

		"face"	
		"l"	4	5	71	-10	-71	
		"lt"	4	6	7	12	11	

		"face"	
		"l"	4	6	72	-11	-72	
		"lt"	4	7	8	13	12	

		"face"	
		"l"	4	7	73	-12	-73	
		"lt"	4	8	9	14	13	

		"face"	
		"l"	4	8	75	-13	-75	
		"lt"	4	10	11	16	15	

		"face"	
		"l"	4	9	76	-14	-76	
		"lt"	4	11	12	17	16	

		"face"	
		"l"	4	10	77	-15	-77	
		"lt"	4	12	13	18	17	

		"face"	
		"l"	4	11	78	-16	-78	
		"lt"	4	13	14	19	18	

		"face"	
		"l"	4	12	80	-17	-80	
		"lt"	4	15	16	21	20	

		"face"	
		"l"	4	13	81	-18	-81	
		"lt"	4	16	17	22	21	

		"face"	
		"l"	4	14	82	-19	-82	
		"lt"	4	17	18	23	22	

		"face"	
		"l"	4	15	83	-20	-83	
		"lt"	4	18	19	24	23	

		"face"	
		"l"	4	16	85	-21	-85	
		"lt"	4	20	21	26	25	

		"face"	
		"l"	4	17	86	-22	-86	
		"lt"	4	21	22	27	26	

		"face"	
		"l"	4	18	87	-23	-87	
		"lt"	4	22	23	28	27	

		"face"	
		"l"	4	19	88	-24	-88	
		"lt"	4	23	24	29	28	

		"face"	
		"l"	4	20	90	-25	-90	
		"lt"	4	25	26	31	30	

		"face"	
		"l"	4	21	91	-26	-91	
		"lt"	4	26	27	32	31	

		"face"	
		"l"	4	22	92	-27	-92	
		"lt"	4	27	28	33	32	

		"face"	
		"l"	4	23	93	-28	-93	
		"lt"	4	28	29	34	33	

		"face"	
		"l"	4	24	95	-29	-95	
		"lt"	4	30	31	36	35	

		"face"	
		"l"	4	25	96	-30	-96	
		"lt"	4	31	32	37	36	

		"face"	
		"l"	4	26	97	-31	-97	
		"lt"	4	32	33	38	37	

		"face"	
		"l"	4	27	98	-32	-98	
		"lt"	4	33	34	39	38	

		"face"	
		"l"	4	28	100	-33	-100	
		"lt"	4	35	36	41	40	

		"face"	
		"l"	4	29	101	-34	-101	
		"lt"	4	36	37	42	41	

		"face"	
		"l"	4	30	102	-35	-102	
		"lt"	4	37	38	43	42	

		"face"	
		"l"	4	31	103	-36	-103	
		"lt"	4	38	39	44	43	

		"face"	
		"l"	4	32	105	-37	-105	
		"lt"	4	40	41	46	45	

		"face"	
		"l"	4	33	106	-38	-106	
		"lt"	4	41	42	47	46	

		"face"	
		"l"	4	34	107	-39	-107	
		"lt"	4	42	43	48	47	

		"face"	
		"l"	4	35	108	-40	-108	
		"lt"	4	43	44	49	48	

		"face"	
		"l"	4	36	110	-41	-110	
		"lt"	4	45	46	51	50	

		"face"	
		"l"	4	37	111	-42	-111	
		"lt"	4	46	47	52	51	

		"face"	
		"l"	4	38	112	-43	-112	
		"lt"	4	47	48	53	52	

		"face"	
		"l"	4	39	113	-44	-113	
		"lt"	4	48	49	54	53	

		"face"	
		"l"	4	40	115	-45	-115	
		"lt"	4	50	51	56	55	

		"face"	
		"l"	4	41	116	-46	-116	
		"lt"	4	51	52	57	56	

		"face"	
		"l"	4	42	117	-47	-117	
		"lt"	4	52	53	58	57	

		"face"	
		"l"	4	43	118	-48	-118	
		"lt"	4	53	54	59	58	

		"face"	
		"l"	4	44	120	-49	-120	
		"lt"	4	55	56	61	60	

		"face"	
		"l"	4	45	121	-50	-121	
		"lt"	4	56	57	62	61	

		"face"	
		"l"	4	46	122	-51	-122	
		"lt"	4	57	58	63	62	

		"face"	
		"l"	4	47	123	-52	-123	
		"lt"	4	58	59	64	63	

		"face"	
		"l"	4	48	125	-53	-125	
		"lt"	4	60	61	66	65	

		"face"	
		"l"	4	49	126	-54	-126	
		"lt"	4	61	62	67	66	

		"face"	
		"l"	4	50	127	-55	-127	
		"lt"	4	62	63	68	67	

		"face"	
		"l"	4	51	128	-56	-128	
		"lt"	4	63	64	69	68	

		"face"	
		"l"	4	52	130	-57	-130	
		"lt"	4	65	66	71	70	

		"face"	
		"l"	4	53	131	-58	-131	
		"lt"	4	66	67	72	71	

		"face"	
		"l"	4	54	132	-59	-132	
		"lt"	4	67	68	73	72	

		"face"	
		"l"	4	55	133	-60	-133	
		"lt"	4	68	69	74	73	

		"face"	
		"l"	4	56	135	-61	-135	
		"lt"	4	70	71	76	75	

		"face"	
		"l"	4	57	136	-62	-136	
		"lt"	4	71	72	77	76	

		"face"	
		"l"	4	58	137	-63	-137	
		"lt"	4	72	73	78	77	

		"face"	
		"l"	4	59	138	-64	-138	
		"lt"	4	73	74	79	78	

		"face"	
		"l"	4	60	140	-1	-140	
		"lt"	4	75	76	81	80	

		"face"	
		"l"	4	61	141	-2	-141	
		"lt"	4	76	77	82	81	

		"face"	
		"l"	4	62	142	-3	-142	
		"lt"	4	77	78	83	82	

		"face"	
		"l"	4	63	143	-4	-143	
		"lt"	4	78	79	84	83	

		"face"	
		"l"	4	-129	-124	144	-157	
		"lt"	4	86	85	89	90	

		"face"	
		"l"	4	-134	156	145	-158	
		"lt"	4	87	86	90	91	

		"face"	
		"l"	4	-139	157	146	-159	
		"lt"	4	88	87	91	92	

		"face"	
		"l"	4	-144	158	147	-69	
		"lt"	4	4	88	92	9	

		"face"	
		"l"	4	-145	-119	148	-160	
		"lt"	4	90	89	93	94	

		"face"	
		"l"	4	-146	159	149	-161	
		"lt"	4	91	90	94	95	

		"face"	
		"l"	4	-147	160	150	-162	
		"lt"	4	92	91	95	96	

		"face"	
		"l"	4	-148	161	151	-74	
		"lt"	4	9	92	96	14	

		"face"	
		"l"	4	-149	-114	152	-163	
		"lt"	4	94	93	97	98	

		"face"	
		"l"	4	-150	162	153	-164	
		"lt"	4	95	94	98	99	

		"face"	
		"l"	4	-151	163	154	-165	
		"lt"	4	96	95	99	100	

		"face"	
		"l"	4	-152	164	155	-79	
		"lt"	4	14	96	100	19	

		"face"	
		"l"	4	-153	-109	-104	-166	
		"lt"	4	98	97	101	102	

		"face"	
		"l"	4	-154	165	-99	-167	
		"lt"	4	99	98	102	103	

		"face"	
		"l"	4	-155	166	-94	-168	
		"lt"	4	100	99	103	104	

		"face"	
		"l"	4	-156	167	-89	-84	
		"lt"	4	19	100	104	24	

		"face"	
		"l"	4	124	180	-169	119	
		"lt"	4	105	106	110	109	

		"face"	
		"l"	4	129	181	-170	-181	
		"lt"	4	106	107	111	110	

		"face"	
		"l"	4	134	182	-171	-182	
		"lt"	4	107	108	112	111	

		"face"	
		"l"	4	139	64	-172	-183	
		"lt"	4	108	0	5	112	

		"face"	
		"l"	4	168	183	-173	114	
		"lt"	4	109	110	114	113	

		"face"	
		"l"	4	169	184	-174	-184	
		"lt"	4	110	111	115	114	

		"face"	
		"l"	4	170	185	-175	-185	
		"lt"	4	111	112	116	115	

		"face"	
		"l"	4	171	69	-176	-186	
		"lt"	4	112	5	10	116	

		"face"	
		"l"	4	172	186	-177	109	
		"lt"	4	113	114	118	117	

		"face"	
		"l"	4	173	187	-178	-187	
		"lt"	4	114	115	119	118	

		"face"	
		"l"	4	174	188	-179	-188	
		"lt"	4	115	116	120	119	

		"face"	
		"l"	4	175	74	-180	-189	
		"lt"	4	116	10	15	120	

		"face"	
		"l"	4	176	189	99	104	
		"lt"	4	117	118	122	121	

		"face"	
		"l"	4	177	190	94	-190	
		"lt"	4	118	119	123	122	

		"face"	
		"l"	4	178	191	89	-191	
		"lt"	4	119	120	124	123	

		"face"	
		"l"	4	179	79	84	-192	
		"lt"	4	120	15	20	124	;
	setAttr -k on ".factor" 0.8;
createNode tweak -n "tweak1";
createNode objectSet -n "spliceMayaDeformer1Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "spliceMayaDeformer1GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "spliceMayaDeformer1GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet1";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId2";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts2";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode hyperGraphInfo -n "nodeEditorPanel2Info";
createNode hyperView -n "hyperView1";
	setAttr ".vl" -type "double2" -67.009132420090879 -719.26369863013713 ;
	setAttr ".vh" -type "double2" 1054.4194390084806 121.80772994129154 ;
	setAttr ".dag" no;
createNode hyperLayout -n "hyperLayout1";
	setAttr ".ihi" 0;
	setAttr -s 12 ".hyp";
	setAttr ".hyp[0].x" 481.42855834960937;
	setAttr ".hyp[0].y" -144.28572082519531;
	setAttr ".hyp[0].nvs" 1920;
	setAttr ".hyp[1].x" 481.42855834960937;
	setAttr ".hyp[1].y" -287.14285278320312;
	setAttr ".hyp[1].nvs" 1920;
	setAttr ".hyp[2].x" 481.42855834960937;
	setAttr ".hyp[2].y" -430;
	setAttr ".hyp[2].nvs" 1920;
	setAttr ".hyp[3].x" 978.5714111328125;
	setAttr ".hyp[3].y" -201.42857360839844;
	setAttr ".hyp[3].nvs" 1920;
	setAttr ".hyp[4].x" 226.06654357910156;
	setAttr ".hyp[4].y" 43.638290405273437;
	setAttr ".hyp[4].nvs" 1921;
	setAttr ".hyp[5].x" 481.42855834960937;
	setAttr ".hyp[5].y" -572.85711669921875;
	setAttr ".hyp[5].nvs" 1920;
	setAttr ".hyp[6].x" 217.1053466796875;
	setAttr ".hyp[6].y" -229.79615783691406;
	setAttr ".hyp[6].nvs" 1920;
	setAttr ".hyp[7].x" 738.5714111328125;
	setAttr ".hyp[7].y" -358.57144165039062;
	setAttr ".hyp[7].nvs" 1920;
	setAttr ".hyp[8].x" 1578.5714111328125;
	setAttr ".hyp[8].y" -590;
	setAttr ".hyp[8].nvs" 1920;
	setAttr ".hyp[9].x" 1.4285714626312256;
	setAttr ".hyp[9].y" -72.857139587402344;
	setAttr ".hyp[9].nvs" 1920;
	setAttr ".hyp[10].x" 1818.5714111328125;
	setAttr ".hyp[10].y" -590;
	setAttr ".hyp[10].nvs" 1920;
	setAttr ".hyp[11].x" 1307.142822265625;
	setAttr ".hyp[11].y" -590;
	setAttr ".hyp[11].nvs" 1920;
	setAttr ".anf" yes;
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :renderPartition;
	setAttr -s 2 ".st";
select -ne :initialShadingGroup;
	setAttr -s 2 ".dsm";
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultShaderList1;
	setAttr -s 2 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderingList1;
select -ne :renderGlobalsList1;
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 18 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surfaces" "Particles" "Fluids" "Image Planes" "UI:" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 18 0 1 1 1 1 1
		 1 0 0 0 0 0 0 0 0 0 0 0 ;
select -ne :defaultHardwareRenderGlobals;
	setAttr ".fn" -type "string" "im";
	setAttr ".res" -type "string" "ntsc_4d 646 485 1.333";
connectAttr "spliceMayaDeformer1GroupId.id" "pSphereShape1.iog.og[0].gid";
connectAttr "spliceMayaDeformer1Set.mwc" "pSphereShape1.iog.og[0].gco";
connectAttr "groupId2.id" "pSphereShape1.iog.og[1].gid";
connectAttr "tweakSet1.mwc" "pSphereShape1.iog.og[1].gco";
connectAttr "spliceMayaDeformer1.og[0]" "pSphereShape1.i";
connectAttr "tweak1.vl[0].vt[0]" "pSphereShape1.twl";
connectAttr "polySphere1.out" "pSphereShape1Orig.i";
connectAttr "polyCube1.out" "pCubeShape1.i";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "spliceMayaDeformer1GroupParts.og" "spliceMayaDeformer1.ip[0].ig";
connectAttr "spliceMayaDeformer1GroupId.id" "spliceMayaDeformer1.ip[0].gi";
connectAttr "pCubeShape1.w" "spliceMayaDeformer1.target";
connectAttr "groupParts2.og" "tweak1.ip[0].ig";
connectAttr "groupId2.id" "tweak1.ip[0].gi";
connectAttr "spliceMayaDeformer1GroupId.msg" "spliceMayaDeformer1Set.gn" -na;
connectAttr "pSphereShape1.iog.og[0]" "spliceMayaDeformer1Set.dsm" -na;
connectAttr "spliceMayaDeformer1.msg" "spliceMayaDeformer1Set.ub[0]";
connectAttr "tweak1.og[0]" "spliceMayaDeformer1GroupParts.ig";
connectAttr "spliceMayaDeformer1GroupId.id" "spliceMayaDeformer1GroupParts.gi";
connectAttr "groupId2.msg" "tweakSet1.gn" -na;
connectAttr "pSphereShape1.iog.og[1]" "tweakSet1.dsm" -na;
connectAttr "tweak1.msg" "tweakSet1.ub[0]";
connectAttr "pSphereShape1Orig.w" "groupParts2.ig";
connectAttr "groupId2.id" "groupParts2.gi";
connectAttr "hyperView1.msg" "nodeEditorPanel2Info.b[0]";
connectAttr "hyperLayout1.msg" "hyperView1.hl";
connectAttr "spliceMayaDeformer1.msg" "hyperLayout1.hyp[0].dn";
connectAttr "tweak1.msg" "hyperLayout1.hyp[1].dn";
connectAttr "tweakSet1.msg" "hyperLayout1.hyp[2].dn";
connectAttr ":initialShadingGroup.msg" "hyperLayout1.hyp[3].dn";
connectAttr "pCubeShape1.msg" "hyperLayout1.hyp[4].dn";
connectAttr "spliceMayaDeformer1Set.msg" "hyperLayout1.hyp[5].dn";
connectAttr "pCube1.msg" "hyperLayout1.hyp[6].dn";
connectAttr "pSphereShape1.msg" "hyperLayout1.hyp[7].dn";
connectAttr "polySphere1.msg" "hyperLayout1.hyp[8].dn";
connectAttr "polyCube1.msg" "hyperLayout1.hyp[9].dn";
connectAttr "pSphereShape1Orig.msg" "hyperLayout1.hyp[10].dn";
connectAttr "pSphere1.msg" "hyperLayout1.hyp[11].dn";
connectAttr "pSphereShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
// End of 12_raycasting.ma
