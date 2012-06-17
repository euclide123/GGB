;;--
;;	Rajoute une ligne de log dans le GUI du bot
;;	@param $message le texte a afficher
;;--
Func writeLog($message)
	Local $date="[" & @MDAY & "/" & @MON & "/" & @YEAR & " " & @HOUR & ":" & @MIN & ":" & @SEC & "] "
	GUICtrlSetData($gLogs, $date & $message & @CRLF & GUICtrlRead($gLogs))
EndFunc

;;--
;;	Initialise la date de lancement du run
;;--
Func startRunStat()
	$runStartTimeCalc = _NowCalc()
EndFunc	

;;--
;;	Initialise la date de lancement du bot
;;	et on met le GUI a jour
;;--
Func startBotTime()
	$startTime			= @MDAY & "/" & @MON & "/" & @YEAR & " " & @HOUR & ":" & @MIN & ":" & @SEC
	$startTimeCalc	 	= _NowCalc()
	GUICtrlSetData($gHStart,$startTime)
EndFunc	

;;--
;;	Incrémente le nombre de run et save le temps du run pour faire le temps moyen
;;--
Func endRunStat()
	$nbRun += 1
	$runTime = getGameLength()
	$runTimeList[$nbRun] = $runTime
EndFunc

;;--
;;	Calcul le temps d'une game
;;	@return le temps en seconde
;;--
Func getGameLength()
	return _DateDiff("s", $runStartTimeCalc, _NowCalc())
EndFunc

;;--
;;	Met a jour les stats du bot et refresh le GUI
;;--
Func updateStats() 
	Local $tempsEcoule = _DateDiff("s", $startTimeCalc, _NowCalc())
	Local $hEcoule = _FormatElapsedTime($tempsEcoule)
	
	GUICtrlSetData($gHStart		, $startTime)
	GUICtrlSetData($gHEcoule	, $hEcoule) ;; timenow - starttime
	GUICtrlSetData($gNbRun		, $nbRun)
	
	Local $avgRunTime=0
	;; calcul du temps moyen
	If $nbRun > 0 Then
	
		For $i = 1 To $nbRun
			$avgRunTime += $runTimeList[$i]
		Next
		
		$avgRunTime /= $nbRun
	
	EndIf

	GUICtrlSetData($gAvgRunTime	, _FormatElapsedTime($avgRunTime))
EndFunc

;;--
;;	Ecrit le contenu de la log et les stats du bot dans un fichier
;;--
Func saveLogs()
	Local $file = FileOpen("logs/botlogs.log",1)
	FileWriteLine($file,"")
	FileWriteLine($file,"")
	FileWriteLine($file,"---------------------------------------------------------")
	FileWriteLine($file,"| Heure Début : " & GUICtrlRead($gHStart))
	FileWriteLine($file,"| Temps écoule : " & GUICtrlRead($gHEcoule))
	FileWriteLine($file,"| Nombre de runs : " & GUICtrlRead($gNbRun))
	FileWriteLine($file,"| Temps moyen par run : " & GUICtrlRead($gAvgRunTime))
	FileWriteLine($file,"---------------------------------------------------------")
	FileWrite($file,GUICtrlRead($gLogs))
	FileClose($file)
EndFunc



;;--
;;	Formate une durée selon le nombre de seconde passé en param
;;  @param $Input_Seconds les secondes
;;	@return String le temps formatté correspondant
;;--
Func _FormatElapsedTime($Input_Seconds)
  If $Input_Seconds < 1 Then Return
  Global $ElapsedMessage = ''
  Global $Input = $Input_Seconds
  Switch $Input_Seconds
	Case 0 To 59
	  GetSeconds()
	Case 60 To 3599
	  GetMinutes()
	  GetSeconds()
	Case 3600 To 86399
	  GetHours()
	  GetMinutes()
	  GetSeconds()
	Case Else
	  GetDays()
	  GetHours()
	  GetMinutes()
	  GetSeconds()
  EndSwitch
  Return $ElapsedMessage
EndFunc   ;==>FormatElapsedTime


;;--
;;	Calcul le nombre de jours par rapport à un temps en secondes.
;; 	Fonctionne de paire avec _FormatElapsedTime()
;;	@return String le temps formaté
;;--
Func GetDays()
	$Days = Int($Input / 86400)
    $Input -= ($Days * 86400)
	$ElapsedMessage &= $Days & ' j, '
	Return $ElapsedMessage
EndFunc   ;==>GetDays

;;--
;;	Calcul le nombre d'heures par rapport à un temps en secondes.
;; 	Fonctionne de paire avec _FormatElapsedTime()
;;	@return String le temps formaté
;;--
Func GetHours()
	  $Hours = Int($Input / 3600)
	  $Input -= ($Hours * 3600)
	  $ElapsedMessage &= $Hours & ' h, '
	  Return $ElapsedMessage
EndFunc   ;==>GetHours

;;--
;;	Calcul le nombre de minutes par rapport à un temps en secondes.
;; 	Fonctionne de paire avec _FormatElapsedTime()
;;	@return String le temps formaté
;;--
Func GetMinutes()
	$Minutes = Int($Input / 60)
	$Input -= ($Minutes * 60)
	$ElapsedMessage &= $Minutes & ' min, '
	Return $ElapsedMessage
EndFunc   ;==>GetMinutes

;;--
;;	Calcul le nombre de secondes par rapport à un temps en secondes.
;; 	Fonctionne de paire avec _FormatElapsedTime()
;;	@return String le temps formaté
;;--
Func GetSeconds()
	$ElapsedMessage &= Int($Input) & ' s.'
	Return $ElapsedMessage
EndFunc   ;==>GetSeconds