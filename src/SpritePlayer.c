#pragma bank 2
#include "SpritePlayer.h"
#include "Keys.h"
#include "SpriteManager.h"

UINT8 bank_SPRITE_PLAYER = 2;

const UINT8 anim_idle[] = {1, 0};
const UINT8 anim_walk[] = {4, 0, 1, 2, 3};

void Start_SPRITE_PLAYER() {
}

void Update_SPRITE_PLAYER() {
	if(KEY_PRESSED(J_LEFT)) {
		THIS->x --;
		SetSpriteAnim(THIS, anim_walk, 15);
		SPRITE_SET_VMIRROR(THIS);
	}
	if(KEY_PRESSED(J_RIGHT)) {
		THIS->x ++;
		SetSpriteAnim(THIS, anim_walk, 15);
		THIS->flags = 0u;
		SPRITE_UNSET_VMIRROR(THIS);
	}
	if(KEY_PRESSED(BUTTON_B)) {
		
	}
}

void Destroy_SPRITE_PLAYER() {
}