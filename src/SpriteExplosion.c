#pragma bank 2
#include "SpriteExplosion.h"
#include "SpriteManager.h"
#include "ZGBMain.h"

UINT8 bank_SPRITE_EXPLOSION = 2;

const UINT8 anim_explosion[] = { 4, 0, 1, 2, 3 };
void Start_SPRITE_EXPLOSION() {
	SetSpriteAnim(THIS, anim_explosion, 8u);
	THIS->anim_speed = 33u;
}
void Update_SPRITE_EXPLOSION() {
	if (THIS->current_frame == 3) {
		SpriteManagerRemoveSprite(THIS);
	}
}
void Destroy_SPRITE_EXPLOSION() {
	SetState(STATE_LIFES);
}