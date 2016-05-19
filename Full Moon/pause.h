
//{{BLOCK(pause)

//======================================================================
//
//	pause, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 129 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 8256 + 2048 = 10816
//
//	Time-stamp: 2014-11-30, 20:33:22
//	Exported by Cearn's GBA Image Transmogrifier
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef __PAUSE__
#define __PAUSE__

#define pauseTilesLen 8256
extern const unsigned short pauseTiles[4128];

#define pauseMapLen 2048
extern const unsigned short pauseMap[1024];

#define pausePalLen 512
extern const unsigned short pausePal[256];

#endif // __PAUSE__

//}}BLOCK(pause)
