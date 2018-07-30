;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module player_b3
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _player
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
	.area _CODE
	.area _CODE
	.area _CODE_3
_player:
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x3e	; 62
	.db #0x27	; 39
	.db #0x7f	; 127
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x8f	; 143
	.db #0xf3	; 243
	.db #0x9f	; 159
	.db #0xe1	; 225
	.db #0xbf	; 191
	.db #0xe1	; 225
	.db #0xbf	; 191
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x18	; 24
	.db #0xf8	; 248
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x82	; 130
	.db #0xfe	; 254
	.db #0x87	; 135
	.db #0xfd	; 253
	.db #0x87	; 135
	.db #0xfd	; 253
	.db #0xcf	; 207
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0xf1	; 241
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x82	; 130
	.db #0x7c	; 124
	.db #0xe4	; 228
	.db #0x18	; 24
	.db #0xf8	; 248
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0xff	; 255
	.db #0x9c	; 156
	.db #0xe3	; 227
	.db #0xbf	; 191
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0xff	; 255
	.db #0x87	; 135
	.db #0xfd	; 253
	.db #0x87	; 135
	.db #0xfc	; 252
	.db #0x4f	; 79	'O'
	.db #0x78	; 120	'x'
	.db #0x4f	; 79	'O'
	.db #0x78	; 120	'x'
	.db #0x27	; 39
	.db #0x3c	; 60
	.db #0x1b	; 27
	.db #0x1e	; 30
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xd8	; 216
	.db #0x78	; 120	'x'
	.db #0xe4	; 228
	.db #0x3c	; 60
	.db #0xf2	; 242
	.db #0x1e	; 30
	.db #0xf2	; 242
	.db #0x1e	; 30
	.db #0xf1	; 241
	.db #0x1f	; 31
	.db #0xe1	; 225
	.db #0xbf	; 191
	.db #0xc1	; 193
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0x39	; 57	'9'
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x27	; 39
	.db #0x3e	; 62
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0xf3	; 243
	.db #0xbf	; 191
	.db #0xe1	; 225
	.db #0xbf	; 191
	.db #0xe1	; 225
	.db #0x7f	; 127
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x82	; 130
	.db #0xfd	; 253
	.db #0x87	; 135
	.db #0xfd	; 253
	.db #0x87	; 135
	.db #0xf9	; 249
	.db #0xcf	; 207
	.db #0xf1	; 241
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x82	; 130
	.db #0xfe	; 254
	.db #0xe4	; 228
	.db #0x7c	; 124
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x9c	; 156
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0xfd	; 253
	.db #0x87	; 135
	.db #0xfc	; 252
	.db #0x87	; 135
	.db #0x78	; 120	'x'
	.db #0x4f	; 79	'O'
	.db #0x78	; 120	'x'
	.db #0x4f	; 79	'O'
	.db #0x3c	; 60
	.db #0x27	; 39
	.db #0x1e	; 30
	.db #0x1b	; 27
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x78	; 120	'x'
	.db #0xd8	; 216
	.db #0x3c	; 60
	.db #0xe4	; 228
	.db #0x1e	; 30
	.db #0xf2	; 242
	.db #0x1e	; 30
	.db #0xf2	; 242
	.db #0x1f	; 31
	.db #0xf1	; 241
	.db #0xbf	; 191
	.db #0xe1	; 225
	.db #0xff	; 255
	.db #0xc1	; 193
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xfd	; 253
	.db #0xc7	; 199
	.db #0x39	; 57	'9'
	.db #0xff	; 255
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x18	; 24
	.db #0xf8	; 248
	.db #0xe0	; 224
	.db #0xe0	; 224
	.area _CABS (ABS)
