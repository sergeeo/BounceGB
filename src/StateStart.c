#pragma bank=2
#include "StateStart.h"
UINT8 bank_STATE_START = 2;

#include "..\res\src\tiles.h"
#include "..\res\src\pressstart.h"
#include "..\res\src\font.h"

#include "ZGBMain.h"
#include "Scroll.h"
#include "Print.h"

extern UINT8 n_sprite_types;

void PrintText() {
	PRINT_POS(3, 16);
	Printf("THIS IS A TEST");
}

void Start_STATE_START() {
	InitScrollTiles(0, 103, tiles, 3);
	InitScroll(pressstartWidth, pressstartHeight, pressstart, 0, 0, 3);
	SHOW_BKG;

	INIT_FONT(font, 3, PRINT_BKG);	
	PrintText();
}

void Update_STATE_START() {
}