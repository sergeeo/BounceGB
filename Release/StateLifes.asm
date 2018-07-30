;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module StateLifes
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
	.globl _bank_STATE_LIFES
	.globl _Start_STATE_LIFES
	.globl _Update_STATE_LIFES
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_STATE_LIFES::
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
;StateLifes.c:3: UINT8 bank_STATE_LIFES = 2;
	ld	hl,#_bank_STATE_LIFES
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
;StateLifes.c:18: void PrintText() {
;	---------------------------------
; Function PrintText
; ---------------------------------
_PrintText::
;StateLifes.c:19: PRINT_POS(3, 3);
	ld	hl,#_print_x
	ld	(hl),#0x03
	ld	hl,#_print_y
	ld	(hl),#0x03
;StateLifes.c:20: Printf("THAT WAS CLOSE");
	ld	hl,#___str_0
	push	hl
	call	_Printf
	add	sp, #2
;StateLifes.c:21: PRINT_POS(7, 4);
	ld	hl,#_print_x
	ld	(hl),#0x07
	ld	hl,#_print_y
	ld	(hl),#0x04
;StateLifes.c:22: Printf("BUDDY");
	ld	hl,#___str_1
	push	hl
	call	_Printf
	add	sp, #2
;StateLifes.c:23: if (lifes > 1) {
	ld	a,#0x01
	ld	hl,#_lifes
	sub	a, (hl)
	jr	NC,00102$
;StateLifes.c:24: PRINT_POS(4, 14);
	ld	hl,#_print_x
	ld	(hl),#0x04
	ld	hl,#_print_y
	ld	(hl),#0x0e
;StateLifes.c:25: Printf("%d LIFES LEFT", lifes);
	ld	hl,#_lifes
	ld	c,(hl)
	ld	b,#0x00
	push	bc
	ld	hl,#___str_2
	push	hl
	call	_Printf
	add	sp, #4
00102$:
;StateLifes.c:27: if (lifes == 1) {
	ld	hl,#_lifes
	ld	a,(hl)
	dec	a
	ret	NZ
;StateLifes.c:28: PRINT_POS(4, 14);
	ld	hl,#_print_x
	ld	(hl),#0x04
	ld	hl,#_print_y
	ld	(hl),#0x0e
;StateLifes.c:29: Printf("%d LIFE LEFT!", lifes);
	ld	hl,#_lifes
	ld	c,(hl)
	ld	b,#0x00
	push	bc
	ld	hl,#___str_3
	push	hl
	call	_Printf
	add	sp, #4
	ret
___str_0:
	.ascii "THAT WAS CLOSE"
	.db 0x00
___str_1:
	.ascii "BUDDY"
	.db 0x00
___str_2:
	.ascii "%d LIFES LEFT"
	.db 0x00
___str_3:
	.ascii "%d LIFE LEFT!"
	.db 0x00
;StateLifes.c:33: void Start_STATE_LIFES() {
;	---------------------------------
; Function Start_STATE_LIFES
; ---------------------------------
_Start_STATE_LIFES::
;StateLifes.c:34: PlayMusic(gameovermusic_mod_Data, 3, 1);
	ld	hl,#0x0103
	push	hl
	ld	hl,#_gameovermusic_mod_Data
	push	hl
	call	_PlayMusic
	add	sp, #4
;StateLifes.c:36: InitScrollTiles(0, 104, tiles, 3);
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
;StateLifes.c:37: InitScroll(lifesleftWidth, lifesleftHeight, lifesleft, 0, 0, 3);
	ld	hl,#0x0000
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	l, #0x00
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl,#_lifesleft
	push	hl
	ld	hl,#0x0012
	push	hl
	ld	l, #0x14
	push	hl
	call	_InitScrollColor
	add	sp, #13
;StateLifes.c:38: SHOW_BKG;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	0, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;StateLifes.c:39: if (lifes > 0) {
	ld	hl,#_lifes
	ld	a,(hl)
	or	a, a
	jr	Z,00102$
;StateLifes.c:40: lifes = lifes - 1;
	dec	(hl)
00102$:
;StateLifes.c:42: INIT_FONT(font, 3, PRINT_BKG);
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
;StateLifes.c:43: PrintText();
	jp	_PrintText
;StateLifes.c:47: void Update_STATE_LIFES() {
;	---------------------------------
; Function Update_STATE_LIFES
; ---------------------------------
_Update_STATE_LIFES::
;StateLifes.c:48: if (keys) {
	ld	hl,#_keys
	ld	a,(hl)
	or	a, a
	ret	Z
;StateLifes.c:49: if (lifes > 0)
	ld	hl,#_lifes
	ld	a,(hl)
	or	a, a
	jr	Z,00102$
;StateLifes.c:51: SetState(STATE_GAME);
	xor	a, a
	push	af
	inc	sp
	call	_SetState
	inc	sp
	ret
00102$:
;StateLifes.c:54: SetState(STATE_GAMEOVER);
	ld	a,#0x03
	push	af
	inc	sp
	call	_SetState
	inc	sp
	ret
	.area _CODE_2
	.area _CABS (ABS)
