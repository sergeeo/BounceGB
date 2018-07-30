;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module StateGameOver
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _PrintText
	.globl _Printf
	.globl _InitScrollColor
	.globl _ZInitScrollTilesColor
	.globl _PlayMusic
	.globl _SetState
	.globl _bank_STATE_GAMEOVER
	.globl _Start_STATE_GAMEOVER
	.globl _Update_STATE_GAMEOVER
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_STATE_GAMEOVER::
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
;StateGameOver.c:3: UINT8 bank_STATE_GAMEOVER = 2;
	ld	hl,#_bank_STATE_GAMEOVER
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
;StateGameOver.c:17: void PrintText() {
;	---------------------------------
; Function PrintText
; ---------------------------------
_PrintText::
;StateGameOver.c:18: PRINT_POS(5, 14);
	ld	hl,#_print_x
	ld	(hl),#0x05
	ld	hl,#_print_y
	ld	(hl),#0x0e
;StateGameOver.c:19: Printf("TRY AGAIN!!");
	ld	hl,#___str_0
	push	hl
	call	_Printf
	add	sp, #2
	ret
___str_0:
	.ascii "TRY AGAIN!!"
	.db 0x00
;StateGameOver.c:22: void Start_STATE_GAMEOVER() {
;	---------------------------------
; Function Start_STATE_GAMEOVER
; ---------------------------------
_Start_STATE_GAMEOVER::
;StateGameOver.c:23: PlayMusic(gameovermusic_mod_Data, 3, 1);
	ld	hl,#0x0103
	push	hl
	ld	hl,#_gameovermusic_mod_Data
	push	hl
	call	_PlayMusic
	add	sp, #4
;StateGameOver.c:24: InitScrollTiles(0, 104, tiles, 3);
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
;StateGameOver.c:25: InitScroll(gameoverWidth, gameoverHeight, gameover, 0, 0, 3);
	ld	hl,#0x0000
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	l, #0x00
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl,#_gameover
	push	hl
	ld	hl,#0x0012
	push	hl
	ld	l, #0x14
	push	hl
	call	_InitScrollColor
	add	sp, #13
;StateGameOver.c:26: SHOW_BKG;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	0, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;StateGameOver.c:28: INIT_FONT(font, 3, PRINT_BKG);
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
;StateGameOver.c:29: PrintText();
	jp	_PrintText
;StateGameOver.c:32: void Update_STATE_GAMEOVER() {
;	---------------------------------
; Function Update_STATE_GAMEOVER
; ---------------------------------
_Update_STATE_GAMEOVER::
;StateGameOver.c:33: if (keys) {
	ld	hl,#_keys
	ld	a,(hl)
	or	a, a
	ret	Z
;StateGameOver.c:34: SetState(STATE_START);
	ld	a,#0x01
	push	af
	inc	sp
	call	_SetState
	inc	sp
	ret
	.area _CODE_2
	.area _CABS (ABS)
