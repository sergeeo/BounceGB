#pragma bank 2
#include "SpritePlayerLittle.h"
#include "Keys.h"
#include "SpriteManager.h"

#define YVELMAX 3

UINT8 bank_SPRITE_PLAYERLITTLE = 2;

const UINT8 anim_walk[] = { 4, 0, 1, 2, 3};
const UINT8 anim_die[] = { 3, 4, 5, 6 };

struct PlayerCustomData {
	fixed yvel;
	INT8 xvel;
	UINT8 tile_collision;
	UINT8 safex;
	UINT8 safey;
};

void Start_SPRITE_PLAYERLITTLE() {

	struct PlayerCustomData* data = (struct PlayerCustomData*)THIS->custom_data;
	data->xvel = 0u;
	data->yvel.w = 0;
	data->tile_collision = 0u;

	THIS->coll_x = 0u;
	THIS->coll_y = 0u;
	THIS->coll_w = 8u;
	THIS->coll_h = 8u;
}

void Update_SPRITE_PLAYERLITTLE() {

	struct PlayerCustomData* data = (struct PlayerCustomData*)THIS->custom_data;
	INT8 currentYVel = 0;
	INT8 signedyvel = (INT8)data->yvel.b.h;

	// Input
	if (KEY_PRESSED(J_LEFT) || (KEY_PRESSED(J_RIGHT))) {
		if (KEY_PRESSED(J_LEFT)) {
			data->xvel = -1;
			
			SPRITE_SET_VMIRROR(THIS);
		}
		if (KEY_PRESSED(J_RIGHT)) {
			data->xvel = 1;
			THIS->flags = 0u;
			SPRITE_UNSET_VMIRROR(THIS);
		}
	}
	else {
		SetSpriteAnim(THIS, anim_idle, 1);
	}

	// Animation
	SetSpriteAnim(THIS, anim_walk, 15);

	// Gravity
	data->yvel.w = data->yvel.w + (INT16)(16 << delta_time);

	// Clamping vertical velocity
	signedyvel = (INT8)data->yvel.b.h;

	if (signedyvel <= -YVELMAX) {
		data->yvel.b.h = -YVELMAX;
		data->yvel.b.l = 0u;
	}
	else if (signedyvel >= YVELMAX) {
		data->yvel.b.h = YVELMAX;
		data->yvel.b.l = 0u;
	}

	// Collisions and translation

	// Vertical
	data->tile_collision = TranslateSprite(THIS, 0, data->yvel.b.h);
	if (data->tile_collision != 0)
	{
		data->yvel.w = -data->yvel.w;
		TranslateSprite(THIS, 0, data->yvel.b.h);
		TranslateSprite(THIS, 0, data->yvel.b.h);
	}
	// Horizontal
	data->tile_collision = TranslateSprite(THIS, data->xvel, 0);
	if (data->tile_collision != 0)
	{
		data->xvel = -data->xvel;
		TranslateSprite(THIS, data->xvel, 0);
		TranslateSprite(THIS, data->xvel, 0);
	}

	// Update collision and translate
	// data->tile_collision = TranslateSprite(THIS, data->xvel, data->yvel.b.h);
}

void Destroy_SPRITE_PLAYERLITTLE() {
}