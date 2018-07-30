;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module ZGBMain_Init
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _InitSprites
	.globl _InitStates
	.globl _Destroy_SPRITE_EXPLOSION
	.globl _Update_SPRITE_EXPLOSION
	.globl _Start_SPRITE_EXPLOSION
	.globl _Destroy_SPRITE_PLAYERLITTLE
	.globl _Update_SPRITE_PLAYERLITTLE
	.globl _Start_SPRITE_PLAYERLITTLE
	.globl _Update_STATE_WIN
	.globl _Start_STATE_WIN
	.globl _Update_STATE_GAMEOVER
	.globl _Start_STATE_GAMEOVER
	.globl _Update_STATE_LIFES
	.globl _Start_STATE_LIFES
	.globl _Update_STATE_START
	.globl _Start_STATE_START
	.globl _Update_STATE_GAME
	.globl _Start_STATE_GAME
	.globl _InitSpriteInfo
	.globl _spritePalDatas
	.globl _n_sprite_types
	.globl _spriteIdxs
	.globl _spriteNumFrames
	.globl _spriteFrameSizes
	.globl _spriteDataBanks
	.globl _spriteDatas
	.globl _spriteDestroyFuncs
	.globl _spriteUpdateFuncs
	.globl _spriteStartFuncs
	.globl _spriteBanks
	.globl _updateFuncs
	.globl _startFuncs
	.globl _stateBanks
	.globl _next_state
	.globl _init_bank
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_init_bank::
	.ds 1
_next_state::
	.ds 1
_stateBanks::
	.ds 5
_startFuncs::
	.ds 10
_updateFuncs::
	.ds 10
_spriteBanks::
	.ds 2
_spriteStartFuncs::
	.ds 4
_spriteUpdateFuncs::
	.ds 4
_spriteDestroyFuncs::
	.ds 4
_spriteDatas::
	.ds 4
_spriteDataBanks::
	.ds 2
_spriteFrameSizes::
	.ds 2
_spriteNumFrames::
	.ds 2
_spriteIdxs::
	.ds 2
_n_sprite_types::
	.ds 1
_spritePalDatas::
	.ds 4
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
;ZGBMain_Init.c:3: UINT8 init_bank = 1;
	ld	hl,#_init_bank
	ld	(hl),#0x01
;ZGBMain_Init.c:18: UINT8 next_state = STATE_START;
	ld	hl,#_next_state
	ld	(hl),#0x01
;ZGBMain_Init.c:21: SET_N_SPRITE_TYPES(N_SPRITE_TYPES);
	ld	hl,#_n_sprite_types
	ld	(hl),#0x02
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_1
;ZGBMain_Init.c:23: void InitStates() {
;	---------------------------------
; Function InitStates
; ---------------------------------
_InitStates::
;ZGBMain_Init.c:24: INIT_STATE(STATE_GAME);
	ld	de,#_stateBanks
	ld	hl,#_bank_STATE_GAME
	ld	a,(hl)
	ld	(de),a
	ld	hl,#_startFuncs
	ld	(hl),#<(_Start_STATE_GAME)
	inc	hl
	ld	(hl),#>(_Start_STATE_GAME)
	ld	hl,#_updateFuncs
	ld	(hl),#<(_Update_STATE_GAME)
	inc	hl
	ld	(hl),#>(_Update_STATE_GAME)
;ZGBMain_Init.c:25: INIT_STATE(STATE_START);
	ld	de,#(_stateBanks + 0x0001)
	ld	hl,#_bank_STATE_START
	ld	a,(hl)
	ld	(de),a
	ld	hl,#(_startFuncs + 0x0002)
	ld	(hl),#<(_Start_STATE_START)
	inc	hl
	ld	(hl),#>(_Start_STATE_START)
	ld	hl,#(_updateFuncs + 0x0002)
	ld	(hl),#<(_Update_STATE_START)
	inc	hl
	ld	(hl),#>(_Update_STATE_START)
;ZGBMain_Init.c:26: INIT_STATE(STATE_LIFES);
	ld	de,#(_stateBanks + 0x0002)
	ld	hl,#_bank_STATE_LIFES
	ld	a,(hl)
	ld	(de),a
	ld	hl,#(_startFuncs + 0x0004)
	ld	(hl),#<(_Start_STATE_LIFES)
	inc	hl
	ld	(hl),#>(_Start_STATE_LIFES)
	ld	hl,#(_updateFuncs + 0x0004)
	ld	(hl),#<(_Update_STATE_LIFES)
	inc	hl
	ld	(hl),#>(_Update_STATE_LIFES)
;ZGBMain_Init.c:27: INIT_STATE(STATE_GAMEOVER);
	ld	de,#(_stateBanks + 0x0003)
	ld	hl,#_bank_STATE_GAMEOVER
	ld	a,(hl)
	ld	(de),a
	ld	hl,#(_startFuncs + 0x0006)
	ld	(hl),#<(_Start_STATE_GAMEOVER)
	inc	hl
	ld	(hl),#>(_Start_STATE_GAMEOVER)
	ld	hl,#(_updateFuncs + 0x0006)
	ld	(hl),#<(_Update_STATE_GAMEOVER)
	inc	hl
	ld	(hl),#>(_Update_STATE_GAMEOVER)
;ZGBMain_Init.c:28: INIT_STATE(STATE_WIN);
	ld	de,#(_stateBanks + 0x0004)
	ld	hl,#_bank_STATE_WIN
	ld	a,(hl)
	ld	(de),a
	ld	hl,#(_startFuncs + 0x0008)
	ld	(hl),#<(_Start_STATE_WIN)
	inc	hl
	ld	(hl),#>(_Start_STATE_WIN)
	ld	hl,#(_updateFuncs + 0x0008)
	ld	(hl),#<(_Update_STATE_WIN)
	inc	hl
	ld	(hl),#>(_Update_STATE_WIN)
	ret
;ZGBMain_Init.c:31: void InitSprites() {
;	---------------------------------
; Function InitSprites
; ---------------------------------
_InitSprites::
;ZGBMain_Init.c:32: INIT_SPRITE(SPRITE_PLAYERLITTLE, playerlittle, 3, FRAME_8x16, 4);
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x0401
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	hl,#_playerlittle
	push	hl
	ld	hl,#_Destroy_SPRITE_PLAYERLITTLE
	push	hl
	ld	hl,#_Update_SPRITE_PLAYERLITTLE
	push	hl
	ld	hl,#_Start_SPRITE_PLAYERLITTLE
	push	hl
	ld	hl,#_bank_SPRITE_PLAYERLITTLE
	ld	a,(hl)
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_InitSpriteInfo
	add	sp, #15
;ZGBMain_Init.c:33: INIT_SPRITE(SPRITE_EXPLOSION, explosion, 3, FRAME_8x16, 4);
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x0401
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	ld	hl,#_explosion
	push	hl
	ld	hl,#_Destroy_SPRITE_EXPLOSION
	push	hl
	ld	hl,#_Update_SPRITE_EXPLOSION
	push	hl
	ld	hl,#_Start_SPRITE_EXPLOSION
	push	hl
	ld	hl,#_bank_SPRITE_EXPLOSION
	ld	a,(hl)
	push	af
	inc	sp
	ld	a,#0x01
	push	af
	inc	sp
	call	_InitSpriteInfo
	add	sp, #15
	ret
	.area _CODE_1
	.area _CABS (ABS)
