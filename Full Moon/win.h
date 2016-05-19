
//{{BLOCK(win)

//======================================================================
//
//	win, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 183 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 11712 + 2048 = 14272
//
//	Time-stamp: 2014-11-30, 20:50:50
//	Exported by Cearn's GBA Image Transmogrifier
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef __WIN__
#define __WIN__

#define winTilesLen 11712
extern const unsigned short winTiles[5856];

#define winMapLen 2048
extern const unsigned short winMap[1024];

#define winPalLen 512
extern const unsigned short winPal[256];

#endif // __WIN__

//}}BLOCK(win)
