#define ThongManMethod$attached 1			// Removes any other thongs
#define ThongManMethod$reset 2				// Resets thongMan
#define ThongManMethod$get 3				// Gets the thong to send a refresh call to #ROOT
#define ThongManMethod$set 4				// (arr)visuals
#define ThongManMethod$hit 5				// (vec)color
#define ThongManMethod$fxVisual 6			// (vec)color, (float)glow, (arr)specular[texture,offsets,repeats,rot,color,gloss,world]
#define ThongManMethod$particles 7			// (float)timeout, (int)prim, (arr)particle_list
											// generally prim 1 is for casting, and prim 2 for received spell effects
#define ThongManMethod$dead 8				// (int)dead - 
#define ThongManMethod$loopSound 9			// (key)sound, (float)vol - Or "" to stop sound
						
#define ThongMan$attached() runOmniMethod("got ThongMan", ThongManMethod$attached, [], TNN)
#define ThongMan$get() runMethod(llGetOwner(), "got ThongMan", ThongManMethod$get, [], TNN)
#define ThongMan$set(targ, data) runMethod(targ, "got ThongMan", ThongManMethod$set, [data], TNN)
#define ThongMan$hit(color) runMethod(llGetOwner(), "got ThongMan", ThongManMethod$hit, [color], TNN)
#define ThongMan$fxVisual(params) runMethod(llGetOwner(), "got ThongMan", ThongManMethod$fxVisual, params, TNN)
#define ThongMan$particles(timeout, prim, particle_list) runMethod(llGetOwner(), "got ThongMan", ThongManMethod$particles, [timeout, prim, particle_list], TNN)
#define ThongMan$dead(dead) runMethod(llGetOwner(), "got ThongMan", ThongManMethod$dead, [dead], TNN)
#define ThongMan$loopSound(sound, vol) runMethod(llGetOwner(), "got ThongMan", ThongManMethod$loopSound, [sound, vol], TNN)


#define ThongManEvt$hit 1					// [(vec)color]
#define ThongManEvt$ini 2					// [(int)is_enhanced]
#define ThongManEvt$getVisuals 3			// void - Get visuals from helper of custom thong
