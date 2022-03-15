// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// SCREEN iS 256x512 pixels
// One register holds 16 horiontal pixels
// iterations needed

// end register, we going from bottom right to top left
@8191 // one lower than 8192 bc screen already holds next value
D=A
@SCRN_SIZE
M=D


(KEYBOARD_CHECK_WHITE)
    @KEYBOARD_CHECK_BLACK
    D=A
    @switch
    M=D

    @KBD
    D=M
    @KEYBOARD_CHECK_WHITE
    D;JEQ
    @fill_cell
    M=-1
    @LOOP_INIT
    0;JMP

(KEYBOARD_CHECK_BLACK)
    @KEYBOARD_CHECK_WHITE
    D=A
    @switch
    M=D

    @KBD
    D=M
    @KEYBOARD_CHECK_BLACK
    D;JNE
    @fill_cell
    M=0
    @LOOP_INIT
    0;JMP

(LOOP_INIT)
    @SCRN_SIZE
    D=M
    @col
    M=D
(LOOP)
    @col
    D=M
    @switch
    A=M
    D;JEQ

    @SCREEN
    D=A
    @col
    D=D+M
    @temp
    M=D
    @fill_cell
    D=M
    @temp
    A=M 
    M=D
    
    @col
    M=M-1
    @LOOP
    0;JMP
