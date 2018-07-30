;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module music_tmp
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _gameovermusic_mod_Data
	.globl _gameovermusic_mod0
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
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
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_3
	.area _CODE_3
_gameovermusic_mod0:
	.db #0x9c	; 156
	.db #0x28	; 40
	.db #0xa4	; 164
	.db #0x18	; 24
	.db #0xa4	; 164
	.db #0x96	; 150
	.db #0x00	; 0
	.db #0x4a	; 74	'J'
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x2c	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xa3	; 163
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x2c	; 44
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x9f	; 159
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x2c	; 44
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x9c	; 156
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x2c	; 44
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x9d	; 157
	.db #0x28	; 40
	.db #0xa2	; 162
	.db #0x18	; 24
	.db #0xa2	; 162
	.db #0x96	; 150
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x2c	; 44
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0xa1	; 161
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x2c	; 44
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x9d	; 157
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x2c	; 44
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x9a	; 154
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x2c	; 44
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x9b	; 155
	.db #0x28	; 40
	.db #0xa0	; 160
	.db #0x18	; 24
	.db #0xa0	; 160
	.db #0x96	; 150
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x2c	; 44
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x9f	; 159
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x2c	; 44
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x9d	; 157
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x2c	; 44
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0xa0	; 160
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x2c	; 44
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x98	; 152
	.db #0x18	; 24
	.db #0x9c	; 156
	.db #0x18	; 24
	.db #0x9f	; 159
	.db #0x16	; 22
	.db #0x8c	; 140
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2c	; 44
	.db #0x2c	; 44
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_gameovermusic_mod_Data:
	.dw _gameovermusic_mod0
	.dw #0x0000
	.area _CABS (ABS)
