;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module StateWin
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _PrintText
	.globl _Printf
	.globl _InitScrollColor
	.globl _ZInitScrollTilesColor
	.globl _SetState
	.globl _bank_STATE_WIN
	.globl _Start_STATE_WIN
	.globl _Update_STATE_WIN
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_STATE_WIN::
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;StateWin.c:3: UINT8 bank_STATE_WIN = 2;
	ld	hl,#_bank_STATE_WIN
	ld	(hl),#0x02
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_2
;StateWin.c:16: void PrintText() {
;	---------------------------------
; Function PrintText
; ---------------------------------
_PrintText::
;StateWin.c:17: PRINT_POS(5, 13);
	ld	hl,#_print_x
	ld	(hl),#0x05
	ld	hl,#_print_y
	ld	(hl),#0x0d
;StateWin.c:18: Printf("THANKS FOR");
	ld	hl,#___str_0
	push	hl
	call	_Printf
	add	sp, #2
;StateWin.c:19: PRINT_POS(6, 14);
	ld	hl,#_print_x
	ld	(hl),#0x06
	ld	hl,#_print_y
	ld	(hl),#0x0e
;StateWin.c:20: Printf("PLAYING!");
	ld	hl,#___str_1
	push	hl
	call	_Printf
	add	sp, #2
	ret
___str_0:
	.ascii "THANKS FOR"
	.db 0x00
___str_1:
	.ascii "PLAYING!"
	.db 0x00
;StateWin.c:23: void Start_STATE_WIN() {
;	---------------------------------
; Function Start_STATE_WIN
; ---------------------------------
_Start_STATE_WIN::
;StateWin.c:25: InitScrollTiles(0, 104, tiles, 3);
	ld	hl,#0x0000
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	hl,#_tiles
	push	hl
	ld	hl,#0x6800
	push	hl
	call	_ZInitScrollTilesColor
	add	sp, #7
;StateWin.c:26: InitScroll(victoryWidth, victoryHeight, victory, 0, 0, 3);
	ld	hl,#0x0000
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	l, #0x00
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl,#_victory
	push	hl
	ld	hl,#0x0012
	push	hl
	ld	l, #0x14
	push	hl
	call	_InitScrollColor
	add	sp, #13
;StateWin.c:27: SHOW_BKG;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	0, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;StateWin.c:29: INIT_FONT(font, 3, PRINT_BKG);	
	ld	hl,#0x0000
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	hl,#_font
	push	hl
	ld	hl,#0x2dd2
	push	hl
	call	_ZInitScrollTilesColor
	add	sp, #7
	ld	hl,#_font_idx
	ld	(hl),#0xd2
	ld	hl,#_print_target
	ld	(hl),#0x00
;StateWin.c:30: PrintText();
	jp	_PrintText
;StateWin.c:33: void Update_STATE_WIN() {
;	---------------------------------
; Function Update_STATE_WIN
; ---------------------------------
_Update_STATE_WIN::
;StateWin.c:34: if (KEY_TICKED(J_START)) {
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	7, c
	ret	Z
	ld	hl,#_previous_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	7, c
	ret	NZ
;StateWin.c:35: SetState(STATE_START);
	ld	a,#0x01
	push	af
	inc	sp
	call	_SetState
	inc	sp
	ret
	.area _CODE_2
	.area _CABS (ABS)
