; sequence WD

Func loadSequencewhich_doctor()	


		Switch $makequest

;cas quete 1.2.2		
		Case 122 
Send("{SHIFTDOWN}")
Send("3")
Sleep(Random(10,30,1))
Send("4")
Sleep(Random(10,30,1))

Local $i = 0
Do

MouseClick("right", Random(433,380,1), Random(300,330,1))
Sleep(Random(10,30,1))
MouseClick("left", Random(443,390,1), Random(300,330,1))
Send("1")
Sleep(Random(10,30,1))
Send("2")
 
 $i = $i + 1
Until $i = 6

Send("{SHIFTUP}")

		
;cas quete 1.6.3			
		Case 163
Send("{SHIFTDOWN}")
Send("3")
Sleep(Random(10,30,1))
Send("4")
Sleep(Random(10,30,1))

Local $i = 0
Do

MouseClick("right", Random(1050,1110,1), Random(460,480,1))
Sleep(Random(10,30,1))
MouseClick("left", Random(1050,1110,1), Random(450,480,1))
Send("1")
Sleep(Random(10,30,1))
Send("2")
 
 $i = $i + 1
Until $i = 6

sleep(50)
MouseClick("middle",837,450)
sleep(700)

Local $i = 0
Do

MouseClick("right", Random(1050,1110,1), Random(460,480,1))
Sleep(Random(10,30,1))
MouseClick("left", Random(1050,1110,1), Random(450,480,1))
Send("1")
Sleep(Random(10,30,1))
Send("2")
 
 $i = $i + 1
Until $i = 6

sleep(50)
MouseClick("middle",837,400)
sleep(700)

Local $i = 0
Do

MouseClick("right", Random(1050,1110,1), Random(460,480,1))
Sleep(Random(10,30,1))
MouseClick("left", Random(1050,1110,1), Random(450,480,1))
Send("1")
Sleep(Random(10,30,1))
Send("2")
 
 $i = $i + 1
Until $i = 6

Send("{SHIFTUP}")
		
;cas quete 4.1.1		
		Case 411
;skill recommande http://eu.battle.net/d3/en/calculator/witch-doctor#ZfUdPQ!TUe!acZZbZ
Send("{SHIFTDOWN}")
Send("3")
Sleep(Random(10,30,1))
Send("4")
Sleep(Random(10,30,1))

Local $i = 0
Do

MouseClick("right", Random(600,780,1), Random(550,749,1))
Sleep(Random(10,30,1))
MouseClick("left", Random(600,680,1), Random(550,749,1))
Send("1")
Sleep(Random(10,30,1))
Send("2")
 
 $i = $i + 1
Until $i = 18

Send("{SHIFTUP}")
	EndSwitch	
	


EndFunc
; fin sequence WD