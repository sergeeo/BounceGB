#pragma bank 1
#include "ZGBMain.h"
UINT8 init_bank = 1;


#include "StateGame.h"

#include "SpritePlayerLittle.h"
#include "SpriteExplosion.h"

#include "../res/src/playerlittle.h"
#include "../res/src/explosion.h"

UINT8 next_state = STATE_GAME;

SET_N_STATES(N_STATES);
SET_N_SPRITE_TYPES(N_SPRITE_TYPES);

void InitStates() {
	INIT_STATE(STATE_GAME);
}

void InitSprites() {
	INIT_SPRITE(SPRITE_PLAYERLITTLE, playerlittle, 3, FRAME_8x16, 4);
	INIT_SPRITE(SPRITE_EXPLOSION, explosion, 3, FRAME_8x16, 4);
}