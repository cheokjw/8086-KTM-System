.MODEL SMALL
.STACK 100
.386
.DATA
	;-------------------------------------------------------- route option page -----------------------------------------------------;
	; declare var for route option page
	ROUTE_MENU	DB	13,10,				"=============================== Route Option ==================================="
				DB	13,10,13,10,13,10,	"        		Choose Route:			"
				DB 	13,10,13,10, 		"		 	  [1] Route Kedah > Johor"
				DB 	13,10, 				"		 	  [2] Route Johor > Kedah"
				DB 	13,10,13,10,13,10,				"		  --------- Please Enter Number ---------"
				DB 	13,10,13,10, 				"		 	Your option : 	$"
	ROUTE_OPT	DB 	0
	
	;--------------------------------------------------------- view map page ---------------------------------------------------------;
	; declare var for view map page
	KDH_ROUTE	DB	13,10,				"=================================== View Map ==================================="
				DB	13,10
				DB 	13,10,				"			     Route Kedah > Johor"
				DB 	13,10, 				"$"
	JHR_ROUTE	DB	13,10,				"=================================== View Map ==================================="
				DB	13,10
				DB 	13,10,				"                               Route Johor > Kedah								"
				DB 	13,10, 				"$"			
	VMAP_MENU	DB 	13,10,				"        |-----+------+-----+-----+-----+-----+-----+-----+-----+-----|         "
				DB 	13,10,				"                KDH    PRK   KTN   TRG    PHG   SGR   NSN   MLK   JHR	        "	 
				
				DB 	13,10,13,10,		"                   [1] Kedah (KDH)        [6] Selangor (SGR)                   "
				DB 	13,10,				"                   [2] Perak (PRK)        [7] N.Sembilan (NSN)                 "
				DB 	13,10,				"                   [3] Kelantan (KTN)     [8] Malacca (MLK)                    "
				DB 	13,10,				"                   [4] Terengganu (TRG)   [9] Johor (JHR)                      "
				DB	13,10, 				"                   [5] Pahang (PHG)"
				
				DB 	13,10,13,10,		"                   ----------- Please Enter Number -----------                $"
	DEP_TEXT	DB 	13,10,13,10,		"                           Department     :  $                                 "
	DEST_TEXT	DB 	13,10, 				"                           Destination    :  $                                 "
	
	TICKET_TEXT	DB 	13,10,13,10,		"               *** Please enter 0 infront if input 0-9 ticket amount ***       "  
				DB 	13,10,				"                           Ticket Amount  :  $                                 "
	B_OR_CONT	DB 	13,10,13,10,13,10,	"[B]BACK                                            PRESS ANY KEY TO CONTINUE..$"
	NL			DB	13,10,				"$"
	
	BACK_V		DB	0
	DEPART_V 	DW	0
	DESTIN_V	DW 	0
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
	START_P2		DB 	0
	Q3				DB	0
	R3				DB	0
	PAYMENT_M		DB 	0

	;-------------------------------------------------- Cash Payment Page -----------------------------------------------------------;
	; declare var for cash payment page
	
	CASHPAY_TXT	DB	13,10,				"================================= Payment Page ================================="
	
	
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
		MOV AH, 09H
		LEA DX, ROUTE_MENU
		INT 21H
		
		; get route option from user
		MOV AH, 01H
		INT 21H
		MOV ROUTE_OPT, AL
		
		; clear screen
		 MOV AH, 00H
		 MOV AL, 02H
		 INT 10H
		
		;----------------- View Map Page --------------------;
		; display view map menu
		CMP ROUTE_OPT, "1"
		JE	D_KROUTE	
		CMP ROUTE_OPT, "2"
		JE 	D_JROUTE
		
	D_KROUTE:	
		MOV AH, 09H
		LEA DX, KDH_ROUTE
		INT 21H
		JMP D_VMAP
	
	D_JROUTE:
		MOV AH, 09H
		LEA DX, JHR_ROUTE
		INT 21H
		JMP D_VMAP
		
	D_VMAP:
		MOV AH, 09H
		LEA DX, VMAP_MENU
		INT 21H
		
		; request departing point from user
		MOV AH, 09H
		LEA DX, DEP_TEXT
		INT 21H
		
		MOV AH, 01H
		INT 21H
		MOV DEPART_V, AX
		
		; request destination point from user
		MOV AH, 09H
		LEA DX, DEST_TEXT
		INT 21H
		
		MOV AH, 01H
		INT 21H
		MOV DESTIN_V, AX
		
		; request amount ticket needed from user
		MOV AH, 09H
		LEA DX, TICKET_TEXT
		INT 21H
		
		MOV AH, 01H
		INT 21H
		MOV TICKET_V1, AL
		
		MOV AH, 01H
		INT 21H
		MOV TICKET_V2, AL
		
		; ask user to back to previous page or proceed to next page
		MOV AH, 09H
		LEA DX, B_OR_CONT
		INT 21H
		
		MOV AH, 07H
		INT 21H
		MOV BACK_V, AL
		
		; HEX > DEC
		SUB DEPART_V, 30H
		SUB	DESTIN_V, 30H
		SUB	TICKET_V1, 30H
		SUB TICKET_V2, 30H
		
		; amount of ticket
	TICKET_AMT:	
		MOV AX, 0
		MOV AL, TICKET_V1
		MUL TEN
		ADD AL, TICKET_V2
		MOV TICKET_V, AL
		CMP START_P2, 1
		JE D_NOTICK
		
		; depends on route option to choose calculation method
		CMP ROUTE_OPT, "1"
		JE	CAL_TRAVEL1
		CMP ROUTE_OPT, "2"
		JE 	CAL_TRAVEL2
		
		; destination - department
	CAL_TRAVEL1:
		MOV BX, DESTIN_V
		SUB BX, DEPART_V
		MOV JOURNEY_V, BX
		CMP START_P, 1
		JE 	D_NOSTAT
		JNE CAL_TOTAL
		
		; department - destination
	CAL_TRAVEL2:	
		MOV BX, DEPART_V
		SUB BX, DESTIN_V
		MOV JOURNEY_V, BX
		CMP START_P, 1
		JE 	D_NOSTAT
		JMP CAL_TOTAL
	
		; multiply station travelled with its price
	CAL_TOTAL:	
		MOV AX, 0
		MOV AX, JOURNEY_V
		MUL TEN
		MOV JOURNEY_V, AX
		
		; multiply station travelled price with ticket amount
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
		MOV BX, DEPART_V
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
	    MOV BX, DESTIN_V
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
		INC START_P2
		JMP TICKET_AMT
	
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
		
		MOV AH, 02H
		MOV DL, Q2
		INT 21H
		
		MOV AH, 02H
		MOV DL, R2
		INT 21H
		
		MOV AH, 02H
		MOV DL, R1
		INT 21H
		
		; display choose payment menu
		MOV AH, 09H
		LEA DX, SPRICE_TXT8
		INT 21H
		
		MOV AH, 07H
		INT 21H
		MOV PAYMENT_M, AL
		
		CMP PAYMENT_M, "1"
		JE
		CMP PAYMENT_M, "2"
		JE
		
		
	
        MOV AX,4C00H
        INT 21H
MAIN ENDP
	END MAIN
