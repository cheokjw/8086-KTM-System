;// TODO: SETTLE TOPUP PAGE (COMPLETE CONDITION JUMP)
.MODEL SMALL
.STACK 100H
.386
.DATA

;--------------------------------------------------------- LOGO PAGE ------------------------------------------------------------------------;
    LOGO_TXT                    DB 13,10,13,10,13,10,           "              ______________                                                 "
                                DB 13,10,                       "              | ---------- |                                                 "
                                DB 13,10,                       "       _______|____________|_______                                          "
                                DB 13,10,                       "      /  __________________________ \                                        "
                                DB 13,10,                       "     |  | |_____|| () '.......'.' |  |                                       "
                                DB 13,10,                       "     |  | |_____|| ()  ________   |  |                                       "         
                                DB 13,10,                       "     |  | |     ||    |        |  |  |        ____  __.________________      "
                                DB 13,10,                       "     |  | |_____||    |________|  |  |       |    |/ _|\__    ___/     \     "
                                DB 13,10,                       "     |  | ........................|  |       |      <    |    | /  \ /  \    "
                                DB 13,10,                       "     |  |_________________________|  |       |    |  \   |    |/    Y    \   "
                                DB 13,10,                       "     |     =====    =====   =====    |       |____|__ \  |____|\____|__  /   "
                                DB 13,10,                       "     |          ____________         |              \/                \/     "
                                DB 13,10,                       "     |          \ I I I I  /         |        _____/\  _______.___   _____   "
                                DB 13,10,                       "     |           \        /          |       /     )/ /   ___/|   | /  _  \  "
                                DB 13,10,                       "     |    ()       ------      ()    |      /  \ /  \ \___  \ |   |/  /_\  \ "
                                DB 13,10,                       "     |            ---------          |     /    Y    \/      \|   /    |    \"
                                DB 13,10,                       "     |_________^___^___^___^_________|     \____|__  /_____  /|___\____|__  /"
                                DB 13,10,                       "       |_________|[ ==.== ]|________|              \/      \/             \/ "
                                DB 13,10,                       "           |||________________|||                                            "
                                DB 13,10,                       "           |||________________|||             Press Any Key To Continue .... "
                                DB 13,10,                       "          //____________________ \\                                          "
                                DB 13,10,                       "        //                         \\                                        "
                                DB 13,10,                       "      //___________________________  \\                                     $"
;------------------------------------------------------- END LOGO PAGE ----------------------------------------------------------------------;

;------------------------------------------------------ WELCOME PAGES VARIABLES--------------------------------------------------------------;
    COND                        DB 1

    WELCOME_TXT                 DB 13,10,13,10,                 "                                       /@@      /@@ /@@       /@@              "
                                DB 13,10,                       "                                      | @@@    /@@@| @/      |__/              "
                                DB 13,10,                       "                                      | @@@@  /@@@@|_/@@@@@@@ /@@  /@@@@@@     "    
                                DB 13,10,                       "    /@@   /@@/@@@@@@@@/@@      /@@    | @@ @@/@@ @@ /@@_____/| @@ |____  @@    " 
                                DB 13,10,                       "   | @@  /@@/__  @@__/ @@@    /@@@    | @@  @@@| @@|  @@@@@@ | @@  /@@@@@@@    "
                                DB 13,10,                       "   | @@ /@@/   | @@  | @@@@  /@@@@    | @@\  @ | @@ \____  @@| @@ /@@__  @@    "
                                DB 13,10,                       "   | @@@@@/    | @@  | @@ @@/@@ @@    | @@ \/  | @@ /@@@@@@@/| @@|  @@@@@@@    "
                                DB 13,10,                       "   | @@  @@    | @@  | @@  @@@| @@    |__/     |__/|_______/ |__/ \_______/    "
                                DB 13,10,                       "   | @@\  @@   | @@  | @@\  @ | @@                                            $"

    WELCOME_TXT2                DB 13,10,                       "   | @@ \  @@  | @@  | @@ \/  | @@                 . . . . o o o o o           "
                                DB 13,10,                       "   |__/  \__/  |__/  |__/     |__/                        _____      o         "
                                DB 13,10,                       "                                                 ____====  ]OO|_n_n__][.       " 
                                DB 13,10,                       "                                               [________]_|__|________)<       "
                                DB 13,10,                       "                                               oo    oo  'oo OOOO-| oo\\_      "
                                DB 13,10,                       "============================ Welcome to KTM M'sia ============================="
                                DB 13,10,13,10,                 "                        Please choose your login option !!!                    "
                                DB 13,10,                       "                            1.    Login as Member                              "
                                DB 13,10,                       "                            2.    Register                                     "
                                DB 13,10,                       "                            3.    Login as Guest                               "
                                DB 13,10,                       "                            4.    Quit                                         "
                                DB 13,10,                       "                (Login as Member to get MEMBER EXCLUSIVE discounts)    $"

    WELCOME_OPT_TXT             DB 13,10,13,10,                 "                               Option: $                                       "

    ; error text
    WELCOME_ERR_TXT             DB 13,10,                       "               Please enter number between 1 and 4 (inclusive) !!!             "
                                DB 13,10,                       "                       Press any key to continue......$                        "

    ; store user input
    A_WELCOME_OPT               LABEL       BYTE              ; name
    MAX_WELCOME_OPT             DB          2                 ; max length
    ACT_WELCOME_OPT             DB          ?                 ; actual length
    WELCOME_OPT                 DB          2 DUP (0)               
    ;------------------------------------------------------ END WELCOME PAGE VARIABLES ----------------------------------------------------------;

    ;-------------------------------------------------------- LOGIN PAGE VARIABLES --------------------------------------------------------------;
    LOGIN_TXT                   DB 13,10,               "                /@@        /@@@@@@   /@@@@@@  /@@@@@@ /@@   /@@          "
                                DB 13,10,               "               | @@       /@@__  @@ /@@__  @@|_  @@_/| @@@ | @@          "
                                DB 13,10,               "               | @@      | @@  \ @@| @@  \__/  | @@  | @@@@| @@          "
                                DB 13,10,               "               | @@      | @@  | @@| @@ /@@@@  | @@  | @@ @@ @@          "
                                DB 13,10,               "               | @@      | @@  | @@| @@|_  @@  | @@  | @@  @@@@          " 
                                DB 13,10,               "               | @@      | @@  | @@| @@  \ @@  | @@  | @@\  @@@          "
                                DB 13,10,               "               | @@@@@@@@|  @@@@@@/|  @@@@@@/ /@@@@@@| @@ \  @@          "
                                DB 13,10,               "               |________/ \______/  \______/ |______/|__/  \__/         $"

    LOGIN_TXT2                  DB 13,10,13,10,13,10,   "================================ Login Page ===================================$"

    USERNAME_TXT                DB 13,10,13,10,         "          Please enter your username: $"
    PASSWORD_TXT                DB 13,10,13,10,         "          Please enter your password: $"

    ; error text
    LOGIN_ERROR_TXT             DB 13,10,13,10,         "                       Please enter exactly 8 characters!!               "
                                DB 13,10,13,10,          "             Press any key to return back to previous screen.....$       "
    UNAME_ERROR_TXT             DB 13,10,13,10,         "                        !!! Wrong Username Entered !!!                   "
                                DB 13,10,13,10,         "            Press any key to return back to the previous screen.....$    "
    PASS_ERROR_TXT              DB 13,10,13,10,         "                        !!! Wrong Password Entered !!!                   "
                                DB 13,10,13,10,         "            Press any key to return back to the previous screen.....$    "
    ; store login uername
    A_USERNAME                  LABEL       BYTE
    MAX_USERNAME                DB          9
    ACT_USERNAME                DB          ?
    USERNAME                    DB          9 DUP (0)

    ; store input password
    A_PASS                      LABEL       BYTE
    MAX_PASS                    DB          9
    ACT_PASS                    DB          ?
    PASSWORD                    DB          9 DUP (0)

    ; to store data from file
    PBUFFER                     DB          8 DUP (0), "$"
    UBUFFER                     DB          8 DUP (0), "$"          ; Make a plain buffer 



    ;----------------------------------------------------- END LOGIN PAGE VARIABLES --------------------------------------------------------------;

    ;------------------------------------------------------ REGISTER PAGE VARIABLES --------------------------------------------------------------;
    REGISTER_TXT                DB 13,10,               " /@@@@@@@  /@@@@@@@@  /@@@@@@  /@@@@@@  /@@@@@@  /@@@@@@@@/@@@@@@@@ /@@@@@@@ "
                                DB 13,10,               "| @@__  @@| @@_____/ /@@__  @@|_  @@_/ /@@__  @@|__  @@__/ @@_____/| @@__  @@"
                                DB 13,10,               "| @@  \ @@| @@      | @@  \__/  | @@  | @@  \__/   | @@  | @@      | @@  \ @@"
                                DB 13,10,               "| @@@@@@@/| @@@@@   | @@ /@@@@  | @@  |  @@@@@@    | @@  | @@@@@   | @@@@@@@/"
                                DB 13,10,               "| @@__  @@| @@__/   | @@|_  @@  | @@   \____  @@   | @@  | @@__/   | @@__  @@" 
                                DB 13,10,               "| @@  \ @@| @@      | @@  \ @@  | @@   /@@  \ @@   | @@  | @@      | @@  \ @@"
                                DB 13,10,               "| @@  | @@| @@@@@@@@|  @@@@@@/ /@@@@@@|  @@@@@@/   | @@  | @@@@@@@@| @@  | @@"
                                DB 13,10,               "|__/  |__/|________/ \______/ |______/ \______/    |__/  |________/|__/  |__/$"

    REGISTER_TXT2               DB 13,10,13,10,13,10,   "================================= Register ====================================="
                                DB 13,10,13,10,         "                   !!! WARNING: old user will be deleted !!!                   $"

    REG_NAME_TXT                DB 13,10,13,10,         "          Please register your username : $"
    REG_PASS_TXT                DB 13,10,13,10,         "          Please register your password : $"
    REG_AGE_TXT                 DB 13,10,13,10,         "          Plesae register your age      : $"
    REG_SUCCESS                 DB 13,10,13,10,         "                          Registered Successfully! $"
    CONTINUE_TXT                DB 13,10,               "                       Press Any Key To Continue........$"

    ; store register username
    REG_USERNAME                DB          9
                                DB          ?
                                DB          9 DUP (0)
    ; store register password
    REG_PASS                    DB          9
                                DB          ?
                                DB          9 DUP (0)

    ; store register age
    REG_AGE                     DB          3
                                DB          ?
                                DB          3 DUP (0)
    
    ; user age discount condition
    USER_AGE                    DB  1
    A1                          DB  0
    A2                          DB  0
 
    ; File Variable (Read and write)
    NUFILE                      DB 'USERNAME.TXT', 0
    NPFILE                      DB 'PASSWORD.TXT', 0
    NAFILE                      DB 'AGE.TXT', 0
    NTFILE                      DB 'TOPUP.TXT', 0
    HANDLE                      DW       ?              ; This would be the file handle, the number that DOS assigns to open file
    HANDLE2                     DW       ?
    BUFFER                      DB 8 DUP (0), "$"       ; Make a plain buffer 
    TBUFFER                     DW 3 DUP (0), "$"       ; buffer for topup (DW for calculation)
    ABUFFER                     DB 2 DUP (0), "$"       ; buffer for age
;----------------------------------------------------- END REGISTER PAGE VARIABLES -----------------------------------------------------------;

;--------------------------------------------------------- TOP UP PAGE VARIABLES -------------------------------------------------------------;
    TOPUP_TXT                   DB 13,10,13,10,           "          . . .~~~~=========================================~~~~. . .   "    
                                DB 13,10,                 "                   |       _____ ___  ___   _   _ ___      |"
                                DB 13,10,                 "                   |      |_   _/ _ \| _ \ | | | | _ \     |"
                                DB 13,10,                 "                   |        | || (_) |  _/ | |_| |  _/     |"
                                DB 13,10,                 "                   |        |_| \___/|_|    \___/|_|       |"
                                DB 13,10,                 "                   |                                       |"
                                DB 13,10,                 "          . . .~~~~=========================================~~~~. . .   $"
  
    TOPUP_TXT2                  DB 13,10,13,10,           "        ~~~~~~~~~~~~~~~~~~~~~~~~~ MEMBER SPECIALY ~~~~~~~~~~~~~~~~~~~~~~ "
                                DB 13,10,                 "        |                                                              |"
                                DB 13,10,                 "        |            Current E-coin Amount :            0              |"
                                DB 13,10,                 "        |                    (Minimum TopUp = RM10)                    |"
                                DB 13,10,                 "        |                                                              |"
                                DB 13,10,                 "        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~$"

    TOPUP_TXT3                  DB 13,10,                 "                     How much would you like to top up?              "
                                DB 13,10,                 "               1. RM 10             2. RM 20           3. RM 50      "
                                DB 13,10,                 "               4. RM 100            5. RM 200          6. RM 500     "
                                DB 13,10,                 "               7. RM 600            8. RM 700          9. RM 800    $"
    
    TOPUP_TXT4                  DB 13,10,13,10,           "                        Top-Up Choice:  $                           "

    ; save user topup choice
    TOPUP_CHOICE                DB ? 
    TTL_TOPUP1                  DB "010$"
    TTL_TOPUP2                  DB "020$"
    TTL_TOPUP3                  DB "050$"
    TTL_TOPUP4                  DB "100$"
    TTL_TOPUP5                  DB "200$"
    TTL_TOPUP6                  DB "500$"
    TTL_TOPUP7                  DB "600$"
    TTL_TOPUP8                  DB "700$"
    TTL_TOPUP9                  DB "800$"
    TOPUP_AMOUNT                DB 0

    ; Second Topup page (Calculation Purpose)
    T2HUNDREDV                  DW 0
    T2TENV                      DW 0
    T2ONEV                      DW 0
    T2Q1                        DB 0
    T2R1                        DB 0 
    T2Q2                        DB 0
    T2R2                        DB 0
    T2TTLV                      DW 0
    TEMP                        DB 3 DUP (0), "$"    
    TTLTEMP                     DW 0
    TBUFFER2                    DW 3 DUP (0), "$"       ; buffer for topup (DW for calculation)

    ; Error Messages
    ERR_TOPUPTXT1               DB 13,10,                  "     !!! Kindly Choose a number between 1 and 9 (inclusive) !!!$"
    S_TOPUPTXT                  DB 13,10,13,10,            "                              TopUp Successfully!!$             "
    ERRT2_TXT                   DB 13,10,                  "                    !!! Maximum 999 In Your Account !!!$           "
    T2_BACK_TXT                 DB 13,10,                  "                        Bringing You Back To Previous Page         "
                                DB 13,10,                  "                            Please Press Any Key To Continue.....$ "
 
;------------------------------------------------------- END TOP UP PAGE VARIABLES -----------------------------------------------------------;

;------------------------------------------------------------- ROUTE OPTION PAGE -------------------------------------------------------------;
; design UI
	; declare var for route option page
	ROUTE_MENU	DB  13,10,13,10,        "                       _-====-__-======-__-========-_____-============-__      "
                DB  13,10,              "                     _(                                                 _)     "
                DB  13,10,              "                  OO(                                                    )_    "
                DB  13,10,              "                 0  (_            To Choose Or Not To Choose.....        _)    "
                DB  13,10,              "                0  (_                                                   _)     "
                DB  13,10,              "               o0     (_                                                _)     "
                DB  13,10,              "              o         '=-___-===-_____-========-___________-===-dwb-='       "
                DB  13,10,              "            .o                                _________                        "
                DB  13,10,              "           . ______          ______________  |         |      _____            "
                DB  13,10,              "         _()_||__|| ________ |            |  |_________|   __||___||__         "  
                DB  13,10,              "        (KTM M'SIA| |      | |            | __Y______00_| |_         _|        "
                DB  13,10,              "       /-OO----OO'''='OO--OO'='OO--------OO'='OO-------OO'='OO-------OO'=P     "
                DB	13,10,				"=============================== Route Option ================================="
				DB	13,10,13,10,    	"                               Choose Route:                                   "
				DB 	13,10,       		"                          [1] Route Kedah > Johor                              "
				DB 	13,10, 				"                          [2] Route Johor > Kedah                              "
				DB 	13,10,          	"                   --------- Please Enter Number ---------                    $"
	ROUTE_TXT	DB 	13,10,13,10,	    "                            Your option : 	$                                   "
				
	ERROR_MSS1	DB	13,10,				"                        !!! Please enter 1 or 2 !!!                            $"
	ROUTE_OPT	DB 	0

;----------------------------------------------------------- END ROUTE OPTION PAGE -----------------------------------------------------------;

;---------------------------------------------------------------- VIEW MAP PAGE --------------------------------------------------------------;
	; declare var for view map page
	KDH_ROUTE	DB	13,10,				"=================================== View Map ==================================="
				DB	13,10
				DB 	13,10,				"                               Route Kedah > Johor                             "
				DB 	13,10, 				"$"
	JHR_ROUTE	DB	13,10,				"=================================== View Map ==================================="
				DB	13,10
				DB 	13,10,				"                               Route Johor > Kedah								"
				DB 	13,10, 				"$"			
	VMAP_MENU	DB 	13,10,				"        |-----+------+-----+-----+-----+-----+-----+-----+-----+-----|         "
				DB 	13,10,				"             KDH    PRK   KTN   TRG    PHG   SGR   NSN   MLK   JHR	            "	 
				
				DB 	13,10,13,10,		"                   [1] Kedah (KDH)        [6] Selangor (SGR)                   "
				DB 	13,10,				"                   [2] Perak (PRK)        [7] N.Sembilan (NSN)                 "
				DB 	13,10,				"                   [3] Kelantan (KTN)     [8] Malacca (MLK)                    "
				DB 	13,10,				"                   [4] Terengganu (TRG)   [9] Johor (JHR)                      "
				DB	13,10, 				"                   [5] Pahang (PHG)"
				
				DB 	13,10,13,10,		"                   ----------- Please Enter Number -----------                $"
	DEP_TEXT	DB 	13,10,13,10,		"                           Department     :  $                                 "
	DEST_TEXT	DB 	13,10, 				"                           Destination    :  $                                 "
	TICKET_TEXT	DB 	13,10,				"                           Ticket Amount  :  $                                 "
	B_OR_CONT	DB 	13,10,13,10,13,10,	"[B]BACK                                            PRESS ANY KEY TO CONTINUE..$"
    CONT_TXT    DB  13,10,13,10,13,10,  "                                                 Press Any Key To Continue....$"
    CONT_TXT1   DB  13,10,              "                                                 Press Any Key To Continue....$"
	ERROR_MSS2	DB	13,10,				"                   !! Invalid Input. Please insert 1 to 9 !!                  $"
	ERROR_MSS3	DB 	13,10,				"               !! Invalid Route. This is Kedah to Johor route. !!             $"
	ERROR_MSS4	DB 	13,10,				"               !! Invalid Route. This is Johor to Kedah route. !!             $"
	ERROR_MSS5	DB 	13,10,				"     !! Invalid Input. MINIMUM 1 ticket and MAXIMUM 10 ticket to buy. !!      $"
	
    ; calculation purpose
	COUNT		DB	0
	BACK_V		DB	0
	DEPART_V 	DB	0
	DESTIN_V	DB 	0
	TICKET_V	DB	0
	TICKET_V1	DB	0
	TICKET_V2	DB	0
	JOURNEY_V	DW 	0
	TTL_AMT		DW 	0
	TEN			DB 	10
	Q1			DB	0
	R1			DB 	0
	Q2			DB	0
	R2			DB 	0
	
;---------------------------------------------------------------- END VIEW MAP PAGE ----------------------------------------------------------;

;; jw code
;------------------------------------------------------ SHOW PRICE PAGE-----------------------------------------------------------;
; Design UI
; declare var for show price page						
	SPRICE_TXT   	DB 13,10,13,10,         "  ============================================================================"
					DB 13,10,               "  |               _.-------._                                                |"
					DB 13,10,               "  |            _-'_.------._ `-_                                             |"
					DB 13,10,               "  |          _- _-          `-_/       ____  ____  ___ ____ _____            |"
					DB 13,10,               "  |         -  -                       |  _ \|  _ \|_ _/ ___| ____|          |"
					DB 13,10,               "  |     ___/  /______________          | |_) | |_) || | |   |  _|            |"
					DB 13,10,               "  |    /___  .______________/          |  __/|  _ < | | |___| |___           |"
					DB 13,10,               "  |    ___| |_____________             |_|   |_| \_\___\____|_____|          |"
                    DB 13,10,               "  |    /___  .____________/                                                  |"
                    DB 13,10,               "  |        \  \                                                              |$"
    SPRICE_TXT2     DB 13,10,               "  =================== These are the details of your purchases ================$"
    SPRICE_TXT3     DB 13,10,13,10,13,10,   "                 Starting Point              :      $"
    SPRICE_TXT4     DB 13,10,               "                 Ending Point                :      $"
    SPRICE_TXT5     DB 13,10,               "                 Number of station travelled :      $"
    SPRICE_TXT6     DB 13,10,               "                 Number of tickets purchased :      $" 
	SPRICE_TXT7		DB 13,10,				"                 Sub-Total                   :      RM $"

	
	STATE1          DB "KEDAH (KDH)$"
    STATE2          DB "PERAK (PRK)$"
    STATE3          DB "KELANTAN (KTN)$"
    STATE4          DB "TERENGGANU (TRG)$"
    STATE5          DB "PAHANG (PHG)$"
    STATE6          DB "SELANGOR (SGR)$"
    STATE7          DB "N.SEMBILAN (NSN)$"
    STATE8          DB "MALACCA (MLK)$"
    STATE9          DB "JOHOR (JHR)$"
	
	START_P			DB 	0
	COUNT2			DB 	0
	Q3				DB	0
	R3				DB	0
;--------------------------------------------------- END GUEST SHOW PRICE VARIABLES ----------------------------------------------------------;

;------------------------------------------------------------- PAYMENT PAGE ------------------------------------------------------------------;
	; declare var for cash payment page
    ; Design UI
	PAY_TXT	    DB  13,10,13,10,        "================================================================================"
                DB	13,10,13,10,	    "  +------+.          ____   _ __   ____  __ _____ _   _ _____        .+------+"
                DB  13,10,              "  |`.    | `.       |  _ \ / \\ \ / /  \/  | ____| \ | |_   _|     .' |    .'|"
                DB  13,10,              "  |  `+--+---+      | |_) / _ \\ V /| |\/| |  _| |  \| | | |      +---+--+'  |"
                DB  13,10,              "  |   |  |   |      |  __/ ___ \| | | |  | | |___| |\  | | |      |   |  |   |"
                DB  13,10,              "  +---+--+.  |      |_| /_/   \_\_| |_|  |_|_____|_| \_| |_|      |  .+--+---+"
                DB  13,10,              "   `. |    `.|                                                    |.'    | .' "
                DB  13,10,              "     `+------+                                                    +------+'   "
                DB  13,10,13,10,        "================================= Payment Page ================================="
				DB 	13,10,13,10,13,10, 	"                          Sub-Total       :    RM $                            "              
	PAY_TXT2  	DB 	13,10,				"                          Member Discount :    $                               "
	PAY_TXT3	DB	13,10,				"                          Tax Total       :    $                               "
	PAY_TXT4	DB 	13,10,				"                          Total Amount    :    RM $                            "
    ECOIN_BALANCE	DB 	13,10,		    "                          E-Coin Balance  :    $                               "
	PAY_TXT5	DB 	13,10,13,10,13,10,	"                       Enter your pay amount :     RM $                        "
	PAY_TXT6	DB 	13,10,13,10,		"                       Cash                  :     RM $                        "
	PAY_TXT7	DB 	13,10,				"                       Change                :     RM $                        "
    ERROR_MSS6		DB 	13,10,				"  Invalid input. Kindly enter pay amount greater than or equal  total amount  $"
    TOPUP_OPTION 	DB 	13,10,				"                                Wish to top up?                                "
					DB 	13,10,				"                                   [1] Yes                                     "
					DB 	13,10, 				"                                   [2] No                                     $"
	TOPUP_OPT_TXT   DB 	13,10,				"                            Enter your option:    $                            "
    ERRPAY_TXT      DB  13,10,              "                         !!! Please Enter 0 ~ 9 !!!                           $"
    BAL_ERR_TXT     DB  13,10,              "                        !!! Insufficient Balance !!!                           "
                    DB  13,10,              "                          Press Enter To Continue.....                        $"
	COUNT3			DB 	0
	COUNT4			DB 	0
	USERTYPE		DB  1 ; later ny change when compile if jw code
	DIS_FIFTYTXT	DB 	"50%$"
	DIS_NINTYTXT	DB 	"10%$"
	MEMBER_DISC		DW 	0
	Q4				DB	0
	R4				DB	0
	Q5				DB	0
	R5				DB	0
	Q6				DB	0
	R6				DB	0
	Q7				DB	0
	R7				DB	0
	U_PAY1			DW 	0
	U_PAY2			DW	0
	U_PAY3			DW 	0
	U_TPAY			DW	0
	U_HUNDRED		DW	0
	HUN_VALUE		DW	0
	TEN_VALUE		DW 	0
	CHANGE			DW 	0
	HUNDRED			DW	100
	TEN_W           DW  10
	FIFTY			DW 	50
	NINTY			DW 	90
	REMAIN			DW 	0
	TOPUP_VALUE		DB 	0
    CAL_TEMP1       DW  0
    CAL_TEMP2       DW  0
    CAL_TEMP3       DW  0
    P2HUNDREDV      DW  0
    P2TENV          DW  0
    P2ONEV          DW  0
    PTTLTEMP        DW  0
    PQ1             DB  0
    PR1             DB  0
    P2Q1            DB  0
    P2Q2            DB  0
    P2R1            DB  0
    P2R2            DB  0
    PTEMP           DB  3 DUP (0), "$"
;--------------------------------------------------------- END PAYMENT PAGE ---------------------------------------------------------------------;

;---------------------------------------------------------- RECEIPT PAGE ------------------------------------------------------------------------;
    RECEIPT_TXT         DB 13,10,                    "    .-----------------------------------------------------------------------.  "
                        DB 13,10,                    "   /   .-.       @@\     @@\           @@\                 @@\          .-.  \ "
                        DB 13,10,                    "  |  /    \      @@ |    \__|          @@ |                @@ |        /   \  |"
                        DB 13,10,                    "  | |\_.  |    @@@@@@\   @@\  @@@@@@@\ @@ |  @@\  @@@@@@\@@@@@@\      |    /| |"
                        DB 13,10,                    "  |\|  | /|    \_@@  _|  @@ |@@  _____|@@ | @@  |@@  __@@\_@@  _|     |\  | |/|"
                        DB 13,10,                    "  | `---' |      @@ |    @@ |@@ /      @@@@@@  / @@@@@@@@ |@@ |       | `---' |"
                        DB 13,10,                    "  |       |      @@ |@@\ @@ |@@ |      @@  _@@\  @@   ____|@@ |@@\    |       |"
                        DB 13,10,                    "  |       |      \@@@@ | @@ |\@@@@@@@\ @@ | \@@\ \@@@@@@@\ \@@@@  |   |       |"
                        DB 13,10,                    "  |       |       \____/ \__| \_______|\__|  \__| \_______| \____/    |       |"
                        DB 13,10,                    "  |       |  .-.-.     .-.-.     .-.-.     .-.-.     .-.-.     .-.-.  |       |"
                        DB 13,10,                    "  |       |                                                           |       |"
                        DB 13,10,                    "  |       |     Department         :            $                              "                                      
    RECEIPT_TXT2        DB 13,10,                    "  |       |                                                           |       |"
                        DB 13,10,                    "  |       |     Destination        :            $                              "        
    RECEIPT_TXT3        DB 13,10,                    "  |       |                                                           |       |"
                        DB 13,10,                    "  |       |     Ticket Amount      :            $                              "       
    RECEIPT_TXT4        DB 13,10,                    "  |       |                                                           |       |"
                        DB 13,10,                    "  |       |           !!! Wish y'all have a fun trip !!!              |       |"
                        DB 13,10,                    "  |       |                                                           |       |"
                        DB 13,10,                    "  |       |         Presented to you by   :   KTM M'sia               |       |"
                        DB 13,10,                    "  |       |                                                           |       |"
                        DB 13,10,                    "  \       |___________________________________________________________|       /"
                        DB 13,10,                    "   \     /                                                             \     / "
                        DB 13,10,                    "    `---'                                                               `---' $"
    JUMP_COND           DB 0
;----------------------------------------------------------- END RECEIPT PAGE -------------------------------------------------------------------;

;---------------------------------------------------------- CONTINUE PAGE VARIABLES ------------------------------------------------------------;
    CONTINUE_TXT1       DB 13,10,13,10,13,10,13,10, "    .-=~=-.                                                           .-=~=-."
                        DB 13,10,                   "    (__  _)-._.-=-._.-=-._.-=-._.-=-._.-=-._.-=-._.-=-._.-=-._.-=-._.-(__  _)"
                        DB 13,10,                   "    ( _ __)                                                           ( _ __)"
                        DB 13,10,                   "    (__  _)                                                           (__  _)"
                        DB 13,10,                   "    (_ ___)                                                           (_ ___)"
                        DB 13,10,                   "    (__  _)                                                           (__  _)"
                        DB 13,10,                   "    ( _ __)                                                           ( _ __)"
                        DB 13,10,                   "    (__  _)              Do You Wish To Continue? (Y/N)....           (__  _)"
                        DB 13,10,                   "    (_ ___)                                                           (_ ___)"
                        DB 13,10,                   "    (__  _)                                                           (__  _)"
                        DB 13,10,                   "    ( _ __)                                                           ( _ __)"
                        DB 13,10,                   "    (__  _)                                                           (__  _)"
                        DB 13,10,                   "    (_ ___)-._.-=-._.-=-._.-=-._.-=-._.-=-._.-=-._.-=-._.-=-._.-=-._.-(_ ___)"
                        DB 13,10,                   "    `-._.-'                                                           `-._.-'$"
    ERR_CONT_TXT        DB 13,10,13,10,             "                       !!!Invalid Input, Please Try Again!!!$"
    CONT_OPT            DB 0

;--------------------------------------------------------- END CONTINUE PAGE VARIABLES ---------------------------------------------------------;


.CODE
MAIN PROC
    MOV AX, @DATA 
    MOV DS, AX 

    ; Code Start------------------------------------------------------------------------------------------------------------------------------;
    
    ; cls whole screen
    MOV AH, 00H                                 
    MOV AL, 02H 
    INT 10H 

    ; starts with logo
    JMP LOGO

    ; Comparing COND to 1, if true, jump start (continue programme), else, jmp condelse (terminate programme)
    MOV AL, COND                               
    CMP AL, 1
    JE START 
    JNE SHUTDOWN  ; jump not equal

    ;--------------------------------- LOGO PAGE ------------------------------;
    LOGO:
        MOV AH, 09H
        LEA DX, LOGO_TXT
        INT 21H

        PUSH CX
        PUSH AX
        PUSH DX
        PUSH BX
        MOV AH, 08H
        INT 21H
        POP BX
        POP AX
        POP DX
        POP CX
        JMP START

    ;------------------------------- WELCOME PAGE ----------------------------;
    START: 
        ; cls whole screen
        MOV AH, 00H                                 
        MOV AL, 02H 
        INT 10H 
        ; Display Main Menu
        MOV AH, 09H
        LEA DX, WELCOME_TXT
        INT 21H
        MOV AH, 09H
        LEA DX, WELCOME_TXT2
        INT 21H
        MOV AH, 09H
        LEA DX, WELCOME_OPT_TXT
        INT 21H

        ; input string
        MOV AH, 0AH  
        LEA DX, A_WELCOME_OPT
        INT 21H 

        ; User Login Option 
        MOV AL, 0   ; clear al
        CMP WELCOME_OPT, "1"
        JE LOGIN    ; jump equal 
        JL WELCOME_ERR
        CMP WELCOME_OPT, "2"
        JE REGISTER 
        CMP WELCOME_OPT, "3"
        JE CHOOSEROUTE 
        CMP WELCOME_OPT, "4"
        JE SHUTDOWN
        JG WELCOME_ERR

    WELCOME_ERR:
        ; show error message and press any key to continue
        MOV AH, 09H
        LEA DX, WELCOME_ERR_TXT
        INT 21H
        PUSH CX
        PUSH AX
        PUSH DX
        PUSH BX
        MOV AH, 08H
        INT 21H
        POP BX
        POP AX
        POP DX
        POP CX
        JMP START

    ;---------------------------- LOGIN PAGE ---------------------------------;
    LOGIN:
        ; declare usertype as member
        MOV BL, 1
        MOV USERTYPE, BL

        MOV AH, 00H     ; clear screen                          
        MOV AL, 02H 
        INT 10H
        MOV AH, 02H     ; display new line
        MOV DL, 13
        INT 21H
        MOV AH, 02H     ; display carriage
        MOV DL, 10
        INT 21H
        LINPUT:
            ; Display login page
            MOV AH, 09H
            LEA DX, LOGIN_TXT
            INT 21H
            MOV AH, 09H
            LEA DX, LOGIN_TXT2
            INT 21H
            MOV AH, 09H
            LEA DX, USERNAME_TXT
            INT 21H
            ; Login: Get input username
            MOV AH, 0AH
            MOV DX, OFFSET A_USERNAME
            INT 21H
            MOV AH, 09H
            LEA DX, PASSWORD_TXT
            INT 21H
            ; Login: Get input password
            MOV AH, 0AH
            MOV DX, OFFSET A_PASS
            INT 21H

        ; Validate username
        MOV AH,3DH
        LEA DX, NUFILE
        MOV AL,0  ; 0 -> reading purpose
        INT 21H
        MOV HANDLE,AX
        MOV AH,3FH  ; read from file
        MOV BX,HANDLE
        MOV DX,OFFSET(UBUFFER)   ; store string into buffer
        MOV CX,8
        INT 21H
        ; close file
        MOV AH, 3EH
        MOV BX, HANDLE
        INT 21H

        ; load password from file
        MOV AH,3DH
        LEA DX, NPFILE
        MOV AL,0                    ; 0 -> reading purpose
        INT 21H
        MOV HANDLE2,AX
        MOV AH,3FH                  ; read from file
        MOV BX,HANDLE2
        MOV DX,OFFSET(PBUFFER)      ; store string into buffer
        MOV CX,8
        INT 21H
        MOV AH, 3EH                 ; close file
        MOV BX, HANDLE2
        INT 21H

        ; compare input username and actual username
        UCMP:
            MOV SI, 0
            UL3:
                CMP SI, 8  
                JE PCMP
                JNE UL1
            UL1:
                MOV BL, USERNAME[SI]
                CMP BL, UBUFFER[SI]
                JE UL2
                JNE ERRUNAME
            UL2:
                INC SI
                JMP UL3

        ; compare input username and actual username
        PCMP:
            MOV SI, 0
            PL3:
                CMP SI, 8
                JE AGE_COND
                JNE PL1
            PL1:
                MOV BL, PASSWORD[SI]
                CMP BL, PBUFFER[SI]
                JE PL2
                JNE ERRPASS
            PL2:
                INC SI
                JMP PL3

        AGE_COND:
            ; Set age discount condition
            ; Load age from file
            MOV AH,3DH
            LEA DX, NAFILE
            MOV AL,0  ; 0 -> reading purpose
            INT 21H
            MOV HANDLE,AX
            MOV AH,3FH  ; read from file
            MOV BX,HANDLE
            MOV DX,OFFSET(ABUFFER)   ; store string into buffer
            MOV CX,2
            INT 21H
            ; close file
            MOV AH, 3EH
            MOV BX, HANDLE
            INT 21H

            MOV SI, 0
            MOV AX, 0
            MOV AL, ABUFFER[SI]
            CMP AL, "2"
            JGE LCHK_AGE
            JLE LAGE_DISCOUNT

            LCHK_AGE:
                CMP AL, "6"
                JGE LAGE_DISCOUNT
                JLE CHOOSEROUTE
            
            LAGE_DISCOUNT:
                MOV BL, 0
                MOV USER_AGE, BL
                JMP CHOOSEROUTE

        ERRUNAME:   
            MOV AH, 09H
            LEA DX, UNAME_ERROR_TXT
            INT 21H
            PUSH CX
            PUSH AX
            PUSH DX
            PUSH BX
            MOV AH, 08H
            INT 21H
            POP BX
            POP AX
            POP DX
            POP CX
            JMP START

        ERRPASS:
            MOV AH, 09H
            LEA DX, PASS_ERROR_TXT
            INT 21H
            PUSH CX
            PUSH AX
            PUSH DX
            PUSH BX
            MOV AH, 08H
            INT 21H
            POP BX
            POP AX
            POP DX
            POP CX
            JMP START

    ;----------------------------- REGISTER PAGE ---------------------------------;
    REGISTER:  
        ; declare usertype as member
        MOV BL, 1
        MOV USERTYPE, BL 

        MOV DX, 0      ; clear dx
        MOV AH, 00H    ; clear screen                                 
        MOV AL, 02H 
        INT 10H

        ; Display Register Page
        MOV AH, 09H
        LEA DX, REGISTER_TXT
        INT 21H
        MOV AH, 09H
        LEA DX, REGISTER_TXT2  
        INT 21H
        ; Register user info into their respective veriables
        MOV AH, 09H
        LEA DX, REG_NAME_TXT
        INT 21H
        GETUNAME:
            MOV AH, 0AH
            MOV DX, OFFSET REG_USERNAME
            INT 21H
            ; convert array to string (for writing to file)
            MOV SI, OFFSET REG_USERNAME + 2
            MOV CL, [SI]
            MOV CH, 0
            INC CX
            ADD SI, CX
            MOV AL, 0
            MOV [SI], AL
            ; open username file
            MOV AH, 3DH
            MOV AL, 1       ; 0 -> for reading, 1 -> for writing, 2 -> for both
            MOV DX, OFFSET NUFILE
            INT 21H
            MOV HANDLE, AX
            MOV DI, 1
            ; JC ERR_SEEK
            UINPUT:
            ; input text into username file
            MOV AH, 40H
            MOV BX, HANDLE
            MOV DX, OFFSET REG_USERNAME + 2
            MOV CX, 8
            INT 21H
            DEC DI
            JNZ UINPUT
            ; close file
            MOV AH, 3EH
            MOV BX, HANDLE
            INT 21H

        ; Register: Get input password
        MOV AH, 09H
        LEA DX, REG_PASS_TXT
        INT 21H
        GETRPASS:
            MOV AH, 0AH
            MOV DX, OFFSET REG_PASS
            INT 21H
            ; convert array to string (for writing to file)
            MOV SI, OFFSET REG_PASS + 2
            MOV CL, [SI]
            MOV CH, 0
            INC CX
            ADD SI, CX
            MOV AL, 0
            MOV [SI], AL
            ; open password file
            MOV AH, 3DH
            MOV AL, 1       ; 0 -> for reading, 1 -> for writing, 2 -> for both
            MOV DX, OFFSET NPFILE
            INT 21H
            MOV HANDLE, AX
            MOV DI, 1
            PINPUT:
            ; input text into file
            MOV AH, 40H
            MOV BX, HANDLE
            MOV DX, OFFSET REG_PASS + 2
            MOV CX, 8
            INT 21H
            DEC DI
            JNZ PINPUT
            ; close file
            MOV AH, 3EH
            MOV BX, HANDLE
            INT 21H

        ; Register: Get input age
        MOV AH, 09H
        LEA DX, REG_AGE_TXT
        INT 21H
        GETRAGE:
            MOV AH, 0AH
            MOV DX, OFFSET REG_AGE
            INT 21H
            ; convert array to string (for writing to file)
            MOV SI, OFFSET REG_AGE + 2
            MOV CL, [SI]
            MOV CH, 0
            INC CX
            ADD SI, CX
            MOV AL, 0
            MOV [SI], AL
            ; open age file
            MOV AH, 3DH
            MOV AL, 1       ; 0 -> for reading, 1 -> for writing, 2 -> for both
            MOV DX, OFFSET NAFILE
            INT 21H
            MOV HANDLE, AX
            MOV DI, 1
            AINPUT:
            ; input text into file
            MOV AH, 40H
            MOV BX, HANDLE
            MOV DX, OFFSET REG_AGE + 2
            MOV CX, 2
            INT 21H
            DEC DI
            JNZ AINPUT
            ; close file
            MOV AH, 3EH
            MOV BX, HANDLE
            INT 21H
        
        ; Set age discount condition
        ; Load age from file
        MOV AH,3DH
        LEA DX, NAFILE
        MOV AL,0  ; 0 -> reading purpose
        INT 21H
        MOV HANDLE,AX
        MOV AH,3FH  ; read from file
        MOV BX,HANDLE
        MOV DX,OFFSET(ABUFFER)   ; store string into buffer
        MOV CX,2
        INT 21H
        ; close file
        MOV AH, 3EH
        MOV BX, HANDLE
        INT 21H

        INT 21H
        MOV AH, 09H
        LEA DX, REG_SUCCESS
        INT 21H   

        ; ; Discount Condition  
        ; MOV SI, 0
        ; MOV AX, 0
        ; MOV AL, ABUFFER[SI]
        ; CMP AL, "2"
        ; JGE RCHK_AGE1
        ; JLE RAGE_DISCOUNT

        ; RCHK_AGE1:
        ;     CMP AL, "6"
        ;     JGE RAGE_DISCOUNT
        
        ; RAGE_DISCOUNT:
        ;     MOV BL, 0
        ;     MOV USER_AGE, BL
        JMP TOPUP

    ;------------------------------ MEMBER TOPUP PAGE -----------------------------------;
    TOPUP:
        ; cls whole screen
        MOV AH, 00H                                 
        MOV AL, 02H 
        INT 10H 
        ; display topup page
        MOV AH, 09H
        LEA DX, TOPUP_TXT
        INT 21H
        MOV AH, 09H
        LEA DX, TOPUP_TXT2
        INT 21H
        MOV AH, 09H
        LEA DX, TOPUP_TXT3
        INT 21H
        MOV AH, 09H
        LEA DX, TOPUP_TXT4
        INT 21H
        ; ask for user topup amount
        MOV AH, 01H      
        INT 21H
        MOV TOPUP_CHOICE,AL 
        ; open topup file
        MOV AH, 3DH
        MOV AL, 1       ; 0 -> for reading, 1 -> for writing, 2 -> for both
        MOV DX, OFFSET NTFILE
        INT 21H
        MOV HANDLE, AX
        
    ; validate user input range from 1-9 (inclusive)
    CHKTOPUP:   
        MOV BL, TOPUP_CHOICE
        CMP BL, "1"
        JL ERR_TOPUP
        CMP BL, "9"
        JG  ERR_TOPUP
        JLE CMPTOPUP      ; jump to save to file function
    
    ; store user topup amount into a variable called TOPUP_AMOUNT
    CMPTOPUP:
        CMP TOPUP_CHOICE, "1"
        JE T1
        CMP TOPUP_CHOICE, "2"
        JE T2
        CMP TOPUP_CHOICE, "3"
        JE T3
        CMP TOPUP_CHOICE, "4"
        JE T4
        CMP TOPUP_CHOICE, "5"
        JE T5
        CMP TOPUP_CHOICE, "6"
        JE T6
        CMP TOPUP_CHOICE, "7"
        JE T7
        CMP TOPUP_CHOICE, "8"
        JE T8
        CMP TOPUP_CHOICE, "9"
        JE T9                 
        T1:
            ; input text into file
            MOV AH, 40H
            MOV BX, HANDLE
            MOV CX, 2     
            MOV DX, OFFSET TTL_TOPUP1
            INT 21H
            JMP S_TOPUP
        T2:
            ; input text into file
            MOV AH, 40H
            MOV BX, HANDLE
            MOV CX, 2     
            MOV DX, OFFSET TTL_TOPUP2
            INT 21H
            JMP S_TOPUP
        T3:
            ; input text into file
            MOV AH, 40H
            MOV BX, HANDLE
            MOV CX, 2     
            MOV DX, OFFSET TTL_TOPUP3
            INT 21H
            JMP S_TOPUP
        T4:
            ; input text into file
            MOV AH, 40H
            MOV BX, HANDLE
            MOV CX, 3     
            MOV DX, OFFSET TTL_TOPUP4
            INT 21H
            JMP S_TOPUP
        T5:
            ; input text into file
            MOV AH, 40H
            MOV BX, HANDLE
            MOV CX, 3     
            MOV DX, OFFSET TTL_TOPUP5
            INT 21H
            JMP S_TOPUP
        T6:
            ; input text into file
            MOV AH, 40H
            MOV BX, HANDLE
            MOV CX, 3     
            MOV DX, OFFSET TTL_TOPUP6
            INT 21H
            JMP S_TOPUP
        T7:
            ; input text into file
            MOV AH, 40H
            MOV BX, HANDLE
            MOV CX, 3     
            MOV DX, OFFSET TTL_TOPUP7
            INT 21H
            JMP S_TOPUP
        T8:
            ; input text into file
            MOV AH, 40H
            MOV BX, HANDLE
            MOV CX, 3     
            MOV DX, OFFSET TTL_TOPUP8
            INT 21H
            JMP S_TOPUP
        T9:
            ; input text into file
            MOV AH, 40H
            MOV BX, HANDLE
            MOV CX, 3     
            MOV DX, OFFSET TTL_TOPUP9
            INT 21H
            JMP S_TOPUP

    S_TOPUP:
        ; close file
        MOV AH, 3EH
        MOV BX, HANDLE
        INT 21H

        MOV AH, 09H
        LEA DX, S_TOPUPTXT
        INT 21H    
        ;PRESS ANY KEY TO CONTINUE
        PUSH CX
        PUSH AX
        PUSH DX
        PUSH BX
        MOV AH, 08H
        INT 21H
        POP BX
        POP AX
        POP DX
        POP CX
        JMP CHOOSEROUTE
    
    ; show error message
    ERR_TOPUP:
        MOV AH, 09H
        LEA DX, ERR_TOPUPTXT1
        INT 21H
        MOV AH, 09H
        LEA DX, CONTINUE_TXT
        INT 21H
        ;PRESS ANY KEY TO CONTINUE
        PUSH CX
        PUSH AX
        PUSH DX
        PUSH BX
        MOV AH, 08H
        INT 21H
        POP BX
        POP AX
        POP DX
        POP CX
        JMP TOPUP           ; require user to input again


    ;---------------------------------------- ROUTE OPTION PAGE -------------------------------------------;
    ; display route option menu
	CHOOSEROUTE:
        ; clear all var for back purpose  
        MOV START_P, 0
        MOV COUNT, 0
        MOV COUNT2,0
        MOV BACK_V, 0
        MOV DEPART_V, 0
        MOV DESTIN_V, 0
        MOV TICKET_V, 0
        MOV TICKET_V1, 0
        MOV TICKET_V2, 0
        MOV JOURNEY_V, 0
        MOV TTL_AMT, 0
        MOV Q1, 0
        MOV R1, 0
        MOV Q2, 0
        MOV R2, 0
        ; cls whole screen
        MOV AH, 00H                                 
        MOV AL, 02H 
        INT 10H 
		MOV AH, 09H
		LEA DX, ROUTE_MENU
		INT 21H
	D_ROUTETXT:	
		MOV AH, 09H
		LEA DX, ROUTE_TXT
		INT 21H
		; get route option from user
		MOV AH, 01H
		INT 21H
		MOV ROUTE_OPT, AL
		; compare route option input by user with 1 and 2
		CMP ROUTE_OPT, "1"
		JE 	D_CONTINUE1
		CMP	ROUTE_OPT, "2"
		JE	D_CONTINUE1
		JNE ERRORM_RP
	; display error message if not 1 or 2
	ERRORM_RP:
		MOV AH, 09H
		LEA DX, ERROR_MSS1
		INT 21H
		JMP D_ROUTETXT
	D_CONTINUE1:	
		MOV AH, 09H
        LEA DX, CONT_TXT
        INT 21H    
        ;PRESS ANY KEY TO CONTINUE
        PUSH CX
        PUSH AX
        PUSH DX
        PUSH BX
        MOV AH, 08H
        INT 21H
        POP BX
        POP AX
        POP DX
        POP CX

    
	;-----------------------------------------  VIEW MAP PAGE --------------------------------------------;
    ; display view map menu
	VMAP_PAGE:	
		; clear screen
		MOV AH, 00H
		MOV AL, 02H
		INT 10H
		; compare user input route option with 1 and 2
		; to determine which route text to display
		CMP ROUTE_OPT, "1"
		JE	D_KROUTE	
		CMP ROUTE_OPT, "2"
		JE 	D_JROUTE
	; display kedah to johor route
	D_KROUTE:	
		MOV AH, 09H
		LEA DX, KDH_ROUTE
		INT 21H
		JMP D_VMAP
	; display johor to kedah route
	D_JROUTE:
		MOV AH, 09H
		LEA DX, JHR_ROUTE
		INT 21H
		JMP D_VMAP
    ; display view map menu
	D_VMAP:
		MOV AH, 09H
		LEA DX, VMAP_MENU
		INT 21H
	; request departing point from user
	D_DEPTEXT:
		MOV AH, 09H
		LEA DX, DEP_TEXT
		INT 21H
		MOV AH, 01H
		INT 21H
		MOV DEPART_V, AL
		; validation (check input from 1 to  9)
		CMP DEPART_V, "1"
		JL	ERRORM_VM
		CMP DEPART_V, "9"
		JG 	ERRORM_VM
		JLE D_DESTXT
	; display error message
	ERRORM_VM:
		MOV AH, 09H
		LEA DX, ERROR_MSS2
		INT 21H
		JMP D_DEPTEXT
	; request destination point from user
	D_DESTXT:
		MOV AH, 09H
		LEA DX, DEST_TEXT
		INT 21H
		MOV AH, 01H
		INT 21H
		MOV DESTIN_V, AL
		; HEX > DEC
		SUB DEPART_V, 30H
		SUB	DESTIN_V, 30H
		; validation (check input from 1 to 9)
		CMP DESTIN_V, 1
		JL	ERRORM_VM2
		CMP DESTIN_V, 9
		JG 	ERRORM_VM2
		JLE CMPROUTE
	; display error message
	ERRORM_VM2:
		MOV AH, 09H
		LEA DX, ERROR_MSS2
		INT 21H
		JMP D_DESTXT
	; check if it invalid route based on route option
	CMPROUTE:
		CMP ROUTE_OPT, "1"
		JE	CHK_KROUTE
		CMP ROUTE_OPT, "2"
		JE 	CHK_JROUTE
	; check kedah to johor route
	; ensure department < destination
	CHK_KROUTE:
		MOV BL, DEPART_V
		CMP BL, DESTIN_V
		JG  ERRORM_VM3
		JNE D_TICTXT
	; check johor to kedah route
	; ensure department > destination
	CHK_JROUTE:
		MOV BL, DEPART_V
		CMP BL, DESTIN_V
		JL  ERRORM_VM4
		JNE D_TICTXT
	; display error message if invalid
	ERRORM_VM3:
		MOV AH, 09H
		LEA DX, ERROR_MSS3
		INT 21H
		JMP D_DEPTEXT
	; display error message if invalid
	ERRORM_VM4:
		MOV AH, 09H
		LEA DX, ERROR_MSS4
		INT 21H
		JMP D_DEPTEXT
	; request amount ticket needed from user
	D_TICTXT:	
		MOV AH, 09H
		LEA DX, TICKET_TEXT
		INT 21H
		MOV AH, 01H
		INT 21H
		MOV TICKET_V1, AL
		SUB	TICKET_V1, 30H
		MOV AH, 01H
		INT 21H
		MOV TICKET_V2, AL
		SUB TICKET_V2, 30H
	; check ticket (digit 1)
	CHK_TICKET1:
		CMP TICKET_V1, 1
		JL	TICKET_AMT
		CMP TICKET_V1, 9
		JG 	TICKET_AMT
		JNE CHK_TICKET2
	; check ticket (digit 2)
	CHK_TICKET2:
		ADD TICKET_V2, 30H
		CMP TICKET_V2, 13
		JE	CHK_ENTER
		JNE	TICKET_AMT
	CHK_ENTER:
		INC COUNT
		; avoid double checking 
		SUB TICKET_V2, 30H
		MOV BL, TICKET_V1
		MOV TICKET_V2, BL
		MOV TICKET_V1, 0
		JMP CAL_AMT
	TICKET_AMT:
		SUB TICKET_V2, 30H
	CAL_AMT:
		; calculate amount of ticket
		MOV AX, 0
		MOV AL, TICKET_V1
		MUL TEN
		ADD AL, TICKET_V2
		MOV TICKET_V, AL
		CMP COUNT2, 1
		JE 	D_NOTICK
		CMP COUNT, 1
		JE 	CMPROUTE2
		JNE CHK_TICK
	; check if the ticket amount in the range of 1 to 10(inclusive)
	CHK_TICK:
		MOV BL, TICKET_V
		CMP BL, 1
		JL 	ERRORM_VM5
		CMP BL, 10
		JG 	ERRORM_VM5
		JLE	CMPROUTE2
	; display error message if not in the range
	ERRORM_VM5:
		MOV AH, 09H
		LEA DX, ERROR_MSS5
		INT 21H
		JMP D_TICTXT
	; compare route and depends on route option to choose calculation method
	CMPROUTE2:	
		CMP ROUTE_OPT, "1"
		JE	CAL_TRAVEL1
		CMP ROUTE_OPT, "2"
		JE 	CAL_TRAVEL2
	; calculation1 = destination - department
	CAL_TRAVEL1:
		MOV BL, DESTIN_V
		SUB BL, DEPART_V
		MOV JOURNEY_V, BX
		CMP START_P, 1
		JE 	D_NOSTAT
		JNE CAL_TOTAL
	; calculation2 = department - destination
	CAL_TRAVEL2:	
		MOV BL, DEPART_V
		SUB BL, DESTIN_V
		MOV JOURNEY_V, BX
		CMP START_P, 1
		JE 	D_NOSTAT
		JMP CAL_TOTAL
	; multiply station travelled with its price(10)
	CAL_TOTAL:	
		MOV AX, 0
		MOV AX, JOURNEY_V
		MUL TEN
		MOV JOURNEY_V, AX
	; multiply station travelled price with total ticket amount
	CAL_TTLAMT:	
		MOV AX, JOURNEY_V
		MUL TICKET_V
		MOV TTL_AMT, AX
		; preparing in display total amount
		MOV AX, 0
		MOV AX, TTL_AMT
		DIV TEN
		MOV Q1, AL
		MOV R1, AH
		MOV AX, 0
		MOV AL, Q1
		DIV TEN
		MOV Q2, AL
		MOV R2, AH
		; dec > hex
		ADD Q2, 30H
		ADD R2, 30H
		ADD R1, 30H
		; ask user back to previous page or proceed to next page
		MOV AH, 09H
		LEA DX, B_OR_CONT
		INT 21H
		MOV AH, 07H
		INT 21H
		MOV BACK_V, AL
        MOV BL, BACK_V
        CMP BL, "b"
        JE CHOOSEROUTE
        JNE DISPLAYPRICE

    ;-------------------------- DISPLAY PRICE PAGE --------------------------------;
    DISPLAYPRICE:   
        ; clear screen
		MOV AH, 00H
		MOV AL, 02H
		INT 10H
		
		; display show price text
		MOV AH, 09H
		LEA DX, SPRICE_TXT
		INT 21H
		
		MOV AH, 09H
		LEA DX, SPRICE_TXT2
		INT 21H
		
		; display starting point text
		MOV AH, 09H
		LEA DX, SPRICE_TXT3
		INT 21H
		JMP LOOPING
		
	; search for the starting point and ending point 
	LOOPING:
		ADD DEPART_V, 30H 
		ADD DESTIN_V, 30H
		MOV SI, 0
		MOV BX, 0
		MOV BL, DEPART_V
		JMP NEXT_D
		
	; match input department and destination with respective value
	NEXT_D:	
		MOV BH, 0
		CMP BX, "1"
		JE STAT1	
		CMP BX, "2"
		JE STAT2
		CMP BX, "3"
		JE STAT3
		CMP BX, "4"
		JE STAT4
		CMP BX, "5"
		JE STAT5
		CMP BX, "6"
		JE STAT6
		CMP BX, "7"
		JE STAT7
		CMP BX, "8"
		JE STAT8
		CMP BX, "9"
		JE STAT9
		
	; display starting point and ending point if found
	STAT1:
		MOV AH, 09H
		LEA DX, STATE1
		INT 21H
		JMP D_DESTIN
	
	STAT2:
		MOV AH, 09H
		LEA DX, STATE2
		INT 21H
		JMP D_DESTIN
		
	STAT3:
		MOV AH, 09H
		LEA DX, STATE3
		INT 21H
		JMP D_DESTIN
		
	STAT4:
		MOV AH, 09H
		LEA DX, STATE4
		INT 21H
		JMP D_DESTIN
		
	STAT5:
		MOV AH, 09H
		LEA DX, STATE5
		INT 21H
		JMP D_DESTIN
		
	STAT6:
		MOV AH, 09H
		LEA DX, STATE6
		INT 21H
		JMP D_DESTIN
		
	STAT7:
		MOV AH, 09H
		LEA DX, STATE7
		INT 21H
		JMP D_DESTIN
		
	STAT8:
		MOV AH, 09H
		LEA DX, STATE8
		INT 21H
		JMP D_DESTIN
	
	STAT9:
		MOV AH, 09H
		LEA DX, STATE9
		INT 21H
		JMP D_DESTIN
	
	
	; jmp here to display ending point text
	; else , it will jmp to display number of station travelled text
	D_DESTIN:  
        CMP JUMP_COND, 1
        JE TICKET_CONT
        CMP JUMP_COND, 2
        JE TICKET_CONT2
	    MOV BL, DESTIN_V
		INC SI
		CMP SI, 1
		JE PRINT_T4
		JNE STAT_TRAVEL
	
	; display ending point text
	PRINT_T4:
		MOV AH, 09H
		LEA DX, SPRICE_TXT4
		INT 21H
		JMP NEXT_D
	
	; display number of station travelled text
	STAT_TRAVEL:
		MOV AH, 09H
		LEA DX, SPRICE_TXT5
		INT 21H
		
		SUB DEPART_V, 30H
		SUB DESTIN_V, 30H
		INC START_P
		
		; to cal the difference between destination and department
		; to get number of station travelled
		CMP ROUTE_OPT, "1"
		JE	CAL_TRAVEL1
		CMP ROUTE_OPT, "2"
		JE 	CAL_TRAVEL2
	
	; display number of station travelled
	D_NOSTAT: 
		ADD JOURNEY_V, 30H
		MOV AH, 02H
		MOV DX, JOURNEY_V
		INT 21H
		
		; display number of ticket purchased text
		MOV AH, 09H
		LEA DX, SPRICE_TXT6
		INT 21H
		INC COUNT2
		JMP CAL_AMT
	
	; display number of ticket purchased
	D_NOTICK:
		MOV AX, 0
		MOV AL, TICKET_V
		DIV TEN
		MOV Q3, AL
		MOV R3, AH
		
		ADD Q3, 30H
		ADD R3, 30H
		
        ; ignore 0
        CMP Q3, "0"
        JE DT2

        DT1:
            MOV AH, 02H
            MOV DL, Q3
            INT 21H
		DT2:
            MOV AH, 02H
            MOV DL, R3
            INT 21H
	
        CMP JUMP_COND, 3
        JE TICKET_CONT3 
		; display sub-total
		MOV AH, 09H
		LEA DX, SPRICE_TXT7
		INT 21H
	
		; display subtotal
	D_SUBTOTAL:

        CMP Q2, "0"
        JE PD2
        CMP R2, "0"
        JE PD3
        PD1:
            MOV AH, 02H
            MOV DL, Q2
            INT 21H
		PD2:
            MOV AH, 02H
            MOV DL, R2
            INT 21H
        PD3:
            MOV AH, 02H
            MOV DL, R1
            INT 21H
		
		CMP COUNT3, 1
		JE 	D_PAYTXT2	; jmp to display member discount
		CMP COUNT3, 3
		JE 	D_PAYTXT5	; jmp to ask user to input pay amount
		
	D_CONTINUE2:
		MOV AH, 09H
		LEA DX, B_OR_CONT
		INT 21H
		
		MOV AH, 07H
		INT 21H
        MOV BACK_V, AL
        MOV BL, BACK_V
        CMP BL, "b"
        JE CHOOSEROUTE
        JNE PAYMENT
    ;-------------------------- DISPLAY PAYMENT PAGE -------------------------------------; 
    PAYMENT:
        ; clear screen
		MOV AH, 00H
		MOV AL, 02H
		INT 10H
		
		; display sub total text
		MOV AH, 09H
		LEA DX, PAY_TXT
		INT 21H
		
		INC COUNT3		; count3 = 1
		JMP D_SUBTOTAL  ; to display subtotal
		
		; display member discount text
	D_PAYTXT2:
		MOV AH, 09H
		LEA DX, PAY_TXT2
		INT 21H
		; compare usertype = guest(0) or member(1)
		CMP USERTYPE, 0
		JE 	U_GUEST
		CMP USERTYPE, 1
		JE 	U_MEMBER
		
		; if usertype == guest
		; display 0 for member discount
	U_GUEST:
		CMP COUNT3, 2
		JE 	D_PAYTXT4
		JNE D_PAYTXT3
		
		; if usertype == member
		; calculate member discount
	U_MEMBER:
		CMP USER_AGE, 0 ; 0 is age < 20 or age > 60
		JE 	CAL_DISCOUNT0
		CMP USER_AGE, 1 ; 1 is age 20 <= age <= 60
		JE 	CAL_DISCOUNT1
		
		; age < 20 or age > 60 (*0.5)
	CAL_DISCOUNT0:
		; display 50 % 
		MOV AH, 09H
		LEA DX, DIS_FIFTYTXT
		INT 21H
		
		;  mutiply subtotal with 50 percent
		MOV AX, 0
		MOV AX, TTL_AMT
		MUL FIFTY
		DIV HUNDRED
		MOV MEMBER_DISC, AX
		JMP D_PAYTXT3
		
		; age 20 <= age <= 60 (*0.9)
	CAL_DISCOUNT1:
		; display 10%
		MOV AH, 09H
		LEA DX, DIS_NINTYTXT
		INT 21H
		
		; mutiply subtotal with 10 percent
		MOV AX, 0
		MOV AX, TTL_AMT
		MUL NINTY
		DIV HUNDRED
		MOV MEMBER_DISC, AX
		JMP D_PAYTXT3
	
		;  display tax total
	D_PAYTXT3:
		MOV AH, 09H
		LEA DX, PAY_TXT3
		INT 21H
        MOV AH, 02H
		MOV DL, "0"
		INT 21H
		
		INC COUNT3   		; count3 = 2
		; compare usertype = guest(0) or member(1)
		CMP USERTYPE, 0
		JE 	U_GUEST  		; display 0 for tax total if is guest 
		CMP USERTYPE, 1		
		JE 	U_GUEST			; display 0 for tax total if is member
		
		; display total amount text
	D_PAYTXT4:
		MOV AH, 09H
		LEA DX, PAY_TXT4
		INT 21H
		
		; compare usertype = guest(0) or member(1)
		CMP USERTYPE, 0
		JE 	TA_GUEST
		CMP USERTYPE, 1
		JE 	TA_MEMBER
		
	; display total amount for guest
	TA_GUEST:
		INC COUNT3			; count3 = 3
		JMP D_SUBTOTAL	

		; display total amount for member
	TA_MEMBER:
		; separate into digit
		MOV AX, 0
		MOV AX, MEMBER_DISC
		DIV TEN
		MOV Q4, AL
		MOV R4, AH
		
		MOV AX, 0
		MOV AL, Q4
		DIV TEN 
		MOV Q5, AL
		MOV R5, AH
		
		; dec > hex
		ADD Q5, 30H
		ADD R5, 30H
		ADD R4, 30H
		
        ; ignore 0
        CMP Q5, "0"
        JE MP2
        CMP R5, "0"
        JE MP3
		; display total amount
        MP1:
		    MOV AH, 02H
		    MOV DL, Q5
		    INT 21H
        MP2:
            MOV AH, 02H
            MOV DL, R5
            INT 21H
		MP3:
            MOV AH, 02H
            MOV DL, R4
            INT 21H
		
		; if usertype
		CMP USERTYPE, 0
		JE 	D_PAYTXT5
		CMP USERTYPE, 1
		JE 	D_ECOIN
		
	D_ECOIN:
		MOV AH, 09H
		LEA DX, ECOIN_BALANCE
		INT 21H
		
        ; Display Current e-coin balance
		; Load topup from file
        MOV AH,3DH
        LEA DX, NTFILE
        MOV AL,0  ; 0 -> reading purpose
        INT 21H
        MOV HANDLE,AX
        MOV AH,3FH  ; read from file
        MOV BX,HANDLE
        MOV DX,OFFSET(TBUFFER)   ; store string into buffer
        MOV CX,8
        INT 21H
        ; close file
        MOV AH, 3EH
        MOV BX, HANDLE
        INT 21H

        MOV AH, 09H
        MOV DX, OFFSET TBUFFER
        INT 21H
		
		
	; request user input pay amount
	D_PAYTXT5:
		MOV AH, 09H
		LEA DX, PAY_TXT5
		INT 21H
		
		; user input pay amount (digit 1)
		MOV AH, 01H
		INT 21H 
		MOV AH, 0
		MOV U_PAY1, AX
		
		; user input pay amount (digit 2)
		MOV AH, 01H
		INT 21H  
		MOV AH, 0
		MOV U_PAY2, AX
		
        ; check if user input enter
		CMP U_PAY2, 13
		JE 	SWITCH_VALUE1

		; user input pay amount (digit 3)
		MOV AH, 01H
		INT 21H   
		MOV AH, 0
		MOV U_PAY3, AX
		
		; check if user input enter 
		CMP U_PAY3, 13
		JE 	SWITCH_VALUE2
		JNE	HEX_TO_DEC
		
    ; if pay amount digit  is enter
    ; pay amount digit2 value move into pay amount digit3
    ; move 0 into pay amount digit1
    ; move 0 into pay amount digit2
	SWITCH_VALUE1:
		MOV BX, 0
		MOV BX, U_PAY1
		MOV U_PAY3, BX
		MOV U_PAY1, 30H
		MOV U_PAY2, 30H
		JMP CHKPAYINP1	
		
    ; pay amount digit2 value move into pay amount digit3
    ; pay amount digit1 value move into pay amount digit2
    ; 0 move into pay amount digit1
	SWITCH_VALUE2:
		MOV BX, 0
		MOV BX, U_PAY2
		MOV U_PAY3, BX
		
		MOV BX, 0
		MOV BX, U_PAY1
		MOV U_PAY2, BX
		
		MOV U_PAY1, 30H
		JMP CHKPAYINP1	
	
    CHKPAYINP1:   
        MOV BX, 0
        MOV BX, U_PAY1
        CMP BX, "0"
        JL CHKPAYINP2
        CMP BX, "1"
        JE CHKPAYINP2
        CMP BX, "2"
        JE CHKPAYINP2
        CMP BX, "3"
        JE CHKPAYINP2
        CMP BX, "4"
        JE CHKPAYINP2
        CMP BX, "5"
        JE CHKPAYINP2
        CMP BX, "6"
        JE CHKPAYINP2
        CMP BX, "7"
        JE CHKPAYINP2
        CMP BX, "8"
        JE CHKPAYINP2
        CMP BX, "9"
        JE CHKPAYINP2
        JG ERRPAY
    CHKPAYINP2:
        MOV BX, 0
        MOV BX, U_PAY2
        CMP BX, "0"
        JL ERRPAY
        JE CHKPAYINP3
        CMP BX, "1"
        JE CHKPAYINP3
        CMP BX, "2"
        JE CHKPAYINP3
        CMP BX, "3"
        JE CHKPAYINP3
        CMP BX, "4"
        JE CHKPAYINP3
        CMP BX, "5"
        JE CHKPAYINP3
        CMP BX, "6"
        JE CHKPAYINP3
        CMP BX, "7"
        JE CHKPAYINP3
        CMP BX, "8"
        JE CHKPAYINP3
        CMP BX, "9"
        JE CHKPAYINP3
        JG ERRPAY
    CHKPAYINP3:   
        MOV BX, 0
        MOV BX, U_PAY3
        CMP BX, "0"
        JL ERRPAY
        JE HEX_TO_DEC
        CMP BX, "1"
        JE HEX_TO_DEC
        CMP BX, "2"
        JE HEX_TO_DEC
        CMP BX, "3"
        JE HEX_TO_DEC
        CMP BX, "4"
        JE HEX_TO_DEC
        CMP BX, "5"
        JE HEX_TO_DEC
        CMP BX, "6"
        JE HEX_TO_DEC
        CMP BX, "7"
        JE HEX_TO_DEC
        CMP BX, "8"
        JE HEX_TO_DEC
        CMP BX, "9"
        JE HEX_TO_DEC
        JG ERRPAY
		
	HEX_TO_DEC:	
		; convert 3 input digit into a number
		; hex > dec
		SUB U_PAY1, 30H
		SUB U_PAY2, 30H
		SUB U_PAY3, 30H
		
		; input digit1 *= 100
		MOV AX, 0
		MOV AX, U_PAY1
		MUL HUNDRED
		MOV U_HUNDRED, AX
		
		; input digit2 *= 10
		; total input digit = input digit2 + input digit1 + input digit3
		MOV AX, 0
		MOV AX, U_PAY2
		MUL TEN
		ADD AX, U_HUNDRED
		ADD AX, U_PAY3
		MOV U_TPAY, AX
		 
		CMP USERTYPE, 0
		JE 	CHK_TOTALPAY0
		CMP USERTYPE, 1
		JE 	CHK_TOTALPAY1
		
	; check total pay amount when usertype is guest(0)
	CHK_TOTALPAY0:
		MOV BX, 0
		MOV BX, U_TPAY
		CMP BX, TTL_AMT
		JL 	D_ERRORMESS1
		JGE CAL_CHANGE
		
	; display error message when pay amount < total amount
	D_ERRORMESS1:
		MOV AH, 09H
		LEA DX, ERROR_MSS6 
		INT 21H
		JMP D_PAYTXT5
		
	; check total pay amount when usertype is member(1)
	CHK_TOTALPAY1:	
		MOV BX, 0
		MOV BX, U_TPAY
		CMP BX, MEMBER_DISC
		JL 	D_ERRORMESS2
		JGE CONVERT
	
	D_ERRORMESS2:
		; display error message when pay amount < total amount
		MOV AH, 09H
		LEA DX, ERROR_MSS6
		INT 21H
		
        
		; ask user whether want to TOP UP or not
		MOV AH, 09H
		LEA DX, TOPUP_OPTION
		INT 21H
		
		MOV AH, 09H
		LEA DX, TOPUP_OPT_TXT
		INT 21H
		
		MOV AH, 01H
		INT 21H    
		MOV AH, 0
		MOV TOPUP_VALUE, AL
		
		MOV BX, 0
		MOV BL, TOPUP_VALUE
		CMP BL, "1"
		JE 	SECTOPUP                  ; jmp to topup 2 then jump back to payment page
		CMP BL, "2"
		JE 	D_PAYTXT5
		
	; transfer MEMBER_DISC value to TTL_AMT
	CONVERT:	
		MOV BX, 0
		MOV BX, MEMBER_DISC
		MOV TTL_AMT, BX

        ; Deduct amount paid from user e-coin balance
        ; process data from file into whole unmber
        MOV AX, 0
        MOV AX, TBUFFER[0]              
        SUB AX, 30H     
        MOV AH, 0
        MUL HUNDRED     
        MOV P2HUNDREDV, AX  ; hundreds
        MOV AX, 0
        MOV AX, TBUFFER[1]    
        SUB AX, 30H
        MOV AH, 0
        MUL TEN
        MOV P2TENV, AX        ; tens
        MOV AX, TBUFFER[2]
        SUB AX, 30H        
        MOV AH, 0
        MOV P2ONEV, AX
        
        MOV BX, 0
        MOV BX, P2HUNDREDV    ; combine everything into bx
        ADD BX, P2TENV
        ADD BX, P2ONEV      
        MOV PTTLTEMP, BX

        ; check if the input payamount is larger than user balance
        MOV BX,0
        MOV BX, PTTLTEMP
        CMP BX, U_TPAY
        JL ERRPAYBAL

        ; Calculate amount left
        MOV AX,0
        MOV AX, PTTLTEMP
        SUB AX, U_TPAY
        MOV PTTLTEMP, AX

        ; seperate result
        MOV AX, 0
        MOV AX, PTTLTEMP
        DIV TEN
        MOV P2Q1, AL
        MOV P2R1, AH
        
        MOV AX, 0
        MOV AL, P2Q1
        DIV TEN
        MOV P2Q2, AL
        MOV P2R2, AH   
        
        ; update result into temp var   
        MOV BL, P2Q2     
        ADD BL, 30H
        MOV PTEMP[0], BL
        MOV BL, P2R2      
        ADD BL, 30H
        MOV PTEMP[1], BL
        MOV BL, P2R1   
        ADD BL, 30H
        MOV PTEMP[2], BL
        
        MOV AH, 3DH
        MOV AL, 1       ; 0 -> for reading, 1 -> for writing, 2 -> for both
        MOV DX, OFFSET NTFILE
        INT 21H
        MOV HANDLE, AX              

        ; input text into file
        MOV AH, 40H
        MOV BX, HANDLE
        MOV CX, 3     
        MOV DX, OFFSET PTEMP
        INT 21H

        ; close file
        MOV AH, 3EH
        MOV BX, HANDLE
        INT 21H
        
		JMP CAL_CHANGE
		
	; charge = user input pay amount - total amount
	CAL_CHANGE:	 
		MOV AX, 0
		MOV AX, U_TPAY
		SUB AX, TTL_AMT
		MOV CHANGE, AX
		
        ; add change into balance
        MOV AX, 0
        MOV AX, PTTLTEMP
        ADD AX, CHANGE
        MOV PTTLTEMP, AX
         ; seperate result
        MOV AX, 0
        MOV AX, PTTLTEMP
        DIV TEN
        MOV P2Q1, AL
        MOV P2R1, AH
        
        MOV AX, 0
        MOV AL, P2Q1
        DIV TEN
        MOV P2Q2, AL
        MOV P2R2, AH   
        
        ; update result into temp var   
        MOV BL, P2Q2     
        ADD BL, 30H
        MOV PTEMP[0], BL
        MOV BL, P2R2      
        ADD BL, 30H
        MOV PTEMP[1], BL
        MOV BL, P2R1   
        ADD BL, 30H
        MOV PTEMP[2], BL

        MOV AH, 3DH
        MOV AL, 1       ; 0 -> for reading, 1 -> for writing, 2 -> for both
        MOV DX, OFFSET NTFILE
        INT 21H
        MOV HANDLE, AX              

        ; input text into file
        MOV AH, 40H
        MOV BX, HANDLE
        MOV CX, 3     
        MOV DX, OFFSET PTEMP
        INT 21H

        ; close file
        MOV AH, 3EH
        MOV BX, HANDLE
        INT 21H
        

		; prepare to display charge
		MOV AX, 0
		MOV AX, CHANGE
		DIV TEN
		MOV Q6, AL
		MOV R6, AH

		MOV AX, 0
		MOV AL, Q6
		DIV TEN
		MOV Q7, AL
		MOV R7, AH

		ADD Q7, 30H
		ADD R7, 30H
		ADD R6, 30H
		
		; display cash text
		MOV AH, 09H
		LEA DX, PAY_TXT6
		INT 21H
		
		; hex > dec
		ADD U_PAY1, 30H
		ADD U_PAY2, 30H
		ADD U_PAY3, 30H
		
		; display pay amount/cash input by user
		MOV AH, 02H
		MOV DX, U_PAY1
		INT 21H
		
		MOV AH, 02H
		MOV DX, U_PAY2
		INT 21H
		
		MOV AH, 02H
		MOV DX, U_PAY3
		INT 21H
		
		; display change text
		MOV AH, 09H
		LEA DX, PAY_TXT7
		INT 21H
		
		; print out the change
		MOV AH, 02H
		MOV DL, Q7
		INT 21H
		
		MOV AH, 02H
		MOV DL, R7
		INT 21H
		
		MOV AH, 02H
		MOV DL, R6
		INT 21H
        JMP TICKET
    
    ERRPAY:
        MOV AH, 09H
        LEA DX, ERRPAY_TXT
        INT 21H
        JMP D_PAYTXT5

    ERRPAYBAL:
        MOV AH, 09H
        LEA DX, BAL_ERR_TXT
        INT 21H
        PUSH CX
        PUSH AX
        PUSH DX
        PUSH BX
        MOV AH, 08H
        INT 21H
        POP BX
        POP AX
        POP DX
        POP CX
        JMP D_PAYTXT5
    
    ;----------------------------------------- DISPLAY SECOND TOP UP PAGE ------------------------------;
    SECTOPUP:
        ; Load current balance into account
        MOV AH,3DH
        LEA DX, NTFILE
        MOV AL,0  ; 0 -> reading purpose
        INT 21H  
        MOV DX,0
        MOV HANDLE,AX
        MOV AH,3FH  ; read from file
        MOV BX,HANDLE
        MOV DX,OFFSET(TBUFFER2)   ; store string into buffer
        MOV CX,3
        INT 21H
        ; close file
        MOV AH, 3EH
        MOV BX, HANDLE
        INT 21H

        ; process data from file into whole unmber
        MOV AX, 0
        MOV AX, TBUFFER2[0]              
        SUB AX, 30H
        MUL HUNDRED     
        MOV T2HUNDREDV, AX  ; hundreds
        MOV AX, 0
        MOV AX, TBUFFER2[1]    
        SUB AX, 30H
        MUL TEN
        MOV AX, 0
        MOV AX, TBUFFER[2]
        SUB AX, 30H
        MOV T2ONEV, AX
        MOV T2TENV, AX        ; tens
        
        MOV BX, 0
        MOV BX, T2HUNDREDV    ; combine everything into bx
        ADD BX, T2TENV
        MOV BH, 0         
        MOV TTLTEMP, BX

        ; cls whole screen
        MOV AH, 00H                                 
        MOV AL, 02H 
        INT 10H 
        ; display topup page
        MOV AH, 09H
        LEA DX, TOPUP_TXT
        INT 21H
        MOV AH, 09H
        LEA DX, TOPUP_TXT3
        INT 21H
        MOV AH, 09H
        LEA DX, TOPUP_TXT4
        INT 21H
        ; ask for user topup amount
        MOV AH, 01H      
        INT 21H
        MOV TOPUP_CHOICE,AL 
        ; open topup file
        MOV AH, 3DH
        MOV AL, 1       ; 0 -> for reading, 1 -> for writing, 2 -> for both
        MOV DX, OFFSET NTFILE
        INT 21H
        MOV HANDLE, AX


        
    ; validate user input range from 1-9 (inclusive)
    CHKTOPUP2:   
        MOV BL, TOPUP_CHOICE
        CMP BL, "1"
        JL ERRT2
        CMP BL, "9"
        JG  ERRT2
        JLE CMPTOPUP2      ; jump to save to file function
    
    ; store user topup amount into a variable called TOPUP_AMOUNT
    CMPTOPUP2:
        CMP TOPUP_CHOICE, "1"
        JE TT1
        CMP TOPUP_CHOICE, "2"
        JE TT2
        CMP TOPUP_CHOICE, "3"
        JE TT3
        CMP TOPUP_CHOICE, "4"
        JE TT4
        CMP TOPUP_CHOICE, "5"
        JE TT5
        CMP TOPUP_CHOICE, "6"
        JE TT6
        CMP TOPUP_CHOICE, "7"
        JE TT7
        CMP TOPUP_CHOICE, "8"
        JE TT8
        CMP TOPUP_CHOICE, "9"
        JE TT9                 

        TT1:
            ; Add total into current amount      
            MOV BX, 0
            MOV BX, TTLTEMP
            ADD BX, 10   
            MOV T2TTLV, BX   
            JMP T2CHECK

        TT2:
        ; Add total into current amount   
            MOV BX, 0
            MOV BX, TTLTEMP
            ADD BX, 20    
            MOV T2TTLV, BX  
            JMP T2CHECK

        TT3:
            ; Add total into current amount   
            MOV BX, 0
            MOV BX, TTLTEMP
            ADD BX, 50    
            MOV T2TTLV, BX
            JMP T2CHECK

        TT4:
             ; Add total into current amount  
            MOV BX, 0
            MOV BX, TTLTEMP
            ADD BX, 100   
            MOV T2TTLV, BX
            JMP T2CHECK

        TT5:
             ; Add total into current amount
            MOV BX, 0
            MOV BX, TTLTEMP
            ADD BX, 200   
            MOV T2TTLV, BX
            JMP T2CHECK
        TT6:
             ; Add total into current amount
            MOV BX, 0
            MOV BX, TTLTEMP
            ADD BX, 500   
            MOV T2TTLV, BX  
            MOV T2TTLV, BX
            JMP T2CHECK
        TT7:
            ; Add total into current amount
            MOV BX, 0
            MOV BX, TTLTEMP
            ADD BX, 600    
            MOV T2TTLV, BX
            JMP T2CHECK
        TT8:
            ; Add total into current amount
            MOV BX, 0
            MOV BX, TTLTEMP
            ADD BX,700      
            MOV T2TTLV, BX
            JMP T2CHECK
        TT9:
            ; Add total into current amount
            MOV BX, 0
            MOV BX, TTLTEMP
            ADD BX, 800    
            MOV T2TTLV, BX  
            JMP T2CHECK
            
    ; Validate Result  (Max: 999)
    T2CHECK:
        MOV BX, 0    
        MOV BX, T2TTLV
        CMP BX, 1000
        JL TUPDATE
        JGE ERRT2
    
    TUPDATE:    
        ; seperate result
        MOV AX, 0
        MOV AX, T2TTLV
        DIV TEN
        MOV T2Q1, AL
        MOV T2R1, AH
        
        MOV AX, 0
        MOV AL, T2Q1
        DIV TEN
        MOV T2Q2, AL
        MOV T2R2, AH   
        
        ; update result into temp var   
        MOV BL, T2Q2     
        ADD BL, 30H
        MOV TEMP[0], BL
        MOV BL, T2R2      
        ADD BL, 30H
        MOV TEMP[1], BL
        MOV BL, T2R1   
        ADD BL, 30H
        MOV TEMP[2], BL
        
        MOV AH, 3DH
        MOV AL, 1       ; 0 -> for reading, 1 -> for writing, 2 -> for both
        MOV DX, OFFSET NTFILE
        INT 21H
        MOV HANDLE, AX              

        ; input text into file
        MOV AH, 40H
        MOV BX, HANDLE
        MOV CX, 3     
        MOV DX, OFFSET TEMP
        INT 21H

        ; close file
        MOV AH, 3EH
        MOV BX, HANDLE
        INT 21H

    S_TOPUP2:

        MOV AH, 09H
        LEA DX, S_TOPUPTXT
        INT 21H    
        ;PRESS ANY KEY TO CONTINUE
        PUSH CX
        PUSH AX
        PUSH DX
        PUSH BX
        MOV AH, 08H
        INT 21H
        POP BX
        POP AX
        POP DX
        POP CX
        JMP D_PAYTXT4

    ERRT2:
        MOV AH, 09H
        LEA DX, ERRT2_TXT
        INT 21H
        MOV AH, 09H
        LEA DX, T2_BACK_TXT
        INT 21H
        PUSH CX
        PUSH AX
        PUSH DX
        PUSH BX
        MOV AH, 08H
        INT 21H
        POP BX
        POP AX
        POP DX
        POP CX
        ; cls whole screen
        MOV AH, 00H                                 
        MOV AL, 02H 
        INT 10H 
        JMP SECTOPUP
    

    ;----------------------------------------- DIPLAY TICKET PAGE --------------------------------------;
    TICKET:
        ; cls whole screen
        MOV AH, 00H                                 
        MOV AL, 02H 
        INT 10H 
        MOV AH, 09H
        LEA DX, RECEIPT_TXT
        INT 21H
        MOV BX, 0
        MOV BL, DEPART_V
        ADD BL, 30H
        INC JUMP_COND               ; jump_cond = 1
        JMP NEXT_D
    TICKET_CONT:
        MOV AH, 09H
        LEA DX, RECEIPT_TXT2
        INT 21H
        MOV BX, 0
        MOV BL, DESTIN_V
        ADD BL, 30H
        INC JUMP_COND               ; jump_cond = 2
        JMP NEXT_D
    TICKET_CONT2:
        MOV AH, 09H
        LEA DX, RECEIPT_TXT3
        INT 21H
        INC JUMP_COND               ; jump_cond = 3
        JMP D_NOTICK
    TICKET_CONT3:
        MOV AH, 09H
        LEA DX, RECEIPT_TXT4
        INT 21H

        MOV AH, 09H
        LEA DX, CONT_TXT1
        INT 21H    
        ;PRESS ANY KEY TO CONTINUE
        PUSH CX
        PUSH AX
        PUSH DX
        PUSH BX
        MOV AH, 08H
        INT 21H
        POP BX
        POP AX
        POP DX
        POP CX
        JMP CONTINUE_PAGE

    ;----------------------------------- DISPLAY CONTINUE PAGE ---------------------------------------;
    CONTINUE_PAGE:

        MOV COUNT, 0
        MOV COUNT2, 0
        MOV COUNT3, 0
        MOV JUMP_COND, 0
        ; cls whole screen
        MOV AH, 00H                                 
        MOV AL, 02H 
        INT 10H 

        MOV AH, 09H
        LEA DX, CONTINUE_TXT1
        INT 21H
        MOV AH, 01H
        INT 21H
        MOV CONT_OPT, AL
        MOV AX, 0
        MOV AL, CONT_OPT
        CMP AL, "y"
        JE LOGO
        CMP AL, "n"
        JE SHUTDOWN
        JNE ERR_CONT
    
    ERR_CONT:
        MOV AH, 09H
        LEA DX, ERR_CONT_TXT
        INT 21H
        ;PRESS ANY KEY TO CONTINUE
        PUSH CX
        PUSH AX
        PUSH DX
        PUSH BX
        MOV AH, 08H
        INT 21H
        POP BX
        POP AX
        POP DX
        POP CX
        JMP CONTINUE_PAGE




    ; Code End---------------------------------------------------------------------------------------------------------------------------------;

SHUTDOWN:
    MOV AX, 4C00H
    INT 21H

MAIN ENDP
    END MAIN





; ; Load topup from file
; ;         MOV AH,3DH
; ;         LEA DX, NTFILE
; ;         MOV AL,0  ; 0 -> reading purpose
; ;         INT 21H
; ;         MOV HANDLE,AX
; ;         MOV AH,3FH  ; read from file
; ;         MOV BX,HANDLE
; ;         MOV DX,OFFSET(TBUFFER)   ; store string into buffer
; ;         MOV CX,8
; ;         INT 21H
; ;         close file
; ;         MOV AH, 3EH
; ;         MOV BX, HANDLE
; ;         INT 21H

; ; Load age from file
;         MOV AH,3DH
;         LEA DX, NAFILE
;         MOV AL,0  ; 0 -> reading purpose
;         INT 21H
;         MOV HANDLE,AX
;         MOV AH,3FH  ; read from file
;         MOV BX,HANDLE
;         MOV DX,OFFSET(ABUFFER)   ; store string into buffer
;         MOV CX,8
;         INT 21H
;         ; close file
;         MOV AH, 3EH
;         MOV BX, HANDLE
;         INT 21H