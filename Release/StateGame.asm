;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module StateGame
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SpriteManagerAdd
	.globl _SpriteManagerLoad
	.globl _ScrollFindTile
	.globl _InitScrollColor
	.globl _ZInitScrollTilesColor
	.globl _PlayMusic
	.globl _SetState
	.globl _collision_tiles
	.globl _bank_STATE_GAME
	.globl _Start_STATE_GAME
	.globl _Update_STATE_GAME
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_STATE_GAME::
	.ds 1
_collision_tiles::
	.ds 19
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
;StateGame.c:3: UINT8 bank_STATE_GAME = 2;
	ld	hl,#_bank_STATE_GAME
	ld	(hl),#0x02
;StateGame.c:22: UINT8 collision_tiles[] = { 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 19, 20, 21, 22, 0 };
	ld	hl,#_collision_tiles
	ld	(hl),#0x02
	ld	hl,#(_collision_tiles + 0x0001)
	ld	(hl),#0x03
	ld	hl,#(_collision_tiles + 0x0002)
	ld	(hl),#0x04
	ld	hl,#(_collision_tiles + 0x0003)
	ld	(hl),#0x05
	ld	hl,#(_collision_tiles + 0x0004)
	ld	(hl),#0x06
	ld	hl,#(_collision_tiles + 0x0005)
	ld	(hl),#0x07
	ld	hl,#(_collision_tiles + 0x0006)
	ld	(hl),#0x08
	ld	hl,#(_collision_tiles + 0x0007)
	ld	(hl),#0x09
	ld	hl,#(_collision_tiles + 0x0008)
	ld	(hl),#0x0a
	ld	hl,#(_collision_tiles + 0x0009)
	ld	(hl),#0x0b
	ld	hl,#(_collision_tiles + 0x000a)
	ld	(hl),#0x0c
	ld	hl,#(_collision_tiles + 0x000b)
	ld	(hl),#0x0d
	ld	hl,#(_collision_tiles + 0x000c)
	ld	(hl),#0x0e
	ld	hl,#(_collision_tiles + 0x000d)
	ld	(hl),#0x0f
	ld	hl,#(_collision_tiles + 0x000e)
	ld	(hl),#0x13
	ld	hl,#(_collision_tiles + 0x000f)
	ld	(hl),#0x14
	ld	hl,#(_collision_tiles + 0x0010)
	ld	(hl),#0x15
	ld	hl,#(_collision_tiles + 0x0011)
	ld	(hl),#0x16
	ld	hl,#(_collision_tiles + 0x0012)
	ld	(hl),#0x00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_2
;StateGame.c:24: void Start_STATE_GAME() {
;	---------------------------------
; Function Start_STATE_GAME
; ---------------------------------
_Start_STATE_GAME::
	add	sp, #-4
;StateGame.c:29: NR52_REG = 0x80; //Enables sound, you should always setup this first
	ld	hl,#0xff26
	ld	(hl),#0x80
;StateGame.c:30: NR51_REG = 0xFF; //Enables all channels (left and right)
	ld	l, #0x25
	ld	(hl),#0xff
;StateGame.c:31: NR50_REG = 0x77; //Max volume
	ld	l, #0x24
	ld	(hl),#0x77
;StateGame.c:33: PlayMusic(levelmusic_mod_Data, 3, 1);
	ld	hl,#0x0103
	push	hl
	ld	hl,#_levelmusic_mod_Data
	push	hl
	call	_PlayMusic
	add	sp, #4
;StateGame.c:35: SPRITES_8x16;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	2, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;StateGame.c:36: for(i = 0; i != n_sprite_types; ++ i) {
	ld	b,#0x00
00113$:
	ld	hl,#_n_sprite_types
	ld	a,(hl)
	sub	a, b
	jr	Z,00101$
;StateGame.c:37: SpriteManagerLoad(i);
	push	bc
	push	bc
	inc	sp
	call	_SpriteManagerLoad
	inc	sp
	pop	bc
;StateGame.c:36: for(i = 0; i != n_sprite_types; ++ i) {
	inc	b
	jr	00113$
00101$:
;StateGame.c:39: SHOW_SPRITES;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	1, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;StateGame.c:41: if(level ==1) {
	ld	hl,#_level
	ld	a,(hl)
	dec	a
	jp	NZ,00103$
;StateGame.c:42: ScrollFindTile(mapWidth, map, 3, 18, 0, 0, mapWidth, mapHeight, &startX, &startY);
	ldhl	sp,#0
	ld	c,l
	ld	b,h
	ldhl	sp,#2
	ld	e,l
	ld	d,h
	push	bc
	push	de
	ld	hl,#0x1228
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x1203
	push	hl
	ld	hl,#_map
	push	hl
	ld	hl,#0x0028
	push	hl
	call	_ScrollFindTile
	add	sp, #14
;StateGame.c:43: scroll_target = SpriteManagerAdd(SPRITE_PLAYERLITTLE, startX << 3, startY << 3);
	pop	bc
	push	bc
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	ldhl	sp,#(3 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	push	bc
	push	de
	xor	a, a
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
	ld	hl,#_scroll_target
	ld	(hl),e
	inc	hl
	ld	(hl),d
;StateGame.c:45: InitScrollTiles(0, 104, tiles, 3);
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
;StateGame.c:46: InitScroll(mapWidth, mapHeight, map, collision_tiles, 0, 3);
	ld	hl,#0x0000
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	l, #0x00
	push	hl
	ld	hl,#_collision_tiles
	push	hl
	ld	hl,#_map
	push	hl
	ld	hl,#0x0012
	push	hl
	ld	l, #0x28
	push	hl
	call	_InitScrollColor
	add	sp, #13
;StateGame.c:47: SHOW_BKG;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	0, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
00103$:
;StateGame.c:49: if (level == 3) {
	ld	hl,#_level
	ld	a,(hl)
	sub	a, #0x03
	jp	NZ,00105$
;StateGame.c:50: ScrollFindTile(map2Width, map2, 3, 18, 0, 0, map2Width, map2Height, &startX, &startY);
	ldhl	sp,#0
	ld	c,l
	ld	b,h
	ldhl	sp,#2
	ld	e,l
	ld	d,h
	push	bc
	push	de
	ld	hl,#0x1228
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x1203
	push	hl
	ld	hl,#_map2
	push	hl
	ld	hl,#0x0028
	push	hl
	call	_ScrollFindTile
	add	sp, #14
;StateGame.c:51: scroll_target = SpriteManagerAdd(SPRITE_PLAYERLITTLE, startX << 3, startY << 3);
	pop	bc
	push	bc
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	ldhl	sp,#(3 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	push	bc
	push	de
	xor	a, a
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
	ld	hl,#_scroll_target
	ld	(hl),e
	inc	hl
	ld	(hl),d
;StateGame.c:53: InitScrollTiles(0, 104, tiles, 3);
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
;StateGame.c:54: InitScroll(map2Width, map2Height, map2, collision_tiles, 0, 3);
	ld	hl,#0x0000
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	l, #0x00
	push	hl
	ld	hl,#_collision_tiles
	push	hl
	ld	hl,#_map2
	push	hl
	ld	hl,#0x0012
	push	hl
	ld	l, #0x28
	push	hl
	call	_InitScrollColor
	add	sp, #13
;StateGame.c:55: SHOW_BKG;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	0, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
00105$:
;StateGame.c:57: if (level == 2) {
	ld	hl,#_level
	ld	a,(hl)
	sub	a, #0x02
	jp	NZ,00107$
;StateGame.c:58: ScrollFindTile(map3Width, map3, 3, 18, 0, 0, map3Width, map3Height, &startX, &startY);
	ldhl	sp,#0
	ld	c,l
	ld	b,h
	ldhl	sp,#2
	ld	e,l
	ld	d,h
	push	bc
	push	de
	ld	hl,#0x1228
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x1203
	push	hl
	ld	hl,#_map3
	push	hl
	ld	hl,#0x0028
	push	hl
	call	_ScrollFindTile
	add	sp, #14
;StateGame.c:59: scroll_target = SpriteManagerAdd(SPRITE_PLAYERLITTLE, startX << 3, startY << 3);
	pop	bc
	push	bc
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	ldhl	sp,#(3 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	push	bc
	push	de
	xor	a, a
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
	ld	hl,#_scroll_target
	ld	(hl),e
	inc	hl
	ld	(hl),d
;StateGame.c:61: InitScrollTiles(0, 104, tiles, 3);
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
;StateGame.c:62: InitScroll(mapWidth, mapHeight, map3, collision_tiles, 0, 3);
	ld	hl,#0x0000
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	l, #0x00
	push	hl
	ld	hl,#_collision_tiles
	push	hl
	ld	hl,#_map3
	push	hl
	ld	hl,#0x0012
	push	hl
	ld	l, #0x28
	push	hl
	call	_InitScrollColor
	add	sp, #13
;StateGame.c:63: SHOW_BKG;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	0, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
00107$:
;StateGame.c:65: if (level == 4) {
	ld	hl,#_level
	ld	a,(hl)
	sub	a, #0x04
	jp	NZ,00109$
;StateGame.c:66: ScrollFindTile(map4Width, map4, 3, 18, 0, 0, map4Width, map4Height, &startX, &startY);
	ldhl	sp,#0
	ld	c,l
	ld	b,h
	ldhl	sp,#2
	ld	e,l
	ld	d,h
	push	bc
	push	de
	ld	hl,#0x1228
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x1203
	push	hl
	ld	hl,#_map4
	push	hl
	ld	hl,#0x0028
	push	hl
	call	_ScrollFindTile
	add	sp, #14
;StateGame.c:67: scroll_target = SpriteManagerAdd(SPRITE_PLAYERLITTLE, startX << 3, startY << 3);
	pop	bc
	push	bc
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	ldhl	sp,#(3 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	push	bc
	push	de
	xor	a, a
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
	ld	hl,#_scroll_target
	ld	(hl),e
	inc	hl
	ld	(hl),d
;StateGame.c:69: InitScrollTiles(0, 104, tiles, 3);
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
;StateGame.c:70: InitScroll(map4Width, map4Height, map4, collision_tiles, 0, 3);
	ld	hl,#0x0000
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	l, #0x00
	push	hl
	ld	hl,#_collision_tiles
	push	hl
	ld	hl,#_map4
	push	hl
	ld	hl,#0x0012
	push	hl
	ld	l, #0x28
	push	hl
	call	_InitScrollColor
	add	sp, #13
;StateGame.c:71: SHOW_BKG;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	0, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
00109$:
;StateGame.c:73: if (level > 4) {
	ld	a,#0x04
	ld	hl,#_level
	sub	a, (hl)
	jr	NC,00115$
;StateGame.c:74: SetState(STATE_WIN);
	ld	a,#0x04
	push	af
	inc	sp
	call	_SetState
	inc	sp
00115$:
	add	sp, #4
	ret
;StateGame.c:80: void Update_STATE_GAME() {
;	---------------------------------
; Function Update_STATE_GAME
; ---------------------------------
_Update_STATE_GAME::
;StateGame.c:81: }
	ret
	.area _CODE_2
	.area _CABS (ABS)
