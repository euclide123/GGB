#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; !!! On part du checkpoint repos du guerrier!!!
Func act1moveToWarriorRest()
;ici ajouter fonction buff une fois qu'elle sera créé
writeLog("Deplacement dans le warriors rest")
mouseClick("left",1225, 242)
	sleep(2650)
mouseClick("left",1200, 476)
	sleep(1650)	
mouseClick("left",1077, 269)
	sleep(2350)		
mouseClick("left",1089, 252)
	sleep(2350)		
mouseClick("left",1170, 373)
	sleep(2300)		
	mouseClick("left",738, 534)
	sleep(300)	
	

writeLog("A l attaque")	
		attack()
writeLog("Attaque finie")			
	If isDead() Then
		writeLog("Mort")
		$sequenceError = 1
		Return 1
	EndIf
	

writeLog("Positionnement pickit")	
	sleep(800)
	MouseClick("left",1069,407)
	sleep(1000)
writeLog("Pickit")	
	pickit()
writeLog("Pickit fini")	

	EndFunc