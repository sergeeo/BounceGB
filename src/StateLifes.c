#pragma bank 2
#include "StateLifes.h"
UINT8 bank_STATE_LIFES = 2;

#include "..\res\src\tiles.h"
#include "..\res\src\lifesleft.h"
#include "..\res\src\font.h"

#include "ZGBMain.h"
#include "Scroll.h"
#include "Print.h"
#include "Keys.h"

extern UINT8 n_sprite_types;
extern UINT8 lifes;
extern UINT8* gameovermusic_mod_Data[];

void PrintText() {
	PRINT_POS(3, 3);
	Printf("THAT WAS CLOSE");
	PRINT_POS(7, 4);
	Printf("BUDDY");
	if (lifes > 1) {
		PRINT_POS(4, 14);
		Printf("%d LIFES LEFT", lifes);
	}
	if (lifes == 1) {
		PRINT_POS(4, 14);
		Printf("%d LIFE LEFT!", lifes);
	}
}

void Start_STATE_LIFES() {
	PlayMusic(gameovermusic_mod_Data, 3, 1);

	InitScrollTiles(0, 104, tiles, 3);
	InitScroll(lifesleftWidth, lifesleftHeight, lifesleft, 0, 0, 3);
	SHOW_BKG;
	if (lifes > 0) {
		lifes = lifes - 1;
	}
	INIT_FONT(font, 3, PRINT_BKG);
	PrintText();

}

void Update_STATE_LIFES() {
	if (keys) {
		if (lifes > 0)
		{
			SetState(STATE_GAME);
		}
		else {
			SetState(STATE_GAMEOVER);
		}
	}
}