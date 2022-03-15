//TODO: FIX GUEST PRICE PAGE OUTPUT (INFINITE LOOP)

.MODEL SMALL
.STACK 100H
.386
.DATA
;------------------------------------------------------ WELCOME PAGES VARIABLES--------------------------------------------------------------;
    COND            DB 1

    WELCOME_TXT     DB 13,10,                       "    /@@   /@@/@@@@@@@@/@@      /@@     /@@      /@@ /@@       /@@              "
                    DB 13,10,                       "   | @@  /@@/__  @@__/ @@@    /@@@    | @@@    /@@@| @/      |__/              "    
                    DB 13,10,                       "   | @@ /@@/   | @@  | @@@@  /@@@@    | @@@@  /@@@@|_/@@@@@@@ /@@  /@@@@@@     "
                    DB 13,10,                       "   | @@@@@/    | @@  | @@ @@/@@ @@    | @@ @@/@@ @@ /@@_____/| @@ |____  @@    "
                    DB 13,10,                       "   | @@  @@    | @@  | @@  @@@| @@    | @@  @@@| @@|  @@@@@@ | @@  /@@@@@@@    "
                    DB 13,10,                       "   | @@\  @@   | @@  | @@\  @ | @@    | @@\  @ | @@ \____  @@| @@ /@@__  @@    "
                    DB 13,10,                       "   | @@ \  @@  | @@  | @@ \/  | @@    | @@ \/  | @@ /@@@@@@@/| @@|  @@@@@@@    "
                    DB 13,10,                       "   |__/  \__/  |__/  |__/     |__/    |__/     |__/|_______/ |__/ \_______/   $"

    WELCOME_TXT2    DB 13,10,13,10,13,10,13,10,     "============================ Welcome to KTM M'sia ============================="
                    DB 13,10,13,10,                 "                        Please choose your login option !!!                   "
                    DB 13,10,13,10,                 "                            1.    Login as Member                             "
                    DB 13,10,                       "                            2.    Register                                    "
                    DB 13,10,                       "                            3.    Login as Guest                              "
                    DB 13,10,                       "                            4.    Quit                                        "
                    DB 13,10,13,10,                 "                (Login as Member to get MEMBER EXCLUSIVE discounts)    $"

    WELCOME_OPT_TXT DB 13,10,13,10,                 "                              Option: $"

    ; store user input
    A_WELCOME_OPT       LABEL       BYTE              ; name
    MAX_WELCOME_OPT      DB          2                ; max length
    ACT_WELCOME_OPT      DB          ?                ; actual length
    WELCOME_OPT          DB          2 DUP (0)               
    ;------------------------------------------------------ END WELCOME PAGE VARIABLES ----------------------------------------------------------;

    ;-------------------------------------------------------- LOGIN PAGE VARIABLES --------------------------------------------------------------;
    LOGIN_TXT       DB 13,10,               "                /@@        /@@@@@@   /@@@@@@  /@@@@@@ /@@   /@@          "
                    DB 13,10,               "               | @@       /@@__  @@ /@@__  @@|_  @@_/| @@@ | @@          "
                    DB 13,10,               "               | @@      | @@  \ @@| @@  \__/  | @@  | @@@@| @@          "
                    DB 13,10,               "               | @@      | @@  | @@| @@ /@@@@  | @@  | @@ @@ @@          "
                    DB 13,10,               "               | @@      | @@  | @@| @@|_  @@  | @@  | @@  @@@@          " 
                    DB 13,10,               "               | @@      | @@  | @@| @@  \ @@  | @@  | @@\  @@@          "
                    DB 13,10,               "               | @@@@@@@@|  @@@@@@/|  @@@@@@/ /@@@@@@| @@ \  @@          "
                    DB 13,10,               "               |________/ \______/  \______/ |______/|__/  \__/         $"

    LOGIN_TXT2      DB 13,10,13,10,13,10,   "================================ Login Page ===================================$"

    USERNAME_TXT    DB 13,10,13,10,         "          Please enter your username: $"
    PASSWORD_TXT    DB 13,10,13,10,         "          Please enter your password: $"

    ; store login uername
    A_USERNAME          LABEL       BYTE
    MAX_USERNAME         DB          8
    ACT_USERNAME         DB          ?
    USERNAME             DB          8 DUP (0)

    ; store input password
    A_PASS              LABEL       BYTE
    MAX_PASS             DB          8
    ACT_PASS             DB          ?
    PASSWORD             DB          8 DUP (0)
    ;----------------------------------------------------- END LOGIN PAGE VARIABLES --------------------------------------------------------------;

    ;------------------------------------------------------ REGISTER PAGE VARIABLES --------------------------------------------------------------;
    REGISTER_TXT    DB 13,10,               " /@@@@@@@  /@@@@@@@@  /@@@@@@  /@@@@@@  /@@@@@@  /@@@@@@@@/@@@@@@@@ /@@@@@@@ "
                    DB 13,10,               "| @@__  @@| @@_____/ /@@__  @@|_  @@_/ /@@__  @@|__  @@__/ @@_____/| @@__  @@"
                    DB 13,10,               "| @@  \ @@| @@      | @@  \__/  | @@  | @@  \__/   | @@  | @@      | @@  \ @@"
                    DB 13,10,               "| @@@@@@@/| @@@@@   | @@ /@@@@  | @@  |  @@@@@@    | @@  | @@@@@   | @@@@@@@/"
                    DB 13,10,               "| @@__  @@| @@__/   | @@|_  @@  | @@   \____  @@   | @@  | @@__/   | @@__  @@" 
                    DB 13,10,               "| @@  \ @@| @@      | @@  \ @@  | @@   /@@  \ @@   | @@  | @@      | @@  \ @@"
                    DB 13,10,               "| @@  | @@| @@@@@@@@|  @@@@@@/ /@@@@@@|  @@@@@@/   | @@  | @@@@@@@@| @@  | @@"
                    DB 13,10,               "|__/  |__/|________/ \______/ |______/ \______/    |__/  |________/|__/  |__/$"

    REGISTER_TXT2   DB 13,10,13,10,13,10,   "================================= Register =====================================$"

    REG_NAME_TXT    DB 13,10,13,10,         "          Please register your username : $"
    REG_PASS_TXT    DB 13,10,13,10,         "          Please register your password : $"
    REG_AGE_TXT     DB 13,10,13,10,         "          Plesae register your age      : $"
    REG_SUCCESS     DB 13,10,13,10,         "                          Registered Successfully! $"

    ; store register username
    REG_USERNAME         DB          8
                        DB          ?
                        DB          8 DUP (0)
    ; store register password
    REG_PASS             DB          8
                        DB          ?
                        DB          8 DUP (0)

    ; store register age
    REG_AGE              DB          3
                        DB          ?
                        DB          3 DUP (0)

    ; File Variable (Read and write)
    NUFILE          DB 'USERNAME.TXT', 0
    NPFILE          DB 'PASSWORD.TXT', 0
    NAFILE          DB 'AGE.TXT', 0
    HANDLE          DW       ?              ; This would be the file handle, the number that DOS assigns to open file
    BUFFER          DB 255 DUP (0)          ; Make a plain buffer 
;----------------------------------------------------- END REGISTER PAGE VARIABLES -----------------------------------------------------------;

;------------------------------------------------------ GUEST SHOW PRICE VARIABLES -----------------------------------------------------------;
    GUEST_TXT   DB 13,10,13,10,         "        ========================================"
                DB 13,10,               "        |      ____  ____  ___ ____ _____      |"
                DB 13,10,               "        |     |  _ \|  _ \|_ _/ ___| ____|     |"
                DB 13,10,               "        |     | |_) | |_) || | |   |  _|       |"
                DB 13,10,               "        |     |  __/|  _ < | | |___| |___      |"
                DB 13,10,               "        |     |_|   |_| \_\___\____|_____|     |"
                DB 13,10,               "        |                                      |"
                DB 13,10,               "        ========================================$"

    GUEST_TXT2      DB 13,10,13,10,         "          These are the details of your purchases $"
    GUEST_TXT3      DB 13,10,               "    Starting Point :        $"
    GUEST_TXT4      DB 13,10,               "    Ending Point   :        $"
    GUEST_TXT5      DB 13,10,               "    Number of station travelled :      $"
    GUEST_TXT6      DB 13,10,               "    Number of tickets purchased :      $"
    
    ; for output string
    ATEXT       LABEL       BYTE
    MAXTEXT      DB          10
    ACTTEXT      DB          ?
    STATETEXT    DB         10 DUP (0)
          
    STATE1          DB "KEDAH (KDH)$"
    STATE2          DB "PERAK (PRK)$"
    STATE3          DB "KELANTAN (KTN)$"
    STATE4          DB "TERENGGANU (TRG)$"
    STATE5          DB "PAHANG (PHG)$"
    STATE6          DB "SELANGOR (SGR)$"
    STATE7          DB "N.SEMBILAN (NSN)$"
    STATE8          DB "MALACCA (MLK)$"
    STATE9          DB "JOHOR (JHR)$"
    
    STTCOUNT        DB 0
    START_OPT       DB "1"
    END_OPT         DB "3"
    ; Jump Condition 
    OCOND           DB "1"
    TTLSTATION      DB "2"
    TTLTICKET       DB "1"
ends
;--------------------------------------------------- END GUEST SHOW PRICE VARIABLES ----------------------------------------------------------;

.CODE
MAIN PROC
    MOV AX, @DATA 
    MOV DS, AX 

    ; Code Start------------------------------------------------------------------------------------------------------------------------------;
    
    ; cls whole screen
    MOV AH, 00H                                 
    MOV AL, 02H 
    INT 10H 

    ; Comparing COND to 1, if true, jump start (continue programme), else, jmp condelse (terminate programme)
    MOV AL, COND                               
    CMP AL, 1
    JE START 
    JNE SHUTDOWN  ; jump not equal

    ;------------------------------- WELCOME PAGE ----------------------------;
    START: 
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
        CMP WELCOME_OPT, "2"
        JE REGISTER 
        CMP WELCOME_OPT, "3"
        JE GUEST 
        CMP WELCOME_OPT, "4"
        JE SHUTDOWN

    ;---------------------------- LOGIN PAGE ---------------------------------;
    LOGIN:
        MOV AH, 00H     ; clear screen                          
        MOV AL, 02H 
        INT 10H
        MOV AH, 02H     ; display new line
        MOV DL, 13
        INT 21H
        MOV AH, 02H     ; display carriage
        MOV DL, 10
        INT 21H
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
        MOV CX,0
        MOV CX,8
        MOV SI,0
        GETLNAME:
            MOV AH,01H
            INT 21H
            MOV REG_USERNAME[SI], AL
            INC SI
            LOOP GETLNAME

        MOV AH, 09H
        LEA DX, PASSWORD_TXT
        INT 21H
        ; Login: Get input password
        MOV CX,0
        MOV CX,8
        MOV SI,0
        GETLPASS:
            MOV AH, 01H
            INT 21H
            MOV PASSWORD[SI], AL
            INC SI
            LOOP GETLPASS

        JMP VIEWMAP

    ;-------------------------= REGISTER PAGE ---------------------------------;
    REGISTER:   
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
            ; move cursor to end of file
            MOV BX, HANDLE
            MOV AH, 42H
            MOV AL, 2
            MOV CX, 0
            MOV DX, 0
            INT 21H
            ; JC ERR_SEEK
            UINPUT:
            ; input text into username file
            MOV AH, 40H
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
            ; move cursor to end of file
            MOV BX, HANDLE
            MOV AH, 42H
            MOV AL, 2
            MOV CX, 0
            MOV DX, 0
            INT 21H
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
            ; move cursor to end of file
            MOV BX, HANDLE
            MOV AH, 42H
            MOV AL, 2
            MOV CX, 0
            MOV DX, 0
            INT 21H
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

        INT 21H
        MOV AH, 09H
        LEA DX, REG_SUCCESS
        INT 21H     
        JMP TOPUP

    TOPUP:
        JMP SHUTDOWN

    VIEWMAP:
        JMP SHUTDOWN

           ;-------------------------- DISPLAY GUEST PRICE PAGE --------------------------------;
    GUEST:
        MOV AH, 00H     ; clear screen                          
        MOV AL, 02H 
        INT 10H
        MOV AH, 09H
        ; Display Page
        LEA DX, GUEST_TXT
        INT 21H
        MOV AH, 09H
        LEA DX, GUEST_TXT2
        INT 21H
        ; output department
        MOV AH, 09H
        LEA DX, GUEST_TXT3  
        INT 21H             
        JMP CSTR
        GOUTPUT:
            MOV SI, 0
            MOV CL, STTCOUNT  
            MOV CH, 0
            OLOOP:
                MOV AH, 02H
                MOV DL, STATETEXT[SI]
                INT 21H
                INC SI
                LOOP OLOOP
        ; output destination
        MOV AH, 09H
        LEA DX, GUEST_TXT4
        INT 21H
        MOV OCOND, 2
        JMP CSTR2
        GOUTPUT2:
            MOV SI, 0
            MOV CL, STTCOUNT  
            MOV CH, 0
            OLOOP2:
                MOV AH, 02H
                MOV DL, STATETEXT[SI]
                INT 21H
                INC SI
                LOOP OLOOP2
        ; output number of stations travelled
        MOV AH, 09H
        LEA DX, GUEST_TXT5
        INT 21H
        MOV AH, 02H
        MOV DL, TTLSTATION
        INT 21H
        ; output numeber of tickets purchased
        MOV AH, 09H
        LEA DX, GUEST_TXT6
        INT 21H
        MOV AH, 02H
        MOV DL, TTLTICKET
        INT 21H
                     
        MOV AH, 09H
        MOV DX, OFFSET ANYKEY_BUTTON 
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
        ;CLEAR SCREEN
        MOV AH, 00H
        MOV AL, 02H
        INT 10H
        ;JMP PAYMENT

    ; Compare purchase option for display
    CSTR:
        CMP START_OPT, "1"
        JE STT1
        CMP START_OPT, "2"
        JE STT2
        CMP START_OPT, "3"
        JE STT3
        CMP START_OPT, "4"
        JE STT4
        CMP START_OPT, "5"
        JE STT5
        CMP START_OPT, "6"
        JE STT6
        CMP START_OPT, "7"
        JE STT7
        CMP START_OPT, "8"
        JE STT8
        CMP START_OPT, "9"
        JE STT9 
    
    CSTR2:
        CMP END_OPT, "1"
        JE STT1
        CMP END_OPT, "2"
        JE STT2
        CMP END_OPT, "3"
        JE STT3
        CMP END_OPT, "4"
        JE STT4
        CMP END_OPT, "5"
        JE STT5
        CMP END_OPT, "6"
        JE STT6
        CMP END_OPT, "7"
        JE STT7
        CMP END_OPT, "8"
        JE STT8
        CMP END_OPT, "9"
        JE STT9
       
    
    ; kedah
    STT1:
        MOV SI, 0
        MOV CL, 11     
        MOV CH, 0
        MOV STTCOUNT, CL
        
        SWAP1:
            MOV AL, STATE1[SI]
            MOV STATETEXT[SI], AL
            INC SI
            LOOP SWAP1
        CMP OCOND, "1"
        JE GOUTPUT
        JNE GOUTPUT2

    ; perak
    STT2:
        MOV SI, 0
        MOV CL, 11  
        MOV CH, 0
        MOV STTCOUNT, CL
        SWAP2:
            MOV AL, STATE2[SI]
            MOV STATETEXT[SI], AL
            INC SI
            LOOP SWAP2
        CMP OCOND, 1
        JE GOUTPUT
        JNE GOUTPUT2

    ; kelantan
    STT3:
        MOV SI, 0
        MOV CL, 14   
        MOV CH, 0
        MOV STTCOUNT, CL
        SWAP3:
            MOV AL, STATE3[SI]
            MOV STATETEXT[SI], AL
            INC SI
            LOOP SWAP3
        CMP OCOND, 1
        JE GOUTPUT
        JNE GOUTPUT2

    ; terengganu
    STT4:
        MOV SI, 0
        MOV CL, 16  
        MOV CH, 0
        MOV STTCOUNT, CL
        SWAP4:
            MOV AL, STATE4[SI]
            MOV STATETEXT[SI], AL
            INC SI
            LOOP SWAP4
        CMP OCOND, 1
        JE GOUTPUT
        JNE GOUTPUT2
    
    ; pahang
    STT5:
        MOV SI, 0
        MOV CL, 12  
        MOV CH, 0
        MOV STTCOUNT, CL
        SWAP5:
            MOV AL, STATE5[SI]
            MOV STATETEXT[SI], AL
            INC SI
            LOOP SWAP5
        CMP OCOND, 1
        JE GOUTPUT
        JNE GOUTPUT2

    ; selangor
    STT6:
        MOV SI, 0
        MOV CL, 14 
        MOV CH, 0
        MOV STTCOUNT, CL
        SWAP6:
            MOV AL, STATE6[SI]
            MOV STATETEXT[SI], AL
            INC SI
            LOOP SWAP6
        CMP OCOND, 1
        JE GOUTPUT
        JNE GOUTPUT2
    
    ; n.sembilan
    STT7:
        MOV SI, 0
        MOV CL, 16 
        MOV CH, 0
        MOV STTCOUNT, CL
        SWAP7:
            MOV AL, STATE7[SI]
            MOV STATETEXT[SI], AL
            INC SI
            LOOP SWAP7
        CMP OCOND, 1
        JE GOUTPUT
        JNE GOUTPUT2

    ; malacca
    STT8:
        MOV SI, 0
        MOV CL, 13  
        MOV CH, 0
        MOV STTCOUNT, CL
        SWAP8:
            MOV AL, STATE8[SI]
            MOV STATETEXT[SI], AL
            INC SI
            LOOP SWAP8
        CMP OCOND, 1
        JE GOUTPUT
        JNE GOUTPUT2
    
    ; johor
    STT9:
        MOV SI, 0
        MOV CL, 11  
        MOV CH, 0
        MOV STTCOUNT, CL
        SWAP9:
            MOV AL, STATE9[SI]
            MOV STATETEXT[SI], AL
            INC SI
            LOOP SWAP9
        CMP OCOND, 1
        JE GOUTPUT
        JNE GOUTPUT2

    ;---------------------------------  DISPLAY PAYMENT PAGE -----------------------------------------;



    ; Code End---------------------------------------------------------------------------------------------------------------------------------;

SHUTDOWN:
    MOV AX, 4C00H
    INT 21H

MAIN ENDP
    END MAIN
