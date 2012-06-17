#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author: Anakha, boubi, TheJok3r

 Description
 Liste des fonction pour la gestion du Run
	On retrouve la fonction pour repair, move to boss etc
	

#ce ----------------------------------------------------------------------------
Func loadGame()
	Local $error = waitInGame()
	If $error Then
		writeLog($msgErrorCreateGameFail)
		Return 1
	EndIf
	sleep(1000)
	
	$sequenceError=0
	$botInTown=0
	
	Switch $charType
		Case $TYPE_SORC 
			loadSequenceSoSo()
		Case $TYPE_MONK
			loadSequenceMonk()
		Case $TYPE_BARB
			loadSequenceBarb()
		Case $TYPE_DH
			writeLog($msgErrorNoSequenceFound &" DH")
		Case $TYPE_WD
			writeLog($msgErrorNoSequenceFound &" WD")
	EndSwitch
	
	If $sequenceError Then
		Return 1
	EndIf
	
	
	If Mod($nbRun,$runModRepSell) == 0 Then
		act3sellRepair()
	EndIf
	
	return 0
EndFunc
; sequence barb
Func loadSequenceBarb()
	send("{3}") ; on lance le cri
	act3moveToTyraelIskatu()
	If $sequenceError Then
		return 1
	EndIf
	
	skipCinematic()
	sleep(7000)                                    ; combat
	send("{2}")
	sleep(2000)
	send("{2}")
	sleep(2000)
	send("{2}")
	sleep(2000)
	send("{2}")
	sleep(2000)
	send("{2}")
	sleep(2000)
	send("{2}")
	sleep(2000)
	send("{4}")     ; tremblement de terre sans coup en fury
	sleep(3000)
	send("{2}")
	sleep(2000)
	send("{2}")
	sleep(2000)
	send("{2}")
	sleep(2000)
	send("{2}")
	sleep(2000)
	send("{2}")

	while (not act3CheckQuestDone()) And (Not isDead()) And (getGameLength() <= $gameMaxLength) And checkGameStatus() And checkInGame()
		sleep(2000)
		send("{2}")
		sleep(2000)
		send("{2}")
	WEnd
	If isDead() Then
		writeLog($msgErrorDeath)
		$sequenceError = 1
		Return 1
	EndIf
	If getGameLength() >= $gameMaxLength Then
		writeLog($msgErrorGameTimeout)
		$sequenceError = 1
		Return 1
	EndIf
	If Not checkGameStatus() Or Not checkInGame() Then
		writeLog($msgErrorNotInGame)
		$sequenceError = 1
		Return 1
	EndIf
	sleep(500)
	MouseClick("left",844,574)
	send("{SPACE}")
	Sleep(800)
	send("{SPACE}")
	MouseClick("left",430,582)
	Sleep(800)
	send("{SPACE}")
	MouseClick("left",460,330)
	Sleep(800)
	send("{SPACE}")
	MouseClick("left",804,290)
	Sleep(800)
	send("{SPACE}")
	MouseClick("left",628,786)
	sleep(200)
	send("{SPACE}")
	pickit()
EndFunc
; fin sequence barb



Func loadSequenceMonk()
	act3moveToTyraelIskatu()
	If $sequenceError Then
		return 1
	EndIf
	
	skipCinematic()
	
	sleep(500)
	; on lance buff mantra
	MouseClick("right",Random(463,618,1),Random(339,369,1))
	Sleep(Random(450,650,1))
	; on creer notre clone clone
	MouseClick("left", Random(518,560,1), Random(920,960,1))
	Sleep(Random(300,400,1))
	; on lance vent tournoyant
	MouseClick("left", Random(459,502,1), Random(920,960,1))
	Sleep(Random(320,420,1))
	;Attaque automatique en appuyant sur shift pour pas bouger
	; on peut modifier le nombre de coup avant de lancer sérénité
	$serenite=0

	Local $h = WinGetHandle("Diablo III")

	;sérénité sert aussi de sortie de secour de la boucle while au cas ou il y ai un probleme avec les checksum
	while (not act3CheckQuestDone()) And (Not isDead()) And (getGameLength() <= $gameMaxLength) And checkGameStatus() And checkInGame()
		Send("{LSHIFT down}")
		MouseClick("left",Random(630,650,1),Random(435,455,1))
		Sleep(Random(200,300,1))
		Send("{LSHIFT up}")

			if $serenite = 20 Then
				MouseClick("left",Random(340,380,1),Random(920,960,1))
				Sleep(Random(450,650,1))
			ElseIf $serenite = 60 Then
				ExitLoop
			EndIf
		$serenite = $serenite + 1
	WEnd
	If isDead() Then
		writeLog($msgErrorDeath)
		$sequenceError = 1
		Return 1
	EndIf
	If getGameLength() >= $gameMaxLength Then
		writeLog($msgErrorGameTimeout)
		$sequenceError = 1
		Return 1
	EndIf
	If Not checkGameStatus() Or Not checkInGame() Then
		writeLog($msgErrorNotInGame)
		$sequenceError = 1
		Return 1
	EndIf
	
	sleep(500)
	MouseClick("left",844,574)
	send("{SPACE}")
	Sleep(800)
	send("{SPACE}")
	MouseClick("left",430,582)
	Sleep(800)
	send("{SPACE}")
	MouseClick("left",460,330)
	Sleep(800)
	send("{SPACE}")
	MouseClick("left",804,290)
	Sleep(800)
	send("{SPACE}")
	MouseClick("left",628,786)
	sleep(200)
	send("{SPACE}")
	pickit()
EndFunc


Func loadSequenceSoSo()
	send("{2}")
	send("{3}")
	send("{4}")
	act3moveToTyraelIskatu()
	
	If $sequenceError Then
		return 1
	EndIf
	
	skipCinematic()
	sleep(500)
	MouseClick("left",557,71)
	sleep(3000)
	send("{1}")
	sleep(500)
	while (not act3CheckQuestDone()) And (Not isDead()) And (getGameLength() <= $gameMaxLength) And checkGameStatus() And checkInGame()
		MouseMove(429,358)
		MouseDown("right")
	WEnd
	MouseUp("right")
	
	If isDead() Then
		writeLog($msgErrorDeath)
		$sequenceError = 1
		Return 1
	EndIf
	If getGameLength() >= $gameMaxLength Then
		writeLog($msgErrorGameTimeout)
		$sequenceError = 1
		Return 1
	EndIf
	If Not checkGameStatus() Or Not checkInGame() Then
		writeLog($msgErrorNotInGame)
		$sequenceError = 1
		Return 1
	EndIf
	sleep(500)
	;MouseClick("left",844,574)
	send("{SPACE}")
	Sleep(800)
	send("{SPACE}")
	;MouseClick("left",430,582)
	Sleep(800)
	send("{SPACE}")
	;MouseClick("left",460,330)
	Sleep(800)
	send("{SPACE}")
	;MouseClick("left",804,290)
	Sleep(800)
	send("{SPACE}")
	;MouseClick("left",628,786)
	sleep(200)
	send("{SPACE}")
	pickit()
EndFunc

Func act3moveToTyraelIskatu()

	mouseClick("left",794,465)
	sleep(2000)
	mouseClick("left",3,104)
	sleep(3800)
	mouseClick("left",14,71)
	sleep(4500)
	mouseClick("left",71,80)
	sleep(3500)
	send("{SPACE}")
	sleep(500)
	send("{SPACE}")
	sleep(500)
	send("{SPACE}")
	sleep(500)
	send("{SPACE}")
	sleep(500)
	
	;; on parle a tyra
	MouseClick("left",473,198)
	sleep(1000)
	send("{SPACE}")
	sleep(500)
	send("{SPACE}")
	sleep(500)
	send("{SPACE}")
	sleep(500)
	send("{SPACE}")
	sleep(500)
	send("{SPACE}")
	sleep(500)
	
	;; on rentre dans le portail
	MouseClick("left",128,55)
	sleep(9000)
EndFunc

func skipCinematic()
	Local $maxLoop = 0
	while ("000000" <> hex(PixelGetColor (385,33),6)) And $maxLoop <= $cinmaticTimeout And checkGameStatus() And checkInGame()
		Sleep(100)
		$maxLoop += 1
	WEnd
	Send("{Escape}")
	Sleep(450)
	MouseClick("left",338,208)
	Sleep(2500)
EndFunc

Func waitInGame()
	Local $maxLoop=0
	while Not checkInGame() And $maxLoop <= $waitInGameTimeout And checkGameStatus()
		sleep(100)
		$maxLoop += 1
	WEnd
	If $maxLoop > $waitInGameTimeout Or Not checkGameStatus() Then
		return 1
	Else
		return 0
	EndIf
EndFunc

Func pickit()
	send("{ALT}")
	sleep(500)
	Local $pickitStart=_NowCalc()

	while $pickSet And checkGameStatus() And checkInGame() And (_DateDiff("s", $pickitStart, _NowCalc()) <= $pickitTimeout)	;; sets
		send("{ALT}")
		sleep(100)
		;$itemPos= PixelSearch(20,20,1252,826,0x01EF00,3)
		Local $itemPos= PixelSearch(150,150,1252,826,0x00FF00,1)
		If Not @error Then
			MouseClick("left",$itemPos[0],$itemPos[1],1,1)
			sleep(1000)
		Else
			ExitLoop
		EndIf
	WEnd
	while $pickLegend And checkGameStatus() And checkInGame() And (_DateDiff("s", $pickitStart, _NowCalc()) <= $pickitTimeout) ;; legendary
		send("{ALT}")
		sleep(100)
		;$itemPos= PixelSearch(20,20,1252,826,0xB35F2E,3)
		Local $itemPos= PixelSearch(150,150,1252,826,0xBF642F,1)
		If Not @error Then
			MouseClick("left",$itemPos[0],$itemPos[1],1,1)
			sleep(1000)
		Else
			ExitLoop
		EndIf
	WEnd	
	while $pickRare And checkGameStatus() And checkInGame() And (_DateDiff("s", $pickitStart, _NowCalc()) <= $pickitTimeout) ;; rare
		send("{ALT}")
		sleep(100)
		Local $itemPos= PixelSearch(150,150,1252,826,0xFFFF00,1)
		If Not @error Then
			MouseClick("left",$itemPos[0],$itemPos[1],1,1)
			sleep(1000)
		Else
			ExitLoop
		EndIf
	WEnd
	while $pickMagic And checkGameStatus() And checkInGame() And (_DateDiff("s", $pickitStart, _NowCalc()) <= $pickitTimeout) ;; magic
		send("{ALT}")
		sleep(100)
		;$itemPos= PixelSearch(20,20,1252,826,0x6969FF,3) 
		Local $itemPos= PixelSearch(150,150,1252,826,0x6464EF,1)
		If Not @error Then
			MouseClick("left",$itemPos[0],$itemPos[1],1,1)
			sleep(1000)
		Else
			ExitLoop
		EndIf
	WEnd
EndFunc

Func act3sellRepair()
	If Not checkGameStatus() Or Not checkInGame() Then
		writeLog($msgErrorNotInGame)
		$sequenceError = 1
		Return 1
	EndIf

	;; on retourne en ville
	Send("t")
	$botInTown=1
	Sleep(8500)
	;; on va au npc en haut a droite qui vend les potions
	MouseClick("left",567,148)
	sleep(1500)
	MouseClick("left",789,511)
	Sleep(2000)
	MouseClick("left",730,366)
	Sleep(2000)
	MouseClick("left",640,337)
	Sleep(1500)
	MouseClick("left",428,173)
	Sleep(1500)
	repair()
	sleep(500)
	sellItems()
	sleep(500)
	Send("{Escape}")
	sleep(200)
EndFunc

Func repair()
	MouseClick("left",280,198)
	sleep(500)
	MouseClick("left",143,327)
	sleep(500)
EndFunc

Func sellItems()
	MouseClick("left",282,126)
	sleep(500)
	
	For $i = 0 To 5
		For $j = 1 To 10
			$line = $inv[$i]
			If $line[$j] == 0 Then
				MouseClick("right",$invLeft+$invCaseWidth*(1/2+$j-1), $invTop+$invCaseHeight*(1/2+$i),1,1)
			EndIf
		Next
	Next
	sleep(1000)
	;; buy potions
EndFunc

;; fonction appelé par stopGame()
Func leaveGame()
	If Not checkGameStatus() Or Not checkInGame() Then
		Return 1
	EndIf

	;; on retourne en ville pour quitter
	If Not $botInTown Then
		send("t")
		sleep(7500)
	EndIf
	Send("{Escape}")
	sleep(500)
	MouseClick("left",394,320)
	return 0
EndFunc