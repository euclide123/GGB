#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author: Anakha

 Description
	Liste des fonction pour la gestion du jeu
	On retrouve le lancement du jeu, connexion, choix de quest
	mais pas les mouvement interne a une game
	
	

#ce ----------------------------------------------------------------------------


Func waitForGameStart()
	Local $pid = ProcessWait("Diablo III.exe",30)
	If $pid <> 0 Then
		;; on attend que la windows diabloIII apparaisse

		WinWait("[CLASS:D3 Main Window Class]")

		Local $maxLoop = 0 ;; 2min
		
		While Not checkLoginBtn() And $maxLoop <= $gameStart
			WinActivate($winName)
			sleep(1000)
			$maxLoop += 1
		WEnd 
		If $maxLoop >= $gameStart Then
			return 1
		Else
			return 0
		EndIf
	Else
		return 1
	EndIf
EndFunc


Func login()
	writeLog($msgIdentToBNet)
	
	;; on click sur le champs du compte pour le supprimer
	MouseClick("left",441,326,1,5)
	sleep(100)
	send("^{a}")
	sleep(200)
	send("{BACKSPACE}")
	sleep(500)
	send($accountName)
	sleep(500)
	send("{TAB}")
	sleep(200)
	
	Local $btnMaxAttempted=0
	While checkLoginBtn() And checkGameStatus()
		
		;; si on ne trouve plus el bouton connexion (et qu'on est pas entré dans le connect)
		;; on quitte la fonction et on renvoie 1 (error)
		writeLog($msgConnectionTry)
		if $btnMaxAttempted >= 100 Then
			return 1
		EndIf
		
		If Not checkLoginBtn() Then
			sleep(100)
			$btnMaxAttempted += 1
			ContinueLoop
		EndIf
		
		
		send($accountPass)
		sleep(100)
		send("{ENTER}")		;; valid le formulaire
		sleep(500)
		
		;; on check si les popup avec les check sont présents

		Local $startTry = _NowCalc()
		While Not checkPopupConnected() And _DateDiff("s", $startTry, _NowCalc()) < 120
			sleep(100)
		WEnd

		While Not checkPopupVerif() And _DateDiff("s", $startTry, _NowCalc()) < 120
			sleep(100)
		WEnd

		;; si on entre là, on est forcément connecté
		While Not checkPopupRecup()  And _DateDiff("s", $startTry, _NowCalc()) < 120
			sleep(100)
		WEnd

		sleep(1000)
		If _DateDiff("s", $startTry, _NowCalc()) < 120 Then
			WriteLog($msgConnected)
			Return 0
		EndIf
		
		sleep(1000)
		send("{ENTER}")		;; on ferme le popup d'erreur (s'il y en a)
	WEnd
	return 1
EndFunc

Func waitForLobby()
	Local $maxLoop = 0 ;; 2min
	
	While Not checkLobbyStart() And $maxLoop <= $lobbyTimeout And checkGameStatus()
		sleep(1000)
		$maxLoop += 1
	WEnd 
	
	If $maxLoop >= $lobbyTimeout Or Not checkGameStatus() Then
		return 1
	Else
		return 0
	EndIf
EndFunc

Func selectQuest()
	writeLog($msgQuestSelect)
	
	;; on ouvre la selection de quest
	MouseClick("left",128,268)
	sleep(500)
	;; on choisit la difficulté si c'est pas encore fait
	If $selectDiff == 0 Then
		MouseClick("left",301,477)
		sleep(200)
		Local $diffClickTop=$lvlTop+$lvlHeight*(1/2+$difficulty-1)
		MouseClick("left",$lvlLeft,$diffClickTop)
		sleep(200)
		$selectDiff=1
	EndIf
	startQuest()
	
	sleep(1000)
	MouseClick("left", 527,572)
	sleep(500)
	

EndFunc


Func selectChar()
	writeLog($msgCharSelect)
	MouseClick("left",395,531)
	sleep(500)
	Local $charPosition=$charTop+$charHeight/2+($charHeight+$charSpace)*($character-1)
	MouseClick("left",$charLeft,$charPosition)
	sleep(500)
	MouseClick("left",394,530)
EndFunc


Func startGame()
	writeLog($msgStartRun)
	startRunStat()
	updateStats()
	;; on click sur commencer / jouer
	MouseClick("left",132,226)
	sleep(200)
	Return loadGame()
EndFunc

Func stopGame()
	leaveGame()
	endRunStat()
	updateStats() 
	writeLog($msgEndRun & _FormatElapsedTime($runTimeList[$nbRun]))
EndFunc

Func leaveChannel()
	MouseClick("left",29,480)
	sleep(500)
	MouseClick("left",78,525)
	sleep(500)
EndFunc