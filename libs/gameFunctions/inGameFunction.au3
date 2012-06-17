#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author: Anakha, boubi, TheJok3r

 Description
 Liste des fonction pour la gestion du Run
	On retrouve la fonction pour repair, move to boss etc
	

#ce ----------------------------------------------------------------------------
Func loadGame()
	$error = waitInGame()
	If $error Then
		writeLog("Echec de création de la partie")
		Return 1
	EndIf
	sleep(1000)
	
	$sequenceError=0
	$botInTown=0

	choseBoss()	


	If Mod($nbRun,$runModRepSell) == 0 Then
			Switch $runBoss
		Case $ZONE_ISKATU 
			act3sellRepair()
		Case $TYPE_DANK_CELLAR
			act1sellRepair()
	EndSwitch	
	EndIf
	
	return 0
EndFunc


func skipCinematic()
				
	$maxLoop = 0
	while ("000000" <> hex(PixelGetColor (517,37),6)) And $maxLoop <= $cinmaticTimeout And checkGameStatus() And checkInGame()
		Sleep(100)
		$maxLoop += 1
	WEnd
	Send("{Escape}")
	Sleep(450)
	MouseClick("left", 530,340)
	Sleep(2500)
EndFunc

Func waitInGame()
	$maxLoop=0
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
	$pickitStart=_NowCalc()

	while $pickSet And checkGameStatus() And checkInGame() And (_DateDiff("s", $pickitStart, _NowCalc()) <= $pickitTimeout)	;; sets
		send("{ALT}")
		sleep(100)
		;$itemPos= PixelSearch(20,20,1252,826,0x01EF00,3)
		$itemPos= PixelSearch(150,150,1252,826,0x00FF00,1)
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
		$itemPos= PixelSearch(150,150,1252,826,0xBF642F,1)
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
		$itemPos= PixelSearch(150,150,1252,826,0xFFFF00,1)
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
		$itemPos= PixelSearch(150,150,1252,826,0x6464EF,1)
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
		writeLog("On n'est plus dans la game")
		$sequenceError = 1
		Return 1
	EndIf

	;; on retourne en ville
	Send("t")
	
	Sleep(8900)
	;; on va au npc en haut a droite qui vend les potions
	;; avant on check si on est pas mort pdent le tp
		If isDead() Then
		writeLog("Mort")
		$sequenceError = 1
		Return 1
	EndIf
	$botInTown=1
	
	MouseClick("left",36,617)
	sleep(1800)
	MouseClick("left",127,144)
	Sleep(2000)
	MouseClick("left",487,434)
	Sleep(900)
	;on re re check si on est pas mort
			If isDead() Then
		writeLog("Mort")
		$sequenceError = 1
		Return 1
	EndIf
	repair()
	sleep(500)
	sellItems()
	sleep(500)
	Send("{Escape}")
	sleep(200)
EndFunc

Func act1sellRepair()
	If Not checkGameStatus() Or Not checkInGame() Then
		writeLog("On n'est plus dans la game")
		$sequenceError = 1
		Return 1
	EndIf

	;; on retourne en ville
	Send("t")
	$botInTown=1
	Sleep(8900)
	;; on va au npc
	MouseClick("left",1152,341)
	sleep(2000)
	MouseClick("left",889,109)
	Sleep(2000)
	MouseClick("left",601,210)
	Sleep(1800)
	repair()
	sleep(500)
	sellItems()
	sleep(500)
	Send("{Escape}")
	sleep(200)
EndFunc

Func repair()

;;;
local $act = Int($makequest/100)
		Switch $act
		Case 1 
			MouseClick("left",469,435)
			sleep(500)
			MouseClick("left",234,536)
			sleep(500)
		Case 3
			MouseClick("left",465,324)
			sleep(500)
			MouseClick("left",234,536)
			sleep(500)
	EndSwitch	
EndFunc

Func sellItems()
	MouseClick("left",455,204)
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
		sleep(8500)
	EndIf
	Send("{Escape}")
	sleep(500)
	MouseClick("left",626,524)
	return 0
EndFunc

func attack()
	Switch $charType
		Case $TYPE_SORC 
			loadSequenceSoSo()
		Case $TYPE_MONK
			loadSequenceMonk()
		Case $TYPE_BARB
			loadSequenceBarb()
		Case $TYPE_DH
			loadSequencedeamon_hunter()
		Case $TYPE_WD
			loadSequencewhich_doctor()
	EndSwitch
		If $sequenceError Then
		Return 1
	EndIf
EndFunc	
	