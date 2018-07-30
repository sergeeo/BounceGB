;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module SpritePlayerLittle
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _PlayFx
	.globl _SpriteManagerRemoveSprite
	.globl _SpriteManagerAdd
	.globl _SetState
	.globl _TranslateSprite
	.globl _SetSpriteAnim
	.globl _bank_SPRITE_PLAYERLITTLE
	.globl _anim_walk
	.globl _Start_SPRITE_PLAYERLITTLE
	.globl _Update_SPRITE_PLAYERLITTLE
	.globl _Destroy_SPRITE_PLAYERLITTLE
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_SPRITE_PLAYERLITTLE::
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
;SpritePlayerLittle.c:18: UINT8 bank_SPRITE_PLAYERLITTLE = 2;
	ld	hl,#_bank_SPRITE_PLAYERLITTLE
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
;SpritePlayerLittle.c:29: void Start_SPRITE_PLAYERLITTLE() {
;	---------------------------------
; Function Start_SPRITE_PLAYERLITTLE
; ---------------------------------
_Start_SPRITE_PLAYERLITTLE::
	add	sp, #-2
;SpritePlayerLittle.c:31: struct PlayerCustomData* data = (struct PlayerCustomData*)THIS->custom_data;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0018
	add	hl,bc
	ld	c,l
	ld	b,h
;SpritePlayerLittle.c:32: data->xvel = 0;
	ld	hl,#0x0006
	add	hl,bc
	inc	sp
	inc	sp
	push	hl
	pop	hl
	push	hl
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;SpritePlayerLittle.c:33: data->ygrav = 0;
	ld	a,#0x00
	ld	(bc),a
	inc	bc
	ld	a,#0x00
	ld	(bc),a
;SpritePlayerLittle.c:35: THIS->coll_x = 0u;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x000c
	add	hl,bc
	ld	c,l
	ld	b,h
	xor	a, a
	ld	(bc),a
;SpritePlayerLittle.c:36: THIS->coll_y = 0u;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x000d
	add	hl,bc
	ld	c,l
	ld	b,h
	xor	a, a
	ld	(bc),a
;SpritePlayerLittle.c:37: THIS->coll_w = 8u;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x000e
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0x08
	ld	(bc),a
;SpritePlayerLittle.c:38: THIS->coll_h = 8u;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x000f
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0x08
	ld	(bc),a
	add	sp, #2
	ret
_anim_walk:
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
;SpritePlayerLittle.c:41: void Update_SPRITE_PLAYERLITTLE() {
;	---------------------------------
; Function Update_SPRITE_PLAYERLITTLE
; ---------------------------------
_Update_SPRITE_PLAYERLITTLE::
	add	sp, #-10
;SpritePlayerLittle.c:43: struct PlayerCustomData* data = (struct PlayerCustomData*)THIS->custom_data;
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#8
	ld	(hl+),a
	ld	(hl),e
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0018
	add	hl,de
	ld	c,l
	ld	b,h
	inc	sp
	inc	sp
	push	bc
;SpritePlayerLittle.c:46: INT8 incx = 0;
	ldhl	sp,#2
	ld	(hl),#0x00
;SpritePlayerLittle.c:47: INT8 incy = 0;
	ldhl	sp,#5
	ld	(hl),#0x00
;SpritePlayerLittle.c:51: if (KEY_TICKED(J_LEFT)) {
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
;SpritePlayerLittle.c:55: if (data->xvel >= -MINXVELOCITY) {
	pop	de
	push	de
	ld	hl,#0x0006
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#6
	ld	(hl+),a
	ld	(hl),d
;SpritePlayerLittle.c:51: if (KEY_TICKED(J_LEFT)) {
	bit	1, c
	jp	Z,00104$
	ld	hl,#_previous_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	1, c
	jp	NZ,00104$
;SpritePlayerLittle.c:53: SPRITE_SET_VMIRROR(THIS);
	ldhl	sp,#(9 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x000b
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	set	5, a
	ld	(bc),a
;SpritePlayerLittle.c:55: if (data->xvel >= -MINXVELOCITY) {
	ldhl	sp,#(7 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ld	a,#0xff
	ld	e,a
	ld	a,b
	ld	d,a
	ld	a,c
	sub	a, #0xe0
	ld	a,b
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	C,00104$
;SpritePlayerLittle.c:56: data->xvel = -LATERALIMPULSE;
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0xfd
00104$:
;SpritePlayerLittle.c:59: if (KEY_TICKED(J_RIGHT)) {
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	0, c
	jp	Z,00109$
	ld	hl,#_previous_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	0, c
	jp	NZ,00109$
;SpritePlayerLittle.c:43: struct PlayerCustomData* data = (struct PlayerCustomData*)THIS->custom_data;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;SpritePlayerLittle.c:53: SPRITE_SET_VMIRROR(THIS);
	ld	hl,#0x000b
	add	hl,bc
	ld	c,l
	ld	b,h
;SpritePlayerLittle.c:61: SPRITE_UNSET_VMIRROR(THIS);
	ld	a,(bc)
	and	a, #0xdf
	ld	(bc),a
;SpritePlayerLittle.c:63: if (data->xvel <= MINXVELOCITY) {
	ldhl	sp,#(7 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ld	e,a
	ld	a,#0x00
	ld	d,a
	ld	a,#0x20
	cp	a, c
	ld	a,#0x00
	sbc	a, b
	bit	7, e
	jr	Z,00229$
	bit	7, d
	jr	NZ,00230$
	cp	a, a
	jr	00230$
00229$:
	bit	7, d
	jr	Z,00230$
	scf
00230$:
	jr	C,00109$
;SpritePlayerLittle.c:64: data->xvel = LATERALIMPULSE;
	ldhl	sp,#6
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x03
00109$:
;SpritePlayerLittle.c:69: SetSpriteAnim(THIS, anim_walk, 15);
	ld	a,#0x0f
	push	af
	inc	sp
	ld	hl,#_anim_walk
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_SetSpriteAnim
	add	sp, #5
;SpritePlayerLittle.c:72: data->yaccum.w += data->ygrav;
	pop	de
	push	de
	ld	hl,#0x0002
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#8
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ldhl	sp,#3
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	pop	de
	push	de
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	ldhl	sp,#8
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),c
	inc	hl
	ld	(hl),b
;SpritePlayerLittle.c:73: if (data->yaccum.b.h != 0) {
	ldhl	sp,#(9 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	ld	a,(bc)
	or	a, a
	jr	Z,00112$
;SpritePlayerLittle.c:74: incy = data->yaccum.b.h;
	ld	a,(bc)
	ldhl	sp,#5
	ld	(hl),a
;SpritePlayerLittle.c:75: data->yaccum.b.h = 0;
	xor	a, a
	ld	(bc),a
00112$:
;SpritePlayerLittle.c:77: data->ygrav += GRAVITY;
	pop	de
	push	de
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ld	hl,#0x000e
	add	hl,bc
	ld	c,l
	ld	b,h
	pop	hl
	push	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
;SpritePlayerLittle.c:80: data->xaccum.w += data->xvel;
	pop	de
	push	de
	ld	hl,#0x0004
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#3
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ldhl	sp,#8
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl-),a
	dec	hl
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	inc	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	ldhl	sp,#3
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),c
	inc	hl
	ld	(hl),b
;SpritePlayerLittle.c:81: if (data->xaccum.b.h != 0) {
	ldhl	sp,#(4 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	ld	a,(bc)
	or	a, a
	jr	Z,00114$
;SpritePlayerLittle.c:82: incx = data->xaccum.b.h;
	ld	a,(bc)
	dec	hl
	dec	hl
	ld	(hl),a
;SpritePlayerLittle.c:83: data->xaccum.b.h = 0;
	xor	a, a
	ld	(bc),a
00114$:
;SpritePlayerLittle.c:86: if (data->xvel > 0) {
	ldhl	sp,#(7 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ld	e,a
	ld	a,#0x00
	ld	d,a
	xor	a, a
	cp	a, c
	sbc	a, b
	bit	7, e
	jr	Z,00231$
	bit	7, d
	jr	NZ,00232$
	cp	a, a
	jr	00232$
00231$:
	bit	7, d
	jr	Z,00232$
	scf
00232$:
	jr	NC,00120$
;SpritePlayerLittle.c:87: data->xvel = data->xvel - HORIZONTALRESISTANCE;
	ld	a,c
	add	a,#0xf2
	ld	c,a
	ld	a,b
	adc	a,#0xff
	ld	b,a
	ldhl	sp,#6
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),c
	inc	hl
	ld	(hl),b
;SpritePlayerLittle.c:88: if (data->xvel < 0) {
	ld	a,#0x00
	ld	e,a
	ld	a,b
	ld	d,a
	bit	7, b
	jp	Z,00121$
;SpritePlayerLittle.c:89: data->xvel = 0;
	ldhl	sp,#6
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
	jp	00121$
00120$:
;SpritePlayerLittle.c:93: data->xvel = data->xvel + HORIZONTALRESISTANCE;
	ld	hl,#0x000e
	add	hl,bc
	ld	c,l
	ld	b,h
	ldhl	sp,#6
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),c
	inc	hl
	ld	(hl),b
;SpritePlayerLittle.c:94: if (data->xvel > 0) {
	ld	a,b
	ld	e,a
	ld	a,#0x00
	ld	d,a
	xor	a, a
	cp	a, c
	sbc	a, b
	bit	7, e
	jr	Z,00233$
	bit	7, d
	jr	NZ,00234$
	cp	a, a
	jr	00234$
00233$:
	bit	7, d
	jr	Z,00234$
	scf
00234$:
	jr	NC,00121$
;SpritePlayerLittle.c:95: data->xvel = 0;
	ldhl	sp,#6
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
00121$:
;SpritePlayerLittle.c:102: tile_collision = TranslateSprite(THIS, 0, incy);
	ldhl	sp,#5
	ld	a,(hl)
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_TranslateSprite
	add	sp, #4
	ld	c,e
;SpritePlayerLittle.c:103: if (tile_collision != 0)
	ld	a,c
	or	a, a
	jp	Z,00132$
;SpritePlayerLittle.c:106: if ((tile_collision >= 19) && (tile_collision <= 22)) {
	ld	a,c
	sub	a, #0x13
	jr	C,00123$
	ld	a,#0x16
	sub	a, c
	jr	C,00123$
;SpritePlayerLittle.c:107: level++;
	ld	hl,#_level
	inc	(hl)
;SpritePlayerLittle.c:108: SetState(STATE_GAME);
	push	bc
	xor	a, a
	push	af
	inc	sp
	call	_SetState
	inc	sp
	pop	bc
00123$:
;SpritePlayerLittle.c:111: if ((tile_collision == 14) || (tile_collision == 15)) {
	ld	a,c
	cp	a,#0x0e
	jr	Z,00125$
	sub	a, #0x0f
	jp	NZ,00126$
00125$:
;SpritePlayerLittle.c:43: struct PlayerCustomData* data = (struct PlayerCustomData*)THIS->custom_data;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;SpritePlayerLittle.c:112: SpriteManagerAdd(SPRITE_EXPLOSION, THIS->x, THIS->y);
	ld	hl,#0x0009
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#3
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	dec	hl
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ld	hl,#0x0007
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ldhl	sp,#3
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	push	bc
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;SpritePlayerLittle.c:113: SpriteManagerRemoveSprite(THIS);
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_SpriteManagerRemoveSprite
	add	sp, #2
00126$:
;SpritePlayerLittle.c:116: if (data->ygrav < 0) {
	pop	de
	push	de
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ld	a,#0x00
	ld	e,a
	ld	a,b
	ld	d,a
	bit	7, b
	jr	Z,00129$
;SpritePlayerLittle.c:117: data->ygrav = -data->ygrav;
	xor	a, a
	sub	a, c
	ld	c,a
	ld	a, #0x00
	sbc	a, b
	ld	b,a
	pop	hl
	push	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
	jr	00130$
00129$:
;SpritePlayerLittle.c:119: data->ygrav = -VERTICALBOUNCE;
	pop	hl
	push	hl
	ld	(hl),#0xa8
	inc	hl
	ld	(hl),#0xfd
00130$:
;SpritePlayerLittle.c:121: PlayFx(CHANNEL_1, 10, 0x23, 0x07, 0x7b, 0xab, 0x84);
	ld	hl,#0x0084
	push	hl
	ld	l, #0xab
	push	hl
	ld	l, #0x7b
	push	hl
	ld	l, #0x07
	push	hl
	ld	l, #0x23
	push	hl
	ld	hl,#0x0a00
	push	hl
	call	_PlayFx
	add	sp, #12
00132$:
;SpritePlayerLittle.c:124: tile_collision = TranslateSprite(THIS, incx, 0);
	xor	a, a
	push	af
	inc	sp
	ldhl	sp,#3
	ld	a,(hl)
	push	af
	inc	sp
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_TranslateSprite
	add	sp, #4
	ld	c,e
;SpritePlayerLittle.c:125: if ((tile_collision != 0))
	ld	a,c
	or	a, a
	jp	Z,00141$
;SpritePlayerLittle.c:128: if ((tile_collision >= 19) && (tile_collision <= 22)) {
	ld	a,c
	sub	a, #0x13
	jr	C,00134$
	ld	a,#0x16
	sub	a, c
	jr	C,00134$
;SpritePlayerLittle.c:129: level++;
	ld	hl,#_level
	inc	(hl)
;SpritePlayerLittle.c:130: SetState(STATE_GAME);
	push	bc
	xor	a, a
	push	af
	inc	sp
	call	_SetState
	inc	sp
	pop	bc
00134$:
;SpritePlayerLittle.c:132: if ((tile_collision == 14) || (tile_collision == 15)) {
	ld	a,c
	cp	a,#0x0e
	jr	Z,00136$
	sub	a, #0x0f
	jp	NZ,00137$
00136$:
;SpritePlayerLittle.c:43: struct PlayerCustomData* data = (struct PlayerCustomData*)THIS->custom_data;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;SpritePlayerLittle.c:133: SpriteManagerAdd(SPRITE_EXPLOSION, THIS->x, THIS->y);
	ld	hl,#0x0009
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#3
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	dec	hl
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	ld	hl,#0x0007
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	e, c
	ld	d, b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	ldhl	sp,#3
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	push	bc
	ld	a,#0x01
	push	af
	inc	sp
	call	_SpriteManagerAdd
	add	sp, #5
;SpritePlayerLittle.c:134: SpriteManagerRemoveSprite(THIS);
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_SpriteManagerRemoveSprite
	add	sp, #2
00137$:
;SpritePlayerLittle.c:136: data->xvel = -data->xvel;
	ldhl	sp,#(7 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
	xor	a, a
	sub	a, c
	ld	c,a
	ld	a, #0x00
	sbc	a, b
	ld	b,a
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	ld	(hl),c
	inc	hl
	ld	(hl),b
;SpritePlayerLittle.c:137: PlayFx(CHANNEL_1, 10, 0x23, 0x07, 0x7b, 0xab, 0x84);
	ld	hl,#0x0084
	push	hl
	ld	l, #0xab
	push	hl
	ld	l, #0x7b
	push	hl
	ld	l, #0x07
	push	hl
	ld	l, #0x23
	push	hl
	ld	hl,#0x0a00
	push	hl
	call	_PlayFx
	add	sp, #12
00141$:
	add	sp, #10
	ret
;SpritePlayerLittle.c:146: void Destroy_SPRITE_PLAYERLITTLE() {
;	---------------------------------
; Function Destroy_SPRITE_PLAYERLITTLE
; ---------------------------------
_Destroy_SPRITE_PLAYERLITTLE::
;SpritePlayerLittle.c:148: }
	ret
	.area _CODE_2
	.area _CABS (ABS)
