#pragma bank=2
#include "StateWin.h"
UINT8 bank_STATE_WIN = 2;

#include "..\res\src\tiles.h"
#include "..\res\src\victory.h"
#include "..\res\src\font.h"

#include "ZGBMain.h"
#include "Scroll.h"
#include "Print.h"

extern UINT8 n_sprite_types;

void PrintText() {
	PRINT_POS(3, 16);
	Printf("THIS IS A TEST");
}

void Start_STATE_WIN() {

	InitScrollTiles(0, 103, tiles, 3);
	InitScroll(victoryWidth, victoryHeight, victory, 0, 0, 3);
	SHOW_BKG;

	INIT_FONT(font, 3, PRINT_BKG);	
	PrintText();
}

void Update_STATE_WIN() {
}