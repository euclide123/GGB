;sequence monk
Func loadSequenceMonk()

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

	$h = WinGetHandle("Diablo III")

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
	
EndFunc