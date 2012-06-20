Func loadSequenceSoSo()
	send("{2}")
	send("{3}")
	send("{4}")

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
	
EndFunc