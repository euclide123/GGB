#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author: Anakha

 Description
 

#ce ----------------------------------------------------------------------------
;;--
;;	Backup le D3Prefs.txt original et remplace par celui dans configs/
;;--
Func diabloPrefChange()
	If not $prefChanged Then
		FileMove($prefPath,$prefPath & ".bkp",1)
		FileCopy($prefName,$prefPath,1)
		$prefChanged=1
	EndIf
EndFunc

;;--
;;	Remet le fichier D3Prefs.txt original du joueur
;;--
Func diabloPrefRestore()
	If $prefChanged Then
		FileDelete($prefPath)
		FileMove($prefPath & ".bkp",$prefPath,1)
		$prefChanged = 0
	EndIf
EndFunc

;; ---
;; Cherche / v�rifie si un pixel se trouve � une position donn�. On utilise pixelSearch avec un carr� de 1x1 pixel pour chercher la couleur
;; 	avec une tol�rance de base � 2.
;; pixelArray = [x,y,color]
;; renvoi 1 si trouv�
;; renvoi 0 si non trouv�
;; @param $pixelArray 	le tableau avec la color et le coord
;; @param $precisionX/Y l'aggrandissement horizontale et verticale pour la zone de recherche
;; @param $tolerance 	la tol�rance pour la recherche
;; @return 1 si trouv�, 0 sinon
;; ---
Func checkPixel($pixelArray, $precisionX=0, $precisionY=0, $tolerance=2)
	Local $pos = PixelSearch($pixelArray[0]-$precisionX,$pixelArray[1]-$precisionX,$pixelArray[0]+$precisionX,$pixelArray[1]+$precisionY,$pixelArray[2],$tolerance)
	If @error Then
		return 0
	EndIf
	return 1
EndFunc


;; v�rifie que le jeu est bien lanc� (process OK) 
;; 			que la fenetre existe
;;			et on l'active
Func checkGameStatus()
	$pid = ProcessExists("Diablo III.exe")
	If $pid <> 0 Then
		If WinExists($winName) Then
			;; on l'active au cas o�
			WinActivate($winName)
			return 1
		Else
			return 0
		EndIf
	Else
		return 0
	EndIf
EndFunc
