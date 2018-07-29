#pragma bank 2
#include "StateGame.h"
UINT8 bank_STATE_GAME = 2;

#include "..\res\src\tiles.h"
#include "..\res\src\map.h"
#include "..\res\src\map2.h"
#include "..\res\src\map3.h"
#include "..\res\src\map4.h"

#include "ZGBMain.h"
#include "Scroll.h"
#include "SpriteManager.h"

extern UINT8 n_sprite_types;

// 2 is floor, 3 left wall, 4 right wall, 5 ceiling
// 6 7 8 and 9 are corners
UINT8 collision_tiles[] = { 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 19, 20, 21, 22, 0 };

void Start_STATE_GAME() {
	UINT8 i;
	UINT16 startX, startY;

	SPRITES_8x16;
	for(i = 0; i != n_sprite_types; ++ i) {
		SpriteManagerLoad(i);
	}
	SHOW_SPRITES;

	ScrollFindTile(mapWidth, map4, 3, 18, 0, 0, mapWidth, mapHeight, &startX, &startY);
	scroll_target = SpriteManagerAdd(SPRITE_PLAYERLITTLE, startX<<3, startY<<3);

	InitScrollTiles(0, 104, tiles, 3);
	InitScroll(mapWidth, mapHeight, map4, collision_tiles, 0, 3);
	SHOW_BKG;
}

void Update_STATE_GAME() {
}