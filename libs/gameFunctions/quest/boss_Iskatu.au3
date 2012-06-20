#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

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
	
	skipCinematic()	
	
	
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