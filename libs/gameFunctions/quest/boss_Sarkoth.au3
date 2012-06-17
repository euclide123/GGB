#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; !!! On part du checkpoint des vielles ruines !!!
Func act1moveToSarkoth()
;ici ajouter fonction buff une fois qu'elle sera créé
mouseClick("left",238, 232)
	sleep(2300)
	mouseClick("left",21, 374)
	sleep(2500)
	mouseClick("left",24, 398)
	sleep(2200)
	mouseClick("left",12, 515)
	sleep(1000)
mouseClick("left",202, 419)
	sleep(1400)
mouseClick("left",801, 261)
	sleep(500)
	If isDead() Then
		writeLog("Mort")
		$sequenceError = 1
		Return 1
	EndIf
	;ici on doit check si on est dans le cellar ou non
	
	$cellarOpen=0
	while $cellarOpen <= $findCellarTimeOut And checkGameStatus() And checkInGame()
		$pos = PixelSearch(1012,21,1015,25,0x03070A,2)
		If not @error Then
		;rien a faire
			send("{SPACE}")
	
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
	sleep(1800)		
	MouseClick("left",864,175)	
	sleep(1800)		
	MouseClick("left",50,500)
	sleep(1300)
	
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
	MouseClick("left",352,844)
	sleep(1000)
	MouseClick("left",262,592)
	sleep(1000)

	pickit()
	
	EndFunc