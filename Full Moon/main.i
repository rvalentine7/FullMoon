# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 14 "main.c"
# 1 "myLib.h" 1



typedef unsigned short u16;
# 50 "myLib.h"
extern unsigned short *videoBuffer;

extern unsigned short *frontBuffer;
extern unsigned short *backBuffer;




void setPixel3(int row, int col, unsigned short color);
void drawRect3(int row, int col, int height, int width, unsigned short color);
void fillScreen3(unsigned short color);
void drawImage3(const unsigned short* image, int row, int col, int height, int width);


void setPixel4(int row, int col, unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, unsigned char colorIndex);
void fillScreen4(unsigned char color);

void drawBackgroundImage4(const unsigned short* image);
void drawImage4(const unsigned short* image, int row, int col, int height, int width);
void drawSubImage4(const unsigned short* sourceImage, int sourceRow, int sourceCol,
       int row, int col, int height, int width);

void loadPalette(const unsigned short* palette);
void initialize();

void waitForVblank();
void flipPage();


void menu();
void instructions();
void game();
void pause();
void win();
void lose();
void werewolf();
void updateOAM();
void animateWolf();
void gravity();
void knight(int k);
void animateKnight(int i);
void hideSprites();
void setupSounds();
void playSoundA(const unsigned char* sound, int length, int frequency);
void playSoundB(const unsigned char* sound, int length, int frequency);
void muteSound();
void unmuteSound();
void pauseSound();
void unpauseSound();
void stopSound();
void setupInterrupts();
void interruptHandler();
int abs();
void doorPlacement();
void healthbar();
void werewolfAttack();
void werewolfDeath();
void initialize2();
void game2();
# 130 "myLib.h"
extern unsigned int oldButtons;
extern unsigned int buttons;
# 140 "myLib.h"
void DMANow(int channel, volatile const void* source, volatile void* destination, unsigned int control);






typedef volatile struct
{
        volatile const void *src;
        volatile void *dst;
        volatile unsigned int cnt;
} DMA;

extern DMA *dma;
# 179 "myLib.h"
enum {IDLE, CHASE, FLEE};
# 273 "myLib.h"
typedef struct { u16 tileimg[8192]; } charblock;
typedef struct { u16 tilemap[1024]; } screenblock;
# 333 "myLib.h"
typedef struct{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
}OBJ_ATTR;

typedef struct {
    int row;
    int col;
} Sprite;
# 15 "main.c" 2
# 1 "menu.h" 1
# 22 "menu.h"
extern const unsigned short menuTiles[6560];


extern const unsigned short menuMap[1024];


extern const unsigned short menuPal[256];
# 16 "main.c" 2
# 1 "instructions.h" 1
# 22 "instructions.h"
extern const unsigned short instructionsTiles[7744];


extern const unsigned short instructionsMap[1024];


extern const unsigned short instructionsPal[256];
# 17 "main.c" 2
# 1 "game.h" 1
# 22 "game.h"
extern const unsigned short gameTiles[3424];


extern const unsigned short gameMap[1024];


extern const unsigned short gamePal[256];
# 18 "main.c" 2
# 1 "background1.h" 1
# 22 "background1.h"
extern const unsigned short background1Tiles[11168];


extern const unsigned short background1Map[2048];


extern const unsigned short background1Pal[256];
# 19 "main.c" 2
# 1 "pause.h" 1
# 22 "pause.h"
extern const unsigned short pauseTiles[4128];


extern const unsigned short pauseMap[1024];


extern const unsigned short pausePal[256];
# 20 "main.c" 2
# 1 "win.h" 1
# 22 "win.h"
extern const unsigned short winTiles[5856];


extern const unsigned short winMap[1024];


extern const unsigned short winPal[256];
# 21 "main.c" 2
# 1 "lose.h" 1
# 22 "lose.h"
extern const unsigned short loseTiles[3680];


extern const unsigned short loseMap[1024];


extern const unsigned short losePal[256];
# 22 "main.c" 2
# 1 "spriteSheet.h" 1
# 21 "spriteSheet.h"
extern const unsigned short spriteSheetTiles[16384];


extern const unsigned short spriteSheetPal[256];
# 23 "main.c" 2
# 1 "collisionMap1.h" 1
# 20 "collisionMap1.h"
extern const unsigned short collisionMap1Bitmap[131072];
# 24 "main.c" 2
# 1 "menuMusic.h" 1
# 20 "menuMusic.h"
extern const unsigned char menuMusic[907337];
# 25 "main.c" 2
# 1 "backgroundMusic.h" 1
# 20 "backgroundMusic.h"
extern const unsigned char backgroundMusic[369216];
# 26 "main.c" 2
# 1 "loseMusic.h" 1
# 20 "loseMusic.h"
extern const unsigned char loseMusic[423648];
# 27 "main.c" 2
# 1 "winMusic.h" 1
# 20 "winMusic.h"
extern const unsigned char winMusic[75168];
# 28 "main.c" 2
# 1 "slash.h" 1
# 20 "slash.h"
extern const unsigned char slash[2888];
# 29 "main.c" 2
# 1 "background2.h" 1
# 22 "background2.h"
extern const unsigned short background2Tiles[1152];


extern const unsigned short background2Map[2048];


extern const unsigned short background2Pal[256];
# 30 "main.c" 2
# 1 "injuredGrunt.h" 1
# 20 "injuredGrunt.h"
extern const unsigned char injuredGrunt[2277];
# 31 "main.c" 2
# 1 "level2Background.h" 1
# 22 "level2Background.h"
extern const unsigned short level2BackgroundTiles[10976];


extern const unsigned short level2BackgroundMap[2048];


extern const unsigned short level2BackgroundPal[256];
# 32 "main.c" 2
# 1 "collisionMap2.h" 1
# 20 "collisionMap2.h"
extern const unsigned short collisionMap2Bitmap[131072];
# 33 "main.c" 2

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
ENEMY Knight[5];

enum {WOLFWALK, WOLFIDLE, WOLFJUMP, WOLFATTACK};
enum {KNIGHTIDLE, KNIGHTATTACK, KNIGHTMOVE};
enum {FULL, THREEFOURTHS, HALF, ONEFOURTH};
int direction;

int doubleJump = 0;

int slowerFlames = 0;

int wolfDWait = 0;

int damaged = 0;

int moveAway = 0;
int bounceLeft = 1;
int bounceRight = 2;
int bounceUp = 3;
int damageReaction = 0;

int duration = 0;

int cheat;
int wolfPalette = 0;
int prevGameState;

int state;
enum {MENUSCREEN, INSTRUCTIONSCREEN, GAMESCREEN, GAME2SCREEN, PAUSESCREEN, WINSCREEN, LOSESCREEN};


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




int main() {
 *(unsigned short *)0x4000000 = 0 | (1<<8) | (1 << 12);
 *(volatile unsigned short*)0x4000008 = 0 << 2 | 27 << 8 | 1<<14 | 1 << 7;

 state = MENUSCREEN;
 loadPalette(background1Pal);
 DMANow(3, menuTiles, &((charblock *)0x6000000)[0], (0 << 23));
    DMANow(3, menuMap, &((screenblock *)0x6000000)[27], (0 << 23));

    setupInterrupts();
    setupSounds();
    playSoundA(menuMusic, 907337, 44100);

 while(1) {
  oldButtons = buttons;
  buttons = *(volatile unsigned int *)0x04000130;
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




void menu() {
 if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  *(unsigned short *)0x4000000 = 0 | (1<<8) | (1<<9) | (1 << 12);
  state = GAMESCREEN;
     *(volatile unsigned short*)0x4000008 = 0 << 2 | 27 << 8 | 1<<14 | 1 << 7;
     DMANow(3, background1Tiles, &((charblock *)0x6000000)[0], 22336/2);
     DMANow(3, background1Map, &((screenblock *)0x6000000)[27], 4096/2);
  *(volatile unsigned short*)0x400000A = 2 << 2 | 29 << 8 | 1<<14 | 1 << 7;
     DMANow(3, background2Tiles, &((charblock *)0x6000000)[2], 2304/2);
     DMANow(3, background2Map, &((screenblock *)0x6000000)[29], 4096/2);
     playSoundA(backgroundMusic, 369216, 11025);
    }
 if((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
  state = INSTRUCTIONSCREEN;
  DMANow(3, instructionsTiles, &((charblock *)0x6000000)[0], (0 << 23));
     DMANow(3, instructionsMap, &((screenblock *)0x6000000)[27], (0 << 23));
 }
}




void instructions() {
 if((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
  state = MENUSCREEN;
  DMANow(3, menuTiles, &((charblock *)0x6000000)[0], (0 << 23));
     DMANow(3, menuMap, &((screenblock *)0x6000000)[27], (0 << 23));
 }
}




void game() {
 *(volatile unsigned short *)0x04000010 = hOff;
 *(volatile unsigned short *)0x04000012 = vOff;
 *(volatile unsigned short *)0x04000014 = hOffSky;
 *(volatile unsigned short *)0x04000016 = vOffSky;
 DMANow(3, spriteSheetTiles, &((charblock *)0x6000000)[4], 32768/2);
 DMANow(3, spriteSheetPal, ((unsigned short*)(0x5000200)), 256);
 werewolf();
 int i;
 for (i = 0; i < 5; i++) {
  knight(i);
 }
 doorPlacement();
 if (cheat == 0) {
  healthbar();
 }
 updateOAM();
 DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
 if ((!(~(oldButtons)&((1<<9))) && (~buttons & ((1<<9))))) {
  if (cheat == 0) {
   cheat = 1;
   wolfPalette = 5;
  } else {
   cheat = 0;
   wolfPalette = 0;
  }
 }

 if((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
  *(unsigned short *)0x4000000 = 0 | (1<<8);
  hideSprites();
  *(volatile unsigned short *)0x04000010 = 0;
  *(volatile unsigned short *)0x04000012 = 0;
  state = PAUSESCREEN;
  *(volatile unsigned short*)0x4000008 = 0 << 2 | 27 << 8 | 1<<14 | 1 << 7;
  DMANow(3, pauseTiles, &((charblock *)0x6000000)[0], (0 << 23));
     DMANow(3, pauseMap, &((screenblock *)0x6000000)[27], (0 << 23));
     pauseSound();
 }
 int j;
 for (j = 0; j < 5; j++) {
  if (Knight[j].knightHealth == 0) {
   Knight[j].bigRow = 0;
   Knight[j].bigCol = 0;
  }
 }
 if(wolf.bigCol > door.bigCol && wolf.bigCol + wolf.width < door.bigCol + door.width
  && wolf.bigRow > door.bigRow && (!(~(oldButtons)&((1<<6))) && (~buttons & ((1<<6))))) {
  initialize2();
  *(unsigned short *)0x4000000 = 0 | (1<<8) | (1<<9) | (1 << 12);
  state = GAME2SCREEN;
  *(volatile unsigned short*)0x4000008 = 0 << 2 | 27 << 8 | 1<<14 | 1 << 7;
     DMANow(3, level2BackgroundTiles, &((charblock *)0x6000000)[0], 22336/2);
     DMANow(3, level2BackgroundMap, &((screenblock *)0x6000000)[27], 4096/2);
  *(volatile unsigned short*)0x400000A = 3 << 2 | 30 << 8 | 1<<14 | 1 << 7;
     DMANow(3, background2Tiles, &((charblock *)0x6000000)[3], 2304/2);
     DMANow(3, background2Map, &((screenblock *)0x6000000)[30], 4096/2);
 }
}

void game2() {
 *(volatile unsigned short *)0x04000010 = hOff;
 *(volatile unsigned short *)0x04000012 = vOff;
 *(volatile unsigned short *)0x04000014 = hOffSky;
 *(volatile unsigned short *)0x04000016 = vOffSky;
 DMANow(3, spriteSheetTiles, &((charblock *)0x6000000)[4], 32768/2);
 DMANow(3, spriteSheetPal, ((unsigned short*)(0x5000200)), 256);
 werewolf();
 int i;
 for (i = 0; i < 5; i++) {
  knight(i);
 }
 doorPlacement();
 if (cheat == 0) {
  healthbar();
 }
 updateOAM();
 DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
 if ((!(~(oldButtons)&((1<<9))) && (~buttons & ((1<<9))))) {
  if (cheat == 0) {
   cheat = 1;
   wolfPalette = 5;
  } else {
   cheat = 0;
   wolfPalette = 0;
  }
 }

 if((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
  *(unsigned short *)0x4000000 = 0 | (1<<8);
  hideSprites();
  *(volatile unsigned short *)0x04000010 = 0;
  *(volatile unsigned short *)0x04000012 = 0;
  state = PAUSESCREEN;
  *(volatile unsigned short*)0x4000008 = 0 << 2 | 27 << 8 | 1<<14 | 1 << 7;
  DMANow(3, pauseTiles, &((charblock *)0x6000000)[0], (0 << 23));
     DMANow(3, pauseMap, &((screenblock *)0x6000000)[27], (0 << 23));
     pauseSound();
 }
 int j;
 for (j = 0; j < 5; j++) {
  if (Knight[j].knightHealth == 0) {
   Knight[j].bigRow = 0;
   Knight[j].bigCol = 0;
  }
 }
 if(wolf.bigCol > door.bigCol && wolf.bigCol + wolf.width < door.bigCol + door.width
  && wolf.bigRow > door.bigRow && (!(~(oldButtons)&((1<<6))) && (~buttons & ((1<<6))))) {
  *(unsigned short *)0x4000000 = 0 | (1<<8);
  hideSprites();
  *(volatile unsigned short *)0x04000010 = 0;
  *(volatile unsigned short *)0x04000012 = 0;
  state = WINSCREEN;
  *(volatile unsigned short*)0x4000008 = 0 << 2 | 27 << 8 | 1<<14 | 1 << 7;
  DMANow(3, winTiles, &((charblock *)0x6000000)[0], (0 << 23));
     DMANow(3, winMap, &((screenblock *)0x6000000)[27], (0 << 23));
     stopSound();
     playSoundB(winMusic, 75168, 11025);
 }
}




void werewolf() {
 wolf.bigRow = wolf.row + vOff;
 wolf.bigCol = wolf.col + hOff;
 if (state == GAMESCREEN) {
  if((~(*(volatile unsigned int *)0x04000130) & ((1<<5))) && damaged == 0 && doubleJump == 0) {
   if (collisionMap1Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol - 1))] != 0
    && collisionMap1Bitmap[((wolf.bigRow - 1 + wolf.height)*(collMapSize)+(wolf.bigCol - 1))] != 0
    && collisionMap1Bitmap[((wolf.bigRow + wolf.height / 2)*(collMapSize)+(wolf.bigCol - 1))] != 0
    && collisionMap1Bitmap[((wolf.bigRow + 4)*(collMapSize)+(wolf.bigCol - 1))] != 0
    && collisionMap1Bitmap[((wolf.bigRow + wolf.height - 4)*(collMapSize)+(wolf.bigCol - 1))] != 0) {
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
    if (collisionMap1Bitmap[((wolf.bigRow + i)*(collMapSize)+(wolf.bigCol))] == 0) {
     wolf.bigRow++;
    }
   }
   direction = 0;
  } else if ((~(*(volatile unsigned int *)0x04000130) & ((1<<5))) && damaged == 0 && doubleJump != 0) {
   if (collisionMap1Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol - 1))] != 0
    && collisionMap1Bitmap[((wolf.bigRow + wolf.height + 1)*(collMapSize)+(wolf.bigCol - 1))] != 0
    && collisionMap1Bitmap[((wolf.bigRow + wolf.height / 2)*(collMapSize)+(wolf.bigCol - 1))] != 0
    && collisionMap1Bitmap[((wolf.bigRow + 4)*(collMapSize)+(wolf.bigCol - 1))] != 0
    && collisionMap1Bitmap[((wolf.bigRow + wolf.height - 4)*(collMapSize)+(wolf.bigCol - 1))] != 0) {
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
    if (collisionMap1Bitmap[((wolf.bigRow + i)*(collMapSize)+(wolf.bigCol))] == 0) {
     wolf.bigRow++;
    }
   }
   direction = 0;
  }
  if (collisionMap1Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol))] == 0
   || collisionMap1Bitmap[((wolf.bigRow + wolf.height)*(collMapSize)+(wolf.bigCol))] == 0) {
   wolf.bigCol++;
  }
  if((~(*(volatile unsigned int *)0x04000130) & ((1<<4))) && damaged == 0 && doubleJump == 0) {
   if (collisionMap1Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol + wolf.width + 1))] != 0
    && collisionMap1Bitmap[((wolf.bigRow - 1 + wolf.height)*(collMapSize)+(wolf.bigCol + wolf.width + 1))] != 0
    && collisionMap1Bitmap[((wolf.bigRow + wolf.height / 2)*(collMapSize)+(wolf.bigCol + wolf.width + 1))] != 0
    && collisionMap1Bitmap[((wolf.bigRow + 4)*(collMapSize)+(wolf.bigCol + wolf.width + 1))] != 0
    && collisionMap1Bitmap[((wolf.bigRow + wolf.height - 4)*(collMapSize)+(wolf.bigCol + wolf.width + 1))] != 0) {
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
   direction = 1;
  } else if ((~(*(volatile unsigned int *)0x04000130) & ((1<<4))) && damaged == 0 && doubleJump != 0) {
   if (collisionMap1Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol + wolf.width + 1))] != 0
    && collisionMap1Bitmap[((wolf.bigRow + wolf.height + 1)*(collMapSize)+(wolf.bigCol + wolf.width + 1))] != 0
    && collisionMap1Bitmap[((wolf.bigRow + wolf.height / 2)*(collMapSize)+(wolf.bigCol + wolf.width + 1))] != 0
    && collisionMap1Bitmap[((wolf.bigRow + 4)*(collMapSize)+(wolf.bigCol + wolf.width + 1))] != 0
    && collisionMap1Bitmap[((wolf.bigRow + wolf.height - 4)*(collMapSize)+(wolf.bigCol + wolf.width + 1))] != 0) {
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
   direction = 1;
  }
  if (collisionMap1Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol + wolf.width))] == 0
   || collisionMap1Bitmap[((wolf.bigRow + wolf.height)*(collMapSize)+(wolf.bigCol + wolf.width))] == 0) {
   wolf.bigCol--;
  }
  if((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0)))) && doubleJump != 2) {
   wolf.gravity = 1.5;
   wolf.row -= wolf.gravity;
   doubleJump++;
  }

  if (collisionMap1Bitmap[((wolf.bigRow + 1 + wolf.height)*(collMapSize)+(wolf.bigCol))] != 0
    && collisionMap1Bitmap[((wolf.bigRow + 1 + wolf.height)*(collMapSize)+(wolf.bigCol + wolf.width))] != 0) {
   wolf.gravity = wolf.gravity - 0.025;
   wolf.row -= wolf.gravity;
  }

  if ((collisionMap1Bitmap[((wolf.bigRow + 1 + wolf.height)*(collMapSize)+(wolf.bigCol))] == 0
    || collisionMap1Bitmap[((wolf.bigRow + 1 + wolf.height)*(collMapSize)+(wolf.bigCol + wolf.width))] == 0
    || collisionMap1Bitmap[((wolf.bigRow + 1 + wolf.height)*(collMapSize)+(wolf.bigCol + wolf.width / 2))] == 0
    || collisionMap1Bitmap[((wolf.bigRow + 1 + wolf.height)*(collMapSize)+(wolf.bigCol + 4))] == 0
    || collisionMap1Bitmap[((wolf.bigRow + 1 + wolf.height)*(collMapSize)+(wolf.bigCol + wolf.width - 4))] == 0)
    && wolf.gravity < 0) {
   wolf.gravity = 0;
   doubleJump = 0;
   if (collisionMap1Bitmap[((wolf.bigRow + wolf.height)*(collMapSize)+(wolf.bigCol))] != 0) {
    int wolfRow = wolf.row;
    wolf.row = wolfRow;
    wolf.row = wolf.row + 1;
   }
   if (collisionMap1Bitmap[((wolf.bigRow + wolf.height)*(collMapSize)+(wolf.bigCol))] == 0) {
    wolf.row = wolf.row - 1;
   }
   if (collisionMap1Bitmap[((wolf.bigRow + wolf.height)*(collMapSize)+(wolf.bigCol))] == 0) {
    wolf.row = wolf.row - 1;
   }
  }

  if ((collisionMap1Bitmap[((wolf.bigRow - 1)*(collMapSize)+(wolf.bigCol))] == 0
    || collisionMap1Bitmap[((wolf.bigRow - 1)*(collMapSize)+(wolf.bigCol + wolf.width))] == 0
    || collisionMap1Bitmap[((wolf.bigRow - 1)*(collMapSize)+(wolf.bigCol + wolf.width / 2))] == 0
    || collisionMap1Bitmap[((wolf.bigRow - 1)*(collMapSize)+(wolf.bigCol + 4))] == 0
    || collisionMap1Bitmap[((wolf.bigRow - 1)*(collMapSize)+(wolf.bigCol + wolf.width - 4))] == 0)
    && wolf.gravity > 0) {
   wolf.gravity -= wolf.gravity;
  }
  if (collisionMap1Bitmap[((wolf.bigRow - 1)*(collMapSize)+(wolf.bigCol + wolf.width))] == 0) {
   wolf.col--;
  }
  if (collisionMap1Bitmap[((wolf.bigRow - 1)*(collMapSize)+(wolf.bigCol))] == 0) {
   wolf.col++;
  }
  werewolfAttack();
  if (damaged == 1 && moveAway == bounceLeft) {
   playSoundB(injuredGrunt, 2277, 11025);
   if (collisionMap1Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol - 1))] == 0
    && collisionMap1Bitmap[((wolf.bigRow - 1 + wolf.height)*(collMapSize)+(wolf.bigCol - 1))] == 0
    && collisionMap1Bitmap[((wolf.bigRow + wolf.height / 2)*(collMapSize)+(wolf.bigCol - 1))] == 0) {
    wolf.gravity = 1.5;
   } else if (collisionMap1Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol - 4))] != 0
    && collisionMap1Bitmap[((wolf.bigRow - 1 + wolf.height)*(collMapSize)+(wolf.bigCol - 4))] != 0
    && collisionMap1Bitmap[((wolf.bigRow + wolf.height / 2)*(collMapSize)+(wolf.bigCol - 4))] != 0) {
    wolf.col -= 4;
    if (collisionMap1Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol))] == 0
     || collisionMap1Bitmap[((wolf.bigRow - 1 + wolf.height)*(collMapSize)+(wolf.bigCol))] == 0
     || collisionMap1Bitmap[((wolf.bigRow + wolf.height / 2)*(collMapSize)+(wolf.bigCol))] == 0) {
     wolf.bigCol += 20;
    }
    wolf.gravity = 0.3;
   } else if (collisionMap1Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol - 3))] != 0
    && collisionMap1Bitmap[((wolf.bigRow - 1 + wolf.height)*(collMapSize)+(wolf.bigCol - 3))] != 0
    && collisionMap1Bitmap[((wolf.bigRow + wolf.height / 2)*(collMapSize)+(wolf.bigCol - 3))] != 0) {
    wolf.col -= 3;
    if (collisionMap1Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol))] == 0
     || collisionMap1Bitmap[((wolf.bigRow - 1 + wolf.height)*(collMapSize)+(wolf.bigCol))] == 0
     || collisionMap1Bitmap[((wolf.bigRow + wolf.height / 2)*(collMapSize)+(wolf.bigCol))] == 0) {
     wolf.bigCol += 20;
    }
    wolf.gravity = 0.3;
   } else if (collisionMap1Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol - 2))] != 0
    && collisionMap1Bitmap[((wolf.bigRow - 1 + wolf.height)*(collMapSize)+(wolf.bigCol - 2))] != 0
    && collisionMap1Bitmap[((wolf.bigRow + wolf.height / 2)*(collMapSize)+(wolf.bigCol - 2))] != 0) {
    wolf.col -= 2;
    if (collisionMap1Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol))] == 0
     || collisionMap1Bitmap[((wolf.bigRow - 1 + wolf.height)*(collMapSize)+(wolf.bigCol))] == 0
     || collisionMap1Bitmap[((wolf.bigRow + wolf.height / 2)*(collMapSize)+(wolf.bigCol))] == 0) {
     wolf.bigCol += 20;
    }
    wolf.gravity = 0.3;
   }
   wolf.row -= wolf.gravity;
   damageReaction++;
   if (damageReaction == 5) {
    damaged = 0;
    moveAway = 0;
    damageReaction = 0;
   }
  } else if (damaged == 1 && moveAway == bounceUp) {
   playSoundB(injuredGrunt, 2277, 11025);
   wolf.gravity = 1.5;
   damageReaction++;
   if (damageReaction == 5) {
    damaged = 0;
    moveAway = 0;
    damageReaction = 0;
   }
  } else if (damaged == 1) {
   playSoundB(injuredGrunt, 2277, 11025);
   if (collisionMap1Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol + wolf.width + 4))] != 0
    && collisionMap1Bitmap[((wolf.bigRow - 1 + wolf.height)*(collMapSize)+(wolf.bigCol + wolf.width + 4))] != 0
    && collisionMap1Bitmap[((wolf.bigRow + wolf.height / 2)*(collMapSize)+(wolf.bigCol + wolf.width + 4))] != 0) {
    wolf.col += 4;
   } else if (collisionMap1Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol + wolf.width + 3))] != 0
    && collisionMap1Bitmap[((wolf.bigRow - 1 + wolf.height)*(collMapSize)+(wolf.bigCol + wolf.width + 3))] != 0
    && collisionMap1Bitmap[((wolf.bigRow + wolf.height / 2)*(collMapSize)+(wolf.bigCol + wolf.width + 3))] != 0) {
    wolf.col += 3;
   } else if (collisionMap1Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol + wolf.width + 2))] != 0
    && collisionMap1Bitmap[((wolf.bigRow - 1 + wolf.height)*(collMapSize)+(wolf.bigCol + wolf.width + 2))] != 0
    && collisionMap1Bitmap[((wolf.bigRow + wolf.height / 2)*(collMapSize)+(wolf.bigCol + wolf.width + 2))] != 0) {
    wolf.col += 2;
   }
   if (collisionMap1Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol + wolf.width))] == 0
    || collisionMap1Bitmap[((wolf.bigRow - 1 + wolf.height)*(collMapSize)+(wolf.bigCol + wolf.width))] == 0
    || collisionMap1Bitmap[((wolf.bigRow + wolf.height / 2)*(collMapSize)+(wolf.bigCol + wolf.width))] == 0) {
    wolf.bigCol -= 20;
   }
   if (collisionMap1Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol + wolf.width + 1))] == 0
    && collisionMap1Bitmap[((wolf.bigRow - 1 + wolf.height)*(collMapSize)+(wolf.bigCol + wolf.width + 1))] == 0
    && collisionMap1Bitmap[((wolf.bigRow + wolf.height / 2)*(collMapSize)+(wolf.bigCol + wolf.width + 1))] == 0) {
    wolf.gravity = 1.5;
   } else {
    wolf.gravity = 0.3;
   }
   wolf.row -= wolf.gravity;
   damageReaction++;
   if (damageReaction == 5) {
    damaged = 0;
    moveAway = 0;
    damageReaction = 0;
   }
  }
 } else {
  if((~(*(volatile unsigned int *)0x04000130) & ((1<<5))) && damaged == 0 && doubleJump == 0) {
   if (collisionMap2Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol - 1))] != 0
    && collisionMap2Bitmap[((wolf.bigRow - 1 + wolf.height)*(collMapSize)+(wolf.bigCol - 1))] != 0
    && collisionMap2Bitmap[((wolf.bigRow + wolf.height / 2)*(collMapSize)+(wolf.bigCol - 1))] != 0
    && collisionMap2Bitmap[((wolf.bigRow + 4)*(collMapSize)+(wolf.bigCol - 1))] != 0
    && collisionMap2Bitmap[((wolf.bigRow + wolf.height - 4)*(collMapSize)+(wolf.bigCol - 1))] != 0) {
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
    if (collisionMap2Bitmap[((wolf.bigRow + i)*(collMapSize)+(wolf.bigCol))] == 0) {
     wolf.bigRow++;
    }
   }
   direction = 0;
  } else if ((~(*(volatile unsigned int *)0x04000130) & ((1<<5))) && damaged == 0 && doubleJump != 0) {
   if (collisionMap2Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol - 1))] != 0
    && collisionMap2Bitmap[((wolf.bigRow + wolf.height + 1)*(collMapSize)+(wolf.bigCol - 1))] != 0
    && collisionMap2Bitmap[((wolf.bigRow + wolf.height / 2)*(collMapSize)+(wolf.bigCol - 1))] != 0
    && collisionMap2Bitmap[((wolf.bigRow + 4)*(collMapSize)+(wolf.bigCol - 1))] != 0
    && collisionMap2Bitmap[((wolf.bigRow + wolf.height - 4)*(collMapSize)+(wolf.bigCol - 1))] != 0) {
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
    if (collisionMap2Bitmap[((wolf.bigRow + i)*(collMapSize)+(wolf.bigCol))] == 0) {
     wolf.bigRow++;
    }
   }
   direction = 0;
  }
  if (collisionMap2Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol))] == 0
   || collisionMap2Bitmap[((wolf.bigRow + wolf.height)*(collMapSize)+(wolf.bigCol))] == 0) {
   wolf.bigCol++;
  }
  if((~(*(volatile unsigned int *)0x04000130) & ((1<<4))) && damaged == 0 && doubleJump == 0) {
   if (collisionMap2Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol + wolf.width + 1))] != 0
    && collisionMap2Bitmap[((wolf.bigRow - 1 + wolf.height)*(collMapSize)+(wolf.bigCol + wolf.width + 1))] != 0
    && collisionMap2Bitmap[((wolf.bigRow + wolf.height / 2)*(collMapSize)+(wolf.bigCol + wolf.width + 1))] != 0
    && collisionMap2Bitmap[((wolf.bigRow + 4)*(collMapSize)+(wolf.bigCol + wolf.width + 1))] != 0
    && collisionMap2Bitmap[((wolf.bigRow + wolf.height - 4)*(collMapSize)+(wolf.bigCol + wolf.width + 1))] != 0) {
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
   direction = 1;
  } else if ((~(*(volatile unsigned int *)0x04000130) & ((1<<4))) && damaged == 0 && doubleJump != 0) {
   if (collisionMap2Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol + wolf.width + 1))] != 0
    && collisionMap2Bitmap[((wolf.bigRow + wolf.height + 1)*(collMapSize)+(wolf.bigCol + wolf.width + 1))] != 0
    && collisionMap2Bitmap[((wolf.bigRow + wolf.height / 2)*(collMapSize)+(wolf.bigCol + wolf.width + 1))] != 0
    && collisionMap2Bitmap[((wolf.bigRow + 4)*(collMapSize)+(wolf.bigCol + wolf.width + 1))] != 0
    && collisionMap2Bitmap[((wolf.bigRow + wolf.height - 4)*(collMapSize)+(wolf.bigCol + wolf.width + 1))] != 0) {
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
   direction = 1;
  }
  if (collisionMap2Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol + wolf.width))] == 0
   || collisionMap2Bitmap[((wolf.bigRow + wolf.height)*(collMapSize)+(wolf.bigCol + wolf.width))] == 0) {
   wolf.bigCol--;
  }
  if((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0)))) && doubleJump != 2) {
   wolf.gravity = 1.5;
   wolf.row -= wolf.gravity;
   doubleJump++;
  }

  if (collisionMap2Bitmap[((wolf.bigRow + 1 + wolf.height)*(collMapSize)+(wolf.bigCol))] != 0
    && collisionMap2Bitmap[((wolf.bigRow + 1 + wolf.height)*(collMapSize)+(wolf.bigCol + wolf.width))] != 0) {
   wolf.gravity = wolf.gravity - 0.025;
   wolf.row -= wolf.gravity;
  }

  if ((collisionMap2Bitmap[((wolf.bigRow + 1 + wolf.height)*(collMapSize)+(wolf.bigCol))] == 0
    || collisionMap2Bitmap[((wolf.bigRow + 1 + wolf.height)*(collMapSize)+(wolf.bigCol + wolf.width))] == 0
    || collisionMap2Bitmap[((wolf.bigRow + 1 + wolf.height)*(collMapSize)+(wolf.bigCol + wolf.width / 2))] == 0
    || collisionMap2Bitmap[((wolf.bigRow + 1 + wolf.height)*(collMapSize)+(wolf.bigCol + 4))] == 0
    || collisionMap2Bitmap[((wolf.bigRow + 1 + wolf.height)*(collMapSize)+(wolf.bigCol + wolf.width - 4))] == 0)
    && wolf.gravity < 0) {
   wolf.gravity = 0;
   doubleJump = 0;
   if (collisionMap2Bitmap[((wolf.bigRow + wolf.height)*(collMapSize)+(wolf.bigCol))] != 0) {
    int wolfRow = wolf.row;
    wolf.row = wolfRow;
    wolf.row = wolf.row + 1;
   }
   if (collisionMap2Bitmap[((wolf.bigRow + wolf.height)*(collMapSize)+(wolf.bigCol))] == 0) {
    wolf.row = wolf.row - 1;
   }
   if (collisionMap2Bitmap[((wolf.bigRow + wolf.height)*(collMapSize)+(wolf.bigCol))] == 0) {
    wolf.row = wolf.row - 1;
   }
  }

  if ((collisionMap2Bitmap[((wolf.bigRow - 1)*(collMapSize)+(wolf.bigCol))] == 0
    || collisionMap2Bitmap[((wolf.bigRow - 1)*(collMapSize)+(wolf.bigCol + wolf.width))] == 0
    || collisionMap2Bitmap[((wolf.bigRow - 1)*(collMapSize)+(wolf.bigCol + wolf.width / 2))] == 0
    || collisionMap2Bitmap[((wolf.bigRow - 1)*(collMapSize)+(wolf.bigCol + 4))] == 0
    || collisionMap2Bitmap[((wolf.bigRow - 1)*(collMapSize)+(wolf.bigCol + wolf.width - 4))] == 0)
    && wolf.gravity > 0) {
   wolf.gravity -= wolf.gravity;
  }
  if (collisionMap2Bitmap[((wolf.bigRow - 1)*(collMapSize)+(wolf.bigCol + wolf.width))] == 0) {
   wolf.col--;
  }
  if (collisionMap2Bitmap[((wolf.bigRow - 1)*(collMapSize)+(wolf.bigCol))] == 0) {
   wolf.col++;
  }
  werewolfAttack();
  if (damaged == 1 && moveAway == bounceLeft) {
   playSoundB(injuredGrunt, 2277, 11025);
   if (collisionMap2Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol - 1))] == 0
    && collisionMap2Bitmap[((wolf.bigRow - 1 + wolf.height)*(collMapSize)+(wolf.bigCol - 1))] == 0
    && collisionMap2Bitmap[((wolf.bigRow + wolf.height / 2)*(collMapSize)+(wolf.bigCol - 1))] == 0) {
    wolf.gravity = 1.5;
   } else if (collisionMap2Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol - 4))] != 0
    && collisionMap2Bitmap[((wolf.bigRow - 1 + wolf.height)*(collMapSize)+(wolf.bigCol - 4))] != 0
    && collisionMap2Bitmap[((wolf.bigRow + wolf.height / 2)*(collMapSize)+(wolf.bigCol - 4))] != 0) {
    wolf.col -= 4;
    if (collisionMap2Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol))] == 0
     || collisionMap2Bitmap[((wolf.bigRow - 1 + wolf.height)*(collMapSize)+(wolf.bigCol))] == 0
     || collisionMap2Bitmap[((wolf.bigRow + wolf.height / 2)*(collMapSize)+(wolf.bigCol))] == 0) {
     wolf.bigCol += 20;
    }
    wolf.gravity = 0.3;
   } else if (collisionMap2Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol - 3))] != 0
    && collisionMap2Bitmap[((wolf.bigRow - 1 + wolf.height)*(collMapSize)+(wolf.bigCol - 3))] != 0
    && collisionMap2Bitmap[((wolf.bigRow + wolf.height / 2)*(collMapSize)+(wolf.bigCol - 3))] != 0) {
    wolf.col -= 3;
    if (collisionMap2Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol))] == 0
     || collisionMap2Bitmap[((wolf.bigRow - 1 + wolf.height)*(collMapSize)+(wolf.bigCol))] == 0
     || collisionMap2Bitmap[((wolf.bigRow + wolf.height / 2)*(collMapSize)+(wolf.bigCol))] == 0) {
     wolf.bigCol += 20;
    }
    wolf.gravity = 0.3;
   } else if (collisionMap2Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol - 2))] != 0
    && collisionMap2Bitmap[((wolf.bigRow - 1 + wolf.height)*(collMapSize)+(wolf.bigCol - 2))] != 0
    && collisionMap2Bitmap[((wolf.bigRow + wolf.height / 2)*(collMapSize)+(wolf.bigCol - 2))] != 0) {
    wolf.col -= 2;
    if (collisionMap2Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol))] == 0
     || collisionMap2Bitmap[((wolf.bigRow - 1 + wolf.height)*(collMapSize)+(wolf.bigCol))] == 0
     || collisionMap2Bitmap[((wolf.bigRow + wolf.height / 2)*(collMapSize)+(wolf.bigCol))] == 0) {
     wolf.bigCol += 20;
    }
    wolf.gravity = 0.3;
   }
   wolf.row -= wolf.gravity;
   damageReaction++;
   if (damageReaction == 5) {
    damaged = 0;
    moveAway = 0;
    damageReaction = 0;
   }
  } else if (damaged == 1 && moveAway == bounceUp) {
   playSoundB(injuredGrunt, 2277, 11025);
   wolf.gravity = 1.5;
   damageReaction++;
   if (damageReaction == 5) {
    damaged = 0;
    moveAway = 0;
    damageReaction = 0;
   }
  } else if (damaged == 1) {
   playSoundB(injuredGrunt, 2277, 11025);
   if (collisionMap2Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol + wolf.width + 4))] != 0
    && collisionMap2Bitmap[((wolf.bigRow - 1 + wolf.height)*(collMapSize)+(wolf.bigCol + wolf.width + 4))] != 0
    && collisionMap2Bitmap[((wolf.bigRow + wolf.height / 2)*(collMapSize)+(wolf.bigCol + wolf.width + 4))] != 0) {
    wolf.col += 4;
   } else if (collisionMap2Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol + wolf.width + 3))] != 0
    && collisionMap2Bitmap[((wolf.bigRow - 1 + wolf.height)*(collMapSize)+(wolf.bigCol + wolf.width + 3))] != 0
    && collisionMap2Bitmap[((wolf.bigRow + wolf.height / 2)*(collMapSize)+(wolf.bigCol + wolf.width + 3))] != 0) {
    wolf.col += 3;
   } else if (collisionMap2Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol + wolf.width + 2))] != 0
    && collisionMap2Bitmap[((wolf.bigRow - 1 + wolf.height)*(collMapSize)+(wolf.bigCol + wolf.width + 2))] != 0
    && collisionMap2Bitmap[((wolf.bigRow + wolf.height / 2)*(collMapSize)+(wolf.bigCol + wolf.width + 2))] != 0) {
    wolf.col += 2;
   }
   if (collisionMap2Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol + wolf.width))] == 0
    || collisionMap2Bitmap[((wolf.bigRow - 1 + wolf.height)*(collMapSize)+(wolf.bigCol + wolf.width))] == 0
    || collisionMap2Bitmap[((wolf.bigRow + wolf.height / 2)*(collMapSize)+(wolf.bigCol + wolf.width))] == 0) {
    wolf.bigCol -= 20;
   }
   if (collisionMap2Bitmap[((wolf.bigRow + 1)*(collMapSize)+(wolf.bigCol + wolf.width + 1))] == 0
    && collisionMap2Bitmap[((wolf.bigRow - 1 + wolf.height)*(collMapSize)+(wolf.bigCol + wolf.width + 1))] == 0
    && collisionMap2Bitmap[((wolf.bigRow + wolf.height / 2)*(collMapSize)+(wolf.bigCol + wolf.width + 1))] == 0) {
    wolf.gravity = 1.5;
   } else {
    wolf.gravity = 0.3;
   }
   wolf.row -= wolf.gravity;
   damageReaction++;
   if (damageReaction == 5) {
    damaged = 0;
    moveAway = 0;
    damageReaction = 0;
   }
  }
 }
 animateWolf();
}



void werewolfAttack() {
 int i;
 for (i = 0; i < 5; i++) {
  if((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {
   playSoundB(slash, 2888, 11025);
   if (direction == 1 && Knight[i].knightDWait == 0) {
    if (wolf.bigCol + wolf.width + slashAttack.width - 3 > Knight[i].bigCol
     && wolf.bigCol < Knight[i].bigCol &&
     wolf.bigRow + wolf.height > Knight[i].bigRow && Knight[i].bigRow < wolf.bigRow + 2
   && Knight[i].bigRow + Knight[i].height > wolf.bigRow) {
     Knight[i].knightHealth--;
     if (Knight[i].knightHealth == 0) {
      Knight[i].row = 0;
      Knight[i].col = 160;
     }
     Knight[i].knightDamaged = 1;
     Knight[i].knightBounce = 1;
     Knight[i].knightDWait = 1;
     Knight[i].knightReaction = 1;
    }
   } else if (direction == 0 && Knight[i].knightDWait == 0) {
    if (wolf.bigCol - slashAttack.width + 3 < Knight[i].bigCol + Knight[i].width
     && wolf.bigCol + wolf.width > Knight[i].bigCol + Knight[i].width &&
     wolf.bigRow + wolf.height > Knight[i].bigRow && Knight[i].bigRow < wolf.bigRow + 2
   && Knight[i].bigRow + Knight[i].height > wolf.bigRow) {
     Knight[i].knightHealth--;
     if (Knight[i].knightHealth == 0) {
      Knight[i].row = 0;
      Knight[i].col = 160;
     }
     Knight[i].knightDamaged = 1;
     Knight[i].knightBounce = 0;
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
  if (Knight[i].knightBounce == 1) {
   Knight[i].bigCol += 3;
   Knight[i].knightReaction++;
   if (Knight[i].knightReaction == 5) {
    Knight[i].knightDamaged = 0;
    Knight[i].knightBounce = 5;
    Knight[i].knightReaction = 0;
   }
  } else if (Knight[i].knightBounce == 0) {
   Knight[i].bigCol -= 3;
   Knight[i].knightReaction++;
   if (Knight[i].knightReaction == 5) {
    Knight[i].knightBounce = 5;
    Knight[i].knightDamaged = 0;
    Knight[i].knightReaction = 0;
   }
  }
 }
}




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
    if((~(*(volatile unsigned int *)0x04000130) & ((1<<5))) && wolf.gravity == 0) {
  wolf.aniState = WOLFWALK;
 }
    if((~(*(volatile unsigned int *)0x04000130) & ((1<<4))) && wolf.gravity == 0) {
  wolf.aniState = WOLFWALK;
 }
 if((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
  wolf.aniState = WOLFJUMP;
 }
 if((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {
  duration = 1;
  wolf.aniState = WOLFATTACK;
  if (direction == 0) {
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




void healthbar() {
 health.row = health.bigRow - vOff;
 health.col = health.bigCol;
 int i;
 for (i = 0; i < 5; i++) {
  if ((wolf.bigCol < Knight[i].bigCol
    && wolf.bigCol + wolf.width - 1 > Knight[i].bigCol
    && wolf.bigRow + 3 > Knight[i].bigRow && Knight[i].bigRow < wolf.bigRow + 2
   && Knight[i].bigRow + Knight[i].height > wolf.bigRow)
   && wolfDWait == 0 && Knight[i].knightHealth > 0) {
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
   damaged = 1;
   moveAway = bounceLeft;
  } else if ((wolf.bigCol + 3 < Knight[i].bigCol + Knight[i].width
    && wolf.bigCol > Knight[i].bigCol
    && wolf.bigRow + 3 > Knight[i].bigRow && Knight[i].bigRow < wolf.bigRow + 2
   && Knight[i].bigRow + Knight[i].height > wolf.bigRow)
   && wolfDWait == 0 && Knight[i].knightHealth > 0) {
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
   damaged = 1;
   moveAway = bounceRight;
  } else if (wolf.bigRow + wolf.height - 3 > Knight[i].bigRow
    && wolf.bigRow < Knight[i].bigRow && Knight[i].bigRow < wolf.bigRow + 2
    && Knight[i].bigRow + Knight[i].height > wolf.bigRow
    && ((wolf.bigCol < Knight[i].bigCol && wolf.bigCol + wolf.width > Knight[i].bigCol)
     || (wolf.bigCol > Knight[i].bigCol && wolf.bigCol < Knight[i].bigCol + Knight[i].width))
   && wolfDWait == 0 && Knight[i].knightHealth > 0) {
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
   damaged = 1;
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
 *(unsigned short *)0x4000000 = 0 | (1<<8);
 *(volatile unsigned short *)0x04000010 = 0;
 *(volatile unsigned short *)0x04000012 = 0;
 state = LOSESCREEN;
 *(volatile unsigned short*)0x4000008 = 0 << 2 | 27 << 8 | 1<<14 | 1 << 7;
 DMANow(3, loseTiles, &((charblock *)0x6000000)[0], (0 << 23));
 DMANow(3, loseMap, &((screenblock *)0x6000000)[27], (0 << 23));
    playSoundA(loseMusic, 423648, 11025);
}




void knight(int i) {
 Knight[i].row = Knight[i].bigRow - vOff;
 Knight[i].col = Knight[i].bigCol - hOff;
 if (state == GAMESCREEN) {
  if (Knight[i].slowKnight < 1 && Knight[i].knightDamaged == 0) {
   Knight[i].slowKnight++;
   if (Knight[i].bigCol - Knight[i].width * 3 < wolf.bigCol && Knight[i].bigCol > wolf.bigCol
    && Knight[i].bigRow - Knight[i].height < wolf.bigRow && Knight[i].bigRow < wolf.bigRow + 2
    && Knight[i].bigRow + Knight[i].height > wolf.bigRow) {
    Knight[i].knightDirection = 1;
    Knight[i].knightAttacking = 1;
   } else if (Knight[i].bigCol + Knight[i].width * 3 > wolf.bigCol && Knight[i].bigCol < wolf.bigCol
    && Knight[i].bigRow - Knight[i].height < wolf.bigRow && Knight[i].bigRow < wolf.bigRow + 2
    && Knight[i].bigRow + Knight[i].height > wolf.bigRow) {
    Knight[i].knightDirection = 2;
    Knight[i].knightAttacking = 1;
   } else if (collisionMap1Bitmap[((Knight[i].bigRow + 1)*(collMapSize)+(Knight[i].bigCol))] == 0
     && collisionMap1Bitmap[((Knight[i].bigRow - 1 + Knight[i].height)*(collMapSize)+(Knight[i].bigCol))] == 0
     && collisionMap1Bitmap[((Knight[i].bigRow + Knight[i].height / 2)*(collMapSize)+(Knight[i].bigCol))] == 0) {
    Knight[i].knightDirection = 2;
    Knight[i].knightAttacking = 0;
   } else if (collisionMap1Bitmap[((Knight[i].bigRow + 1)*(collMapSize)+(Knight[i].bigCol + Knight[i].width))] == 0
    && collisionMap1Bitmap[((Knight[i].bigRow - 1 + Knight[i].height)*(collMapSize)+(Knight[i].bigCol + Knight[i].width))] == 0
    && collisionMap1Bitmap[((Knight[i].bigRow + Knight[i].height / 2)*(collMapSize)+(Knight[i].bigCol + Knight[i].width))] == 0) {
    Knight[i].knightDirection = 1;
    Knight[i].knightAttacking = 0;
   } else {
    Knight[i].knightAttacking = 0;
   }
   int j;
   for (j = 0; j < 5; j++) {
    if (i != j && Knight[i].bigCol + Knight[i].width > Knight[j].bigCol && Knight[i].bigCol < Knight[j].bigCol
     && Knight[j].knightHealth != 0 && Knight[i].knightHealth != 0 && Knight[i].bigRow < Knight[j].bigRow + 3
     && Knight[i].bigRow + Knight[i].height > Knight[j].bigRow) {
     Knight[i].knightDirection = 1;
     Knight[j].knightDirection = 2;
    }
   }
   int k;
   for (k = 0; k < 5; k++) {
    if (i != k && Knight[i].bigCol < Knight[k].bigCol + Knight[k].width && Knight[i].bigCol > Knight[k].bigCol
     && Knight[k].knightHealth != 0 && Knight[i].knightHealth != 0 && Knight[i].bigRow < Knight[k].bigRow + 3
     && Knight[i].bigRow + Knight[i].height > Knight[k].bigRow) {
     Knight[i].knightDirection = 2;
     Knight[k].knightDirection = 1;
    }
   }
   if (Knight[i].knightDirection == 1 && collisionMap1Bitmap[((Knight[i].bigRow + 1)*(collMapSize)+(Knight[i].bigCol))] != 0
     && collisionMap1Bitmap[((Knight[i].bigRow - 1 + Knight[i].height)*(collMapSize)+(Knight[i].bigCol))] != 0
     && collisionMap1Bitmap[((Knight[i].bigRow + Knight[i].height / 2)*(collMapSize)+(Knight[i].bigCol))] != 0) {
    Knight[i].bigCol -= 1;
   } else if (Knight[i].knightDirection == 2 && collisionMap1Bitmap[((Knight[i].bigRow + 1)*(collMapSize)+(Knight[i].bigCol + Knight[i].width))] != 0
    && collisionMap1Bitmap[((Knight[i].bigRow - 1 + Knight[i].height)*(collMapSize)+(Knight[i].bigCol + Knight[i].width))] != 0
    && collisionMap1Bitmap[((Knight[i].bigRow + Knight[i].height / 2)*(collMapSize)+(Knight[i].bigCol + Knight[i].width))] != 0) {
    Knight[i].bigCol += 1;
   }
   if (Knight[i].knightDirection == 1
    && collisionMap1Bitmap[((Knight[i].bigRow + Knight[i].height + 1)*(collMapSize)+(Knight[i].bigCol))] != 0) {
    Knight[i].knightDirection = 2;
   } else if (Knight[i].knightDirection == 2
    && collisionMap1Bitmap[((Knight[i].bigRow + Knight[i].height + 1)*(collMapSize)+(Knight[i].bigCol + Knight[i].width))] != 0) {
    Knight[i].knightDirection = 1;
   }
  }
 } else {
  if (Knight[i].slowKnight < 1 && Knight[i].knightDamaged == 0) {
   Knight[i].slowKnight++;
   if (Knight[i].bigCol - Knight[i].width * 3 < wolf.bigCol && Knight[i].bigCol > wolf.bigCol
    && Knight[i].bigRow - Knight[i].height < wolf.bigRow && Knight[i].bigRow < wolf.bigRow + 2
    && Knight[i].bigRow + Knight[i].height > wolf.bigRow) {
    Knight[i].knightDirection = 1;
    Knight[i].knightAttacking = 1;
   } else if (Knight[i].bigCol + Knight[i].width * 3 > wolf.bigCol && Knight[i].bigCol < wolf.bigCol
    && Knight[i].bigRow - Knight[i].height < wolf.bigRow && Knight[i].bigRow < wolf.bigRow + 2
    && Knight[i].bigRow + Knight[i].height > wolf.bigRow) {
    Knight[i].knightDirection = 2;
    Knight[i].knightAttacking = 1;
   } else if (collisionMap2Bitmap[((Knight[i].bigRow + 1)*(collMapSize)+(Knight[i].bigCol))] == 0
     && collisionMap2Bitmap[((Knight[i].bigRow - 1 + Knight[i].height)*(collMapSize)+(Knight[i].bigCol))] == 0
     && collisionMap2Bitmap[((Knight[i].bigRow + Knight[i].height / 2)*(collMapSize)+(Knight[i].bigCol))] == 0) {
    Knight[i].knightDirection = 2;
    Knight[i].knightAttacking = 0;
   } else if (collisionMap2Bitmap[((Knight[i].bigRow + 1)*(collMapSize)+(Knight[i].bigCol + Knight[i].width))] == 0
    && collisionMap2Bitmap[((Knight[i].bigRow - 1 + Knight[i].height)*(collMapSize)+(Knight[i].bigCol + Knight[i].width))] == 0
    && collisionMap2Bitmap[((Knight[i].bigRow + Knight[i].height / 2)*(collMapSize)+(Knight[i].bigCol + Knight[i].width))] == 0) {
    Knight[i].knightDirection = 1;
    Knight[i].knightAttacking = 0;
   } else {
    Knight[i].knightAttacking = 0;
   }
   int j;
   for (j = 0; j < 5; j++) {
    if (i != j && Knight[i].bigCol + Knight[i].width > Knight[j].bigCol && Knight[i].bigCol < Knight[j].bigCol
     && Knight[j].knightHealth != 0 && Knight[i].knightHealth != 0 && Knight[i].bigRow < Knight[j].bigRow + 3
     && Knight[i].bigRow + Knight[i].height > Knight[j].bigRow) {
     Knight[i].knightDirection = 1;
     Knight[j].knightDirection = 2;
    }
   }
   int k;
   for (k = 0; k < 5; k++) {
    if (i != k && Knight[i].bigCol < Knight[k].bigCol + Knight[k].width && Knight[i].bigCol > Knight[k].bigCol
     && Knight[k].knightHealth != 0 && Knight[i].knightHealth != 0 && Knight[i].bigRow < Knight[k].bigRow + 3
     && Knight[i].bigRow + Knight[i].height > Knight[k].bigRow) {
     Knight[i].knightDirection = 2;
     Knight[k].knightDirection = 1;
    }
   }
   if (Knight[i].knightDirection == 1 && collisionMap2Bitmap[((Knight[i].bigRow + 1)*(collMapSize)+(Knight[i].bigCol))] != 0
     && collisionMap2Bitmap[((Knight[i].bigRow - 1 + Knight[i].height)*(collMapSize)+(Knight[i].bigCol))] != 0
     && collisionMap2Bitmap[((Knight[i].bigRow + Knight[i].height / 2)*(collMapSize)+(Knight[i].bigCol))] != 0) {
    Knight[i].bigCol -= 1;
   } else if (Knight[i].knightDirection == 2 && collisionMap2Bitmap[((Knight[i].bigRow + 1)*(collMapSize)+(Knight[i].bigCol + Knight[i].width))] != 0
    && collisionMap2Bitmap[((Knight[i].bigRow - 1 + Knight[i].height)*(collMapSize)+(Knight[i].bigCol + Knight[i].width))] != 0
    && collisionMap2Bitmap[((Knight[i].bigRow + Knight[i].height / 2)*(collMapSize)+(Knight[i].bigCol + Knight[i].width))] != 0) {
    Knight[i].bigCol += 1;
   }
   if (Knight[i].knightDirection == 1
    && collisionMap2Bitmap[((Knight[i].bigRow + Knight[i].height + 1)*(collMapSize)+(Knight[i].bigCol))] != 0) {
    Knight[i].knightDirection = 2;
   } else if (Knight[i].knightDirection == 2
    && collisionMap2Bitmap[((Knight[i].bigRow + Knight[i].height + 1)*(collMapSize)+(Knight[i].bigCol + Knight[i].width))] != 0) {
    Knight[i].knightDirection = 1;
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




void pause() {
 if((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2)))) && prevGameState == GAMESCREEN) {
  *(unsigned short *)0x4000000 = 0 | (1<<8) | (1<<9) | (1 << 12);
  *(volatile unsigned short *)0x04000014 = hOff;
  *(volatile unsigned short *)0x04000016 = vOff;
  state = GAMESCREEN;
     *(volatile unsigned short*)0x4000008 = 0 << 2 | 27 << 8 | 1<<14 | 1 << 7;
     DMANow(3, background1Tiles, &((charblock *)0x6000000)[0], 22336/2);
     DMANow(3, background1Map, &((screenblock *)0x6000000)[27], 4096/2);
  *(volatile unsigned short*)0x400000A = 2 << 2 | 29 << 8 | 1<<14 | 1 << 7;
     DMANow(3, background2Tiles, &((charblock *)0x6000000)[2], 2304/2);
     DMANow(3, background2Map, &((screenblock *)0x6000000)[29], 4096/2);
     unpauseSound();
 }
 if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2)))) && prevGameState == GAME2SCREEN) {
  *(unsigned short *)0x4000000 = 0 | (1<<8) | (1<<9) | (1 << 12);
  *(volatile unsigned short *)0x04000014 = hOff;
  *(volatile unsigned short *)0x04000016 = vOff;
  state = GAME2SCREEN;
     *(volatile unsigned short*)0x4000008 = 0 << 2 | 27 << 8 | 1<<14 | 1 << 7;
     DMANow(3, level2BackgroundTiles, &((charblock *)0x6000000)[0], 22336/2);
     DMANow(3, level2BackgroundMap, &((screenblock *)0x6000000)[27], 4096/2);
  *(volatile unsigned short*)0x400000A = 2 << 2 | 29 << 8 | 1<<14 | 1 << 7;
     DMANow(3, background2Tiles, &((charblock *)0x6000000)[2], 2304/2);
     DMANow(3, background2Map, &((screenblock *)0x6000000)[29], 4096/2);
     unpauseSound();
 }
 if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  state = MENUSCREEN;
  DMANow(3, menuTiles, &((charblock *)0x6000000)[0], (0 << 23));
     DMANow(3, menuMap, &((screenblock *)0x6000000)[27], (0 << 23));
     playSoundA(menuMusic, 907337, 44100);
     hOffSky = 0;
 }
}




void win() {
 if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  state = MENUSCREEN;
  DMANow(3, menuTiles, &((charblock *)0x6000000)[0], (0 << 23));
     DMANow(3, menuMap, &((screenblock *)0x6000000)[27], (0 << 23));
     stopSound();
     playSoundA(menuMusic, 907337, 44100);
     hOffSky = 0;
 }
}




void lose() {
 if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  state = MENUSCREEN;
  DMANow(3, menuTiles, &((charblock *)0x6000000)[0], (0 << 23));
     DMANow(3, menuMap, &((screenblock *)0x6000000)[27], (0 << 23));
     stopSound();
     playSoundA(menuMusic, 907337, 44100);
     hOffSky = 0;
 }
}




void hideSprites() {
    int i;
    for (i = 0; i < 128; i++) {
     shadowOAM[i].attr0 |= (2 << 8);
    }
}




void initialize()
{
 cheat = 0;
 prevGameState = GAMESCREEN;


    hOff = 0;
 vOff = 256 - 160;
 direction = 1;
 wolf.width = 14;
 wolf.height = 16;
 wolf.row = 128;
 wolf.col = 0;
 wolf.aniCounter = 0;
 wolf.currFrame = 0;
 wolf.gravity = 0;
 wolf.aniState = WOLFIDLE;
 doubleJump = 0;
 damaged = 0;
 wolfPalette = 0;


 int i;
 for (i = 0; i < 5 - 1; i++) {
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
  Knight[i].knightDamaged = 0;
  Knight[i].knightDirection = 1;
  Knight[i].slowKnight = 0;
  Knight[i].knightBounce = 5;
  Knight[i].deathWait = 0;
  Knight[i].knightAttacking = 0;
 }
 Knight[5 - 1].width = 16;
 Knight[5 - 1].height = 16;
 Knight[5 - 1].bigRow = 192;
 Knight[5 - 1].bigCol = 180;
 Knight[5 - 1].aniCounter = 0;
 Knight[5 - 1].currFrame = 0;
 Knight[5 - 1].aniState = KNIGHTATTACK;
 Knight[5 - 1].knightHealth = 2;
 Knight[5 - 1].knightDamaged = 0;
 Knight[5 - 1].knightDirection = 1;
 Knight[5 - 1].slowKnight = 0;
 Knight[5 - 1].knightBounce = 5;
 Knight[5 - 1].deathWait = 0;
 Knight[5 - 1].knightAttacking = 0;


 door.width = 32;
 door.height = 32;
 door.bigRow = 208;
 door.bigCol = 460;
 door.currFrame = 0;


 health.bigRow = 97;
 health.bigCol = 1;
 health.currFrame = FULL;


 slashAttack.row = 0;
 slashAttack.col = 10;
 slashAttack.width = 16;
 slashAttack.height = 16;

 hideSprites();
}

void initialize2() {
 prevGameState = GAME2SCREEN;

    hOff = 0;
 vOff = 256 - 160;
 direction = 1;
 wolf.width = 14;
 wolf.height = 16;
 wolf.row = 128;
 wolf.col = 0;
 wolf.aniCounter = 0;
 wolf.currFrame = 0;
 wolf.gravity = 0;
 wolf.aniState = WOLFIDLE;
 doubleJump = 0;
 damaged = 0;


 int i;
 for (i = 0; i < 5 - 2; i++) {
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
  Knight[i].knightDamaged = 0;
  Knight[i].knightDirection = 1;
  Knight[i].slowKnight = 0;
  Knight[i].knightBounce = 5;
  Knight[i].deathWait = 0;
  Knight[i].knightAttacking = 0;
 }
 Knight[5 - 2].width = 16;
 Knight[5 - 2].height = 16;
 Knight[5 - 2].bigRow = 192;
 Knight[5 - 2].bigCol = 380;
 Knight[5 - 2].aniCounter = 0;
 Knight[5 - 2].currFrame = 0;
 Knight[5 - 2].aniState = KNIGHTATTACK;
 Knight[5 - 2].knightHealth = 2;
 Knight[5 - 2].knightDamaged = 0;
 Knight[5 - 2].knightDirection = 1;
 Knight[5 - 2].slowKnight = 0;
 Knight[5 - 2].knightBounce = 5;
 Knight[5 - 2].deathWait = 0;
 Knight[5 - 2].knightAttacking = 0;

 Knight[5 - 1].width = 16;
 Knight[5 - 1].height = 16;
 Knight[5 - 1].bigRow = 168;
 Knight[5 - 1].bigCol = 180;
 Knight[5 - 1].aniCounter = 0;
 Knight[5 - 1].currFrame = 0;
 Knight[5 - 1].aniState = KNIGHTATTACK;
 Knight[5 - 1].knightHealth = 2;
 Knight[5 - 1].knightDamaged = 0;
 Knight[5 - 1].knightDirection = 1;
 Knight[5 - 1].slowKnight = 0;
 Knight[5 - 1].knightBounce = 5;
 Knight[5 - 1].deathWait = 0;
 Knight[5 - 1].knightAttacking = 0;


 door.width = 32;
 door.height = 32;
 door.bigRow = 208;
 door.bigCol = 460;
 door.currFrame = 0;


 health.bigRow = 97;
 health.bigCol = 1;


 slashAttack.row = 0;
 slashAttack.col = 10;
 slashAttack.width = 16;
 slashAttack.height = 16;}




void updateOAM()
{


 if (wolf.aniState == WOLFJUMP && wolf.gravity > 0) {
  if (direction == 1) {
   shadowOAM[0].attr0 = (0xFF & (int) wolf.row) | (0 << 13) | (2 << 14);
   shadowOAM[0].attr1 = (0x1FF & (int) wolf.col) | (2 << 14);
   if (damaged == 0) {
    shadowOAM[0].attr2 = ((wolfPalette<<12)) | (((0)*4)*32+(2*(wolf.aniState)));
   } else {
    shadowOAM[0].attr2 = ((2<<12)) | (((0)*4)*32+(2*(wolf.aniState)));
   }
  } else {
   shadowOAM[0].attr0 = (0xFF & (int) wolf.row) | (0 << 13) | (2 << 14);
   shadowOAM[0].attr1 = (0x1FF & (int) wolf.col) | (2 << 14) | (1 << 12);
   if (damaged == 0) {
    shadowOAM[0].attr2 = ((wolfPalette<<12)) | (((0)*4)*32+(2*(wolf.aniState)));
   } else {
    shadowOAM[0].attr2 = ((2<<12)) | (((0)*4)*32+(2*(wolf.aniState)));
   }
  }
  if (duration > 0) {
   shadowOAM[2].attr0 = (0xFF & (int) slashAttack.row) | (0 << 13) | (0 << 14);
   if (direction == 0) {
    shadowOAM[2].attr1 = (0x1FF & (int) slashAttack.col) | (1 << 14) | (1 << 12);
   } else {
    shadowOAM[2].attr1 = (0x1FF & (int) slashAttack.col) | (1 << 14);
   }
   shadowOAM[2].attr2 = ((wolfPalette<<12)) | ((0)*32+(8));
  } else {
   shadowOAM[2].attr0 = (0xFF & (int) slashAttack.row) | (0 << 13) | (0 << 14);
   if (direction == 0) {
    shadowOAM[2].attr1 = (0x1FF & (int) slashAttack.col) | (1 << 14) | (1 << 12);
   } else {
    shadowOAM[2].attr1 = (0x1FF & (int) slashAttack.col) | (1 << 14);
   }
   shadowOAM[2].attr2 = ((wolfPalette<<12)) | ((0)*32+(8)) | (5<<10);
  }
 } else if (state == GAMESCREEN && ((wolf.aniState == WOLFJUMP && wolf.gravity < 0)
   || ((collisionMap1Bitmap[((wolf.bigRow + 1 + wolf.height)*(collMapSize)+(wolf.bigCol))] != 0)
   && (collisionMap1Bitmap[((wolf.bigRow + 1 + wolf.height)*(collMapSize)+(wolf.bigCol + wolf.width))] != 0)))) {
  if (direction == 1) {
   shadowOAM[0].attr0 = (0xFF & (int) wolf.row) | (0 << 13) | (2 << 14);
   shadowOAM[0].attr1 = (0x1FF & (int) wolf.col) | (2 << 14);
   if (damaged == 0) {
    shadowOAM[0].attr2 = ((wolfPalette<<12)) | (((4))*32+(2*(wolf.aniState%3)));
   } else {
    shadowOAM[0].attr2 = ((2<<12)) | (((4))*32+(2*(wolf.aniState%3)));
   }
  } else {
   shadowOAM[0].attr0 = (0xFF & (int) wolf.row) | (0 << 13) | (2 << 14);
   shadowOAM[0].attr1 = (0x1FF & (int) wolf.col) | (2 << 14) | (1 << 12);
   if (damaged == 0) {
    shadowOAM[0].attr2 = ((wolfPalette<<12)) | (((4))*32+(2*(wolf.aniState%3)));
   } else {
    shadowOAM[0].attr2 = ((2<<12)) | (((4))*32+(2*(wolf.aniState%3)));
   }
  }
  if (duration > 0) {
   shadowOAM[2].attr0 = (0xFF & (int) slashAttack.row) | (0 << 13) | (0 << 14);
   if (direction == 0) {
    shadowOAM[2].attr1 = (0x1FF & (int) slashAttack.col) | (1 << 14) | (1 << 12);
   } else {
    shadowOAM[2].attr1 = (0x1FF & (int) slashAttack.col) | (1 << 14);
   }
   shadowOAM[2].attr2 = ((wolfPalette<<12)) | ((0)*32+(8));
  } else {
   shadowOAM[2].attr0 = (0xFF & (int) slashAttack.row) | (0 << 13) | (0 << 14);
   if (direction == 0) {
    shadowOAM[2].attr1 = (0x1FF & (int) slashAttack.col) | (1 << 14) | (1 << 12);
   } else {
    shadowOAM[2].attr1 = (0x1FF & (int) slashAttack.col) | (1 << 14);
   }
   shadowOAM[2].attr2 = ((wolfPalette<<12)) | ((0)*32+(8)) | (5<<10);
  }
 } else if (wolf.aniState == WOLFATTACK) {
  if (direction == 1) {
   shadowOAM[0].attr0 = (0xFF & (int) wolf.row) | (0 << 13) | (0 << 14);
   shadowOAM[0].attr1 = (0x1FF & (int) wolf.col) | (1 << 14);
   if (damaged == 0) {
    shadowOAM[0].attr2 = ((wolfPalette<<12)) | (((0))*32+(6));
   } else {
    shadowOAM[0].attr2 = ((2<<12)) | (((0))*32+(6));
   }
   if (duration > 0) {
    shadowOAM[2].attr0 = (0xFF & (int) slashAttack.row) | (0 << 13) | (0 << 14);
    shadowOAM[2].attr1 = (0x1FF & (int) slashAttack.col) | (1 << 14);
    shadowOAM[2].attr2 = ((wolfPalette<<12)) | ((0)*32+(8));
   } else {
    shadowOAM[2].attr0 = (0xFF & (int) slashAttack.row) | (0 << 13) | (0 << 14);
    shadowOAM[2].attr1 = (0x1FF & (int) slashAttack.col) | (1 << 14);
    shadowOAM[2].attr2 = ((wolfPalette<<12)) | ((0)*32+(8)) | (5<<10);
   }
  } else {
   shadowOAM[0].attr0 = (0xFF & (int) wolf.row) | (0 << 13) | (0 << 14);
   shadowOAM[0].attr1 = (0x1FF & (int) wolf.col) | (1 << 14) | (1 << 12);
   if (damaged == 0) {
    shadowOAM[0].attr2 = ((wolfPalette<<12)) | (((0))*32+(6));
   } else {
    shadowOAM[0].attr2 = ((2<<12)) | (((0))*32+(6));
   }
   if (duration > 0) {
    shadowOAM[2].attr0 = (0xFF & (int) slashAttack.row) | (0 << 13) | (0 << 14);
    shadowOAM[2].attr1 = (0x1FF & (int) slashAttack.col) | (1 << 14) | (1 << 12);
    shadowOAM[2].attr2 = ((wolfPalette<<12)) | ((0)*32+(8));
   } else {
    shadowOAM[2].attr0 = (0xFF & (int) slashAttack.row) | (0 << 13) | (0 << 14);
    shadowOAM[2].attr1 = (0x1FF & (int) slashAttack.col) | (1 << 14) | (1 << 12);
    shadowOAM[2].attr2 = ((wolfPalette<<12)) | ((0)*32+(8)) | (5<<10);
   }
  }
 } else {
  if (wolf.aniState == WOLFJUMP) {
   wolf.aniState = WOLFIDLE;
   wolf.prevAniState = wolf.aniState;
  }
  shadowOAM[0].attr0 = (0xFF & (int) wolf.row) | (0 << 13) | (0 << 14);
  if (direction == 0) {
   shadowOAM[0].attr1 = (0x1FF & (int) wolf.col) | (1 << 14) | (1 << 12);
  } else {
   shadowOAM[0].attr1 = (0x1FF & (int) wolf.col) | (1 << 14);
  }
  if (damaged == 0) {
   shadowOAM[0].attr2 = ((wolfPalette<<12)) | ((2*wolf.currFrame)*32+(2*wolf.prevAniState));
  } else {
   shadowOAM[0].attr2 = ((2<<12)) | ((2*wolf.currFrame)*32+(2*wolf.prevAniState));
  }
 }
 if (duration == 0) {
  shadowOAM[2].attr2 = ((wolfPalette<<12)) | ((0)*32+(8)) | (5<<10);
 }


 int i;
 for (i = 0; i < 5; i++) {
  shadowOAM[4 + i].attr0 = (0xFF & (int) Knight[i].row) | (0 << 13) | (0 << 14);
  if (Knight[i].knightDamaged == 0) {
   if (Knight[i].knightAttacking == 1) {
    shadowOAM[4 + i].attr2 = ((1<<12)) | ((2*(Knight[i].currFrame%2))*32+(10));
   } else {
    shadowOAM[4 + i].attr2 = ((1<<12)) | ((2*(Knight[i].currFrame%2) + 4)*32+(10));
   }
  } else {
   shadowOAM[4 + i].attr2 = ((2<<12)) | ((2*(Knight[i].currFrame%2))*32+(10));
  }
  if (Knight[i].knightDirection == 1) {
   shadowOAM[4 + i].attr1 = (0x1FF & (int) Knight[i].col) | (1 << 14) | (1 << 12);
  } else {
   shadowOAM[4 + i].attr1 = (0x1FF & (int) Knight[i].col) | (1 << 14);
  }
  if (Knight[i].knightHealth < 1) {
   if (Knight[i].deathWait < 5) {
    Knight[i].deathWait++;
   }
   if (Knight[i].deathWait >= 5) {
    shadowOAM[4 + i].attr2 = ((0<<12)) | ((0)*32+(8)) | (5<<10);
   }
  }
 }


 shadowOAM[3].attr0 = (0xFF & (int) door.row) | (0 << 13) | (0 << 14);
 if (state == GAMESCREEN) {
  shadowOAM[3].attr2 = ((4<<12)) | ((20 + 4*(door.currFrame%3))*32+(0));
 } else {
  shadowOAM[3].attr2 = ((6<<12)) | ((20 + 4*(door.currFrame%3))*32+(0));
 }
 shadowOAM[3].attr1 = (0x1FF & (int) door.col) | (2 << 14);

 shadowOAM[1].attr0 = (0xFF & (int) health.row) | (0 << 13) | (1 << 14);
 shadowOAM[1].attr2 = ((3<<12)) | ((24 + 2*(health.currFrame))*32+(4));
 shadowOAM[1].attr1 = (0x1FF & (int) health.col) | (2 << 14);
}

void setupSounds() {
        *(volatile u16 *)0x04000084 = (1<<7);

    *(volatile u16*)0x04000082 = (1<<1) |
                        (1<<2) |
                        (3<<8) |
                        0 |
                        (1<<11) |
                        (1<<3) |
                        (3<<12) |
                        (1<<14) |
                        (1<<15);

    *(u16*)0x04000080 = 0;
}

void playSoundA(const unsigned char* sound, int length, int frequency) {
        dma[1].cnt = 0;
        vbCountA = 0;

        int interval = 16777216/frequency;

        DMANow(1, sound, (u16*)0x040000A0, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

        *(volatile unsigned short*)0x4000102 = 0;

        *(volatile unsigned short*)0x4000100 = -interval;
        *(volatile unsigned short*)0x4000102 = (1<<7);

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

        DMANow(2, sound, (u16*)0x040000A4, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

        *(volatile unsigned short*)0x4000106 = 0;

        *(volatile unsigned short*)0x4000104 = -interval;
        *(volatile unsigned short*)0x4000106 = (1<<7);

        soundB.data = sound;
        soundB.length = length;
        soundB.frequency = frequency;
        soundB.isPlaying = 1;
        soundB.loops = 0;
        soundB.duration = ((60*length)/frequency)-((length/frequency)*3)-1;
        soundB.priority = 0;
}

void muteSound() {
    *(volatile u16 *)0x04000084 = 0;
}

void unmuteSound() {
    *(volatile u16 *)0x04000084 = (1<<7);
}

void pauseSound() {
    *(volatile unsigned short*)0x4000102 = *(volatile unsigned short*)0x4000102 & ~(1<<7);
    *(volatile unsigned short*)0x4000106 = *(volatile unsigned short*)0x4000106 & ~(1<<7);
}

void unpauseSound() {
    *(volatile unsigned short*)0x4000102 = *(volatile unsigned short*)0x4000102 | (1<<7);
    *(volatile unsigned short*)0x4000106 = *(volatile unsigned short*)0x4000106 | (1<<7);
}

void stopSound() {
    dma[1].cnt = 0;
    dma[2].cnt = 0;
    soundA.isPlaying = 0;
    soundB.isPlaying = 0;
}

void setupInterrupts() {
    *(unsigned short*)0x4000208 = 0;
    *(unsigned int*)0x3007FFC = (unsigned int)interruptHandler;
    *(unsigned short*)0x4000200 |= 1 << 0;
    *(unsigned short*)0x4000004 |= 1 << 3;
    *(unsigned short*)0x4000208 = 1;
}

void interruptHandler() {
    *(unsigned short*)0x4000208 = 0;
    if(*(volatile unsigned short*)0x4000202 & 1 << 0) {
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
                *(volatile unsigned short*)0x4000102 = 0;
                dma[1].cnt = 0;
                soundA.isPlaying = 0;
            }
        }
        if (soundB.isPlaying && (vbCountB > soundB.duration)) {
            *(volatile unsigned short*)0x4000106 = 0;
            dma[2].cnt = 0;
            soundB.isPlaying = 0;
        }
        *(volatile unsigned short*)0x4000202 = 1 << 0;
    }
    *(unsigned short*)0x4000208 = 1;
}
