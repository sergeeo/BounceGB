#pragma bank 2
#include "StateLifes.h"
UINT8 bank_STATE_LIFES = 2;

#include "..\res\src\tiles.h"
#include "..\res\src\lifesleft.h"
#include "..\res\src\font.h"

#include "ZGBMain.h"
#include "Scroll.h"
#include "Print.h"

extern UINT8 n_sprite_types;

void PrintText() {
	PRINT_POS(3, 3);
	Printf("THAT WAS CLOSE");
	PRINT_POS(7, 4);
	Printf("BUDDY");
	PRINT_POS(4, 14);
	Printf("%d LIFES LEFT",5);
}

void Start_STATE_LIFES() {
	InitScrollTiles(0, 104, tiles, 3);
	InitScroll(lifesleftWidth, lifesleftHeight, lifesleft, 0, 0, 3);
	SHOW_BKG;

	INIT_FONT(font, 3, PRINT_BKG);
	PrintText();
}

void Update_STATE_LIFES() {
}