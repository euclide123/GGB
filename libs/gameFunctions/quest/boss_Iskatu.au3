#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

Func act3moveToTyraelIskatu()

	mouseClick("left",1250, 712)
	sleep(2000)
	mouseClick("left",6, 144)
	sleep(3800)
	mouseClick("left",9, 146)
	sleep(4000)
	mouseClick("left",56, 128)
	sleep(3500)
	send("{SPACE}")
	sleep(500)
	send("{SPACE}")
	sleep(500)
	send("{SPACE}")
	sleep(500)
	send("{SPACE}")
	sleep(500)
	
	$findTyrael=0
	while $findTyrael <= $findNpcTimeout And checkGameStatus() And checkInGame()
		$pos = PixelSearch(500,0,1250,500,0xD38B02,2)
		If not @error Then
			MouseClick("left",$pos[0],$pos[1]+80)
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
			ExitLoop
		EndIf
		sleep(100)
		$findTyrael += 1
	WEnd
	
	If $findTyrael >= $findNpcTimeout Then
		writeLog("Impossible de trouver Tyrael")
		$sequenceError = 1
		return 1
	EndIf
	
	$findPortal=0
	while $findPortal <= $findNpcTimeout And checkGameStatus() And checkInGame()
		$pos = PixelSearch(0,0,700,500,0x286465,2)
		If not @error Then
			MouseClick("left",$pos[0],$pos[1])
			ExitLoop
			sleep(5000)
		EndIf
		sleep(100)
		$findPortal += 1
	WEnd
	
	If $findPortal >= $findNpcTimeout Then
		writeLog("Impossible de trouver le portail d'Iskatu")
		$sequenceError = 1
		return 1
	EndIf
	sleep(4000)

		If $sequenceError Then
		return 1
	EndIf
	
	skipCinematic()	
	
		sleep(2000)
;on se place correctement de facon a ne pas etre circle trop facilement
	MouseClick("left",627,248)	
	sleep(1000)	
	
		attack()
		
			while (not act3CheckQuestDone()) And (Not isDead()) And (getGameLength() <= $gameMaxLength) And checkGameStatus() And checkInGame()
		sleep(500)
		send("{2}")
		sleep(500)
		send("{2}")
	WEnd
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
	MouseClick("left",844,574)
	sleep(800)
	MouseClick("left",430,582)
	sleep(800)
	MouseClick("left",460,330)
	Sleep(800)
	MouseClick("left",804,290)
	Sleep(800)
	MouseClick("left",628,866)
	sleep(300)
	send("{SPACE}")
	sleep(200)
	send("{SPACE}")
		sleep(400)

	pickit()
	
	EndFunc