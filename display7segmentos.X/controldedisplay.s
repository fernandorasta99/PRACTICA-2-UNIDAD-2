PROCESSOR 16F887 
    
    #include <xc.inc>  
    CONFIG FOSC=INTRC_NOCLKOUT 
  
    CONFIG WDTE=OFF
    CONFIG PWRTE=ON
    CONFIG MCLRE=OFF
    CONFIG CP=OFF
    CONFIG CPD=OFF
    CONFIG BOREN=OFF
    CONFIG IESO=OFF
    CONFIG FCMEN=OFF
    CONFIG LVP=OFF
    CONFIG DEBUG=ON
    
    CONFIG BOR4V=BOR40V
    CONFIG WRT=OFF
     
    
    PSECT udata
mask:
    DS 1
cont:
    ds 1
    
PSECT resetVEC,class=CODE, delta=2
resetvec:
    PAGESEL main
    goto main
    
    PSECT code
 n0:
    BANKSEL PORTA 
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    movlw 0b11111100
    movwf PORTA
    PAGESEL main
    return
    
    PSECT code
n1:
    BANKSEL PORTA 
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    movlw 0b01100000
    movwf PORTA
    PAGESEL main
    return
    
    PSECT code
n2:
    BANKSEL PORTA 
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    movlw 0b11011010 ;encendemos a,b,d,e y g
    movwf PORTA
    PAGESEL main
    return
    
    PSECT code
n3:
    BANKSEL PORTA 
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    movlw 0b11110010 ;encendemos a,b,c,d y g
    movwf PORTA
    PAGESEL main
    return
    
    PSECT code
n4:
    BANKSEL PORTA 
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    movlw 0b01100110 ;encendemos b,c,f y g
    movwf PORTA
    PAGESEL main
    return
    
    PSECT code
 n5:
    BANKSEL PORTA 
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    movlw 0b10110110 ;encendemos a,c,d,f y g
    movwf PORTA
    PAGESEL main
    return
    
    PSECT code
 n6:
    BANKSEL PORTA 
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    movlw 0b10111110 ;encendemos a,c,d,e,f,g
    movwf PORTA
    PAGESEL main
    return
    
    PSECT code
 n7:
    BANKSEL PORTA 
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    movlw 0b11100000 ;encendemo a,b y c
    movwf PORTA
    PAGESEL main
    return
    
    PSECT code
 n8:
    BANKSEL PORTA 
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    movlw 0b11111110 ;encendemos a,b,c,d,e,f y g
    movwf PORTA
    PAGESEL main
    return
    
    PSECT code
 n9:
    BANKSEL PORTA 
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    movlw 0b11110110 ;encendemos a,b,c,f y g
    movwf PORTA
    PAGESEL main
    return
    
    PSECT code
 pausa:
    bcf STATUS,6
    bcf STATUS,5
    movlw 0b00000001
    movwf 0x20
 
    suma:
    incfsz 0x20,f
    goto suma
    bcf STATUS,6
    bcf STATUS,5
    movlw 0b00000001
    movwf 0x21
 
    suma1:
    incfsz 0x21,f
    goto suma1
    bcf STATUS,6
    bcf STATUS,5
    movlw 0b00000001
    movwf 0x22
 
    suma2:
    incfsz 0x22,f
    btfss 0x22,3
    goto suma2
    return
    
    
    PSECT code
    main:
    BANKSEL PORTA 
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    BANKSEL OSCCON
    movlw   0x71    
    movwf   OSCCON
    movlw 0b00000000
    movwf PORTA
 
    loop:
    PAGESEL n0
    call n0
    call pausa
    call n1
    call pausa
    call n2
    call pausa
    call n3
    call pausa
    call n4
    call pausa
    call n5
    call pausa 
    call n6
    call pausa
    call n7
    call pausa
    call n8
    call pausa
    call n9
    call pausa
    goto loop
    END