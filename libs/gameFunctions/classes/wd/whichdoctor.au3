; sequence WD

Func loadSequencewhich_doctor()	

;skill recommande http://eu.battle.net/d3/en/calculator/witch-doctor#ZfUdPQ!TUe!acZZbZ
Send("{SHIFTDOWN}")
Send("3")
Sleep(Random(10,30,1))
Send("4")
Sleep(Random(10,30,1))

Local $i = 0
Do

MouseClick("right", Random(550,580,1), Random(700,749,1))
Sleep(Random(10,30,1))
MouseClick("left", Random(550,580,1), Random(700,749,1))
Send("1")
Sleep(Random(10,30,1))
Send("2")
 
 $i = $i + 1
Until $i = 18

Send("{SHIFTUP}")

EndFunc
; fin sequence WD