                                                                                                                     .MODEL SMALL
.STACK 100

.DATA
	;-------------------------------------------------------- route option page -----------------------------------------------------;
	; declare var for route option page
	ROUTE_MENU	DB	13,10,				"=============================== Route Option ==================================="
				DB	13,10,13,10,13,10,	"                               Choose Route:                                   "
				DB 	13,10,13,10, 		"                         [1] Route Kedah > Johor                               "
				DB 	13,10, 				"                         [2] Route Johor > Kedah                               "
				DB 	13,10,13,10,13,10,	"                  --------- Please Enter Number ---------                      "
				DB 	13,10,				"$" 		
	ROUTE_TXT	DB 	13,10,				"                           Your option : 	$                                   "
				
	ERROR_MSS1	DB	13,10,				"                        !! Please enter 1 or 2 !!                             $"
	ROUTE_OPT	DB 	0

	
	;--------------------------------------------------------- view map page ---------------------------------------------------------;
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
	ERROR_MSS2	DB	13,10,				"                   !! Invalid Input. Please insert 1 to 9 !!                  $"
	ERROR_MSS3	DB 	13,10,				"               !! Invalid Route. This is Kedah to Johor route. !!             $"
	ERROR_MSS4	DB 	13,10,				"               !! Invalid Route. This is Johor to Kedah route. !!             $"
	ERROR_MSS5	DB 	13,10,				"     !! Invalid Input. MINIMUM 1 ticket and MAXIMUM 10 ticket to buy. !!      $"
	
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
	
	;; jw code
	;------------------------------------------------------ SHOW PRICE PAGE-----------------------------------------------------------;
	; declare var for show price page						
	SPRICE_TXT   	DB 13,10,13,10,         "                   ========================================                    "
					DB 13,10,               "                   |      ____  ____  ___ ____ _____      |                    "
					DB 13,10,               "                   |     |  _ \|  _ \|_ _/ ___| ____|     |                    "
					DB 13,10,               "                   |     | |_) | |_) || | |   |  _|       |                    "
					DB 13,10,               "                   |     |  __/|  _ < | | |___| |___      |                    "
					DB 13,10,               "                   |     |_|   |_| \_\___\____|_____|     |                    "
					DB 13,10,               "                   |                                      |                    "
					DB 13,10,               "                   ========================================                   $"

    SPRICE_TXT2     DB 13,10,13,10,         "================== These are the details of your purchases =====================$"
    SPRICE_TXT3     DB 13,10,13,10,         "                 Starting Point              :      $"
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
	

	;-------------------------------------------------- Payment Page -----------------------------------------------------------;
	; declare var for cash payment page

	PAY_TXT	    	DB	13,10,				"================================= Payment Page ================================="
					DB 	13,10,13,10,13,10, 	"                          Sub-Total       :    RM $                            "              
	PAY_TXT2  		DB 	13,10,				"                          Member Discount :    $                               "
	PAY_TXT3		DB	13,10,				"                          Tax Total       :    $                               "
	PAY_TXT4		DB 	13,10,				"                          Total Amount    :    RM $                            "
	ECOIN_BALANCE	DB 	13,10,				"                          E-Coin Balance  :    $                               "
	PAY_TXT5		DB 	13,10,13,10,13,10,	"                       Enter your pay amount :     RM $                        "
	PAY_TXT6		DB 	13,10,13,10,		"                       Cash                  :     RM $                        "
	PAY_TXT7		DB 	13,10,				"                       Change                :     RM $                        "
	ERROR_MSS6		DB 	13,10,				"  Invalid input. Kindly enter pay amount greater than or equal  total amount  $"
	TOPUP_OPTION 	DB 	13,10,				"                                Wish to top up?                                "
					DB 	13,10,				"                                   [1] Yes                                     "
					DB 	13,10, 				"                                   [2] No                                     $"
	TOPUP_TXT		DB 	13,10,				"                            Enter your option:    $                            "
	
	COUNT3			DB 	0
	COUNT4			DB 	0
	USERTYPE		DB  1 ; later ny change when compile if jw code
	USER_AGE		DB  1 ; later ny change when compile if jw code
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
	
.CODE
MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
		
		; clear screen
		 MOV AH, 00H
		 MOV AL, 02H
		 INT 10H
		
		;-------------- Route Option Page -------------------;
		; display route option menu
	ROUTE_PG:
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
		LEA DX, B_OR_CONT
		INT 21H
		
		MOV AH, 07H
		INT 21H
		
		
		;----------------- View Map Page --------------------;
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
		
		; ----------------- Show Price Page --------------------;
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
		
		MOV AH, 02H
		MOV DL, Q3
		INT 21H
		
		MOV AH, 02H
		MOV DL, R3
		INT 21H
		
		; display sub-total
		MOV AH, 09H
		LEA DX, SPRICE_TXT7
		INT 21H
	
		; display subtotal
	D_SUBTOTAL:
		MOV AH, 02H
		MOV DL, Q2
		INT 21H
		
		MOV AH, 02H
		MOV DL, R2
		INT 21H
		
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
		
		; ----------------- Payment Page --------------------;	
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
		MOV AH, 02H
		MOV DL, "0"
		INT 21H
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
		
		; display total amount
		MOV AH, 02H
		MOV DL, Q5
		INT 21H
	
		MOV AH, 02H
		MOV DL, R5
		INT 21H
		
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
		
		; ; Load topup from file
        ; MOV AH,3DH
        ; LEA DX, NTFILE
        ; MOV AL,0  ; 0 -> reading purpose
        ; INT 21H
        ; MOV HANDLE,AX
        ; MOV AH,3FH  ; read from file
        ; MOV BX,HANDLE
        ; MOV DX,OFFSET(TBUFFER)   ; store string into buffer
        ; MOV CX,8
        ; INT 21H
        ; ; close file
        ; MOV AH, 3EH
        ; MOV BX, HANDLE
        ; INT 21H

        ; MOV AH, 09H
        ; MOV DX, OFFSET TBUFFER
        ; INT 21H
		
		
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
		
		; user input pay amount (digit 3)
		MOV AH, 01H
		INT 21H   
		MOV AH, 0
		MOV U_PAY3, AX
		
		; check if user input enter 
		CMP U_PAY2, 13
		JE 	SWITCH_VALUE1
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
		JMP HEX_TO_DEC	
		
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
		JMP HEX_TO_DEC	
		
		
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
		LEA DX, TOPUP_TXT
		INT 21H
		
		MOV AH, 01H
		INT 21H    
		MOV AH, 0
		MOV TOPUP_VALUE, AL
		
		MOV BX, 0
		MOV BL, TOPUP_VALUE
		CMP BL, "1"
		JE 	TOPUP_PAGE
		CMP BL, "2"
		JE 	D_PAYTXT5
		
		; transfer MEMBER_DISC value to TTL_AMT
	CONVERT:	
		MOV BX, 0
		MOV BX, MEMBER_DISC
		MOV TTL_AMT, BX
		JMP CAL_CHANGE
		
		; charge = user input pay amount - total amount
	CAL_CHANGE:	 
		MOV AX, 0
		MOV AX, U_TPAY
		SUB AX, TTL_AMT
		MOV CHANGE, AX
		
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
		
		;-------------------------------------TOPUP PAGE-------------------------------------------------;
	TOPUP_PAGE:	
	
		

	MOV AX,4C00H
	INT 21H 
MAIN ENDP  
	END MAIN
	

; havent done:
;          validation:
; 				- VIEWMAP PAGE : ticket amount : canT input using alphabet
;				- PAYMENT PAGE : pay amount > 0, cant input using alphabet and other weird stuff
;          
; 		   each page back and proceed havent do (compare any key with B ; if B then will back to previous page)
; 			need to deduct one zero infront for each input start from show price page to payment page
; 		   

		; -------------------------------
		; this if for retrieve file input 
		
		; MOV AX, 0
		; MOV AX, TBUFFER[0]
		; MUL HUNDRED
		; MOV HUN_VALUE, AX

		; MOV AX, 0
		; MOV AX, TBUFFER[1]
		; MUL TEN
		; MOV TEN_VALUE, AX

		; MOV BX, 0
		; MOV BX, HUN_VALUE
		; ADD BX, TEN_VALUE
		; ADD BX, TBUFFER[2]

		; ; DO VALIDATION HERE EITHER USER PAY > TTL AMT OR < TTL AMT!!!!!!!!!
		; SUB BX, TTL_AMT
		; MOV CHANGE, BX
		;---------------------------------------