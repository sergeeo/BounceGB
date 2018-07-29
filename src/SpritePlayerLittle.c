#pragma bank 2
#include "SpritePlayerLittle.h"
#include "SpriteExplosion.h"
#include "SpriteManager.h"
#include "ZGBMain.h"
#include "Keys.h"
#include "Math.h"
#include "Scroll.h"

#define YVELMAX 2
#define GRAVITY 14
#define MINXVELOCITY 32
#define VERTICALBOUNCE 600
#define LATERALIMPULSE (3 << 8)
#define HORIZONTALRESISTANCE 14

UINT8 bank_SPRITE_PLAYERLITTLE = 2;
const UINT8 anim_walk[] = { 4, 0, 1, 2, 3};
extern UINT8 level;

struct PlayerCustomData {
	INT16 ygrav;
	fixed yaccum;
	fixed xaccum;
	INT16 xvel;
};

void Start_SPRITE_PLAYERLITTLE() {

	struct PlayerCustomData* data = (struct PlayerCustomData*)THIS->custom_data;
	data->xvel = 0;
	data->ygrav = 0;

	THIS->coll_x = 0u;
	THIS->coll_y = 0u;
	THIS->coll_w = 8u;
	THIS->coll_h = 8u;
}

void Update_SPRITE_PLAYERLITTLE() {

	struct PlayerCustomData* data = (struct PlayerCustomData*)THIS->custom_data;
	INT8 currentYVel = 0;
	UINT8 tile_collision;
	INT8 incx = 0;
	INT8 incy = 0;
	UINT8 backgroundTile = 0;

	// Input and horizontal speed
	if (KEY_TICKED(J_LEFT)) {
			
		SPRITE_SET_VMIRROR(THIS);

		if (data->xvel >= -MINXVELOCITY) {
			data->xvel = -LATERALIMPULSE;
		}
	}
	if (KEY_TICKED(J_RIGHT)) {

		SPRITE_UNSET_VMIRROR(THIS);

		if (data->xvel <= MINXVELOCITY) {
			data->xvel = LATERALIMPULSE;
		}
	}

	// Animation
	SetSpriteAnim(THIS, anim_walk, 15);

	// Gravity
	data->yaccum.w += data->ygrav;
	if (data->yaccum.b.h != 0) {
		incy = data->yaccum.b.h;
		data->yaccum.b.h = 0;
	}
	data->ygrav += GRAVITY;

	// Horizontal Force
	data->xaccum.w += data->xvel;
	if (data->xaccum.b.h != 0) {
		incx = data->xaccum.b.h;
		data->xaccum.b.h = 0;
	}

	if (data->xvel > 0) {
		data->xvel = data->xvel - HORIZONTALRESISTANCE;
		if (data->xvel < 0) {
			data->xvel = 0;
		}
	}
	else {
		data->xvel = data->xvel + HORIZONTALRESISTANCE;
		if (data->xvel > 0) {
			data->xvel = 0;
		}
	}

	// Collisions and translation

	// Vertical
	tile_collision = TranslateSprite(THIS, 0, incy);
	if (tile_collision != 0)
	{
		// Goal
		if ((tile_collision >= 19) && (tile_collision <= 22)) {
			level++;
			SetState(STATE_GAME);
		}
		// Spikes
		if ((tile_collision == 14) || (tile_collision == 15)) {
			SpriteManagerAdd(SPRITE_EXPLOSION, THIS->x, THIS->y);
			SpriteManagerRemoveSprite(THIS);
		}
		
		if (data->ygrav < 0) {
			data->ygrav = -data->ygrav;
		} else {
			data->ygrav = -VERTICALBOUNCE;
		}
	}
	// Horizontal
	tile_collision = TranslateSprite(THIS, incx, 0);
	if ((tile_collision != 0))
	{
		// Goal
		if ((tile_collision >= 19) && (tile_collision <= 22)) {
			level++;
			SetState(STATE_GAME);
		}
		if ((tile_collision == 14) || (tile_collision == 15)) {
			SpriteManagerAdd(SPRITE_EXPLOSION, THIS->x, THIS->y);
			SpriteManagerRemoveSprite(THIS);
		}
		data->xvel = -data->xvel;
	}

	/* backgroundTile = GetScrollTile(THIS->x + 4, THIS->y + 12);
	if ((backgroundTile >= 19) && (backgroundTile <= 22)) {
		SetState(STATE_GAME);
	} */
}

void Destroy_SPRITE_PLAYERLITTLE() {
	
}