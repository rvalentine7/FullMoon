
//{{BLOCK(lose)

//======================================================================
//
//	lose, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 115 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 7360 + 2048 = 9920
//
//	Time-stamp: 2014-11-30, 20:53:42
//	Exported by Cearn's GBA Image Transmogrifier
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef __LOSE__
#define __LOSE__

#define loseTilesLen 7360
extern const unsigned short loseTiles[3680];

#define loseMapLen 2048
extern const unsigned short loseMap[1024];

#define losePalLen 512
extern const unsigned short losePal[256];

#endif // __LOSE__

//}}BLOCK(lose)
