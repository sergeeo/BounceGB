;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module StateStart
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
	.globl _level
	.globl _lifes
	.globl _bank_STATE_START
	.globl _Start_STATE_START
	.globl _Update_STATE_START
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_STATE_START::
	.ds 1
_lifes::
	.ds 1
_level::
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
;StateStart.c:3: UINT8 bank_STATE_START = 2;
	ld	hl,#_bank_STATE_START
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
;StateStart.c:19: void PrintText() {
;	---------------------------------
; Function PrintText
; ---------------------------------
_PrintText::
;StateStart.c:20: PRINT_POS(4, 13);
	ld	hl,#_print_x
	ld	(hl),#0x04
	ld	hl,#_print_y
	ld	(hl),#0x0d
;StateStart.c:21: Printf("PRESS START!");
	ld	hl,#___str_0
	push	hl
	call	_Printf
	add	sp, #2
;StateStart.c:22: PRINT_POS(2, 15);
	ld	hl,#_print_x
	ld	(hl),#0x02
	ld	hl,#_print_y
	ld	(hl),#0x0f
;StateStart.c:23: Printf("SERGEEO ZGBJAM18");
	ld	hl,#___str_1
	push	hl
	call	_Printf
	add	sp, #2
	ret
___str_0:
	.ascii "PRESS START!"
	.db 0x00
___str_1:
	.ascii "SERGEEO ZGBJAM18"
	.db 0x00
;StateStart.c:26: void Start_STATE_START() {
;	---------------------------------
; Function Start_STATE_START
; ---------------------------------
_Start_STATE_START::
;StateStart.c:27: PlayMusic(startmusic_mod_Data, 3, 1);
	ld	hl,#0x0103
	push	hl
	ld	hl,#_startmusic_mod_Data
	push	hl
	call	_PlayMusic
	add	sp, #4
;StateStart.c:28: lifes = 5;
	ld	hl,#_lifes
	ld	(hl),#0x05
;StateStart.c:29: level = 1;
	ld	hl,#_level
	ld	(hl),#0x01
;StateStart.c:31: InitScrollTiles(0, 104, tiles, 3);
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
;StateStart.c:32: InitScroll(pressstartWidth, pressstartHeight, pressstart, 0, 0, 3);
	ld	hl,#0x0000
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	l, #0x00
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl,#_pressstart
	push	hl
	ld	hl,#0x0012
	push	hl
	ld	l, #0x14
	push	hl
	call	_InitScrollColor
	add	sp, #13
;StateStart.c:33: SHOW_BKG;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	0, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;StateStart.c:35: INIT_FONT(font, 3, PRINT_BKG);	
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
;StateStart.c:36: PrintText();
	jp	_PrintText
;StateStart.c:39: void Update_STATE_START() {
;	---------------------------------
; Function Update_STATE_START
; ---------------------------------
_Update_STATE_START::
;StateStart.c:40: if (KEY_TICKED(J_START)) {
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
;StateStart.c:41: SetState(STATE_GAME);
	xor	a, a
	push	af
	inc	sp
	call	_SetState
	inc	sp
	ret
	.area _CODE_2
	.area _CABS (ABS)
