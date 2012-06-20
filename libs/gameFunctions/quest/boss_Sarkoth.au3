#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; !!! On part du checkpoint des vielles ruines !!!
Func act1moveToSarkoth()
;ici ajouter fonction buff une fois qu'elle sera créé
mouseClick("middle",238, 150)
	sleep(2550)
	mouseClick("middle",21, 374)
	sleep(2550)
	mouseClick("middle",23, 484)
	sleep(2450)
	mouseClick("middle",30, 232)
	sleep(1350)
mouseClick("middle",59, 648)
	sleep(1750)
mouseClick("left",710, 172)
	sleep(2000)
	If isDead() Then
		writeLog("Mort")
			Send("{Escape}")
	writeLog("Escape")
	sleep(500)
	MouseClick("left",626,524)
		$sequenceError = 1
		Return 1
	EndIf
	;ici on doit check si on est dans le cellar ou non
	
	$cellarOpen=0
	while $cellarOpen <= $findCellarTimeOut And checkGameStatus() And checkInGame()
		$pos = PixelSearch(1012,21,1015,25,0x03070A,2)
		If @error Then
	Send("{Escape}")
	sleep(500)
	MouseClick("left",626,524)
	return 0
	Else
			ExitLoop
		EndIf
		sleep(100)
		$cellarOpen += 1
	WEnd
	
	If $cellarOpen >= $findCellarTimeOut Then
		writeLog("la cave n est pas ouverte")
		$sequenceError = 1
		return 1
	EndIf
	
	
	MouseClick("left",40,836)	
	sleep(2400)	
	MouseClick("left",375,258)
	sleep(1500)		

	
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
	sleep(1000)
	MouseClick("left",255,255)
	sleep(1000)
	MouseClick("left",600,200)
	sleep(1000)

	pickit()
	
	EndFunc