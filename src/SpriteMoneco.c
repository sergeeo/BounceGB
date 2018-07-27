#pragma bank=2
#include "SpriteMoneco.h"
#include "SpriteManager.h"
UINT8 bank_SPRITE_MONECO = 3;

const UINT8 anim_walk[] = {2, 0, 1};

void Start_SPRITE_MONECO() {
}
void Update_SPRITE_MONECO() {
	SetSpriteAnim(THIS, anim_walk, 15);
}
void Destroy_SPRITE_MONECO() {
}