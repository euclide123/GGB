#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author: Anakha
 Modif : Eucli

 Description
	Start script du bot où on crée le dialog pour 
	- nombre de runs, 
	- start/stop
	- key bind (HotKeySet)
	- include des différents fichiers
    On crée les fonction de démarrage et fin du bot également

#ce ----------------------------------------------------------------------------
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_Res_requestedExecutionLevel=asInvoker
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

;; configs 
AutoItSetOption("MouseCoordMode",2)
AutoItSetOption("PixelCoordMode",2)    
AutoItSetOption("GUIOnEventMode",1)


;; include des lib AutoIt
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <array.au3>
#include <Date.au3>


;; include des fichier du bot
#include "au3udf/ImageSearch.au3"
#include "libs/botLogMsg.au3"
#include "libs/variables.au3"
#include "botConfig.au3"
#include "libs/configsParsing.au3"
#include "libs/botStats.au3"
#include "libs/configsParsing.au3"
#include "libs/variables.au3"

#include "libs/gameFunctions/gameChecks.au3"
#include "libs/gameFunctions/outGameFunction.au3"
#include "libs/gameFunctions/inGameFunction.au3"
#include "libs/commonFunctions.au3"

;; include des classes de personnages
#include "libs/gameFunctions/classes/wd/whichdoctor.au3"
#include "libs/gameFunctions/classes/barb/barb.au3"
#include "libs/gameFunctions/classes/dh/deamonhunter.au3"
#include "libs/gameFunctions/classes/monk/monk.au3"
#include "libs/gameFunctions/classes/wiz/wizzard.au3"
;; include des quest
#include "libs/gameFunctions/quest/questSelection.au3"

;; include des boss/area
#include "libs/gameFunctions/quest/boss_Sarkoth.au3"
#include "libs/gameFunctions/quest/boss_WarriorRest.au3"
#include "libs/gameFunctions/quest/boss_Iskatu.au3"

;; Raccourcis clavier
HotKeySet("{PAUSE}","togglePause")
HotKeySet("{DEL}","stopBot")

#region ### Control GUI
$handlerGUI = GUICreate($baseTitle & " - Stopped", 408, 380, 50, 50)
Local $Group1 = GUICtrlCreateGroup("LaunchPad", 8, 8, 105, 113)
$gStart = GUICtrlCreateButton("Start", 16, 24, 89, 25)
$gStop = GUICtrlCreateButton("Stop / Exit", 16, 56, 89, 25)
$gEdit = GUICtrlCreateButton("Edit Config", 16, 88, 89, 25)
Local $Group2 = GUICtrlCreateGroup("Stats", 120, 8, 281, 113)
Local $Label1 = GUICtrlCreateLabel("Heure de début", 128, 24, 78, 17)
Local $Label2 = GUICtrlCreateLabel("Temps écoulé", 128, 48, 71, 17)
Local $Label3 = GUICtrlCreateLabel("Nombre de runs", 128, 72, 79, 17)
Local $Label4 = GUICtrlCreateLabel("Temps moyen par run", 128, 96, 106, 17)
$gHStart = GUICtrlCreateInput("", 248, 22, 145, 21)
GUICtrlSetState(-1, $GUI_DISABLE)
$gHEcoule = GUICtrlCreateInput("", 248, 45, 145, 21)
GUICtrlSetState(-1, $GUI_DISABLE)
$gNbRun = GUICtrlCreateInput("", 248, 68, 145, 21)
GUICtrlSetState(-1, $GUI_DISABLE)
$gAvgRunTime = GUICtrlCreateInput("", 248, 91, 145, 21)
GUICtrlSetState(-1, $GUI_DISABLE)
$gLogs = GUICtrlCreateEdit("", 8, 128, 393, 225)
Local $Credits = GUICtrlCreateLabel("Diablo III @ GMSTemple.com", 8, 360, 255, 17)
#EndRegion

#region ### GUI Event ControlClick
GUICtrlSetOnEvent($gStart,"startBot")
GUICtrlSetOnEvent($gStop,"stopBot")
GUICtrlSetOnEvent($gEdit,"editConfig")
GUISetOnEvent($GUI_EVENT_CLOSE,"stopBot")
GUISetState(@SW_SHOW)
#EndRegion

While 1
	If $restartDiablo Then
		startBot()
	EndIf
	sleep(1000)
WEnd


Func editConfig()
	If $botStatus == 0 Then
		RunWait("configHelper.exe")
		loadConfigs()
	EndIf
EndFunc

Func togglePause()
	If $botStatus <> 0 Then
		$Paused = NOT $Paused
		While $Paused 
			$botStatus = 2
			WinSetTitle($handlerGUI,"",$baseTitle&" - Pause")
			sleep(100)
		WEnd
		WinSetTitle($handlerGUI,"",$baseTitle&" - Running")
		$botStatus = 1
	EndIf
EndFunc

Func stopBot()
	$Paused = 0
	WinSetTitle($handlerGUI,"",$baseTitle&" - Stopped")
	writeLog($msgStopBot)
	writeLog($msgPrefRestore)
	diabloPrefRestore()
	saveLogs()
	Exit
EndFunc


Func startBot()
	;; si le bot n'est pas encore start
	If $botStatus == 0 Or $restartDiablo Then
		If Not $restartDiablo Then
			;; init des stats du bot
			startBotTime()
		EndIf
		$restartDiablo = 0
		;; on met le bon status au bot pour empêcher un double lancement
		$botStatus = 1
		
		WinSetTitle($handlerGUI,"",$baseTitle&" - Started")		
		
		;; le bot lance le jeu et se log
		If $autoLog Then
			;; on switch la config 
			If $prefAutoChange Then
				writeLog($msgPrefChange)
				diabloPrefChange()
			EndIf
			
			;; on check les config avant de lancer le bot (pour éviter les erreurs)
			Local $configOk = loadConfigs()
			If $configOk == 1 Then
				$botStatus = 0
				return
			EndIf
			
			
			;; et on démarre ! :D
			writeLog($msgStartBot)
			
			;; on minimize le launcher du bot, (pour éviter de géner)
			GUISetState(@SW_MINIMIZE,$handlerGUI)
			
			;; on lance le jeu !
			writeLog($msgStartClient)
			Run($gamePath &" -launch")
			Local $error = waitForGameStart()
			
			If $error Then
				writeLog($msgErrorClientNotStarted)
				killGame()
				$restartDiablo=1 ;; restart
				return 1
			EndIf
			
			;; le bot tourne, on se log !
			WinSetTitle($handlerGUI,"",$baseTitle&" - Running")
			$error = login()
			If $error Then
				writeLog($msgErrorCannotConnect)
				killGame()
				$restartDiablo=1 ;; restart
				return 1
			EndIf
			
			;; actions à faire une seule fois avant de commencer le run
			preRunActions()
		EndIf

		;; on débute le run !
		doRun()
	EndIf
EndFunc


Func preRunActions()
	waitForLobby()
	leaveChannel()
	selectChar()
EndFunc


Func doRun()
	while 1
		Local $error = waitForLobby()
		If $error Then
			Local $action = CheckStateAction()
			If $action == 1 Then
				ExitLoop
			ElseIf $action == 2 then
				ContinueLoop
			EndIf
		EndIf
		
		selectQuest()
		
		Local $error = waitForLobby()
		If $error Then
			Local $action = CheckStateAction()
			If $action == 1 Then
				ExitLoop
			ElseIf $action == 2 then
				ContinueLoop
			EndIf
		EndIf
		
		Local $error = startGame()	;; on démarre la game
		If $error Then
			Local $action = CheckStateAction()
			If $action == 1 Then
				ExitLoop
			ElseIf $action == 2 then
				ContinueLoop
			EndIf
		EndIf
		
		stopGame() ;; on leave la game une fois quelle est fini :)
	WEnd
EndFunc

Func CheckStateAction()
	Local $state = checkGameState()
	If $state == 1 Then
		$restartDiablo=1 ;; restart
		return 1
	ElseIf $state == 2 Then
		Local $error = login()
		If $error Then
			writeLog($msgErrorCannotConnect)
			killGame()
			$restartDiablo=1 ;; restart
			return 1
		EndIf
		preRunActions()
		return 2
	ElseIf $state == 3 Then
		return 2
	Else
		return 0
	EndIf
EndFunc

;; regarde l'état de diablo
;; 1 - jeu killed / planté et éteint (process inclus)
;; 2 - au login (déco ?)
;; 3 - dans le lobby
;; 4 - ingame
Func checkGameState()
	If Not checkGameStatus() Then
		writeLog($msgErrorGameCrash)
		killGame()
		return 1
	EndIf
	If Not checkInGame() Then ;; pas in game
		If Not checkLobbyStart() Then ;; pas dans le lobby (ou on peut choisir la quest / démarrer etc
			If Not checkLoginBtn() Then ;; pas de bouton login : on ne sait pas où on est : on kill le jeu et on relance
				writeLog($msgErrorCantFindBotPosition)
				killGame()
				return 1
			Else
				writeLog($msgBotInLogin)
				return 2
			EndIf
		Else
			writeLog($msgBotInLobby)
			Return 3
		EndIf
	Else
		writeLog($msgBotInGame)
		Return 4
	EndIf
EndFunc
	
Func killGame()
	Local $pid = ProcessExists("Diablo III.exe")
	If $pid Then
		ProcessClose($pid)
	EndIf	
EndFunc

