#pragma bank 2
#include "SpritePlayerLittle.h"
#include "Keys.h"
#include "SpriteManager.h"

UINT8 bank_SPRITE_PLAYERLITTLE = 2;

const UINT8 anim_idle[] = {1, 0};
const UINT8 anim_walk[] = {4, 0, 1, 2, 3};

struct PlayerCustomData {
	fixed yvel;
	UINT8 tile_collision;
	UINT8 initx;
};

//typedef struct PlayerCustomData;

void Start_SPRITE_PLAYERLITTLE() {

	struct PlayerCustomData* data = (struct PlayerCustomData*)THIS->custom_data;

	data->yvel.w = 0;

	THIS->coll_x = 0u;
	THIS->coll_y = 0u;
	THIS->coll_w = 16u;
	THIS->coll_h = 16u;
}

void Update_SPRITE_PLAYERLITTLE() {

	struct PlayerCustomData* data = (struct PlayerCustomData*)THIS->custom_data;

	if (KEY_PRESSED(J_LEFT) || (KEY_PRESSED(J_RIGHT))) {
		if (KEY_PRESSED(J_LEFT)) {
			THIS->x--;
			SetSpriteAnim(THIS, anim_walk, 15);
			SPRITE_SET_VMIRROR(THIS);
		}
		if (KEY_PRESSED(J_RIGHT)) {
			THIS->x++;
			SetSpriteAnim(THIS, anim_walk, 15);
			THIS->flags = 0u;
			SPRITE_UNSET_VMIRROR(THIS);
		}
	}
	else {
		SetSpriteAnim(THIS, anim_idle, 1);
	}
	/* if(KEY_TICKED(J_A)) {
		// SALTO O ALGO
		
	} */

	TranslateSprite(THIS, 0u, data->yvel.b.h);

	data->yvel.w = data->yvel.w + (INT16)(16 << delta_time);
}

void Destroy_SPRITE_PLAYERLITTLE() {
}