#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; !!! On part du checkpoint repos du guerrier!!!
Func act1moveToWarriorRest()
;ici ajouter fonction buff une fois qu'elle sera créé
mouseClick("left",1225, 242)
	sleep(2850)
mouseClick("left",1200, 476)
	sleep(1850)	
mouseClick("left",1077, 269)
	sleep(2450)		
mouseClick("left",1089, 252)
	sleep(2450)		
mouseClick("left",814, 418)
	sleep(1000)		
	

	
		attack()
		

	If isDead() Then
		writeLog("Mort")
		$sequenceError = 1
		Return 1
	EndIf
	If getGameLength() >= $gameMaxLength Then
		writeLog("Game Timeout")
		$sequenceError = 1
		Return 1
	EndIf
	If Not checkGameStatus() Or Not checkInGame() Then
		writeLog("On n'est plus dans la game")
		$sequenceError = 1
		Return 1
	EndIf
	sleep(800)
	MouseClick("left",1069,407)
	sleep(1000)

	pickit()

If isDead() Then
		writeLog("Mort")
		$sequenceError = 1
		Return 1
	EndIf
	If getGameLength() >= $gameMaxLength Then
		writeLog("Game Timeout")
		$sequenceError = 1
		Return 1
	EndIf
	If Not checkGameStatus() Or Not checkInGame() Then
		writeLog("On n'est plus dans la game")
		$sequenceError = 1
		Return 1
	EndIf	
	EndFunc