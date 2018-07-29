#pragma bank 2
#include "StateStart.h"
UINT8 bank_STATE_START = 2;

#include "..\res\src\tiles.h"
#include "..\res\src\pressstart.h"
#include "..\res\src\font.h"

#include "ZGBMain.h"
#include "Scroll.h"
#include "Print.h"
#include "Keys.h"

extern UINT8 n_sprite_types;
UINT8 lifes;
UINT8 level;

void PrintText() {
	PRINT_POS(4, 13);
	Printf("PRESS START!");
	PRINT_POS(2, 15);
	Printf("SERGEEO ZGBJAM18");
}

void Start_STATE_START() {
	lifes = 5;
	level = 1;

	InitScrollTiles(0, 104, tiles, 3);
	InitScroll(pressstartWidth, pressstartHeight, pressstart, 0, 0, 3);
	SHOW_BKG;

	INIT_FONT(font, 3, PRINT_BKG);	
	PrintText();
}

void Update_STATE_START() {
	if (KEY_TICKED(J_START)) {
		SetState(STATE_GAME);
	}
}