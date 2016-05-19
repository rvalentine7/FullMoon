
//{{BLOCK(game)

//======================================================================
//
//	game, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 107 tiles (t|f|p reduced) not compressed
//	+ regular map (flat), not compressed, 32x32 
//	Total size: 512 + 6848 + 2048 = 9408
//
//	Time-stamp: 2014-10-21, 09:59:20
//	Exported by Cearn's GBA Image Transmogrifier
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef __GAME__
#define __GAME__

#define gameTilesLen 6848
extern const unsigned short gameTiles[3424];

#define gameMapLen 2048
extern const unsigned short gameMap[1024];

#define gamePalLen 512
extern const unsigned short gamePal[256];

#endif // __GAME__

//}}BLOCK(game)
