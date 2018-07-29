#pragma bank 2
#include "StateGameOver.h"
UINT8 bank_STATE_GAMEOVER = 2;

#include "..\res\src\tiles.h"
#include "..\res\src\gameover.h"
#include "..\res\src\font.h"

#include "ZGBMain.h"
#include "Scroll.h"
#include "Print.h"
#include "Keys.h"

extern UINT8 n_sprite_types;

void PrintText() {
	PRINT_POS(5, 14);
	Printf("TRY AGAIN!!");
}

void Start_STATE_GAMEOVER() {
	InitScrollTiles(0, 104, tiles, 3);
	InitScroll(gameoverWidth, gameoverHeight, gameover, 0, 0, 3);
	SHOW_BKG;

	INIT_FONT(font, 3, PRINT_BKG);
	PrintText();
}

void Update_STATE_GAMEOVER() {
	if (keys) {
		SetState(STATE_START);
	}
}