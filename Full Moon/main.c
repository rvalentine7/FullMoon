/**
 * Full Moon.
 *
 * Final version.
 * Code and Art by: Richard Valentine
 *
 * Music:
 * winMusic is "Victory is Yours!" by ImperfectDisciple
 * loseMusic is "Our Hero Has Fallen (8bit)" by AlxEllis
 * backgroundMusic is "Skull Forest at Midnight" by MarkFiend
 * menuMusic is "The Tragic One" by Satyrcake
 */

#include "myLib.h"
#include "menu.h"
#include "instructions.h"
#include "game.h"
#include "background1.h"
#include "pause.h"
#include "win.h"
#include "lose.h"
#include "spriteSheet.h"
#include "collisionMap1.h"
#include "menuMusic.h"
#include "backgroundMusic.h"
#include "loseMusic.h"
#include "winMusic.h"
#include "slash.h"
#include "background2.h"
#include "injuredGrunt.h"
#include "level2Background.h"
#include "collisionMap2.h"

unsigned int buttons;
unsigned int oldButtons;

double hOff = 0;
double vOff = 0;
double hOffSky = 0;
double vOffSky = 0;

OBJ_ATTR shadowOAM[128];

int collMapSize = 512;

typedef struct {
	double row;
	double col;
	int bigRow;
	int bigCol;
	int rdel;
	int cdel;
	int width;
	int height;
	int aniCounter;
	int aniState;
	int prevAniState;
	int currFrame;
	double gravity;
} SPRITE;

typedef struct {
	double row;
	double col;
	int bigRow;
	int bigCol;
	int rdel;
	int cdel;
	int width;
	int height;
	int aniCounter;
	int aniState;
	int prevAniState;
	int currFrame;
	int knightHealth;
	int knightDirection;
	int knightDamaged;
	int knightDWait;
	int knightReaction;
	int knightBounce;
	int slowKnight;
	int deathWait;
	int knightAttacking;
} ENEMY;

SPRITE wolf;
SPRITE slashAttack;
SPRITE door;
SPRITE health;
SPRITE moon;
ENEMY Knight[knightArrayLength];

enum {WOLFWALK, WOLFIDLE, WOLFJUMP, WOLFATTACK};
enum {KNIGHTIDLE, KNIGHTATTACK, KNIGHTMOVE};
enum {FULL, THREEFOURTHS, HALF, ONEFOURTH};
int direction;
//makes it so the character can only jump twice before touching the ground again
int doubleJump = 0;
//slows animation of flames on the door
int slowerFlames = 0;
//stops the character from taking damage every single frame in contact
int wolfDWait = 0;
//true or false based on if the main character has just taken damage
int damaged = FALSE;
//character reaction to being damaged
int moveAway = 0;
int bounceLeft = 1;
int bounceRight = 2;
int bounceUp = 3;
int damageReaction = 0;
//how long the attack animation stays up
int duration = 0;
//cheat
int cheat;
int wolfPalette = 0;
int prevGameState;

int state;
enum {MENUSCREEN, INSTRUCTIONSCREEN, GAMESCREEN, GAME2SCREEN, PAUSESCREEN, WINSCREEN, LOSESCREEN};

//Sound
typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
} SOUND;

SOUND soundA;
SOUND soundB;
int vbCountA;
int vbCountB;

/**
 * Game Loop
 */
int main() {
	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
	REG_BG0CNT = CBB(0) | SBB(27) | BG_SIZE1 | COLOR256;

	state = MENUSCREEN;
	loadPalette(background1Pal);
	DMANow(3, menuTiles, &CHARBLOCKBASE[0], DMA_SOURCE_INCREMENT);
   	DMANow(3, menuMap, &SCREENBLOCKBASE[27], DMA_SOURCE_INCREMENT);

   	setupInterrupts();
    setupSounds();
    playSoundA(menuMusic, MENUMUSICLEN, MENUMUSICFREQ);

	while(1) {
		oldButtons = buttons;
		buttons = BUTTONS;
		switch(state) {
			case MENUSCREEN:
				initialize();
				menu();
				break;
			case INSTRUCTIONSCREEN:
				instructions();
				break;
			case GAMESCREEN:
				game();
				break;
			case GAME2SCREEN:
				game2();
				break;
			case PAUSESCREEN:
				pause();
				break;
			case WINSCREEN:
				win();
				break;
			case LOSESCREEN:
				lose();
				break;
		}
	}
	return 0;
}

/**
 * Menu Screen
 */
void menu() {
	if(BUTTON_PRESSED(BUTTON_START)) {
		REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
		state = GAMESCREEN;
   		REG_BG0CNT = CBB(0) | SBB(27) | BG_SIZE1 | COLOR256;
   		DMANow(3, background1Tiles, &CHARBLOCKBASE[0], background1TilesLen/2);
   		DMANow(3, background1Map, &SCREENBLOCKBASE[27], background1MapLen/2);
		REG_BG1CNT = CBB(2) | SBB(29) | BG_SIZE1 | COLOR256;
   		DMANow(3, background2Tiles, &CHARBLOCKBASE[2], background2TilesLen/2);
   		DMANow(3, background2Map, &SCREENBLOCKBASE[29], background2MapLen/2);
   		playSoundA(backgroundMusic, BACKGROUNDMUSICLEN, BACKGROUNDMUSICFREQ);
   	}
	if(BUTTON_PRESSED(BUTTON_SELECT)) {
		state = INSTRUCTIONSCREEN;
		DMANow(3, instructionsTiles, &CHARBLOCKBASE[0], DMA_SOURCE_INCREMENT);
    	DMANow(3, instructionsMap, &SCREENBLOCKBASE[27], DMA_SOURCE_INCREMENT);
	}
}

/**
 * Instructions Screen
 */
void instructions() {
	if(BUTTON_PRESSED(BUTTON_SELECT)) {
		state = MENUSCREEN;
		DMANow(3, menuTiles, &CHARBLOCKBASE[0], DMA_SOURCE_INCREMENT);
   		DMANow(3, menuMap, &SCREENBLOCKBASE[27], DMA_SOURCE_INCREMENT);
	}
}

/**
 * Game State
 */
void game() {
	REG_BG0HOFS = hOff;
	REG_BG0VOFS = vOff;
	REG_BG1HOFS = hOffSky;
	REG_BG1VOFS = vOffSky;
	DMANow(3, spriteSheetTiles, &CHARBLOCKBASE[4], spriteSheetTilesLen/2);
	DMANow(3, spriteSheetPal, SPRITE_PALETTE, 256);
	werewolf();
	int i;
	for (i = 0; i < knightArrayLength; i++) {
		knight(i);
	}
	doorPlacement();
	if (cheat == FALSE) {
		healthbar();
	}
	updateOAM();
	DMANow(3, shadowOAM, OAM, 512);
	if (BUTTON_PRESSED(BUTTON_L)) {
		if (cheat == FALSE) {
			cheat = TRUE;
			wolfPalette = 5;
		} else {
			cheat = FALSE;
			wolfPalette = 0;
		}
	}

	if(BUTTON_PRESSED(BUTTON_SELECT)) {
		REG_DISPCTL = MODE0 | BG0_ENABLE;
		hideSprites();
		REG_BG0HOFS = 0;
		REG_BG0VOFS = 0;
		state = PAUSESCREEN;
		REG_BG0CNT = CBB(0) | SBB(27) | BG_SIZE1 | COLOR256;
		DMANow(3, pauseTiles, &CHARBLOCKBASE[0], DMA_SOURCE_INCREMENT);
   		DMANow(3, pauseMap, &SCREENBLOCKBASE[27], DMA_SOURCE_INCREMENT);
   		pauseSound();
	}
	int j;
	for (j = 0; j < knightArrayLength; j++) {
		if (Knight[j].knightHealth == 0) {
			Knight[j].bigRow = 0;
			Knight[j].bigCol = 0;
		}
	}
	if(wolf.bigCol > door.bigCol && wolf.bigCol + wolf.width < door.bigCol + door.width
		&& wolf.bigRow > door.bigRow && BUTTON_PRESSED(BUTTON_UP)) {
		initialize2();
		REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
		state = GAME2SCREEN;
		REG_BG0CNT = CBB(0) | SBB(27) | BG_SIZE1 | COLOR256;
   		DMANow(3, level2BackgroundTiles, &CHARBLOCKBASE[0], background1TilesLen/2);
   		DMANow(3, level2BackgroundMap, &SCREENBLOCKBASE[27], background1MapLen/2);
		REG_BG1CNT = CBB(3) | SBB(30) | BG_SIZE1 | COLOR256;
   		DMANow(3, background2Tiles, &CHARBLOCKBASE[3], background2TilesLen/2);
   		DMANow(3, background2Map, &SCREENBLOCKBASE[30], background2MapLen/2);
	}
}

void game2() {
	REG_BG0HOFS = hOff;
	REG_BG0VOFS = vOff;
	REG_BG1HOFS = hOffSky;
	REG_BG1VOFS = vOffSky;
	DMANow(3, spriteSheetTiles, &CHARBLOCKBASE[4], spriteSheetTilesLen/2);
	DMANow(3, spriteSheetPal, SPRITE_PALETTE, 256);
	werewolf();
	int i;
	for (i = 0; i < knightArrayLength; i++) {
		knight(i);
	}
	doorPlacement();
	if (cheat == FALSE) {
		healthbar();
	}
	updateOAM();
	DMANow(3, shadowOAM, OAM, 512);
	if (BUTTON_PRESSED(BUTTON_L)) {
		if (cheat == FALSE) {
			cheat = TRUE;
			wolfPalette = 5;
		} else {
			cheat = FALSE;
			wolfPalette = 0;
		}
	}

	if(BUTTON_PRESSED(BUTTON_SELECT)) {
		REG_DISPCTL = MODE0 | BG0_ENABLE;
		hideSprites();
		REG_BG0HOFS = 0;
		REG_BG0VOFS = 0;
		state = PAUSESCREEN;
		REG_BG0CNT = CBB(0) | SBB(27) | BG_SIZE1 | COLOR256;
		DMANow(3, pauseTiles, &CHARBLOCKBASE[0], DMA_SOURCE_INCREMENT);
   		DMANow(3, pauseMap, &SCREENBLOCKBASE[27], DMA_SOURCE_INCREMENT);
   		pauseSound();
	}
	int j;
	for (j = 0; j < knightArrayLength; j++) {
		if (Knight[j].knightHealth == 0) {
			Knight[j].bigRow = 0;
			Knight[j].bigCol = 0;
		}
	}
	if(wolf.bigCol > door.bigCol && wolf.bigCol + wolf.width < door.bigCol + door.width
		&& wolf.bigRow > door.bigRow && BUTTON_PRESSED(BUTTON_UP)) {
		REG_DISPCTL = MODE0 | BG0_ENABLE;
		hideSprites();
		REG_BG0HOFS = 0;
		REG_BG0VOFS = 0;
		state = WINSCREEN;
		REG_BG0CNT = CBB(0) | SBB(27) | BG_SIZE1 | COLOR256;
		DMANow(3, winTiles, &CHARBLOCKBASE[0], DMA_SOURCE_INCREMENT);
   		DMANow(3, winMap, &SCREENBLOCKBASE[27], DMA_SOURCE_INCREMENT);
   		stopSound();
   		playSoundB(winMusic, WINMUSICLEN, WINMUSICFREQ);
	}
}

/**
 * Werewolf controls
 */
void werewolf() {
	wolf.bigRow = wolf.row + vOff;
	wolf.bigCol = wolf.col + hOff;
	if (state == GAMESCREEN) {
		if(BUTTON_HELD(BUTTON_LEFT) && damaged == FALSE && doubleJump == 0) {
			if (collisionMap1Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol - 1, collMapSize)] != 0
				&& collisionMap1Bitmap[OFFSET(wolf.bigRow - 1 + wolf.height, wolf.bigCol - 1, collMapSize)] != 0
				&& collisionMap1Bitmap[OFFSET(wolf.bigRow + wolf.height / 2, wolf.bigCol - 1, collMapSize)] != 0
				&& collisionMap1Bitmap[OFFSET(wolf.bigRow + 4, wolf.bigCol - 1, collMapSize)] != 0
				&& collisionMap1Bitmap[OFFSET(wolf.bigRow + wolf.height - 4, wolf.bigCol - 1, collMapSize)] != 0) {
				if (!hOff) {
					if (wolf.col) {
						wolf.col = wolf.col - 0.5;
					}
				} else {
					if (wolf.col <= 240/2 - wolf.width/2) {
						hOff = hOff - 0.5;
						hOffSky -= 0.5;
					} else {
						wolf.col = wolf.col - 0.5;
					}
				}
				hOffSky -= 0.04;
			}
			int i;
			for (i = 0; i < wolf.height; i++) {
				if (collisionMap1Bitmap[OFFSET(wolf.bigRow + i, wolf.bigCol, collMapSize)] == 0) {
					wolf.bigRow++;
				}
			}
			direction = left;
		} else if (BUTTON_HELD(BUTTON_LEFT) && damaged == FALSE && doubleJump != 0) {
			if (collisionMap1Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol - 1, collMapSize)] != 0
				&& collisionMap1Bitmap[OFFSET(wolf.bigRow + wolf.height + 1, wolf.bigCol - 1, collMapSize)] != 0
				&& collisionMap1Bitmap[OFFSET(wolf.bigRow + wolf.height / 2, wolf.bigCol - 1, collMapSize)] != 0
				&& collisionMap1Bitmap[OFFSET(wolf.bigRow + 4, wolf.bigCol - 1, collMapSize)] != 0
				&& collisionMap1Bitmap[OFFSET(wolf.bigRow + wolf.height - 4, wolf.bigCol - 1, collMapSize)] != 0) {
				if (!hOff) {
					if (wolf.col) {
						wolf.col = wolf.col - 0.5;
					}
				} else {
					if (wolf.col <= 240/2 - wolf.width/2) {
						hOff = hOff - 0.5;
						hOffSky -= 0.5;
					} else {
						wolf.col = wolf.col - 0.5;
					}
				}
				hOffSky -= 0.04;
			}
			int i;
			for (i = 0; i < wolf.height; i++) {
				if (collisionMap1Bitmap[OFFSET(wolf.bigRow + i, wolf.bigCol, collMapSize)] == 0) {
					wolf.bigRow++;
				}
			}
			direction = left;
		}
		if (collisionMap1Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol, collMapSize)] == 0
			|| collisionMap1Bitmap[OFFSET(wolf.bigRow + wolf.height, wolf.bigCol, collMapSize)] == 0) {
			wolf.bigCol++;
		}
		if(BUTTON_HELD(BUTTON_RIGHT) && damaged == FALSE && doubleJump == 0) {
			if (collisionMap1Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol + wolf.width + 1, collMapSize)] != 0
				&& collisionMap1Bitmap[OFFSET(wolf.bigRow - 1 + wolf.height, wolf.bigCol + wolf.width + 1, collMapSize)] != 0
				&& collisionMap1Bitmap[OFFSET(wolf.bigRow + wolf.height / 2, wolf.bigCol + wolf.width + 1, collMapSize)] != 0
				&& collisionMap1Bitmap[OFFSET(wolf.bigRow + 4, wolf.bigCol + wolf.width + 1, collMapSize)] != 0
				&& collisionMap1Bitmap[OFFSET(wolf.bigRow + wolf.height - 4, wolf.bigCol + wolf.width + 1, collMapSize)] != 0) {
				if (hOff == 512 - 240) {
					if (wolf.col != 240 - wolf.width) {
						wolf.col = wolf.col + 0.5;
					}
				} else {
					if (wolf.col >= 240/2 - wolf.width/2) {
						hOff = hOff + 0.5;
						hOffSky += 0.5;
					} else {
						wolf.col = wolf.col + 0.5;
					}
				}
				hOffSky += 0.04;
			}
			direction = right;
		} else if (BUTTON_HELD(BUTTON_RIGHT) && damaged == FALSE && doubleJump != 0) {
			if (collisionMap1Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol + wolf.width + 1, collMapSize)] != 0
				&& collisionMap1Bitmap[OFFSET(wolf.bigRow + wolf.height + 1, wolf.bigCol + wolf.width + 1, collMapSize)] != 0
				&& collisionMap1Bitmap[OFFSET(wolf.bigRow + wolf.height / 2, wolf.bigCol + wolf.width + 1, collMapSize)] != 0
				&& collisionMap1Bitmap[OFFSET(wolf.bigRow + 4, wolf.bigCol + wolf.width + 1, collMapSize)] != 0
				&& collisionMap1Bitmap[OFFSET(wolf.bigRow + wolf.height - 4, wolf.bigCol + wolf.width + 1, collMapSize)] != 0) {
				if (hOff == 512 - 240) {
					if (wolf.col != 240 - wolf.width) {
						wolf.col = wolf.col + 0.5;
					}
				} else {
					if (wolf.col >= 240/2 - wolf.width/2) {
						hOff = hOff + 0.5;
						hOffSky += 0.5;
					} else {
						wolf.col = wolf.col + 0.5;
					}
				}
				hOffSky += 0.04;
			}
			direction = right;
		}
		if (collisionMap1Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol + wolf.width, collMapSize)] == 0
			|| collisionMap1Bitmap[OFFSET(wolf.bigRow + wolf.height, wolf.bigCol + wolf.width, collMapSize)] == 0) {
			wolf.bigCol--;
		}
		if(BUTTON_PRESSED(BUTTON_A) && doubleJump != 2) {
			wolf.gravity = 1.5;
			wolf.row -= wolf.gravity;
			doubleJump++;
		}
		//falls if there is nothing under the character
		if (collisionMap1Bitmap[OFFSET(wolf.bigRow + 1 + wolf.height, wolf.bigCol, collMapSize)] != 0
				&& collisionMap1Bitmap[OFFSET(wolf.bigRow + 1 + wolf.height, wolf.bigCol + wolf.width, collMapSize)] != 0) {
			wolf.gravity = wolf.gravity - 0.025;
			wolf.row -= wolf.gravity;
		}
		//stops character from falling
		if ((collisionMap1Bitmap[OFFSET(wolf.bigRow + 1 + wolf.height, wolf.bigCol, collMapSize)] == 0
				|| collisionMap1Bitmap[OFFSET(wolf.bigRow + 1 + wolf.height, wolf.bigCol + wolf.width, collMapSize)] == 0
				|| collisionMap1Bitmap[OFFSET(wolf.bigRow + 1 + wolf.height, wolf.bigCol + wolf.width / 2, collMapSize)] == 0
				|| collisionMap1Bitmap[OFFSET(wolf.bigRow + 1 + wolf.height, wolf.bigCol + 4, collMapSize)] == 0
				|| collisionMap1Bitmap[OFFSET(wolf.bigRow + 1 + wolf.height, wolf.bigCol + wolf.width - 4, collMapSize)] == 0)
				&& wolf.gravity < 0) {
			wolf.gravity = 0;
			doubleJump = 0;
			if (collisionMap1Bitmap[OFFSET(wolf.bigRow + wolf.height, wolf.bigCol, collMapSize)] != 0) {
				int wolfRow = wolf.row;
				wolf.row = wolfRow;
				wolf.row = wolf.row + 1;
			}
			if (collisionMap1Bitmap[OFFSET(wolf.bigRow + wolf.height, wolf.bigCol, collMapSize)] == 0) {
				wolf.row = wolf.row - 1;
			}
			if (collisionMap1Bitmap[OFFSET(wolf.bigRow + wolf.height, wolf.bigCol, collMapSize)] == 0) {
				wolf.row = wolf.row - 1;
			}
		}
		//stops character from going up through objects
		if ((collisionMap1Bitmap[OFFSET(wolf.bigRow - 1, wolf.bigCol, collMapSize)] == 0
				|| collisionMap1Bitmap[OFFSET(wolf.bigRow - 1, wolf.bigCol + wolf.width, collMapSize)] == 0
				|| collisionMap1Bitmap[OFFSET(wolf.bigRow - 1, wolf.bigCol + wolf.width / 2, collMapSize)] == 0
				|| collisionMap1Bitmap[OFFSET(wolf.bigRow - 1, wolf.bigCol + 4, collMapSize)] == 0
				|| collisionMap1Bitmap[OFFSET(wolf.bigRow - 1, wolf.bigCol + wolf.width - 4, collMapSize)] == 0)
				&& wolf.gravity > 0) {
			wolf.gravity -= wolf.gravity;
		}
		if (collisionMap1Bitmap[OFFSET(wolf.bigRow - 1, wolf.bigCol + wolf.width, collMapSize)] == 0) {
			wolf.col--;
		}
		if (collisionMap1Bitmap[OFFSET(wolf.bigRow - 1, wolf.bigCol, collMapSize)] == 0) {
			wolf.col++;
		}
		werewolfAttack();
		if (damaged == TRUE && moveAway == bounceLeft) {
			playSoundB(injuredGrunt, INJUREDGRUNTLEN, INJUREDGRUNTFREQ);
			if (collisionMap1Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol - 1, collMapSize)] == 0
				&& collisionMap1Bitmap[OFFSET(wolf.bigRow - 1 + wolf.height, wolf.bigCol - 1, collMapSize)] == 0
				&& collisionMap1Bitmap[OFFSET(wolf.bigRow + wolf.height / 2, wolf.bigCol - 1, collMapSize)] == 0) {
				wolf.gravity = 1.5;
			} else if (collisionMap1Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol - 4, collMapSize)] != 0
				&& collisionMap1Bitmap[OFFSET(wolf.bigRow - 1 + wolf.height, wolf.bigCol - 4, collMapSize)] != 0
				&& collisionMap1Bitmap[OFFSET(wolf.bigRow + wolf.height / 2, wolf.bigCol - 4, collMapSize)] != 0) {
				wolf.col -= 4;//act like gravity going left
				if (collisionMap1Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol, collMapSize)] == 0
					|| collisionMap1Bitmap[OFFSET(wolf.bigRow - 1 + wolf.height, wolf.bigCol, collMapSize)] == 0
					|| collisionMap1Bitmap[OFFSET(wolf.bigRow + wolf.height / 2, wolf.bigCol, collMapSize)] == 0) {
					wolf.bigCol += 20;
				}
				wolf.gravity = 0.3;
			} else if (collisionMap1Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol - 3, collMapSize)] != 0
				&& collisionMap1Bitmap[OFFSET(wolf.bigRow - 1 + wolf.height, wolf.bigCol - 3, collMapSize)] != 0
				&& collisionMap1Bitmap[OFFSET(wolf.bigRow + wolf.height / 2, wolf.bigCol - 3, collMapSize)] != 0) {
				wolf.col -= 3;
				if (collisionMap1Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol, collMapSize)] == 0
					|| collisionMap1Bitmap[OFFSET(wolf.bigRow - 1 + wolf.height, wolf.bigCol, collMapSize)] == 0
					|| collisionMap1Bitmap[OFFSET(wolf.bigRow + wolf.height / 2, wolf.bigCol, collMapSize)] == 0) {
					wolf.bigCol += 20;
				}
				wolf.gravity = 0.3;
			} else if (collisionMap1Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol - 2, collMapSize)] != 0
				&& collisionMap1Bitmap[OFFSET(wolf.bigRow - 1 + wolf.height, wolf.bigCol - 2, collMapSize)] != 0
				&& collisionMap1Bitmap[OFFSET(wolf.bigRow + wolf.height / 2, wolf.bigCol - 2, collMapSize)] != 0) {
				wolf.col -= 2;
				if (collisionMap1Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol, collMapSize)] == 0
					|| collisionMap1Bitmap[OFFSET(wolf.bigRow - 1 + wolf.height, wolf.bigCol, collMapSize)] == 0
					|| collisionMap1Bitmap[OFFSET(wolf.bigRow + wolf.height / 2, wolf.bigCol, collMapSize)] == 0) {
					wolf.bigCol += 20;
				}
				wolf.gravity = 0.3;
			}
			wolf.row -= wolf.gravity;
			damageReaction++;
			if (damageReaction == 5) {
				damaged = FALSE;
				moveAway = 0;
				damageReaction = 0;
			}
		} else if (damaged == TRUE && moveAway == bounceUp) { //hitting the enemy from above
			playSoundB(injuredGrunt, INJUREDGRUNTLEN, INJUREDGRUNTFREQ);
			wolf.gravity = 1.5;
			damageReaction++;
			if (damageReaction == 5) {
				damaged = FALSE;
				moveAway = 0;
				damageReaction = 0;
			}
		} else if (damaged == TRUE) {
			playSoundB(injuredGrunt, INJUREDGRUNTLEN, INJUREDGRUNTFREQ);
			if (collisionMap1Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol + wolf.width + 4, collMapSize)] != 0
				&& collisionMap1Bitmap[OFFSET(wolf.bigRow - 1 + wolf.height, wolf.bigCol + wolf.width + 4, collMapSize)] != 0
				&& collisionMap1Bitmap[OFFSET(wolf.bigRow + wolf.height / 2, wolf.bigCol + wolf.width + 4, collMapSize)] != 0) {
				wolf.col += 4;//act like gravity going right
			} else if (collisionMap1Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol + wolf.width + 3, collMapSize)] != 0
				&& collisionMap1Bitmap[OFFSET(wolf.bigRow - 1 + wolf.height, wolf.bigCol + wolf.width + 3, collMapSize)] != 0
				&& collisionMap1Bitmap[OFFSET(wolf.bigRow + wolf.height / 2, wolf.bigCol + wolf.width + 3, collMapSize)] != 0) {
				wolf.col += 3;
			} else if (collisionMap1Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol + wolf.width + 2, collMapSize)] != 0
				&& collisionMap1Bitmap[OFFSET(wolf.bigRow - 1 + wolf.height, wolf.bigCol + wolf.width + 2, collMapSize)] != 0
				&& collisionMap1Bitmap[OFFSET(wolf.bigRow + wolf.height / 2, wolf.bigCol + wolf.width + 2, collMapSize)] != 0) {
				wolf.col += 2;
			}
			if (collisionMap1Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol + wolf.width, collMapSize)] == 0
				|| collisionMap1Bitmap[OFFSET(wolf.bigRow - 1 + wolf.height, wolf.bigCol + wolf.width, collMapSize)] == 0
				|| collisionMap1Bitmap[OFFSET(wolf.bigRow + wolf.height / 2, wolf.bigCol + wolf.width, collMapSize)] == 0) {
				wolf.bigCol -= 20;
			}
			if (collisionMap1Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol + wolf.width + 1, collMapSize)] == 0
				&& collisionMap1Bitmap[OFFSET(wolf.bigRow - 1 + wolf.height, wolf.bigCol + wolf.width + 1, collMapSize)] == 0
				&& collisionMap1Bitmap[OFFSET(wolf.bigRow + wolf.height / 2, wolf.bigCol + wolf.width + 1, collMapSize)] == 0) {
				wolf.gravity = 1.5;
			} else {
				wolf.gravity = 0.3;
			}
			wolf.row -= wolf.gravity;
			damageReaction++;
			if (damageReaction == 5) {
				damaged = FALSE;
				moveAway = 0;
				damageReaction = 0;
			}
		}
	} else {
		if(BUTTON_HELD(BUTTON_LEFT) && damaged == FALSE && doubleJump == 0) {
			if (collisionMap2Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol - 1, collMapSize)] != 0
				&& collisionMap2Bitmap[OFFSET(wolf.bigRow - 1 + wolf.height, wolf.bigCol - 1, collMapSize)] != 0
				&& collisionMap2Bitmap[OFFSET(wolf.bigRow + wolf.height / 2, wolf.bigCol - 1, collMapSize)] != 0
				&& collisionMap2Bitmap[OFFSET(wolf.bigRow + 4, wolf.bigCol - 1, collMapSize)] != 0
				&& collisionMap2Bitmap[OFFSET(wolf.bigRow + wolf.height - 4, wolf.bigCol - 1, collMapSize)] != 0) {
				if (!hOff) {
					if (wolf.col) {
						wolf.col = wolf.col - 0.5;
					}
				} else {
					if (wolf.col <= 240/2 - wolf.width/2) {
						hOff = hOff - 0.5;
						hOffSky -= 0.5;
					} else {
						wolf.col = wolf.col - 0.5;
					}
				}
				hOffSky -= 0.04;
			}
			int i;
			for (i = 0; i < wolf.height; i++) {
				if (collisionMap2Bitmap[OFFSET(wolf.bigRow + i, wolf.bigCol, collMapSize)] == 0) {
					wolf.bigRow++;
				}
			}
			direction = left;
		} else if (BUTTON_HELD(BUTTON_LEFT) && damaged == FALSE && doubleJump != 0) {
			if (collisionMap2Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol - 1, collMapSize)] != 0
				&& collisionMap2Bitmap[OFFSET(wolf.bigRow + wolf.height + 1, wolf.bigCol - 1, collMapSize)] != 0
				&& collisionMap2Bitmap[OFFSET(wolf.bigRow + wolf.height / 2, wolf.bigCol - 1, collMapSize)] != 0
				&& collisionMap2Bitmap[OFFSET(wolf.bigRow + 4, wolf.bigCol - 1, collMapSize)] != 0
				&& collisionMap2Bitmap[OFFSET(wolf.bigRow + wolf.height - 4, wolf.bigCol - 1, collMapSize)] != 0) {
				if (!hOff) {
					if (wolf.col) {
						wolf.col = wolf.col - 0.5;
					}
				} else {
					if (wolf.col <= 240/2 - wolf.width/2) {
						hOff = hOff - 0.5;
						hOffSky -= 0.5;
					} else {
						wolf.col = wolf.col - 0.5;
					}
				}
				hOffSky -= 0.04;
			}
			int i;
			for (i = 0; i < wolf.height; i++) {
				if (collisionMap2Bitmap[OFFSET(wolf.bigRow + i, wolf.bigCol, collMapSize)] == 0) {
					wolf.bigRow++;
				}
			}
			direction = left;
		}
		if (collisionMap2Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol, collMapSize)] == 0
			|| collisionMap2Bitmap[OFFSET(wolf.bigRow + wolf.height, wolf.bigCol, collMapSize)] == 0) {
			wolf.bigCol++;
		}
		if(BUTTON_HELD(BUTTON_RIGHT) && damaged == FALSE && doubleJump == 0) {
			if (collisionMap2Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol + wolf.width + 1, collMapSize)] != 0
				&& collisionMap2Bitmap[OFFSET(wolf.bigRow - 1 + wolf.height, wolf.bigCol + wolf.width + 1, collMapSize)] != 0
				&& collisionMap2Bitmap[OFFSET(wolf.bigRow + wolf.height / 2, wolf.bigCol + wolf.width + 1, collMapSize)] != 0
				&& collisionMap2Bitmap[OFFSET(wolf.bigRow + 4, wolf.bigCol + wolf.width + 1, collMapSize)] != 0
				&& collisionMap2Bitmap[OFFSET(wolf.bigRow + wolf.height - 4, wolf.bigCol + wolf.width + 1, collMapSize)] != 0) {
				if (hOff == 512 - 240) {
					if (wolf.col != 240 - wolf.width) {
						wolf.col = wolf.col + 0.5;
					}
				} else {
					if (wolf.col >= 240/2 - wolf.width/2) {
						hOff = hOff + 0.5;
						hOffSky += 0.5;
					} else {
						wolf.col = wolf.col + 0.5;
					}
				}
				hOffSky += 0.04;
			}
			direction = right;
		} else if (BUTTON_HELD(BUTTON_RIGHT) && damaged == FALSE && doubleJump != 0) {
			if (collisionMap2Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol + wolf.width + 1, collMapSize)] != 0
				&& collisionMap2Bitmap[OFFSET(wolf.bigRow + wolf.height + 1, wolf.bigCol + wolf.width + 1, collMapSize)] != 0
				&& collisionMap2Bitmap[OFFSET(wolf.bigRow + wolf.height / 2, wolf.bigCol + wolf.width + 1, collMapSize)] != 0
				&& collisionMap2Bitmap[OFFSET(wolf.bigRow + 4, wolf.bigCol + wolf.width + 1, collMapSize)] != 0
				&& collisionMap2Bitmap[OFFSET(wolf.bigRow + wolf.height - 4, wolf.bigCol + wolf.width + 1, collMapSize)] != 0) {
				if (hOff == 512 - 240) {
					if (wolf.col != 240 - wolf.width) {
						wolf.col = wolf.col + 0.5;
					}
				} else {
					if (wolf.col >= 240/2 - wolf.width/2) {
						hOff = hOff + 0.5;
						hOffSky += 0.5;
					} else {
						wolf.col = wolf.col + 0.5;
					}
				}
				hOffSky += 0.04;
			}
			direction = right;
		}
		if (collisionMap2Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol + wolf.width, collMapSize)] == 0
			|| collisionMap2Bitmap[OFFSET(wolf.bigRow + wolf.height, wolf.bigCol + wolf.width, collMapSize)] == 0) {
			wolf.bigCol--;
		}
		if(BUTTON_PRESSED(BUTTON_A) && doubleJump != 2) {
			wolf.gravity = 1.5;
			wolf.row -= wolf.gravity;
			doubleJump++;
		}
		//falls if there is nothing under the character
		if (collisionMap2Bitmap[OFFSET(wolf.bigRow + 1 + wolf.height, wolf.bigCol, collMapSize)] != 0
				&& collisionMap2Bitmap[OFFSET(wolf.bigRow + 1 + wolf.height, wolf.bigCol + wolf.width, collMapSize)] != 0) {
			wolf.gravity = wolf.gravity - 0.025;
			wolf.row -= wolf.gravity;
		}
		//stops character from falling
		if ((collisionMap2Bitmap[OFFSET(wolf.bigRow + 1 + wolf.height, wolf.bigCol, collMapSize)] == 0
				|| collisionMap2Bitmap[OFFSET(wolf.bigRow + 1 + wolf.height, wolf.bigCol + wolf.width, collMapSize)] == 0
				|| collisionMap2Bitmap[OFFSET(wolf.bigRow + 1 + wolf.height, wolf.bigCol + wolf.width / 2, collMapSize)] == 0
				|| collisionMap2Bitmap[OFFSET(wolf.bigRow + 1 + wolf.height, wolf.bigCol + 4, collMapSize)] == 0
				|| collisionMap2Bitmap[OFFSET(wolf.bigRow + 1 + wolf.height, wolf.bigCol + wolf.width - 4, collMapSize)] == 0)
				&& wolf.gravity < 0) {
			wolf.gravity = 0;
			doubleJump = 0;
			if (collisionMap2Bitmap[OFFSET(wolf.bigRow + wolf.height, wolf.bigCol, collMapSize)] != 0) {
				int wolfRow = wolf.row;
				wolf.row = wolfRow;
				wolf.row = wolf.row + 1;
			}
			if (collisionMap2Bitmap[OFFSET(wolf.bigRow + wolf.height, wolf.bigCol, collMapSize)] == 0) {
				wolf.row = wolf.row - 1;
			}
			if (collisionMap2Bitmap[OFFSET(wolf.bigRow + wolf.height, wolf.bigCol, collMapSize)] == 0) {
				wolf.row = wolf.row - 1;
			}
		}
		//stops character from going up through objects
		if ((collisionMap2Bitmap[OFFSET(wolf.bigRow - 1, wolf.bigCol, collMapSize)] == 0
				|| collisionMap2Bitmap[OFFSET(wolf.bigRow - 1, wolf.bigCol + wolf.width, collMapSize)] == 0
				|| collisionMap2Bitmap[OFFSET(wolf.bigRow - 1, wolf.bigCol + wolf.width / 2, collMapSize)] == 0
				|| collisionMap2Bitmap[OFFSET(wolf.bigRow - 1, wolf.bigCol + 4, collMapSize)] == 0
				|| collisionMap2Bitmap[OFFSET(wolf.bigRow - 1, wolf.bigCol + wolf.width - 4, collMapSize)] == 0)
				&& wolf.gravity > 0) {
			wolf.gravity -= wolf.gravity;
		}
		if (collisionMap2Bitmap[OFFSET(wolf.bigRow - 1, wolf.bigCol + wolf.width, collMapSize)] == 0) {
			wolf.col--;
		}
		if (collisionMap2Bitmap[OFFSET(wolf.bigRow - 1, wolf.bigCol, collMapSize)] == 0) {
			wolf.col++;
		}
		werewolfAttack();
		if (damaged == TRUE && moveAway == bounceLeft) {
			playSoundB(injuredGrunt, INJUREDGRUNTLEN, INJUREDGRUNTFREQ);
			if (collisionMap2Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol - 1, collMapSize)] == 0
				&& collisionMap2Bitmap[OFFSET(wolf.bigRow - 1 + wolf.height, wolf.bigCol - 1, collMapSize)] == 0
				&& collisionMap2Bitmap[OFFSET(wolf.bigRow + wolf.height / 2, wolf.bigCol - 1, collMapSize)] == 0) {
				wolf.gravity = 1.5;
			} else if (collisionMap2Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol - 4, collMapSize)] != 0
				&& collisionMap2Bitmap[OFFSET(wolf.bigRow - 1 + wolf.height, wolf.bigCol - 4, collMapSize)] != 0
				&& collisionMap2Bitmap[OFFSET(wolf.bigRow + wolf.height / 2, wolf.bigCol - 4, collMapSize)] != 0) {
				wolf.col -= 4;//act like gravity going left
				if (collisionMap2Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol, collMapSize)] == 0
					|| collisionMap2Bitmap[OFFSET(wolf.bigRow - 1 + wolf.height, wolf.bigCol, collMapSize)] == 0
					|| collisionMap2Bitmap[OFFSET(wolf.bigRow + wolf.height / 2, wolf.bigCol, collMapSize)] == 0) {
					wolf.bigCol += 20;
				}
				wolf.gravity = 0.3;
			} else if (collisionMap2Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol - 3, collMapSize)] != 0
				&& collisionMap2Bitmap[OFFSET(wolf.bigRow - 1 + wolf.height, wolf.bigCol - 3, collMapSize)] != 0
				&& collisionMap2Bitmap[OFFSET(wolf.bigRow + wolf.height / 2, wolf.bigCol - 3, collMapSize)] != 0) {
				wolf.col -= 3;//act like gravity going left
				if (collisionMap2Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol, collMapSize)] == 0
					|| collisionMap2Bitmap[OFFSET(wolf.bigRow - 1 + wolf.height, wolf.bigCol, collMapSize)] == 0
					|| collisionMap2Bitmap[OFFSET(wolf.bigRow + wolf.height / 2, wolf.bigCol, collMapSize)] == 0) {
					wolf.bigCol += 20;
				}
				wolf.gravity = 0.3;
			} else if (collisionMap2Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol - 2, collMapSize)] != 0
				&& collisionMap2Bitmap[OFFSET(wolf.bigRow - 1 + wolf.height, wolf.bigCol - 2, collMapSize)] != 0
				&& collisionMap2Bitmap[OFFSET(wolf.bigRow + wolf.height / 2, wolf.bigCol - 2, collMapSize)] != 0) {
				wolf.col -= 2;//act like gravity going left
				if (collisionMap2Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol, collMapSize)] == 0
					|| collisionMap2Bitmap[OFFSET(wolf.bigRow - 1 + wolf.height, wolf.bigCol, collMapSize)] == 0
					|| collisionMap2Bitmap[OFFSET(wolf.bigRow + wolf.height / 2, wolf.bigCol, collMapSize)] == 0) {
					wolf.bigCol += 20;
				}
				wolf.gravity = 0.3;
			}
			wolf.row -= wolf.gravity;
			damageReaction++;
			if (damageReaction == 5) {
				damaged = FALSE;
				moveAway = 0;
				damageReaction = 0;
			}
		} else if (damaged == TRUE && moveAway == bounceUp) { //hitting the enemy from above
			playSoundB(injuredGrunt, INJUREDGRUNTLEN, INJUREDGRUNTFREQ);
			wolf.gravity = 1.5;
			damageReaction++;
			if (damageReaction == 5) {
				damaged = FALSE;
				moveAway = 0;
				damageReaction = 0;
			}
		} else if (damaged == TRUE) {
			playSoundB(injuredGrunt, INJUREDGRUNTLEN, INJUREDGRUNTFREQ);
			if (collisionMap2Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol + wolf.width + 4, collMapSize)] != 0
				&& collisionMap2Bitmap[OFFSET(wolf.bigRow - 1 + wolf.height, wolf.bigCol + wolf.width + 4, collMapSize)] != 0
				&& collisionMap2Bitmap[OFFSET(wolf.bigRow + wolf.height / 2, wolf.bigCol + wolf.width + 4, collMapSize)] != 0) {
				wolf.col += 4;//act like gravity going right
			} else if (collisionMap2Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol + wolf.width + 3, collMapSize)] != 0
				&& collisionMap2Bitmap[OFFSET(wolf.bigRow - 1 + wolf.height, wolf.bigCol + wolf.width + 3, collMapSize)] != 0
				&& collisionMap2Bitmap[OFFSET(wolf.bigRow + wolf.height / 2, wolf.bigCol + wolf.width + 3, collMapSize)] != 0) {
				wolf.col += 3;//act like gravity going right
			} else if (collisionMap2Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol + wolf.width + 2, collMapSize)] != 0
				&& collisionMap2Bitmap[OFFSET(wolf.bigRow - 1 + wolf.height, wolf.bigCol + wolf.width + 2, collMapSize)] != 0
				&& collisionMap2Bitmap[OFFSET(wolf.bigRow + wolf.height / 2, wolf.bigCol + wolf.width + 2, collMapSize)] != 0) {
				wolf.col += 2;//act like gravity going right
			}
			if (collisionMap2Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol + wolf.width, collMapSize)] == 0
				|| collisionMap2Bitmap[OFFSET(wolf.bigRow - 1 + wolf.height, wolf.bigCol + wolf.width, collMapSize)] == 0
				|| collisionMap2Bitmap[OFFSET(wolf.bigRow + wolf.height / 2, wolf.bigCol + wolf.width, collMapSize)] == 0) {
				wolf.bigCol -= 20;
			}
			if (collisionMap2Bitmap[OFFSET(wolf.bigRow + 1, wolf.bigCol + wolf.width + 1, collMapSize)] == 0
				&& collisionMap2Bitmap[OFFSET(wolf.bigRow - 1 + wolf.height, wolf.bigCol + wolf.width + 1, collMapSize)] == 0
				&& collisionMap2Bitmap[OFFSET(wolf.bigRow + wolf.height / 2, wolf.bigCol + wolf.width + 1, collMapSize)] == 0) {
				wolf.gravity = 1.5;
			} else {
				wolf.gravity = 0.3;
			}
			wolf.row -= wolf.gravity;
			damageReaction++;
			if (damageReaction == 5) {
				damaged = FALSE;
				moveAway = 0;
				damageReaction = 0;
			}
		}
	}
	animateWolf();
}
/**
 * code for the main character's attack
 */
void werewolfAttack() {
	int i;
	for (i = 0; i < knightArrayLength; i++) {
		if(BUTTON_PRESSED(BUTTON_B)) {
			playSoundB(slash, SLASHLEN, SLASHFREQ);
			if (direction == right && Knight[i].knightDWait == 0) {
				if (wolf.bigCol + wolf.width + slashAttack.width - 3 > Knight[i].bigCol
					&& wolf.bigCol < Knight[i].bigCol &&
					wolf.bigRow + wolf.height > Knight[i].bigRow && Knight[i].bigRow < wolf.bigRow + 2
			&& Knight[i].bigRow + Knight[i].height > wolf.bigRow) {
					Knight[i].knightHealth--;
					if (Knight[i].knightHealth == 0) {
						Knight[i].row = 0;
						Knight[i].col = 160;
					}
					Knight[i].knightDamaged = TRUE;
					Knight[i].knightBounce = right;
					Knight[i].knightDWait = 1;
					Knight[i].knightReaction = 1;
				}
			} else if (direction == left && Knight[i].knightDWait == 0) {
				if (wolf.bigCol - slashAttack.width + 3 < Knight[i].bigCol + Knight[i].width
					&& wolf.bigCol + wolf.width > Knight[i].bigCol + Knight[i].width &&
					wolf.bigRow + wolf.height > Knight[i].bigRow && Knight[i].bigRow < wolf.bigRow + 2
			&& Knight[i].bigRow + Knight[i].height > wolf.bigRow) {
					Knight[i].knightHealth--;
					if (Knight[i].knightHealth == 0) {
						Knight[i].row = 0;
						Knight[i].col = 160;
					}
					Knight[i].knightDamaged = TRUE;
					Knight[i].knightBounce = left;
					Knight[i].knightDWait = 1;
					Knight[i].knightReaction = 1;
				}
			}
		}
		if (Knight[i].knightDWait > 0) {
			Knight[i].knightDWait++;
		}
		if (Knight[i].knightDWait == 50) {
			Knight[i].knightDWait = 0;
		}
		if (Knight[i].knightBounce == right) {
			Knight[i].bigCol += 3;
			Knight[i].knightReaction++;
			if (Knight[i].knightReaction == 5) {
				Knight[i].knightDamaged = FALSE;
				Knight[i].knightBounce = 5;
				Knight[i].knightReaction = 0;
			}
		} else if (Knight[i].knightBounce == left) {
			Knight[i].bigCol -= 3;
			Knight[i].knightReaction++;
			if (Knight[i].knightReaction == 5) {
				Knight[i].knightBounce = 5;
				Knight[i].knightDamaged = FALSE;
				Knight[i].knightReaction = 0;
			}
		}
	}
}

/**
 * Werewolf animations
 */
void animateWolf()
{
    if (wolf.aniState != WOLFIDLE) {
		wolf.prevAniState = wolf.aniState;
	}
		
    wolf.aniState = WOLFIDLE;
		
    if(wolf.aniCounter%20==0) {
		wolf.aniCounter = 0;
		if (wolf.currFrame == 2) {
			wolf.currFrame = 0;
		} else {
			wolf.currFrame++;
		}
    }
    if(BUTTON_HELD(BUTTON_LEFT) && wolf.gravity == 0) {
		wolf.aniState = WOLFWALK;
	}
    if(BUTTON_HELD(BUTTON_RIGHT) && wolf.gravity == 0) {
		wolf.aniState = WOLFWALK;
	}
	if(BUTTON_PRESSED(BUTTON_A)) {
		wolf.aniState = WOLFJUMP;
	}
	if(BUTTON_PRESSED(BUTTON_B)) {
		duration = 1;
		wolf.aniState = WOLFATTACK;
		if (direction == left) {
			slashAttack.row = wolf.row;
			slashAttack.col = wolf.col - wolf.width;
		} else {
			slashAttack.row = wolf.row;
			slashAttack.col = wolf.col + wolf.width;
		}
	}
	if (duration > 0) {
		duration++;
	}
	if (duration == 20) {
		duration = 0;
		slashAttack.row = 0;
		slashAttack.col = 10;
	}
    if(wolf.aniState == WOLFIDLE) {
    	wolf.aniState = wolf.prevAniState;
        wolf.currFrame = 0;
	} else {
        wolf.aniCounter++;
	}
}

/**
 * Updates the health bar and tells from which direction damage was taken
 */
void healthbar() {
	health.row = health.bigRow - vOff;
	health.col = health.bigCol;
	int i;
	for (i = 0; i < knightArrayLength; i++) {
		if ((wolf.bigCol < Knight[i].bigCol
				&& wolf.bigCol + wolf.width - 1 > Knight[i].bigCol
				&& wolf.bigRow + 3 > Knight[i].bigRow && Knight[i].bigRow < wolf.bigRow + 2
			&& Knight[i].bigRow + Knight[i].height > wolf.bigRow)
			&& wolfDWait == 0 && Knight[i].knightHealth > 0) { //moving right
			if (health.currFrame == FULL) {
				health.currFrame = THREEFOURTHS;
				wolfDWait++;
			} else if (health.currFrame == THREEFOURTHS) {
				health.currFrame = HALF;
				wolfDWait++;
			} else if (health.currFrame == HALF) {
				health.currFrame = ONEFOURTH;
				wolfDWait++;
			} else if (health.currFrame == ONEFOURTH) {
				werewolfDeath();
			}
			damaged = TRUE;
			moveAway = bounceLeft;
		} else if ((wolf.bigCol + 3 < Knight[i].bigCol + Knight[i].width
				&& wolf.bigCol > Knight[i].bigCol
				&& wolf.bigRow + 3 > Knight[i].bigRow && Knight[i].bigRow < wolf.bigRow + 2
			&& Knight[i].bigRow + Knight[i].height > wolf.bigRow)
			&& wolfDWait == 0 && Knight[i].knightHealth > 0) { //moving left
			if (health.currFrame == FULL) {
				health.currFrame = THREEFOURTHS;
				wolfDWait++;
			} else if (health.currFrame == THREEFOURTHS) {
				health.currFrame = HALF;
				wolfDWait++;
			} else if (health.currFrame == HALF) {
				health.currFrame = ONEFOURTH;
				wolfDWait++;
			} else if (health.currFrame == ONEFOURTH) {
				werewolfDeath();
			}
			damaged = TRUE;
			moveAway = bounceRight;
		} else if (wolf.bigRow + wolf.height - 3 > Knight[i].bigRow
				&& wolf.bigRow < Knight[i].bigRow && Knight[i].bigRow < wolf.bigRow + 2
				&& Knight[i].bigRow + Knight[i].height > wolf.bigRow
				&& ((wolf.bigCol < Knight[i].bigCol && wolf.bigCol + wolf.width > Knight[i].bigCol)
					|| (wolf.bigCol > Knight[i].bigCol && wolf.bigCol < Knight[i].bigCol + Knight[i].width))
			&& wolfDWait == 0 && Knight[i].knightHealth > 0) { //falling from above
			if (health.currFrame == FULL) {
				health.currFrame = THREEFOURTHS;
				wolfDWait++;
			} else if (health.currFrame == THREEFOURTHS) {
				health.currFrame = HALF;
				wolfDWait++;
			} else if (health.currFrame == HALF) {
				health.currFrame = ONEFOURTH;
				wolfDWait++;
			} else if (health.currFrame == ONEFOURTH) {
				werewolfDeath();
			}
			damaged = TRUE;
			moveAway = bounceUp;
		}
		if (wolfDWait > 0) {
			wolfDWait++;
		}
		if (wolfDWait == 75) {
			wolfDWait = 0;
		}
	}
}

void werewolfDeath() {
	stopSound();
	REG_DISPCTL = MODE0 | BG0_ENABLE;
	REG_BG0HOFS = 0;
	REG_BG0VOFS = 0;
	state = LOSESCREEN;
	REG_BG0CNT = CBB(0) | SBB(27) | BG_SIZE1 | COLOR256;
	DMANow(3, loseTiles, &CHARBLOCKBASE[0], DMA_SOURCE_INCREMENT);
	DMANow(3, loseMap, &SCREENBLOCKBASE[27], DMA_SOURCE_INCREMENT);
   	playSoundA(loseMusic, LOSEMUSICLEN, LOSEMUSICFREQ);
}

/**
 * Knight actions
 */
void knight(int i) {
	Knight[i].row = Knight[i].bigRow - vOff;
	Knight[i].col = Knight[i].bigCol - hOff;
	if (state == GAMESCREEN) {
		if (Knight[i].slowKnight < 1 && Knight[i].knightDamaged == FALSE) {
			Knight[i].slowKnight++;
			if (Knight[i].bigCol - Knight[i].width * 3 < wolf.bigCol && Knight[i].bigCol > wolf.bigCol
				&& Knight[i].bigRow - Knight[i].height < wolf.bigRow && Knight[i].bigRow < wolf.bigRow + 2
				&& Knight[i].bigRow + Knight[i].height > wolf.bigRow) {
				Knight[i].knightDirection = knightLeft;
				Knight[i].knightAttacking = TRUE;
			} else if (Knight[i].bigCol + Knight[i].width * 3 > wolf.bigCol && Knight[i].bigCol < wolf.bigCol
				&& Knight[i].bigRow - Knight[i].height < wolf.bigRow && Knight[i].bigRow < wolf.bigRow + 2
				&& Knight[i].bigRow + Knight[i].height > wolf.bigRow) {
				Knight[i].knightDirection = knightRight;
				Knight[i].knightAttacking = TRUE;
			} else if (collisionMap1Bitmap[OFFSET(Knight[i].bigRow + 1, Knight[i].bigCol, collMapSize)] == 0
					&& collisionMap1Bitmap[OFFSET(Knight[i].bigRow - 1 + Knight[i].height, Knight[i].bigCol, collMapSize)] == 0
					&& collisionMap1Bitmap[OFFSET(Knight[i].bigRow + Knight[i].height / 2, Knight[i].bigCol, collMapSize)] == 0) {
				Knight[i].knightDirection = knightRight;
				Knight[i].knightAttacking = FALSE;
			} else if (collisionMap1Bitmap[OFFSET(Knight[i].bigRow + 1, Knight[i].bigCol + Knight[i].width, collMapSize)] == 0
				&& collisionMap1Bitmap[OFFSET(Knight[i].bigRow - 1 + Knight[i].height, Knight[i].bigCol + Knight[i].width, collMapSize)] == 0
				&& collisionMap1Bitmap[OFFSET(Knight[i].bigRow + Knight[i].height / 2, Knight[i].bigCol + Knight[i].width, collMapSize)] == 0) {
				Knight[i].knightDirection = knightLeft;
				Knight[i].knightAttacking = FALSE;
			} else {
				Knight[i].knightAttacking = FALSE;
			}
			int j;
			for (j = 0; j < knightArrayLength; j++) {
				if (i != j && Knight[i].bigCol + Knight[i].width > Knight[j].bigCol && Knight[i].bigCol < Knight[j].bigCol
					&& Knight[j].knightHealth != 0 && Knight[i].knightHealth != 0 && Knight[i].bigRow < Knight[j].bigRow + 3
					&& Knight[i].bigRow + Knight[i].height > Knight[j].bigRow) {
					Knight[i].knightDirection = knightLeft;
					Knight[j].knightDirection = knightRight;
				}
			}
			int k;
			for (k = 0; k < knightArrayLength; k++) {
				if (i != k && Knight[i].bigCol < Knight[k].bigCol + Knight[k].width && Knight[i].bigCol > Knight[k].bigCol
					&& Knight[k].knightHealth != 0 && Knight[i].knightHealth != 0 && Knight[i].bigRow < Knight[k].bigRow + 3
					&& Knight[i].bigRow + Knight[i].height > Knight[k].bigRow) {
					Knight[i].knightDirection = knightRight;
					Knight[k].knightDirection = knightLeft;
				}
			}
			if (Knight[i].knightDirection == knightLeft && collisionMap1Bitmap[OFFSET(Knight[i].bigRow + 1, Knight[i].bigCol, collMapSize)] != 0
					&& collisionMap1Bitmap[OFFSET(Knight[i].bigRow - 1 + Knight[i].height, Knight[i].bigCol, collMapSize)] != 0
					&& collisionMap1Bitmap[OFFSET(Knight[i].bigRow + Knight[i].height / 2, Knight[i].bigCol, collMapSize)] != 0) {
				Knight[i].bigCol -= 1;
			} else if (Knight[i].knightDirection == knightRight && collisionMap1Bitmap[OFFSET(Knight[i].bigRow + 1, Knight[i].bigCol + Knight[i].width, collMapSize)] != 0
				&& collisionMap1Bitmap[OFFSET(Knight[i].bigRow - 1 + Knight[i].height, Knight[i].bigCol + Knight[i].width, collMapSize)] != 0
				&& collisionMap1Bitmap[OFFSET(Knight[i].bigRow + Knight[i].height / 2, Knight[i].bigCol + Knight[i].width, collMapSize)] != 0) {
				Knight[i].bigCol += 1;
			}
			if (Knight[i].knightDirection == knightLeft
				&& collisionMap1Bitmap[OFFSET(Knight[i].bigRow + Knight[i].height + 1, Knight[i].bigCol, collMapSize)] != 0) {
				Knight[i].knightDirection = knightRight;
			} else if (Knight[i].knightDirection == knightRight
				&& collisionMap1Bitmap[OFFSET(Knight[i].bigRow + Knight[i].height + 1, Knight[i].bigCol + Knight[i].width, collMapSize)] != 0) {
				Knight[i].knightDirection = knightLeft;
			}
		}
	} else {
		if (Knight[i].slowKnight < 1 && Knight[i].knightDamaged == FALSE) {
			Knight[i].slowKnight++;
			if (Knight[i].bigCol - Knight[i].width * 3 < wolf.bigCol && Knight[i].bigCol > wolf.bigCol
				&& Knight[i].bigRow - Knight[i].height < wolf.bigRow && Knight[i].bigRow < wolf.bigRow + 2
				&& Knight[i].bigRow + Knight[i].height > wolf.bigRow) {
				Knight[i].knightDirection = knightLeft;
				Knight[i].knightAttacking = TRUE;
			} else if (Knight[i].bigCol + Knight[i].width * 3 > wolf.bigCol && Knight[i].bigCol < wolf.bigCol
				&& Knight[i].bigRow - Knight[i].height < wolf.bigRow && Knight[i].bigRow < wolf.bigRow + 2
				&& Knight[i].bigRow + Knight[i].height > wolf.bigRow) {
				Knight[i].knightDirection = knightRight;
				Knight[i].knightAttacking = TRUE;
			} else if (collisionMap2Bitmap[OFFSET(Knight[i].bigRow + 1, Knight[i].bigCol, collMapSize)] == 0
					&& collisionMap2Bitmap[OFFSET(Knight[i].bigRow - 1 + Knight[i].height, Knight[i].bigCol, collMapSize)] == 0
					&& collisionMap2Bitmap[OFFSET(Knight[i].bigRow + Knight[i].height / 2, Knight[i].bigCol, collMapSize)] == 0) {
				Knight[i].knightDirection = knightRight;
				Knight[i].knightAttacking = FALSE;
			} else if (collisionMap2Bitmap[OFFSET(Knight[i].bigRow + 1, Knight[i].bigCol + Knight[i].width, collMapSize)] == 0
				&& collisionMap2Bitmap[OFFSET(Knight[i].bigRow - 1 + Knight[i].height, Knight[i].bigCol + Knight[i].width, collMapSize)] == 0
				&& collisionMap2Bitmap[OFFSET(Knight[i].bigRow + Knight[i].height / 2, Knight[i].bigCol + Knight[i].width, collMapSize)] == 0) {
				Knight[i].knightDirection = knightLeft;
				Knight[i].knightAttacking = FALSE;
			} else {
				Knight[i].knightAttacking = FALSE;
			}
			int j;
			for (j = 0; j < knightArrayLength; j++) {
				if (i != j && Knight[i].bigCol + Knight[i].width > Knight[j].bigCol && Knight[i].bigCol < Knight[j].bigCol
					&& Knight[j].knightHealth != 0 && Knight[i].knightHealth != 0 && Knight[i].bigRow < Knight[j].bigRow + 3
					&& Knight[i].bigRow + Knight[i].height > Knight[j].bigRow) {
					Knight[i].knightDirection = knightLeft;
					Knight[j].knightDirection = knightRight;
				}
			}
			int k;
			for (k = 0; k < knightArrayLength; k++) {
				if (i != k && Knight[i].bigCol < Knight[k].bigCol + Knight[k].width && Knight[i].bigCol > Knight[k].bigCol
					&& Knight[k].knightHealth != 0 && Knight[i].knightHealth != 0 && Knight[i].bigRow < Knight[k].bigRow + 3
					&& Knight[i].bigRow + Knight[i].height > Knight[k].bigRow) {
					Knight[i].knightDirection = knightRight;
					Knight[k].knightDirection = knightLeft;
				}
			}
			if (Knight[i].knightDirection == knightLeft && collisionMap2Bitmap[OFFSET(Knight[i].bigRow + 1, Knight[i].bigCol, collMapSize)] != 0
					&& collisionMap2Bitmap[OFFSET(Knight[i].bigRow - 1 + Knight[i].height, Knight[i].bigCol, collMapSize)] != 0
					&& collisionMap2Bitmap[OFFSET(Knight[i].bigRow + Knight[i].height / 2, Knight[i].bigCol, collMapSize)] != 0) {
				Knight[i].bigCol -= 1;
			} else if (Knight[i].knightDirection == knightRight && collisionMap2Bitmap[OFFSET(Knight[i].bigRow + 1, Knight[i].bigCol + Knight[i].width, collMapSize)] != 0
				&& collisionMap2Bitmap[OFFSET(Knight[i].bigRow - 1 + Knight[i].height, Knight[i].bigCol + Knight[i].width, collMapSize)] != 0
				&& collisionMap2Bitmap[OFFSET(Knight[i].bigRow + Knight[i].height / 2, Knight[i].bigCol + Knight[i].width, collMapSize)] != 0) {
				Knight[i].bigCol += 1;
			}
			if (Knight[i].knightDirection == knightLeft
				&& collisionMap2Bitmap[OFFSET(Knight[i].bigRow + Knight[i].height + 1, Knight[i].bigCol, collMapSize)] != 0) {
				Knight[i].knightDirection = knightRight;
			} else if (Knight[i].knightDirection == knightRight
				&& collisionMap2Bitmap[OFFSET(Knight[i].bigRow + Knight[i].height + 1, Knight[i].bigCol + Knight[i].width, collMapSize)] != 0) {
				Knight[i].knightDirection = knightLeft;
			}
		}
	}
	if (Knight[i].slowKnight > 0) {
		Knight[i].slowKnight++;
	}
	if (Knight[i].slowKnight == 5) {
		Knight[i].slowKnight = 0;
	}
	animateKnight(i);
}

/**
 * Knight animations
 */
void animateKnight(int i) {
	if (Knight[i].aniState != KNIGHTIDLE) {
		Knight[i].prevAniState = Knight[i].aniState;
	}
		
    Knight[i].aniState = KNIGHTIDLE;
		
    if(Knight[i].aniCounter%20==0) {
		Knight[i].aniCounter = 0;
		if (Knight[i].currFrame == 2) {
			Knight[i].currFrame = 0;
		} else {
			Knight[i].currFrame++;
		}
    }
	if(Knight[i].knightAttacking) {
    	Knight[i].aniState = KNIGHTATTACK;
    } else {
    	Knight[i].aniState = KNIGHTMOVE;
    }
    if(Knight[i].aniState == KNIGHTIDLE) {
    	Knight[i].aniState = Knight[i].prevAniState;
        Knight[i].currFrame = 0;
	} else {
       	Knight[i].aniCounter++;
	}
}

/**
 * In-game door for stage/win transition
 */
void doorPlacement() {
	door.row = door.bigRow - vOff;
	door.col = door.bigCol - hOff;
	if (slowerFlames == 0) {
		if(door.aniCounter % 20 == 0) {
			door.aniCounter = 0;
			if (door.currFrame == 3) {
				door.currFrame = 0;
			} else {
				door.currFrame++;
			}
    	}
    	slowerFlames++;
	} else {
		slowerFlames++;
	}
	if (slowerFlames == 17) {
		slowerFlames = 0;
	}
}

/**
 * Pause the game
 */
void pause() {
	if(BUTTON_PRESSED(BUTTON_SELECT) && prevGameState == GAMESCREEN) {
		REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
		REG_BG1HOFS = hOff;
		REG_BG1VOFS = vOff;
		state = GAMESCREEN;
   		REG_BG0CNT = CBB(0) | SBB(27) | BG_SIZE1 | COLOR256;
   		DMANow(3, background1Tiles, &CHARBLOCKBASE[0], background1TilesLen/2);
   		DMANow(3, background1Map, &SCREENBLOCKBASE[27], background1MapLen/2);
		REG_BG1CNT = CBB(2) | SBB(29) | BG_SIZE1 | COLOR256;
   		DMANow(3, background2Tiles, &CHARBLOCKBASE[2], background2TilesLen/2);
   		DMANow(3, background2Map, &SCREENBLOCKBASE[29], background2MapLen/2);
   		unpauseSound();
	}
	if (BUTTON_PRESSED(BUTTON_SELECT) && prevGameState == GAME2SCREEN) {
		REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
		REG_BG1HOFS = hOff;
		REG_BG1VOFS = vOff;
		state = GAME2SCREEN;
   		REG_BG0CNT = CBB(0) | SBB(27) | BG_SIZE1 | COLOR256;
   		DMANow(3, level2BackgroundTiles, &CHARBLOCKBASE[0], background1TilesLen/2);
   		DMANow(3, level2BackgroundMap, &SCREENBLOCKBASE[27], background1MapLen/2);
		REG_BG1CNT = CBB(2) | SBB(29) | BG_SIZE1 | COLOR256;
   		DMANow(3, background2Tiles, &CHARBLOCKBASE[2], background2TilesLen/2);
   		DMANow(3, background2Map, &SCREENBLOCKBASE[29], background2MapLen/2);
   		unpauseSound();
	}
	if(BUTTON_PRESSED(BUTTON_START)) {
		state = MENUSCREEN;
		DMANow(3, menuTiles, &CHARBLOCKBASE[0], DMA_SOURCE_INCREMENT);
   		DMANow(3, menuMap, &SCREENBLOCKBASE[27], DMA_SOURCE_INCREMENT);
   		playSoundA(menuMusic, MENUMUSICLEN, MENUMUSICFREQ);
   		hOffSky = 0;
	}
}

/**
 * Win Screen
 */
void win() {
	if(BUTTON_PRESSED(BUTTON_START)) {
		state = MENUSCREEN;
		DMANow(3, menuTiles, &CHARBLOCKBASE[0], DMA_SOURCE_INCREMENT);
   		DMANow(3, menuMap, &SCREENBLOCKBASE[27], DMA_SOURCE_INCREMENT);
   		stopSound();
   		playSoundA(menuMusic, MENUMUSICLEN, MENUMUSICFREQ);
   		hOffSky = 0;
	}
}

/**
 * Lose Screen
 */
void lose() {
	if(BUTTON_PRESSED(BUTTON_START)) {
		state = MENUSCREEN;
		DMANow(3, menuTiles, &CHARBLOCKBASE[0], DMA_SOURCE_INCREMENT);
   		DMANow(3, menuMap, &SCREENBLOCKBASE[27], DMA_SOURCE_INCREMENT);
   		stopSound();
   		playSoundA(menuMusic, MENUMUSICLEN, MENUMUSICFREQ);
   		hOffSky = 0;
	}
}

/**
 * Hides sprites so they are not always visible
 */
void hideSprites() {
    int i;
    for (i = 0; i < 128; i++) {
    	shadowOAM[i].attr0 |= ATTR0_HIDE;
    }
}

/**
 * Initializes the game
 */
void initialize()
{
	cheat = FALSE;
	prevGameState = GAMESCREEN;

	//werewolf
    hOff = 0;
	vOff = 256 - 160;
	direction = right;
	wolf.width = 14;
	wolf.height = 16;
	wolf.row = 128;
	wolf.col = 0;
	wolf.aniCounter = 0;
	wolf.currFrame = 0;
	wolf.gravity = 0;
	wolf.aniState = WOLFIDLE;
	doubleJump = 0;
	damaged = FALSE;
	wolfPalette = 0;

	//knight
	int i;
	for (i = 0; i < knightArrayLength - 1; i++) {
		Knight[i].width = 16;
		Knight[i].height = 16;
		Knight[i].bigRow = 224;
		if (i <= 4) {
			Knight[i].bigCol = 200 + i * 60;
		}
		Knight[i].aniCounter = 0;
		Knight[i].currFrame = 0;
		Knight[i].aniState = KNIGHTATTACK;
		Knight[i].knightHealth = 2;
		Knight[i].knightDamaged = FALSE;
		Knight[i].knightDirection = knightLeft;
		Knight[i].slowKnight = 0;
		Knight[i].knightBounce = 5;
		Knight[i].deathWait = 0;
		Knight[i].knightAttacking = FALSE;
	}
	Knight[knightArrayLength - 1].width = 16;
	Knight[knightArrayLength - 1].height = 16;
	Knight[knightArrayLength - 1].bigRow = 192;
	Knight[knightArrayLength - 1].bigCol = 180;
	Knight[knightArrayLength - 1].aniCounter = 0;
	Knight[knightArrayLength - 1].currFrame = 0;
	Knight[knightArrayLength - 1].aniState = KNIGHTATTACK;
	Knight[knightArrayLength - 1].knightHealth = 2;
	Knight[knightArrayLength - 1].knightDamaged = FALSE;
	Knight[knightArrayLength - 1].knightDirection = knightLeft;
	Knight[knightArrayLength - 1].slowKnight = 0;
	Knight[knightArrayLength - 1].knightBounce = 5;
	Knight[knightArrayLength - 1].deathWait = 0;
	Knight[knightArrayLength - 1].knightAttacking = FALSE;

	//door
	door.width = 32;
	door.height = 32;
	door.bigRow = 208;
	door.bigCol = 460;
	door.currFrame = 0;

	//healthbar
	health.bigRow = 97;
	health.bigCol = 1;
	health.currFrame = FULL;

	//attack
	slashAttack.row = 0;
	slashAttack.col = 10;
	slashAttack.width = 16;
	slashAttack.height = 16;

	hideSprites();
}

void initialize2() {
	prevGameState = GAME2SCREEN;
	//werewolf
    hOff = 0;
	vOff = 256 - 160;
	direction = right;
	wolf.width = 14;
	wolf.height = 16;
	wolf.row = 128;
	wolf.col = 0;
	wolf.aniCounter = 0;
	wolf.currFrame = 0;
	wolf.gravity = 0;
	wolf.aniState = WOLFIDLE;
	doubleJump = 0;
	damaged = FALSE;

	//knights
	int i;
	for (i = 0; i < knightArrayLength - 2; i++) {
		Knight[i].width = 16;
		Knight[i].height = 16;
		Knight[i].bigRow = 224;
		if (i <= 4) {
			Knight[i].bigCol = 200 + i * 60;
		}
		Knight[i].aniCounter = 0;
		Knight[i].currFrame = 0;
		Knight[i].aniState = KNIGHTATTACK;
		Knight[i].knightHealth = 2;
		Knight[i].knightDamaged = FALSE;
		Knight[i].knightDirection = knightLeft;
		Knight[i].slowKnight = 0;
		Knight[i].knightBounce = 5;
		Knight[i].deathWait = 0;
		Knight[i].knightAttacking = FALSE;
	}
	Knight[knightArrayLength - 2].width = 16;
	Knight[knightArrayLength - 2].height = 16;
	Knight[knightArrayLength - 2].bigRow = 192;
	Knight[knightArrayLength - 2].bigCol = 380;
	Knight[knightArrayLength - 2].aniCounter = 0;
	Knight[knightArrayLength - 2].currFrame = 0;
	Knight[knightArrayLength - 2].aniState = KNIGHTATTACK;
	Knight[knightArrayLength - 2].knightHealth = 2;
	Knight[knightArrayLength - 2].knightDamaged = FALSE;
	Knight[knightArrayLength - 2].knightDirection = knightLeft;
	Knight[knightArrayLength - 2].slowKnight = 0;
	Knight[knightArrayLength - 2].knightBounce = 5;
	Knight[knightArrayLength - 2].deathWait = 0;
	Knight[knightArrayLength - 2].knightAttacking = FALSE;

	Knight[knightArrayLength - 1].width = 16;
	Knight[knightArrayLength - 1].height = 16;
	Knight[knightArrayLength - 1].bigRow = 168;
	Knight[knightArrayLength - 1].bigCol = 180;
	Knight[knightArrayLength - 1].aniCounter = 0;
	Knight[knightArrayLength - 1].currFrame = 0;
	Knight[knightArrayLength - 1].aniState = KNIGHTATTACK;
	Knight[knightArrayLength - 1].knightHealth = 2;
	Knight[knightArrayLength - 1].knightDamaged = FALSE;
	Knight[knightArrayLength - 1].knightDirection = knightLeft;
	Knight[knightArrayLength - 1].slowKnight = 0;
	Knight[knightArrayLength - 1].knightBounce = 5;
	Knight[knightArrayLength - 1].deathWait = 0;
	Knight[knightArrayLength - 1].knightAttacking = FALSE;

	//door
	door.width = 32;
	door.height = 32;
	door.bigRow = 208;
	door.bigCol = 460;
	door.currFrame = 0;

	//healthbar
	health.bigRow = 97;
	health.bigCol = 1;

	//attack
	slashAttack.row = 0;
	slashAttack.col = 10;
	slashAttack.width = 16;
	slashAttack.height = 16;}

/**
 * Updates the animations displayed on the screen
 */
void updateOAM()
{
	//werewolf
	//Jumping up
	if (wolf.aniState == WOLFJUMP && wolf.gravity > 0) {
		if (direction == right) {
			shadowOAM[0].attr0 = (ROWMASK & (int) wolf.row) | ATTR0_4BPP | ATTR0_TALL;
			shadowOAM[0].attr1 = (COLMASK & (int) wolf.col) | ATTR1_SIZE32;
			if (damaged == FALSE) {
				shadowOAM[0].attr2 = (ATTR2_PALBANK(wolfPalette)) | (SPRITEOFFSET16((0)*4, 2*(wolf.aniState)));
			} else {
				shadowOAM[0].attr2 = (ATTR2_PALBANK(2)) | (SPRITEOFFSET16((0)*4, 2*(wolf.aniState)));
			}
		} else {
			shadowOAM[0].attr0 = (ROWMASK & (int) wolf.row) | ATTR0_4BPP | ATTR0_TALL;
			shadowOAM[0].attr1 = (COLMASK & (int) wolf.col) | ATTR1_SIZE32 | ATTR1_HFLIP;
			if (damaged == FALSE) {
				shadowOAM[0].attr2 = (ATTR2_PALBANK(wolfPalette)) | (SPRITEOFFSET16((0)*4, 2*(wolf.aniState)));
			} else {
				shadowOAM[0].attr2 = (ATTR2_PALBANK(2)) | (SPRITEOFFSET16((0)*4, 2*(wolf.aniState)));
			}
		}
		if (duration > 0) {//show the attack animation while jumping
			shadowOAM[2].attr0 = (ROWMASK & (int) slashAttack.row) | ATTR0_4BPP | ATTR0_SQUARE;
			if (direction == left) {
				shadowOAM[2].attr1 = (COLMASK & (int) slashAttack.col) | ATTR1_SIZE16 | ATTR1_HFLIP;
			} else {
				shadowOAM[2].attr1 = (COLMASK & (int) slashAttack.col) | ATTR1_SIZE16;
			}
			shadowOAM[2].attr2 = (ATTR2_PALBANK(wolfPalette)) | (SPRITEOFFSET16(0, 8));
		} else {
			shadowOAM[2].attr0 = (ROWMASK & (int) slashAttack.row) | ATTR0_4BPP | ATTR0_SQUARE;
			if (direction == left) {
				shadowOAM[2].attr1 = (COLMASK & (int) slashAttack.col) | ATTR1_SIZE16 | ATTR1_HFLIP;
			} else {
				shadowOAM[2].attr1 = (COLMASK & (int) slashAttack.col) | ATTR1_SIZE16;
			}
			shadowOAM[2].attr2 = (ATTR2_PALBANK(wolfPalette)) | (SPRITEOFFSET16(0, 8)) | ATTR2_PRIO(5);
		}
	} else if (state == GAMESCREEN && ((wolf.aniState == WOLFJUMP && wolf.gravity < 0)
			|| ((collisionMap1Bitmap[OFFSET(wolf.bigRow + 1 + wolf.height, wolf.bigCol, collMapSize)] != 0)
			&& (collisionMap1Bitmap[OFFSET(wolf.bigRow + 1 + wolf.height, wolf.bigCol + wolf.width, collMapSize)] != 0)))) { //Falling down
		if (direction == right) {
			shadowOAM[0].attr0 = (ROWMASK & (int) wolf.row) | ATTR0_4BPP | ATTR0_TALL;
			shadowOAM[0].attr1 = (COLMASK & (int) wolf.col) | ATTR1_SIZE32;
			if (damaged == FALSE) {
				shadowOAM[0].attr2 = (ATTR2_PALBANK(wolfPalette)) | (SPRITEOFFSET16((4), 2*(wolf.aniState%3)));
			} else {
				shadowOAM[0].attr2 = (ATTR2_PALBANK(2)) | (SPRITEOFFSET16((4), 2*(wolf.aniState%3)));
			}
		} else {
			shadowOAM[0].attr0 = (ROWMASK & (int) wolf.row) | ATTR0_4BPP | ATTR0_TALL;
			shadowOAM[0].attr1 = (COLMASK & (int) wolf.col) | ATTR1_SIZE32 | ATTR1_HFLIP;
			if (damaged == FALSE) {
				shadowOAM[0].attr2 = (ATTR2_PALBANK(wolfPalette)) | (SPRITEOFFSET16((4), 2*(wolf.aniState%3)));
			} else {
				shadowOAM[0].attr2 = (ATTR2_PALBANK(2)) | (SPRITEOFFSET16((4), 2*(wolf.aniState%3)));
			}
		}
		if (duration > 0) { //show the attack animation while falling
			shadowOAM[2].attr0 = (ROWMASK & (int) slashAttack.row) | ATTR0_4BPP | ATTR0_SQUARE;
			if (direction == left) {
				shadowOAM[2].attr1 = (COLMASK & (int) slashAttack.col) | ATTR1_SIZE16 | ATTR1_HFLIP;
			} else {
				shadowOAM[2].attr1 = (COLMASK & (int) slashAttack.col) | ATTR1_SIZE16;
			}
			shadowOAM[2].attr2 = (ATTR2_PALBANK(wolfPalette)) | (SPRITEOFFSET16(0, 8));
		} else {
			shadowOAM[2].attr0 = (ROWMASK & (int) slashAttack.row) | ATTR0_4BPP | ATTR0_SQUARE;
			if (direction == left) {
				shadowOAM[2].attr1 = (COLMASK & (int) slashAttack.col) | ATTR1_SIZE16 | ATTR1_HFLIP;
			} else {
				shadowOAM[2].attr1 = (COLMASK & (int) slashAttack.col) | ATTR1_SIZE16;
			}
			shadowOAM[2].attr2 = (ATTR2_PALBANK(wolfPalette)) | (SPRITEOFFSET16(0, 8)) | ATTR2_PRIO(5);
		}
	} else if (wolf.aniState == WOLFATTACK) {//attacking
		if (direction == right) {
			shadowOAM[0].attr0 = (ROWMASK & (int) wolf.row) | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[0].attr1 = (COLMASK & (int) wolf.col) | ATTR1_SIZE16;
			if (damaged == FALSE) {
				shadowOAM[0].attr2 = (ATTR2_PALBANK(wolfPalette)) | (SPRITEOFFSET16((0), 6));
			} else {
				shadowOAM[0].attr2 = (ATTR2_PALBANK(2)) | (SPRITEOFFSET16((0), 6));
			}
			if (duration > 0) {
				shadowOAM[2].attr0 = (ROWMASK & (int) slashAttack.row) | ATTR0_4BPP | ATTR0_SQUARE;
				shadowOAM[2].attr1 = (COLMASK & (int) slashAttack.col) | ATTR1_SIZE16;
				shadowOAM[2].attr2 = (ATTR2_PALBANK(wolfPalette)) | (SPRITEOFFSET16(0, 8));
			} else {
				shadowOAM[2].attr0 = (ROWMASK & (int) slashAttack.row) | ATTR0_4BPP | ATTR0_SQUARE;
				shadowOAM[2].attr1 = (COLMASK & (int) slashAttack.col) | ATTR1_SIZE16;
				shadowOAM[2].attr2 = (ATTR2_PALBANK(wolfPalette)) | (SPRITEOFFSET16(0, 8)) | ATTR2_PRIO(5);
			}
		} else {
			shadowOAM[0].attr0 = (ROWMASK & (int) wolf.row) | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[0].attr1 = (COLMASK & (int) wolf.col) | ATTR1_SIZE16 | ATTR1_HFLIP;
			if (damaged == FALSE) {
				shadowOAM[0].attr2 = (ATTR2_PALBANK(wolfPalette)) | (SPRITEOFFSET16((0), 6));
			} else {
				shadowOAM[0].attr2 = (ATTR2_PALBANK(2)) | (SPRITEOFFSET16((0), 6));
			}
			if (duration > 0) {
				shadowOAM[2].attr0 = (ROWMASK & (int) slashAttack.row) | ATTR0_4BPP | ATTR0_SQUARE;
				shadowOAM[2].attr1 = (COLMASK & (int) slashAttack.col) | ATTR1_SIZE16 | ATTR1_HFLIP;
				shadowOAM[2].attr2 = (ATTR2_PALBANK(wolfPalette)) | (SPRITEOFFSET16(0, 8));
			} else {
				shadowOAM[2].attr0 = (ROWMASK & (int) slashAttack.row) | ATTR0_4BPP | ATTR0_SQUARE;
				shadowOAM[2].attr1 = (COLMASK & (int) slashAttack.col) | ATTR1_SIZE16 | ATTR1_HFLIP;
				shadowOAM[2].attr2 = (ATTR2_PALBANK(wolfPalette)) | (SPRITEOFFSET16(0, 8)) | ATTR2_PRIO(5);
			}
		}
	} else {
		if (wolf.aniState == WOLFJUMP) {
			wolf.aniState = WOLFIDLE;
			wolf.prevAniState = wolf.aniState;
		}
		shadowOAM[0].attr0 = (ROWMASK & (int) wolf.row) | ATTR0_4BPP | ATTR0_SQUARE;
		if (direction == left) {
			shadowOAM[0].attr1 = (COLMASK & (int) wolf.col) | ATTR1_SIZE16 | ATTR1_HFLIP;
		} else {
			shadowOAM[0].attr1 = (COLMASK & (int) wolf.col) | ATTR1_SIZE16;
		}
		if (damaged == FALSE) {
			shadowOAM[0].attr2 = (ATTR2_PALBANK(wolfPalette)) | (SPRITEOFFSET16(2*wolf.currFrame,2*wolf.prevAniState));
		} else {
			shadowOAM[0].attr2 = (ATTR2_PALBANK(2)) | (SPRITEOFFSET16(2*wolf.currFrame,2*wolf.prevAniState));
		}
	}
	if (duration == 0) {
		shadowOAM[2].attr2 = (ATTR2_PALBANK(wolfPalette)) | (SPRITEOFFSET16(0, 8)) | ATTR2_PRIO(5);
	}

	//knight
	int i;
	for (i = 0; i < knightArrayLength; i++) {
		shadowOAM[4 + i].attr0 = (ROWMASK & (int) Knight[i].row) | ATTR0_4BPP | ATTR0_SQUARE;
		if (Knight[i].knightDamaged == FALSE) {
			if (Knight[i].knightAttacking == TRUE) {
				shadowOAM[4 + i].attr2 = (ATTR2_PALBANK(1)) | (SPRITEOFFSET16(2*(Knight[i].currFrame%2), 10));
			} else {
				shadowOAM[4 + i].attr2 = (ATTR2_PALBANK(1)) | (SPRITEOFFSET16(2*(Knight[i].currFrame%2) + 4, 10));
			}
		} else {
			shadowOAM[4 + i].attr2 = (ATTR2_PALBANK(2)) | (SPRITEOFFSET16(2*(Knight[i].currFrame%2), 10));
		}
		if (Knight[i].knightDirection == knightLeft) {
			shadowOAM[4 + i].attr1 = (COLMASK & (int) Knight[i].col) | ATTR1_SIZE16 | ATTR1_HFLIP;
		} else {
			shadowOAM[4 + i].attr1 = (COLMASK & (int) Knight[i].col) | ATTR1_SIZE16;
		}
		if (Knight[i].knightHealth < 1) {
			if (Knight[i].deathWait < 5) {
				Knight[i].deathWait++;
			}
			if (Knight[i].deathWait >= 5) {
				shadowOAM[4 + i].attr2 = (ATTR2_PALBANK(0)) | (SPRITEOFFSET16(0, 8)) | ATTR2_PRIO(5);
			}
		}
	}
	
	//door
	shadowOAM[3].attr0 = (ROWMASK & (int) door.row) | ATTR0_4BPP | ATTR0_SQUARE;
	if (state == GAMESCREEN) {
		shadowOAM[3].attr2 = (ATTR2_PALBANK(4)) | (SPRITEOFFSET16(20 + 4*(door.currFrame%3), 0));
	} else {
		shadowOAM[3].attr2 = (ATTR2_PALBANK(6)) | (SPRITEOFFSET16(20 + 4*(door.currFrame%3), 0));
	}
	shadowOAM[3].attr1 = (COLMASK & (int) door.col) | ATTR1_SIZE32;
	//healthbar
	shadowOAM[1].attr0 = (ROWMASK & (int) health.row) | ATTR0_4BPP | ATTR0_WIDE;
	shadowOAM[1].attr2 = (ATTR2_PALBANK(3)) | (SPRITEOFFSET16(24 + 2*(health.currFrame), 4));
	shadowOAM[1].attr1 = (COLMASK & (int) health.col) | ATTR1_SIZE32;
}

void setupSounds() {
        REG_SOUNDCNT_X = SND_ENABLED;

    REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 | 
                        DSA_OUTPUT_RATIO_100 | 
                        DSA_OUTPUT_TO_BOTH | 
                        DSA_TIMER0 | 
                        DSA_FIFO_RESET |
                        DSB_OUTPUT_RATIO_100 | 
                        DSB_OUTPUT_TO_BOTH | 
                        DSB_TIMER1 | 
                        DSB_FIFO_RESET;

    REG_SOUNDCNT_L = 0;
}

void playSoundA(const unsigned char* sound, int length, int frequency) {
        dma[1].cnt = 0;
        vbCountA = 0;
    
        int interval = 16777216/frequency;
    
        DMANow(1, sound, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);
    
        REG_TM0CNT = 0;
    
        REG_TM0D = -interval;
        REG_TM0CNT = TIMER_ON;

        soundA.data = sound;
        soundA.length = length;
        soundA.frequency = frequency;
        soundA.isPlaying = 1;
        soundA.loops = 1;
        soundA.duration = ((60*length)/frequency)-((length/frequency)*3)-1;
        soundA.priority = 0;
}


void playSoundB(const unsigned char* sound, int length, int frequency) {
        dma[2].cnt = 0;
        vbCountB = 0;

        int interval = 16777216/frequency;

        DMANow(2, sound, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

        REG_TM1CNT = 0;
    
        REG_TM1D = -interval;
        REG_TM1CNT = TIMER_ON;

        soundB.data = sound;
        soundB.length = length;
        soundB.frequency = frequency;
        soundB.isPlaying = 1;
        soundB.loops = 0;
        soundB.duration = ((60*length)/frequency)-((length/frequency)*3)-1;
        soundB.priority = 0;
}

void muteSound() {
    REG_SOUNDCNT_X = 0;
}

void unmuteSound() {
    REG_SOUNDCNT_X = SND_ENABLED;
}

void pauseSound() {
    REG_TM0CNT = REG_TM0CNT & ~TIMER_ON;
    REG_TM1CNT = REG_TM1CNT & ~TIMER_ON;
}

void unpauseSound() {
    REG_TM0CNT = REG_TM0CNT | TIMER_ON;
    REG_TM1CNT = REG_TM1CNT | TIMER_ON;
}

void stopSound() {
    dma[1].cnt = 0;
    dma[2].cnt = 0;
    soundA.isPlaying = 0;
    soundB.isPlaying = 0;
}

void setupInterrupts() {
    REG_IME = 0;
    REG_INTERRUPT = (unsigned int)interruptHandler;
    REG_IE |= INT_VBLANK;
    REG_DISPSTAT |= INT_VBLANK_ENABLE;
    REG_IME = 1;
}

void interruptHandler() {
    REG_IME = 0;
    if(REG_IF & INT_VBLANK) {
        if (soundA.isPlaying) {
            vbCountA++;
        }
        if (soundB.isPlaying) {
            vbCountB++;
        }
        if (soundA.isPlaying && (vbCountA > soundA.duration)) {
            if (soundA.loops) {
                playSoundA(soundA.data, soundA.length, soundA.frequency);
            } else {
                REG_TM0CNT = 0;
                dma[1].cnt = 0;
                soundA.isPlaying = 0;
            }
        }
        if (soundB.isPlaying && (vbCountB > soundB.duration)) {
            REG_TM1CNT = 0;
            dma[2].cnt = 0;
            soundB.isPlaying = 0;
        }
        REG_IF = INT_VBLANK;
    }
    REG_IME = 1;
}