#pragma bank 2
#include "StateGame.h"
UINT8 bank_STATE_GAME = 2;

#include "..\res\src\tiles.h"
#include "..\res\src\map.h"

#include "ZGBMain.h"
#include "Scroll.h"
#include "SpriteManager.h"

extern UINT8 n_sprite_types;

// 2 is floor, 3 left wall, 4 right wall, 5 ceiling
UINT8 collision_tiles[] = { 2, 3, 4, 5, 0 };

void Start_STATE_GAME() {
	UINT8 i;

	SPRITES_8x16;
	for(i = 0; i != n_sprite_types; ++ i) {
		SpriteManagerLoad(i);
	}
	SHOW_SPRITES;

	scroll_target = SpriteManagerAdd(SPRITE_PLAYERLITTLE, 50, 50);

	InitScrollTiles(0, 14, tiles, 3);
	InitScroll(mapWidth, mapHeight, map, collision_tiles, 0, 3);
	SHOW_BKG;
}

void Update_STATE_GAME() {
}