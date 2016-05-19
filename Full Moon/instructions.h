
//{{BLOCK(instructions)

//======================================================================
//
//	instructions, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 242 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 15488 + 2048 = 18048
//
//	Time-stamp: 2014-11-30, 20:44:25
//	Exported by Cearn's GBA Image Transmogrifier
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef __INSTRUCTIONS__
#define __INSTRUCTIONS__

#define instructionsTilesLen 15488
extern const unsigned short instructionsTiles[7744];

#define instructionsMapLen 2048
extern const unsigned short instructionsMap[1024];

#define instructionsPalLen 512
extern const unsigned short instructionsPal[256];

#endif // __INSTRUCTIONS__

//}}BLOCK(instructions)
