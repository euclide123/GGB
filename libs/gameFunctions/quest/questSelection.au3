;selection des quetes
;ici on ajoute les coord de toutes les selections possibles
;pour l'instant on ne rempli pas plus car il faudra ss doute tout remesurer avec la futur resolution d utilisation 

sleep (2000)
Func startQuest()

	If $makequest=111 then

		MouseClick("left",501,259,15)
		sleep(200)
		MouseClick("left",239,489)
		sleep(200)
		MouseClick("left",140,295)
		sleep(200)
		MouseClick("left",144,333)
		sleep(200)
		MouseClick("left",852,784)
		sleep(1000)
		
	ElseIf $makequest=122 then
	;c est un quete ou il faut �tre sur un checkpoint bien precis, il n y � pas de raison de choisir la quete donc
	;	MouseClick("left",501,259,15)
	;	sleep(150)
	;	MouseClick("left",239,489)
	;	sleep(150)
	;	MouseClick("left",250,342)
	;	sleep(150)
	;	MouseClick("left",237,420)
	;	sleep(150)
		MouseClick("left",852,784)
		sleep(200)	
		
	ElseIf $makequest=151 then

		MouseClick("left",501,259,15)
		sleep(200)
		MouseClick("left",250,506)
		sleep(200)
		MouseClick("left",250,500)
		sleep(200)
		MouseClick("left",852,784)
		sleep(1000)
		
		ElseIf $makequest=163 then

	;c est un quete ou il faut �tre sur un checkpoint bien precis, il ne faut donc pas recrer la quest
		MouseClick("left",852,784)
		sleep(200)
		
	ElseIf $makequest=411 then

		MouseClick("left",501,259,15)
		sleep(200)
		MouseClick("left",250,287)
		sleep(200)
		MouseClick("left",501,679,15)
		sleep(200)
		MouseClick("left",250,530)
		sleep(200)
		MouseClick("left",852,784)
		sleep(1000)
		

	Else 
	MsgBox(4096, "Fail", "Cette quete n est pas dispo - voir section config.ini partie quest", 10)
	EndIf	
EndFunc

;choix disponibles pour les boss et zones a runner
Func choseBoss()
	Switch $runBoss
		Case $ZONE_ISKATU 
			act3moveToTyraelIskatu()
		Case $TYPE_DANK_CELLAR
			act1moveToSarkoth()
		Case $TYPE_WARRIOR_REST
			act1moveToWarriorRest()

	EndSwitch
		If $sequenceError Then
		Return 1
	EndIf
EndFunc	

