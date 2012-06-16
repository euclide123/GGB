

Func openConfigGGB()
	#Region ### GGBot Configs ###
	Global $configGUI = GUICreate("GGBot Config", 512, 549, 726, 230)

	Global $Group1 			= GUICtrlCreateGroup("Account", 8, 0, 209, 81)
	Global $Group2 			= GUICtrlCreateGroup("General Config", 232, 0, 249, 137)
	Global $GameConfig 		= GUICtrlCreateGroup("Game Configs", 232, 144, 249, 145)
	Global $Group3 			= GUICtrlCreateGroup("Inventaire", 8, 88, 209, 201)
	Global $shortcut 		= GUICtrlCreateGroup("Raccourcis", 8, 298, 473, 74)
	Global $Group4 			= GUICtrlCreateGroup("Pickit", 10, 382, 225, 155)

	Global $L_Login 		= GUICtrlCreateLabel("Login", 16, 20, 60, 17)
	Global $Label1 			= GUICtrlCreateLabel("Password", 17, 51, 60, 17)
	Global $L_WinName 		= GUICtrlCreateLabel("Win. Name", 240, 20, 60, 17)
	Global $L_GamePath 		= GUICtrlCreateLabel("GamePath :", 240, 51, 60, 17)
	Global $L_PrefPath 		= GUICtrlCreateLabel("PrefPath", 240, 83, 60, 17)
	Global $Label15 		= GUICtrlCreateLabel("Charger automatiquement le fichier de pref ?", 240, 114, 212, 17)
	Global $L_PosChar 		= GUICtrlCreateLabel("Position du Personnage", 240, 163, 115, 17)
	Global $L_Difficult 	= GUICtrlCreateLabel("Difficulté :", 240, 227, 115, 17)
	Global $L_NbRun 		= GUICtrlCreateLabel("Nb. run avant de repair", 240, 259, 115, 17)
	Global $L_Classes 		= GUICtrlCreateLabel("Classes :", 240, 195, 115, 17)
	Global $Label2 			= GUICtrlCreateLabel("Cochez les positions de l'inventaire où se trouvent des items qui ne doivent pas être vendu", 18, 109, 189, 50, $SS_CENTER)
	Global $Label3 			= GUICtrlCreateLabel("Raccourci Skill 2", 21, 344, 84, 17)
	Global $Label4 			= GUICtrlCreateLabel("Raccourci Skill 3", 179, 320, 84, 17)
	Global $Label5 			= GUICtrlCreateLabel("Raccourci Skill 4", 179, 344, 84, 17)
	Global $Label6 			= GUICtrlCreateLabel("Boire une potion", 333, 320, 81, 17)
	Global $Label8 			= GUICtrlCreateLabel("Passer discussion", 333, 344, 88, 17)
	Global $Label7 			= GUICtrlCreateLabel("Raccourci Skill 1", 21, 320, 84, 17)
	Global $Label9 			= GUICtrlCreateLabel("Ramasser", 94, 400, 51, 17)
	Global $Label10 		= GUICtrlCreateLabel("Stoquer", 165, 400, 41, 17)
	Global $Label11 		= GUICtrlCreateLabel("Magic", 20, 420, 33, 17)
	Global $Label12 		= GUICtrlCreateLabel("Rare", 20, 450, 27, 17)
	Global $Label13 		= GUICtrlCreateLabel("Legendaire", 20, 480, 57, 17)
	Global $Label14 		= GUICtrlCreateLabel("Sets", 20, 510, 25, 17)

	Global $gFindD3Exe 		= GUICtrlCreateButton("...", 452, 48, 21, 20)
	Global $gFindD3Pref 	= GUICtrlCreateButton("...", 452, 80, 21, 20)
	Global $gSave 			= GUICtrlCreateButton("Sauvegarder", 248, 390, 235, 63)
	Global $gCancel 		= GUICtrlCreateButton("Annuler", 248, 470, 235, 63)

	Global $gLogin 			= GUICtrlCreateInput($accountName, 80, 16, 129, 21)
	Global $gPass 			= GUICtrlCreateInput($accountPass, 80, 48, 129, 21)
	Global $gWinName 		= GUICtrlCreateInput($winName, 304, 16, 169, 21)
	Global $gGamePath 		= GUICtrlCreateInput($gamePath, 304, 48, 145, 21)
	Global $gPrefPath 		= GUICtrlCreateInput($prefPath, 304, 80, 145, 21)
	Global $gRepNbRun 		= GUICtrlCreateInput($runModRepSell, 360, 256, 25, 21)
	Global $gShortCut1 		= GUICtrlCreateInput($skill1, 109, 316, 50, 21)
	Global $gShortCut2 		= GUICtrlCreateInput($skill2, 109, 340, 50, 21)
	Global $gShortCut3 		= GUICtrlCreateInput($skill3, 267, 316, 50, 21)
	Global $gShortCut4 		= GUICtrlCreateInput($skill4, 267, 340, 50, 21)
	Global $gShortCutPotion = GUICtrlCreateInput($potionDrink, 421, 316, 50, 21)
	Global $gShortCutSkip 	= GUICtrlCreateInput($skipDialog, 421, 340, 50, 21)

	Global $gDifficulty 	= GUICtrlCreateCombo("", 360, 224, 113, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
	Global $gClass 			= GUICtrlCreateCombo("", 360, 192, 113, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
	Global $gCharPosition 	= GUICtrlCreateCombo("", 360, 160, 33, 25)

	Global $gAutoSwitchPref = GUICtrlCreateCheckbox("gAutoSwitchPref", 457, 112, 15, 17)
	Global $gInv59 			= GUICtrlCreateCheckbox("", 177, 252, 15, 17)
	Global $gInv58 			= GUICtrlCreateCheckbox("", 161, 252, 15, 17)
	Global $gInv57 			= GUICtrlCreateCheckbox("", 145, 252, 15, 17)
	Global $gInv56 			= GUICtrlCreateCheckbox("", 129, 252, 15, 17)
	Global $gInv55 			= GUICtrlCreateCheckbox("", 113, 252, 15, 17)
	Global $gInv54 			= GUICtrlCreateCheckbox("", 97, 252, 15, 17)
	Global $gInv53 			= GUICtrlCreateCheckbox("", 81, 252, 15, 17)
	Global $gInv52 			= GUICtrlCreateCheckbox("", 65, 252, 15, 17)
	Global $gInv51 			= GUICtrlCreateCheckbox("", 49, 252, 15, 17)
	Global $gInv50 			= GUICtrlCreateCheckbox("", 33, 252, 15, 17)
	Global $gInv49 			= GUICtrlCreateCheckbox("", 177, 236, 15, 17)
	Global $gInv48 			= GUICtrlCreateCheckbox("", 161, 236, 15, 17)
	Global $gInv47 			= GUICtrlCreateCheckbox("", 145, 236, 15, 17)
	Global $gInv46 			= GUICtrlCreateCheckbox("", 129, 236, 15, 17)
	Global $gInv45 			= GUICtrlCreateCheckbox("", 113, 236, 15, 17)
	Global $gInv44 			= GUICtrlCreateCheckbox("", 97, 236, 15, 17)
	Global $gInv43 			= GUICtrlCreateCheckbox("", 81, 236, 15, 17)
	Global $gInv42 			= GUICtrlCreateCheckbox("", 65, 236, 15, 17)
	Global $gInv41 			= GUICtrlCreateCheckbox("", 49, 236, 15, 17)
	Global $gInv40 			= GUICtrlCreateCheckbox("", 33, 236, 15, 17)
	Global $gInv39 			= GUICtrlCreateCheckbox("", 177, 220, 15, 17)
	Global $gInv38 			= GUICtrlCreateCheckbox("", 161, 220, 15, 17)
	Global $gInv37 			= GUICtrlCreateCheckbox("", 145, 220, 15, 17)
	Global $gInv36 			= GUICtrlCreateCheckbox("", 129, 220, 15, 17)
	Global $gInv35 			= GUICtrlCreateCheckbox("", 113, 220, 15, 17)
	Global $gInv34 			= GUICtrlCreateCheckbox("", 97, 220, 15, 17)
	Global $gInv33 			= GUICtrlCreateCheckbox("", 81, 220, 15, 17)
	Global $gInv32 			= GUICtrlCreateCheckbox("", 65, 220, 15, 17)
	Global $gInv31 			= GUICtrlCreateCheckbox("", 49, 220, 15, 17)
	Global $gInv30 			= GUICtrlCreateCheckbox("", 33, 220, 15, 17)
	Global $gInv29 			= GUICtrlCreateCheckbox("", 177, 204, 15, 17)
	Global $gInv28 			= GUICtrlCreateCheckbox("", 161, 204, 15, 17)
	Global $gInv27 			= GUICtrlCreateCheckbox("", 145, 204, 15, 17)
	Global $gInv26 			= GUICtrlCreateCheckbox("", 129, 204, 15, 17)
	Global $gInv25 			= GUICtrlCreateCheckbox("", 113, 204, 15, 17)
	Global $gInv24 			= GUICtrlCreateCheckbox("", 97, 204, 15, 17)
	Global $gInv23 			= GUICtrlCreateCheckbox("", 81, 204, 15, 17)
	Global $gInv22 			= GUICtrlCreateCheckbox("", 65, 204, 15, 17)
	Global $gInv21 			= GUICtrlCreateCheckbox("", 49, 204, 15, 17)
	Global $gInv20 			= GUICtrlCreateCheckbox("", 33, 204, 15, 17)
	Global $gInv19 			= GUICtrlCreateCheckbox("", 177, 188, 15, 17)
	Global $gInv18 			= GUICtrlCreateCheckbox("", 161, 188, 15, 17)
	Global $gInv17 			= GUICtrlCreateCheckbox("", 145, 188, 15, 17)
	Global $gInv16 			= GUICtrlCreateCheckbox("", 129, 188, 15, 17)
	Global $gInv15 			= GUICtrlCreateCheckbox("", 113, 188, 15, 17)
	Global $gInv14 			= GUICtrlCreateCheckbox("", 97, 188, 15, 17)
	Global $gInv13 			= GUICtrlCreateCheckbox("", 81, 188, 15, 17)
	Global $gInv12 			= GUICtrlCreateCheckbox("", 65, 188, 15, 17)
	Global $gInv11 			= GUICtrlCreateCheckbox("", 49, 188, 15, 17)
	Global $gInv10 			= GUICtrlCreateCheckbox("", 33, 188, 15, 17)
	Global $gInv09 			= GUICtrlCreateCheckbox("", 177, 172, 15, 17)
	Global $gInv08 			= GUICtrlCreateCheckbox("", 161, 172, 15, 17)
	Global $gInv07 			= GUICtrlCreateCheckbox("", 145, 172, 15, 17)
	Global $gInv06 			= GUICtrlCreateCheckbox("", 129, 172, 15, 17)
	Global $gInv05 			= GUICtrlCreateCheckbox("", 113, 172, 15, 17)
	Global $gInv04 			= GUICtrlCreateCheckbox("", 97, 172, 15, 17)
	Global $gInv03 			= GUICtrlCreateCheckbox("", 81, 172, 15, 17)
	Global $gInv02 			= GUICtrlCreateCheckbox("", 65, 172, 15, 17)
	Global $gInv01 			= GUICtrlCreateCheckbox("", 49, 172, 15, 17)
	Global $gInv00 			= GUICtrlCreateCheckbox("", 33, 172, 15, 17)

	Global $gMagicPick 		= GUICtrlCreateCheckbox("", 110, 420, 17, 17)
	Global $gMagicKeep 		= GUICtrlCreateCheckbox("", 180, 420, 17, 17)
	Global $gRarePick 		= GUICtrlCreateCheckbox("", 110, 450, 17, 17)
	Global $gRareKeep 		= GUICtrlCreateCheckbox("", 180, 450, 17, 17)
	Global $gLegendPick		= GUICtrlCreateCheckbox("", 110, 480, 17, 17)
	Global $gSetPick 		= GUICtrlCreateCheckbox("", 110, 510, 17, 17)
	Global $gLegendKeep		= GUICtrlCreateCheckbox("", 180, 480, 17, 17)
	Global $gSetKeep 		= GUICtrlCreateCheckbox("", 180, 510, 17, 17)

	GUICtrlSetState($gInv59, getCheckValueFromConfig($line5[10]))
	GUICtrlSetState($gInv58, getCheckValueFromConfig($line5[9]))
	GUICtrlSetState($gInv57, getCheckValueFromConfig($line5[8]))
	GUICtrlSetState($gInv56, getCheckValueFromConfig($line5[7]))
	GUICtrlSetState($gInv55, getCheckValueFromConfig($line5[6]))
	GUICtrlSetState($gInv54, getCheckValueFromConfig($line5[5]))
	GUICtrlSetState($gInv53, getCheckValueFromConfig($line5[4]))
	GUICtrlSetState($gInv52, getCheckValueFromConfig($line5[3]))
	GUICtrlSetState($gInv51, getCheckValueFromConfig($line5[2]))
	GUICtrlSetState($gInv50, getCheckValueFromConfig($line5[1]))
	GUICtrlSetState($gInv49, getCheckValueFromConfig($line4[10]))
	GUICtrlSetState($gInv48, getCheckValueFromConfig($line4[9]))
	GUICtrlSetState($gInv47, getCheckValueFromConfig($line4[8]))
	GUICtrlSetState($gInv46, getCheckValueFromConfig($line4[7]))
	GUICtrlSetState($gInv45, getCheckValueFromConfig($line4[6]))
	GUICtrlSetState($gInv44, getCheckValueFromConfig($line4[5]))
	GUICtrlSetState($gInv43, getCheckValueFromConfig($line4[4]))
	GUICtrlSetState($gInv42, getCheckValueFromConfig($line4[3]))
	GUICtrlSetState($gInv41, getCheckValueFromConfig($line4[2]))
	GUICtrlSetState($gInv40, getCheckValueFromConfig($line4[1]))
	GUICtrlSetState($gInv39, getCheckValueFromConfig($line3[10]))
	GUICtrlSetState($gInv38, getCheckValueFromConfig($line3[9]))
	GUICtrlSetState($gInv37, getCheckValueFromConfig($line3[8]))
	GUICtrlSetState($gInv36, getCheckValueFromConfig($line3[7]))
	GUICtrlSetState($gInv35, getCheckValueFromConfig($line3[6]))
	GUICtrlSetState($gInv34, getCheckValueFromConfig($line3[5]))
	GUICtrlSetState($gInv33, getCheckValueFromConfig($line3[4]))
	GUICtrlSetState($gInv32, getCheckValueFromConfig($line3[3]))
	GUICtrlSetState($gInv31, getCheckValueFromConfig($line3[2]))
	GUICtrlSetState($gInv30, getCheckValueFromConfig($line3[1]))
	GUICtrlSetState($gInv29, getCheckValueFromConfig($line2[10]))
	GUICtrlSetState($gInv28, getCheckValueFromConfig($line2[9]))
	GUICtrlSetState($gInv27, getCheckValueFromConfig($line2[8]))
	GUICtrlSetState($gInv26, getCheckValueFromConfig($line2[7]))
	GUICtrlSetState($gInv25, getCheckValueFromConfig($line2[6]))
	GUICtrlSetState($gInv24, getCheckValueFromConfig($line2[5]))
	GUICtrlSetState($gInv23, getCheckValueFromConfig($line2[4]))
	GUICtrlSetState($gInv22, getCheckValueFromConfig($line2[3]))
	GUICtrlSetState($gInv21, getCheckValueFromConfig($line2[2]))
	GUICtrlSetState($gInv20, getCheckValueFromConfig($line2[1]))
	GUICtrlSetState($gInv19, getCheckValueFromConfig($line1[10]))
	GUICtrlSetState($gInv18, getCheckValueFromConfig($line1[9]))
	GUICtrlSetState($gInv17, getCheckValueFromConfig($line1[8]))
	GUICtrlSetState($gInv16, getCheckValueFromConfig($line1[7]))
	GUICtrlSetState($gInv15, getCheckValueFromConfig($line1[6]))
	GUICtrlSetState($gInv14, getCheckValueFromConfig($line1[5]))
	GUICtrlSetState($gInv13, getCheckValueFromConfig($line1[4]))
	GUICtrlSetState($gInv12, getCheckValueFromConfig($line1[3]))
	GUICtrlSetState($gInv11, getCheckValueFromConfig($line1[2]))
	GUICtrlSetState($gInv10, getCheckValueFromConfig($line1[1]))
	GUICtrlSetState($gInv09, getCheckValueFromConfig($line0[10]))
	GUICtrlSetState($gInv08, getCheckValueFromConfig($line0[9]))
	GUICtrlSetState($gInv07, getCheckValueFromConfig($line0[8]))
	GUICtrlSetState($gInv06, getCheckValueFromConfig($line0[7]))
	GUICtrlSetState($gInv05, getCheckValueFromConfig($line0[6]))
	GUICtrlSetState($gInv04, getCheckValueFromConfig($line0[5]))
	GUICtrlSetState($gInv03, getCheckValueFromConfig($line0[4]))
	GUICtrlSetState($gInv02, getCheckValueFromConfig($line0[3]))
	GUICtrlSetState($gInv01, getCheckValueFromConfig($line0[2]))
	GUICtrlSetState($gInv00, getCheckValueFromConfig($line0[1]))

	GUICtrlSetState($gAutoSwitchPref, getCheckValueFromConfig($prefAutoChange))
	GUICtrlSetData($gDifficulty, "Normal|Nightmare|Hell|Inferno",getDifficultyFromConfig($difficulty))
	GUICtrlSetData($gClass, "Sorcier|Monk|Demon Hunter|Barbarian|Witch Doctor",getClassFromConfig($charType))
	GUICtrlSetData($gCharPosition, "1|2|3|4|5|6|7",$character)

	GuiCtrlSetState($gMagicPick 	,getCheckValueFromConfig($pickMagic))	
	GuiCtrlSetState($gMagicKeep 	,getCheckValueFromConfig($pickMagic,2))	
	GuiCtrlSetState($gRarePick 		,getCheckValueFromConfig($pickRare))	
	GuiCtrlSetState($gRareKeep 		,getCheckValueFromConfig($pickRare,2))	
	GuiCtrlSetState($gLegendPick	,getCheckValueFromConfig($pickLegend))	
	GuiCtrlSetState($gSetPick 		,getCheckValueFromConfig($pickLegend,2))	
	GuiCtrlSetState($gLegendKeep	,getCheckValueFromConfig($pickSet))	
	GuiCtrlSetState($gSetKeep 		,getCheckValueFromConfig($pickSet,2))

	GUICtrlSetFont($gSave, 11, 400, 0, "MS Sans Serif")
	GUICtrlSetFont($gCancel, 11, 400, 0, "MS Sans Serif")

	GUICtrlSetOnEvent($gSave		, "saveConfig")
	GUICtrlSetOnEvent($gCancel		, "cancelConfig")
	GUICtrlSetOnEvent($gFindD3Exe 	, "findD3exe")
	GUICtrlSetOnEvent($gFindD3Pref 	, "findD3Pref")

	GUISetOnEvent($GUI_EVENT_CLOSE,"cancelConfig")

	GUISetState(@SW_SHOW)
	#EndRegion ### END GGBot Configs ###
EndFunc

Func findD3exe()
	$D3Path=FileOpenDialog("Diablo III.exe","C:\","Diablo EXE File (Diablo III.exe)", "1")
	If Not @error Then
		GUICtrlSetData($gGamePath,$D3Path)
	EndIf
	FileChangeDir($botDir)
EndFunc

Func findD3Pref()
	$D3PrefPath=FileOpenDialog("D3Prefs.txt","C:\","Diablo D3Pref (D3Prefs.txt)",1)
	If Not @error Then
		GUICtrlSetData($gPrefPath,$D3PrefPath)
	EndIf
	FileChangeDir($botDir)
EndFunc

Func getClassFromConfig($val)
	Switch $val
		case 1
			Return "Sorcier"
		Case 2
			Return "Monk"
		case 3 
			Return "Demon Hunter"
		case 4
			Return "Barbarian"
		case 5
			Return "Witch Doctor"
	EndSwitch
EndFunc

Func getDifficultyFromConfig($val)
	Switch $val
		case 1
			Return "Normal"
		Case 2
			Return "Nightmare"
		case 3 
			Return "Hell"
		case 4
			Return "Inferno"
	EndSwitch
EndFunc

Func saveConfig()
	Local $switchPrefVal
	Local $diffVal
	Local $charTypeVal
	If (GUICtrlRead($gAutoSwitchPref)==$GUI_CHECKED) Then
		$switchPrefVal=1
	Else
		$switchPrefVal=0
	EndIf
	Switch GUICtrlRead($gClass)
		Case "Sorcier"
			$charTypeVal=1
		Case "Monk"
			$charTypeVal=2
		case "Demon Hunter"
			$charTypeVal=3
		case "Barbarian"
			$charTypeVal=4
		case "Witch Doctor"
			$charTypeVal=5
	EndSwitch
	Switch GUICtrlRead($gDifficulty)
		Case "Normal"
			$diffVal=1
		Case "Nightmare"
			$diffVal=2
		case "Hell"
			$diffVal=3
		case "Inferno"
			$diffVal=4
	EndSwitch
	$takeMagic	= 0
	$takeRare	= 0
	$takeLegend	= 0
	$takeSet	= 0
	
	If GUICtrlRead($gMagicPick) == $GUI_CHECKED Then
		$takeMagic += 1
	EndIf
	If GUICtrlRead($gMagicKeep) == $GUI_CHECKED Then
		$takeMagic = 2
	EndIf
	If GUICtrlRead($gRarePick) == $GUI_CHECKED Then
		$takeRare += 1
	EndIf
	If GUICtrlRead($gRareKeep) == $GUI_CHECKED Then
		$takeRare = 2
	EndIf
	If GUICtrlRead($gLegendPick) == $GUI_CHECKED Then
		$takeLegend += 1
	EndIf
	If GUICtrlRead($gLegendKeep) == $GUI_CHECKED Then
		$takeLegend = 2
	EndIf
	If GUICtrlRead($gSetPick) == $GUI_CHECKED Then
		$takeSet += 1
	EndIf
	If GUICtrlRead($gSetKeep) == $GUI_CHECKED Then
		$takeSet = 2
	EndIf
	
	$invLine0 = getInvValueFromCheckbox($gInv00) &','&getInvValueFromCheckbox($gInv01) &','&getInvValueFromCheckbox($gInv02) &','&getInvValueFromCheckbox($gInv03) &','&getInvValueFromCheckbox($gInv04) &','&getInvValueFromCheckbox($gInv05) &','&getInvValueFromCheckbox($gInv06) &','&getInvValueFromCheckbox($gInv07) &','&getInvValueFromCheckbox($gInv08) &','&getInvValueFromCheckbox($gInv09)
	$invLine1 = getInvValueFromCheckbox($gInv10) &','&getInvValueFromCheckbox($gInv11) &','&getInvValueFromCheckbox($gInv12) &','&getInvValueFromCheckbox($gInv13) &','&getInvValueFromCheckbox($gInv14) &','&getInvValueFromCheckbox($gInv15) &','&getInvValueFromCheckbox($gInv16) &','&getInvValueFromCheckbox($gInv17) &','&getInvValueFromCheckbox($gInv18) &','&getInvValueFromCheckbox($gInv19)
	$invLine2 = getInvValueFromCheckbox($gInv20) &','&getInvValueFromCheckbox($gInv21) &','&getInvValueFromCheckbox($gInv22) &','&getInvValueFromCheckbox($gInv23) &','&getInvValueFromCheckbox($gInv24) &','&getInvValueFromCheckbox($gInv25) &','&getInvValueFromCheckbox($gInv26) &','&getInvValueFromCheckbox($gInv27) &','&getInvValueFromCheckbox($gInv28) &','&getInvValueFromCheckbox($gInv29)
	$invLine3 = getInvValueFromCheckbox($gInv30) &','&getInvValueFromCheckbox($gInv31) &','&getInvValueFromCheckbox($gInv32) &','&getInvValueFromCheckbox($gInv33) &','&getInvValueFromCheckbox($gInv34) &','&getInvValueFromCheckbox($gInv35) &','&getInvValueFromCheckbox($gInv36) &','&getInvValueFromCheckbox($gInv37) &','&getInvValueFromCheckbox($gInv38) &','&getInvValueFromCheckbox($gInv39)
	$invLine4 = getInvValueFromCheckbox($gInv40) &','&getInvValueFromCheckbox($gInv41) &','&getInvValueFromCheckbox($gInv42) &','&getInvValueFromCheckbox($gInv43) &','&getInvValueFromCheckbox($gInv44) &','&getInvValueFromCheckbox($gInv45) &','&getInvValueFromCheckbox($gInv46) &','&getInvValueFromCheckbox($gInv47) &','&getInvValueFromCheckbox($gInv48) &','&getInvValueFromCheckbox($gInv49)
	$invLine5 = getInvValueFromCheckbox($gInv50) &','&getInvValueFromCheckbox($gInv51) &','&getInvValueFromCheckbox($gInv52) &','&getInvValueFromCheckbox($gInv53) &','&getInvValueFromCheckbox($gInv54) &','&getInvValueFromCheckbox($gInv55) &','&getInvValueFromCheckbox($gInv56) &','&getInvValueFromCheckbox($gInv57) &','&getInvValueFromCheckbox($gInv58) &','&getInvValueFromCheckbox($gInv59)
	
	IniWrite($iniConfigFile,"generalConfig","winName",GUICtrlRead($gWinName))
	IniWrite($iniConfigFile,"generalConfig","gameExecFullPath",GUICtrlRead($gGamePath))
	IniWrite($iniConfigFile,"generalConfig","prefPath",GUICtrlRead($gPrefPath))
	IniWrite($iniConfigFile,"generalConfig","autoSwitchPref",$switchPrefVal)
	IniWrite($iniConfigFile,"accountConfig","email",GUICtrlRead($gLogin))
	IniWrite($iniConfigFile,"accountConfig","pass",GUICtrlRead($gPass))
	IniWrite($iniConfigFile,"gameConfig","character",GUICtrlRead($gCharPosition))
	IniWrite($iniConfigFile,"gameConfig","difficulty",$diffVal)
	IniWrite($iniConfigFile,"gameConfig","repairSellRun",GUICtrlRead($gRepNbRun))
	IniWrite($iniConfigFile,"characterConfig","characterType",$charTypeVal)
	IniWrite($iniConfigFile,"characterConfig","invLine0",$invLine0)
	IniWrite($iniConfigFile,"characterConfig","invLine1",$invLine1)
	IniWrite($iniConfigFile,"characterConfig","invLine2",$invLine2)
	IniWrite($iniConfigFile,"characterConfig","invLine3",$invLine3)
	IniWrite($iniConfigFile,"characterConfig","invLine4",$invLine4)
	IniWrite($iniConfigFile,"characterConfig","invLine5",$invLine5)
	
	IniWrite($iniConfigFile,"pickitOptions","takeMagic",$takeMagic)
	IniWrite($iniConfigFile,"pickitOptions","takeRare",$takeRare)
	IniWrite($iniConfigFile,"pickitOptions","takeLegend",$takeLegend)
	IniWrite($iniConfigFile,"pickitOptions","takeSet",$takeSet)
	
	IniWrite($iniConfigFile,"shortcut","skill1", GUICtrlRead($gShortCut1))
	IniWrite($iniConfigFile,"shortcut","skill2", GUICtrlRead($gShortCut2))
	IniWrite($iniConfigFile,"shortcut","skill3", GUICtrlRead($gShortCut3))
	IniWrite($iniConfigFile,"shortcut","skill4", GUICtrlRead($gShortCut4))
	IniWrite($iniConfigFile,"shortcut","potionDrink", GUICtrlRead($gShortCutPotion))
	IniWrite($iniConfigFile,"shortcut","skipDialog", GUICtrlRead($gShortcutSkip))
	
	

	cancelConfig()
EndFunc

Func getInvValueFromCheckbox($checkbox)
	If GUICtrlRead($checkbox) == $GUI_CHECKED Then
		return 1
	Else
		return 0
	EndIf
EndFunc

Func getCheckValueFromConfig($val, $defValue=1)
	If $val >= $defValue Then
		return $GUI_CHECKED
	Else
		return $GUI_UNCHECKED
	EndIf
EndFunc


Func cancelConfig()
   GUIDelete($configGUI)
EndFunc