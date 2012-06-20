;; misc
Global $prefName="configs/D3Prefs.txt"
Global $iniConfigFile="configs/configs.ini"
Global $botDir=@WorkingDir
;; bot status
Global $botStatus=0	;; 0=stopped, 1=running, 2=paused
Global $Paused
Global $selectDiff=0
Global $botInTown=0
Global $prefChanged=0

;; GUI objects
Global $baseTitle = "GMS Gold Bot"
Global $handlerGUI
Global $gStart
Global $gStop
Global $gEdit
Global $gHStart
Global $gHEcoule
Global $gNbRun
Global $gAvgRunTime
Global $gLogs

;; stats variable
Global $startTime				;; dateheure de lancement du bot
Global $startTimeCalc			;; dateheure pour calcul de durée
Global $runStartTimeCalc		;; dateheure du dÃ©but du run pour calcum
Global $nbRun = 0				;; nombre de runs
Global $runTimeList[99999]		;; list des temps de chaques runs pour calculer la moyenne

;; position de l'inventaire
Global $invTop=326
Global $invLeft=518
Global $invCaseWidth=26
Global $invCaseHeight=26

;; position des fenetre de char
Global $charTop=111
Global $charLeft=131
Global $charHeight=48
Global $charSpace=1

;; position du menu de choix difficulté
Global $lvlTop=492
Global $lvlLeft=182
Global $lvlHeight=17

;; type des personnages :
Global $TYPE_SORC	= 1
Global $TYPE_MONK	= 2
Global $TYPE_DH		= 3
Global $TYPE_BARB	= 4
Global $TYPE_WD		= 5
Global $ZONE_ISKATU			= "iskatu"
Global $TYPE_DANK_CELLAR	= "sarkoth"
Global $TYPE_WARRIOR_REST	= "warriorrest"
;; error in sequence : abort game and start a new
Global $sequenceError
Global $restartDiablo=0

;; image search variable
Global $imgSearchX
Global $imgSearchY

;; images names
Global $launcherBtn 		= 'img/launcher_btn.bmp'
Global $launcherBtnHover	= 'img/launcher_btn_hover.bmp'

Global $loginBtn 			= 'img/login_btn.bmp'
Global $loginBtnActif 		= 'img/login_btn_actif.bmp'
Global $loginBtnActifHover	= 'img/login_btn_actif_hover.bmp'

Global $loginPopupAppear	= 'img/login_popup_appear.bmp'
Global $loginPopupConnect	= 'img/login_popup_connect.bmp'
Global $loginPopupVerif		= 'img/login_popup_verif.bmp'
Global $loginPopupRecup		= 'img/login_popup_recup.bmp'

Global $lobbyStart			= 'img/lobby_start.bmp'
Global $lobbyStartHover		= 'img/lobby_start_hover.bmp'
Global $lobbyPlay			= 'img/lobby_play.bmp'
Global $lobbyPlayHover		= 'img/lobby_play_hover.bmp'

Global $lobbyQuestValid		= 'img/lobby_quest_valid.bmp'

Global $gameTpIcon			= 'img/game_icon_tp.bmp'
Global $gameStash			= 'img/game_coffre.bmp'
Global $gameInventory		= 'img/game_inventaire.bmp'
Global $gameMarketRepair	= 'img/game_market_repair.bmp'
Global $gameMarketMisc		= 'img/game_market_misc.bmp'
Global $gameQuestDone		= 'img/game_quest_done.bmp'
Global $gameResBtn			= 'img/game_res_btn.bmp'
Global $gameResBtnRed		= 'img/game_res_btn_red.bmp'


;; PixelGetColor				= [x,y,color]
Global $loginWindow[3]			= [336,474,0x0C0504]

Global $loginPopupConnect[3]	= [296,256,0x42EB00]
Global $loginPopupVerif[3]		= [296,296,0x3AF200]
Global $loginPopupRecup[3]		= [296,335,0x42EB00]

Global $lobbyStart[3]			= [56,230,0x190400]
Global $lobbyStartHover[3]		= [56,230,0x1F0400]
Global $lobbyPlay[3]			= [56,230,0x190400]
Global $lobbyPlayHover[3]		= [56,230,0x1F0400]

Global $repairNotification[3]  	= [894,35,0xFFF000]
Global $tpIcon[3]				= [488,572,0x1B2B66]
Global $questDonePopup[3]		= [470,427,0xF09900]


