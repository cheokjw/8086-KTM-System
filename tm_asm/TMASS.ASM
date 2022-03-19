.MODEL SMALL
.STACK 100
.386
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
	SPRICE_TXT8		DB 13,10,13,10,13,10,	"                           Choose your payment method                          "
					DB 13,10,				"                                [1] Cash                                       "
					DB 13,10,				"                                [2] E-Coin									   $"
	
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
	PAYMENT_M		DB 	0

	;-------------------------------------------------- Payment Page -----------------------------------------------------------;
	; declare var for cash payment page

	PAY_TXT	    DB	13,10,				"================================= Payment Page ================================="
				DB 	13,10,13,10,13,10, 	"                          Sub-Total       :    RM $                            "              
	PAY_TXT2  	DB 	13,10,				"                          Member Discount :    $                               "
	PAY_TXT3	DB	13,10,				"                          Tax Total       :    $                               "
	PAY_TXT4	DB 	13,10,				"                          Total Amount    :    RM $                            "
	PAY_TXT5	DB 	13,10,13,10,13,10,	"                       Enter your pay amount :     RM $                        "
	PAY_TXT6	DB 	13,10,13,10,		"                       Cash                  :     RM $                        "
	PAY_TXT7	DB 	13,10,				"                       Change                :     RM $                        "
	
	COUNT3		DB 	0
	COUNT4		DB 	0
	USERTYPE	DB  0
	U_PAY1		DW 	0
	U_PAY2		DW	0
	U_PAY3		DW 	0
	U_TPAY		DW	0
	MEMBER_DIS	DB 	0
	HUNDRED		DB	0
	REMAIN		DW 	0
	
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
		
		CMP ROUTE_OPT, "1"
		JE 	VMAP_PAGE
		CMP	ROUTE_OPT, "2"
		JE	VMAP_PAGE
		JNE ERRORM_RP
		
	ERRORM_RP:
		MOV AH, 09H
		LEA DX, ERROR_MSS1
		INT 21H
		JMP D_ROUTETXT
		
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
		CMP COUNT4, 1
		JE 	CAL_CHANGE
		
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
		
		; ----------------- Show Price Page (Member) --------------------;
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
		JE 	D_PAYTXT2	; jmp to member disc text
		CMP COUNT3, 3
		JE 	D_PAYTXT5
		
		; display choose payment menu
		MOV AH, 09H
		LEA DX, SPRICE_TXT8
		INT 21H
		
		MOV AH, 07H
		INT 21H
		MOV PAYMENT_M, AL
		
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
	
	
		;  display tax total
	D_PAYTXT3:
		MOV AH, 09H
		LEA DX, PAY_TXT3
		INT 21H
		
		INC COUNT3   		; count3 = 2
		; compare usertype = guest(0) or member(1)
		CMP USERTYPE, 0
		JE 	U_GUEST
		CMP USERTYPE, 1
		JE 	U_GUEST
		
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
		
	TA_GUEST:
		INC COUNT3			; count3 = 3
		JMP D_SUBTOTAL	

		
	TA_MEMBER:
	
	
		; request user input pay amount
	D_PAYTXT5:
		MOV AH, 09H
		LEA DX, PAY_TXT5
		INT 21H
		
		; user input pay amount (digit 1)
		MOV AH, 01H
		INT 21H
		MOV U_PAY1, AX
		
		; user input pay amount (digit 2)
		MOV AH, 01H
		INT 21H
		MOV U_PAY2, AX
		
		; user input pay amount (digit 3)
		MOV AH, 01H
		INT 21H
		MOV U_PAY3, AX
		
		; display cash text
		MOV AH, 09H
		LEA DX, PAY_TXT6
		INT 21H
		
		MOV AH, 02H
		MOV DX, U_PAY1
		INT 21H
		
		MOV AH, 02H
		MOV DX, U_PAY2
		INT 21H
		
		MOV AH, 02H
		MOV DX, U_PAY3
		INT 21H
		
		
		; hex > dec
		SUB U_PAY1, 30H
		SUB U_PAY2, 30H
		SUB U_PAY3, 30H
		
		; 
		MOV AX, 0
		MOV AX, U_PAY1
		MUL HUNDRED
		MOV U_PAY1, AX
		
		MOV AX, U_PAY2
		MUL TEN
		MOV U_PAY2, AX
		
		MOV BX, U_PAY1
		ADD BX, U_PAY2
		ADD BX, U_PAY3
		MOV U_TPAY, BX
		
		; display change text
		MOV AH, 09H
		LEA DX, PAY_TXT7
		INT 21H
		
		INC COUNT4
		JMP CAL_TTLAMT
		
	CAL_CHANGE:		
		MOV AX, 0
		MOV BX, U_TPAY
		SUB BX, TTL_AMT
		
		; here got prob can only display weird stuff and no support up to 3 digit calculation
		ADD BX, 30H
		MOV AH, 02H
		MOV DX, BX
		INT 21H
		

	MOV AX,4C00H
	INT 21H 
MAIN ENDP  
	END MAIN
	
; payment page 
; validation, last part calculation, membershipz

; showprice page
; need to deduct zero infront

; each page back and proceed havent do 