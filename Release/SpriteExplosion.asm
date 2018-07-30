;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module SpriteExplosion
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _PlayFx
	.globl _SpriteManagerRemoveSprite
	.globl _SetState
	.globl _SetSpriteAnim
	.globl _bank_SPRITE_EXPLOSION
	.globl _anim_explosion
	.globl _Start_SPRITE_EXPLOSION
	.globl _Update_SPRITE_EXPLOSION
	.globl _Destroy_SPRITE_EXPLOSION
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_SPRITE_EXPLOSION::
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
;SpriteExplosion.c:7: UINT8 bank_SPRITE_EXPLOSION = 2;
	ld	hl,#_bank_SPRITE_EXPLOSION
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
;SpriteExplosion.c:10: void Start_SPRITE_EXPLOSION() {
;	---------------------------------
; Function Start_SPRITE_EXPLOSION
; ---------------------------------
_Start_SPRITE_EXPLOSION::
;SpriteExplosion.c:11: SetSpriteAnim(THIS, anim_explosion, 8u);
	ld	a,#0x08
	push	af
	inc	sp
	ld	hl,#_anim_explosion
	push	hl
	ld	hl,#_THIS
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_SetSpriteAnim
	add	sp, #5
;SpriteExplosion.c:12: THIS->anim_speed = 33u;
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	hl,#0x0006
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,#0x21
	ld	(bc),a
	ret
_anim_explosion:
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
;SpriteExplosion.c:14: void Update_SPRITE_EXPLOSION() {
;	---------------------------------
; Function Update_SPRITE_EXPLOSION
; ---------------------------------
_Update_SPRITE_EXPLOSION::
;SpriteExplosion.c:15: PlayFx(CHANNEL_4, 4, 0x0c, 0x41, 0x30, 0xc0);
	ld	hl,#0x00c0
	push	hl
	ld	l, #0x30
	push	hl
	ld	l, #0x41
	push	hl
	ld	l, #0x0c
	push	hl
	ld	hl,#0x0403
	push	hl
	call	_PlayFx
	add	sp, #10
;SpriteExplosion.c:16: if (THIS->current_frame == 3) {
	ld	hl,#_THIS + 1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a,(bc)
	sub	a, #0x03
	ret	NZ
;SpriteExplosion.c:17: SpriteManagerRemoveSprite(THIS);
	dec	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_SpriteManagerRemoveSprite
	add	sp, #2
	ret
;SpriteExplosion.c:20: void Destroy_SPRITE_EXPLOSION() {
;	---------------------------------
; Function Destroy_SPRITE_EXPLOSION
; ---------------------------------
_Destroy_SPRITE_EXPLOSION::
;SpriteExplosion.c:21: SetState(STATE_LIFES);
	ld	a,#0x02
	push	af
	inc	sp
	call	_SetState
	inc	sp
	ret
	.area _CODE_2
	.area _CABS (ABS)
