initialization
initialize

	"This line is only important to keeps this test working even without the corresponding sounds
	in the Resources folder (we store the file out of a Method in the file system). 
	This is not necessary when you want to use our library in the regular case and all your files 
	are already stored on disk."
	GMTestResourceFixtures createSoundOnDisk.
	
	GMSoundLoader new
		"The GMSoundManager can load all files out of a given folder into the cache.
		Files are cached with their full name as string as their key(ex: 'picture.png'), 
		relative folder directories are ignored.
		If you want to load singles resource files and give them specific names use:
			loadResourceIntoCache: filename withName: nameOfKey"
		loadAllResourcesFromDrive: GMTestResourceFixtures testResourceFolder;
		
		"Tune the loudness. Here it is muted for testing purposes.		
		Sound values have a range of 0.0 to 1.0"
		loudness: 0.0;
		
		"You can access and play a sound by its key."
		playSound: GMTestResourceFixtures testSoundPathWAV;
		
		"Music is played in the same way as a sound. 
		The only difference is that you can only play one music at a time and it loops.
		If you start another music the first one is stopped."
		
		playMusic: GMTestResourceFixtures testSoundPathWAV;
		"If you heard enough of your music you can pause it."
		pauseMusic;
		"and continue playing it again later"
		resumePlayingMusic;
		pauseMusic.
	
	"This line again is only important to keep this test free of lasting side effects.
	We clean the previously stored file from the filesystem to clean up behind us. 
	This step is not necessary when you want to use our library in the regular case and all your files 
	are already stored on disk."
	GMTestResourceFixtures clearResourcesOnDisk.