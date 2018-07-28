#pragma bank 2
#include "SpritePlayerLittle.h"
#include "Keys.h"
#include "SpriteManager.h"

#define YVELMAX 3

UINT8 bank_SPRITE_PLAYERLITTLE = 2;

const UINT8 anim_idle[] = {1, 0};
const UINT8 anim_walk[] = {4, 0, 1, 2, 3};

struct PlayerCustomData {
	fixed yvel;
	INT8 xvel;
	UINT8 tile_collision;
	UINT8 initx;
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

	if (KEY_PRESSED(J_LEFT) || (KEY_PRESSED(J_RIGHT))) {
		if (KEY_PRESSED(J_LEFT)) {
			data->xvel = -1;
			SetSpriteAnim(THIS, anim_walk, 15);
			SPRITE_SET_VMIRROR(THIS);
		}
		if (KEY_PRESSED(J_RIGHT)) {
			data->xvel = 1;
			SetSpriteAnim(THIS, anim_walk, 15);
			THIS->flags = 0u;
			SPRITE_UNSET_VMIRROR(THIS);
		}
	}
	else {
		SetSpriteAnim(THIS, anim_idle, 1);
	}
	/* if(KEY_TICKED(J_A)) {
		// SALTO O ALGO ¿CAMBIO DE GRAVEDAD?
	} */

	if (data->tile_collision != 0u) {
		if (data->tile_collision == 2u || data->tile_collision == 5u)
		{
			data->yvel.w = -data->yvel.w;
		}
		if (data->tile_collision == 3u || data->tile_collision == 4u)
		{
			data->xvel = -data->xvel;
		}
	}

	data->yvel.w = data->yvel.w + (INT16)(16 << delta_time);
	signedyvel = (INT8)data->yvel.b.h;
	// Clamping velocity
	
	if (signedyvel <= -YVELMAX) {
		data->yvel.b.h = -YVELMAX;
		data->yvel.b.l = 0u;
	}
	else if (signedyvel >= YVELMAX) {
		data->yvel.b.h = YVELMAX;
		data->yvel.b.l = 0u;
	}

	data->tile_collision = TranslateSprite(THIS, data->xvel, data->yvel.b.h);
}

void Destroy_SPRITE_PLAYERLITTLE() {
}