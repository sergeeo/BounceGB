#pragma bank 2
#include "SpritePlayerLittle.h"
#include "SpriteExplosion.h"
#include "SpriteManager.h"
#include "ZGBMain.h"
#include "Keys.h"
#include "Math.h"

#define YVELMAX 2
#define LATERALIMPULSE (3 << 8)
// #define MINXVELOCITY 5

UINT8 bank_SPRITE_PLAYERLITTLE = 2;

const UINT8 anim_walk[] = { 4, 0, 1, 2, 3};

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

	// Input and horizontal speed
	if (KEY_TICKED(J_LEFT)) {
		//data->xvel.b.h = -1;
			
		SPRITE_SET_VMIRROR(THIS);

		if (data->xvel >= -32) {
			data->xvel = -LATERALIMPULSE;
		}
	}
	if (KEY_TICKED(J_RIGHT)) {
		//data->xvel.b.h = 1;

		SPRITE_UNSET_VMIRROR(THIS);

		if (data->xvel <= 32) {
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
	data->ygrav += 14;


	// Horizontal Force
	data->xaccum.w += data->xvel;
	if (data->xaccum.b.h != 0) {
		incx = data->xaccum.b.h;
		data->xaccum.b.h = 0;
	}

	if (data->xvel > 0) {
		data->xvel = data->xvel - 14;
		if (data->xvel < 0) {
			data->xvel = 0;
		}
	}
	else {
		data->xvel = data->xvel + 14;
		if (data->xvel > 0) {
			data->xvel = 0;
		}
	}

	// Clamping vertical velocity
	//signedyvel = (INT8)data->yvel.b.h;

	//if (signedyvel <= -YVELMAX) {
	//	data->yvel.b.h = -YVELMAX;
	//	data->yvel.b.l = 0u;
	//}
	//else if (signedyvel >= YVELMAX) {
	//	data->yvel.b.h = YVELMAX;
	//	data->yvel.b.l = 0u;
	//}

	// Collisions and translation

	// Vertical
	tile_collision = TranslateSprite(THIS, 0, incy);
	if (tile_collision != 0)
	{
		// Spikes
		if ((tile_collision == 14) || (tile_collision == 15)) {
			SpriteManagerAdd(SPRITE_EXPLOSION, THIS->x, THIS->y);
			SpriteManagerRemoveSprite(THIS);
		}
		
		if (data->ygrav < 0) {
			data->ygrav = -data->ygrav;
		} else {
			data->ygrav = -600;
		}

		
	}
	// Horizontal
	tile_collision = TranslateSprite(THIS, incx, 0);
	if (tile_collision != 0)
	{
		if ((tile_collision == 14) || (tile_collision == 15)) {
			SpriteManagerAdd(SPRITE_EXPLOSION, THIS->x, THIS->y);
			SpriteManagerRemoveSprite(THIS);
		}
		data->xvel = -data->xvel;

	}
	
}

void Destroy_SPRITE_PLAYERLITTLE() {
	
}