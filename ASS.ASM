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

        INT 21H
        MOV AH, 09H
        LEA DX, REG_SUCCESS
        INT 21H     
        JMP TOPUP

    TOPUP:
        JMP SHUTDOWN

    GUEST:
        JMP SHUTDOWN

    UFILE: 
        JMP SHUTDOWN
    PFILE:
        JMP SHUTDOWN

    AFILE: 
        JMP SHUTDOWN

    ; Code End---------------------------------------------------------------------------------------------------------------------------------;

SHUTDOWN:
    MOV AX, 4C00H
    INT 21H

MAIN ENDP
    END MAIN
