
//{{BLOCK(menu)

//======================================================================
//
//	menu, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 205 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 13120 + 2048 = 15680
//
//	Time-stamp: 2014-11-30, 20:48:06
//	Exported by Cearn's GBA Image Transmogrifier
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef __MENU__
#define __MENU__

#define menuTilesLen 13120
extern const unsigned short menuTiles[6560];

#define menuMapLen 2048
extern const unsigned short menuMap[1024];

#define menuPalLen 512
extern const unsigned short menuPal[256];

#endif // __MENU__

//}}BLOCK(menu)
