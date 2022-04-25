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

(BIGLOOP)
  @KBD
  D=M
  @NPRESSED
  D;JEQ
  @PRESSED
  0;JMP

(PRESSED)
  @i
  M=0
  (LOOPP)
    @8192
    D=A
    @i
    D=M-D // D=M-16 is not valid, since '=' can only deal with -1,0,1
    @BIGLOOP
    D;JEQ

    @SCREEN
    D=A
    @i
    D=D+M
    M=M+1
    A=D
    D=0
    M=!D
    @LOOPP
    0;JMP

(NPRESSED)
  @i
  M=0
  (LOOPN)
    @8192
    D=A
    @i
    D=M-D
    @BIGLOOP
    D;JEQ

    @SCREEN
    D=A
    @i
    D=D+M
    M=M+1
    A=D
    M=0
    @LOOPN
    0;JMP
