#cs ----------------------------------------------------------------------------

	AutoIt Version: 3.3.8.1
	Author:         Anakha
	
	Liste des variables utilisées par le script
	
#ce ----------------------------------------------------------------------------


Func loadConfigs()

	;; windows informations
	Global $winName			= IniRead($iniConfigFile,"generalConfig","winName","Diablo III")
	Global $gamePath		= IniRead($iniConfigFile,"generalConfig","gameExecFullPath",0)
	Global $prefPath		= IniRead($iniConfigFile,"generalConfig","prefPath",0)
	Global $prefAutoChange	= IniRead($iniConfigFile,"generalConfig","autoSwitchPref",1)
	Global $autoLog			= 1
	Global $checkForPosition= 1
	
	;; account info
	Global $accountName	= IniRead($iniConfigFile,"accountConfig","email",0)
	Global $accountPass	= IniRead($iniConfigFile,"accountConfig","pass",0)
	
	;; game info
	Global $difficulty		= IniRead($iniConfigFile,"gameConfig","difficulty",1)
	Global $character		= IniRead($iniConfigFile,"gameConfig","character",1)
	Global $runModRepSell	= IniRead($iniConfigFile,"gameConfig","repairSellRun",10)
	
	;; pickit options
	Global $pickMagic	= IniRead($iniConfigFile,"pickitOptions","takeMagic",1)
	Global $pickRare	= IniRead($iniConfigFile,"pickitOptions","takeRare",1)
	Global $pickLegend	= IniRead($iniConfigFile,"pickitOptions","takeLegend",2)
	Global $pickSet		= IniRead($iniConfigFile,"pickitOptions","takeSet",2)
	
	;; character options
	Global $charType 	= IniRead($iniConfigFile,"characterConfig","characterType",0)
	
	;; shortcut config
	Global $skill1		= IniRead($iniConfigFile,"shortcut","skill1",1)
	Global $skill2		= IniRead($iniConfigFile,"shortcut","skill1",2)
	Global $skill3		= IniRead($iniConfigFile,"shortcut","skill1",3)
	Global $skill4		= IniRead($iniConfigFile,"shortcut","skill1",4)
	Global $potionDrink	= IniRead($iniConfigFile,"shortcut","potionDrink","Q")
	Global $skipDialog	= IniRead($iniConfigFile,"shortcut","skipDialog","SPACE")
	
	;; imagesearch options
	Global $imgSearchTolerance 	= IniRead($iniConfigFile,"imagesearch","tolerance",0)
	
	;; inventory settings
	;; 2 = potion slot
	;; 1 = do not touch
	;; 0 = sell
	Global $line0 = StringSplit(IniRead($iniConfigFile,"characterConfig","invLine0",0),',')
	Global $line1 = StringSplit(IniRead($iniConfigFile,"characterConfig","invLine1",0),',')
	Global $line2 = StringSplit(IniRead($iniConfigFile,"characterConfig","invLine2",0),',')
	Global $line3 = StringSplit(IniRead($iniConfigFile,"characterConfig","invLine3",0),',')
	Global $line4 = StringSplit(IniRead($iniConfigFile,"characterConfig","invLine4",0),',')
	Global $line5 = StringSplit(IniRead($iniConfigFile,"characterConfig","invLine5",0),',')
	
	;; Timeouts
	Global $launcherStart		= IniRead($iniConfigFile,"timeOut","launcherStart",1200)
	Global $gameStart			= IniRead($iniConfigFile,"timeOut","gameStart",120)
	Global $lobbyTimeout		= IniRead($iniConfigFile,"timeOut","lobbyTimeout",120)
	Global $gameMaxLength		= IniRead($iniConfigFile,"timeOut","gameMaxLength",180)
	Global $findNpcTimeout		= IniRead($iniConfigFile,"timeOut","findNpcTimeOut",100)
	Global $cinmaticTimeout		= IniRead($iniConfigFile,"timeOut","cinematicTimeOut",600)
	Global $waitInGameTimeout	= IniRead($iniConfigFile,"timeOut","waitInGame",300)
	Global $pickitTimeout		= IniRead($iniConfigFile,"timeOut","pickitTimeout",180)
	
	
	
	Local $error=0
	
	;; vérification des configs
	If Not FileExists($gamePath) Then
		MsgBox(4096,$msgErrorWrongConfigTitle,$msgErrorWrongGamePath)
		$error=1
	EndIf
	If Not FileExists($prefPath) Then
		MsgBox(4096,$msgErrorWrongConfigTitle,$msgErrorWrongPrefPath)
		$error=1
	EndIf
	If $accountName == "email" Or $accountPass == "pass" Then
		MsgBox(4096,$msgErrorWrongConfigTitle,$msgErrorWrongIdent)
		$error=1
	EndIf
	If $difficulty == 0 Then
		MsgBox(4096,$msgErrorWrongConfigTitle,$msgErrorWrongDifficulty)
		$error=1
	EndIf
	If $character == 0 Then
		MsgBox(4096,$msgErrorWrongConfigTitle,$msgErrorWrongChar)
		$error=1
	EndIf
	If $line0 == 0 Or $line0[0] <> 10 Then
		MsgBox(4096,$msgErrorWrongConfigTitle,$msgErrorWrongInvLine0)
		$error=1
	EndIf
	If $line1 == 0 Or $line1[0] <> 10 Then
		MsgBox(4096,$msgErrorWrongConfigTitle,$msgErrorWrongInvLine1)
		$error=1
	EndIf
	If $line2 == 0 Or $line2[0] <> 10 Then
		MsgBox(4096,$msgErrorWrongConfigTitle,$msgErrorWrongInvLine2)
		$error=1
	EndIf
	If $line3 == 0 Or $line3[0] <> 10 Then
		MsgBox(4096,$msgErrorWrongConfigTitle,$msgErrorWrongInvLine3)
		$error=1
	EndIf
	If $line4 == 0 Or $line4[0] <> 10 Then
		MsgBox(4096,$msgErrorWrongConfigTitle,$msgErrorWrongInvLine4)
		$error=1
	EndIf
	If $line5 == 0 Or $line5[0] <> 10 Then
		MsgBox(4096,$msgErrorWrongConfigTitle,$msgErrorWrongInvLine5)
		$error=1
	EndIf
	
	;; inventory settings
	Global $inv[6]
	$inv[0] = $line0
	$inv[1] = $line1
	$inv[2] = $line2
	$inv[3] = $line3
	$inv[4] = $line4
	$inv[5] = $line5
	
	return $error
EndFunc

;; on lance la fonction dès le chargement du fichier
loadConfigs()