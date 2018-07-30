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
extern UINT8* levelmusic_mod_Data[];
extern UINT8 lifes;
extern UINT8 level;

// 2 is floor, 3 left wall, 4 right wall, 5 ceiling
// 6 7 8 and 9 are corners
UINT8 collision_tiles[] = { 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 19, 20, 21, 22, 0 };

void Start_STATE_GAME() {
	UINT8 i;
	UINT16 startX, startY;


	NR52_REG = 0x80; //Enables sound, you should always setup this first
	NR51_REG = 0xFF; //Enables all channels (left and right)
	NR50_REG = 0x77; //Max volume

	PlayMusic(levelmusic_mod_Data, 3, 1);

	SPRITES_8x16;
	for(i = 0; i != n_sprite_types; ++ i) {
		SpriteManagerLoad(i);
	}
	SHOW_SPRITES;

	if(level ==1) {
		ScrollFindTile(mapWidth, map, 3, 18, 0, 0, mapWidth, mapHeight, &startX, &startY);
		scroll_target = SpriteManagerAdd(SPRITE_PLAYERLITTLE, startX << 3, startY << 3);

		InitScrollTiles(0, 104, tiles, 3);
		InitScroll(mapWidth, mapHeight, map, collision_tiles, 0, 3);
		SHOW_BKG;
	}
	if (level == 3) {
		ScrollFindTile(map2Width, map2, 3, 18, 0, 0, map2Width, map2Height, &startX, &startY);
		scroll_target = SpriteManagerAdd(SPRITE_PLAYERLITTLE, startX << 3, startY << 3);

		InitScrollTiles(0, 104, tiles, 3);
		InitScroll(map2Width, map2Height, map2, collision_tiles, 0, 3);
		SHOW_BKG;
	}
	if (level == 2) {
		ScrollFindTile(map3Width, map3, 3, 18, 0, 0, map3Width, map3Height, &startX, &startY);
		scroll_target = SpriteManagerAdd(SPRITE_PLAYERLITTLE, startX << 3, startY << 3);

		InitScrollTiles(0, 104, tiles, 3);
		InitScroll(mapWidth, mapHeight, map3, collision_tiles, 0, 3);
		SHOW_BKG;
	}
	if (level == 4) {
		ScrollFindTile(map4Width, map4, 3, 18, 0, 0, map4Width, map4Height, &startX, &startY);
		scroll_target = SpriteManagerAdd(SPRITE_PLAYERLITTLE, startX << 3, startY << 3);

		InitScrollTiles(0, 104, tiles, 3);
		InitScroll(map4Width, map4Height, map4, collision_tiles, 0, 3);
		SHOW_BKG;
	}
	if (level > 4) {
		SetState(STATE_WIN);
	}


}

void Update_STATE_GAME() {
}