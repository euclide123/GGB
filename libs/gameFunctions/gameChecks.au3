#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author: Anakha

 Description
	Liste des différents check (avec imagesearch) pour s'y retrouver lorsqu'on joue.
 

#ce ----------------------------------------------------------------------------


Func checkLoginBtn()
	Return checkPixel($loginWindow)
EndFunc

Func checkPopupAppear()
	;Return _Imagesearch($loginPopupAppear,1,$imgSearchX,$imgSearchY,$imgSearchTolerance)
EndFunc

Func checkPopupConnected()
	Return checkPixel($loginPopupConnect)	
	;Return _Imagesearch($loginPopupConnect,1,$imgSearchX,$imgSearchY,$imgSearchTolerance)
EndFunc

Func checkPopupVerif()
	Return checkPixel($loginPopupVerif)
	;;Return _Imagesearch($loginPopupVerif,1,$imgSearchX,$imgSearchY,$imgSearchTolerance)
EndFunc

Func checkPopupRecup()
	Return checkPixel($loginPopupRecup)
	;;Return _Imagesearch($loginPopupRecup,1,$imgSearchX,$imgSearchY,$imgSearchTolerance)
EndFunc	

Func checkLobbyStart()
	Return checkPixel($lobbyStart) Or checkPixel($lobbyStartHover)
EndFunc

Func act3CheckQuestDone()
	Return checkPixel($questDonePopup,30,5)
	;return _Imagesearch($gameQuestDone,1,$imgSearchX,$imgSearchY,$imgSearchTolerance)
EndFunc

Func isDead()
	;Local $btn 	= _Imagesearch($gameResBtn,1,$imgSearchX,$imgSearchY,$imgSearchTolerance)
	;Local $btn2	= _Imagesearch($gameResBtnRed,1,$imgSearchX,$imgSearchY,$imgSearchTolerance)
	;return $btn Or $btn2
	return 0
EndFunc

Func checkInGame()
	Return checkPixel($tpIcon)
	;return _Imagesearch($gameTpIcon,1,$imgSearchX,$imgSearchY,$imgSearchTolerance)
EndFunc
