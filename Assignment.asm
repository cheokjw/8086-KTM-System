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
                DB 13,10,13,10,                 "                            1.    Login as Member                       "
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
A_REGISTER          LABEL       BYTE
MAX_REG_NAME         DB          8
ACT_REG_NAME         DB          ?
REG_USERNAME         DB          8 DUP (0)
; store register password
REG_PASS             DB          8 DUP (0)
; store register age
A_AGE               LABEL       BYTE
MAX_AGE              DB          2
ACT_AGE              DB          ?
REG_AGE              DB          2 DUP (0)

; File Variable (Read and write)
FNAME           DB 'INFO.TXT', 0
HANDLE          DB       ?              ; This would be the file handle, the number that DOS assigns to open file
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
        ; Register: Get input username 
        MOV CX,0
        MOV CX,8
        MOV SI,0
        GETUNAME:
            MOV AH,01H
            INT 21H
            MOV USERNAME[SI], AL
            INC SI
            LOOP GETUNAME

        MOV AH, 09H
        LEA DX, REG_PASS_TXT
        INT 21H
        ; Register: Get input password
        MOV CX, 0
        MOV CX, 8
        MOV SI, 0
        GETRPASS:
            MOV AH, 01H
            INT 21H
            MOV REG_PASS[SI], AL
            INC SI
            LOOP GETRPASS

        MOV AH, 09H
        LEA DX, REG_AGE_TXT
        INT 21H
        ; Register: Get input age
        MOV CX, 0
        MOV CX, 1
        MOV SI, 0
        GETRAGE:
            MOV AH, 01H
            INT 21H
            MOV REG_AGE[SI], AL
            INC SI
            LOOP GETRAGE

        INT 21H
        MOV AH, 09H
        LEA DX, REG_SUCCESS
        INT 21H
        JMP FILEHANDLING

        ; Write registered data into file
        FILEHANDLING:
            MOV AH, 3DH         ; byte for open file
            MOV AL, 1           ; 0 -> reading, 1 -> writing, 2 -> both
            LEA DX, FNAME
            INT 21H
            MOV HANDLE, AX      ; byte 3DH returns the file handle in AX, we'll be saving it for later use

            MOV AH, 42H         ; LSEEK operator = set current file position
            MOV AL, 2           ; move cursor to end of file
            MOV CX, 0
            MOV DX, 0
            INT 21H

        JMP TOPUP

    TOPUP:
        JMP SHUTDOWN

    GUEST:
        JMP SHUTDOWN



    ; Code End---------------------------------------------------------------------------------------------------------------------------------;

SHUTDOWN:
    MOV AX, 4C00H
    INT 21H

MAIN ENDP
    END MAIN
