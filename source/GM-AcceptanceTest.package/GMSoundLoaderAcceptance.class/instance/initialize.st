initialization
initialize

	"This line is only important to keeps this test working without the corresponding sounds on disk.
	It is not part of the library api.
	It creates the necessary files on disk from the image".
	GMTestResourceFixtures createSoundOnDisk.
	
	GMSoundLoader new
		"The GMSoundLoader can load all or single files out of a given folder into the cache.
		Files are cached with their relative pathname as string as their key(ex: 'folder\picture.wav')
		It is possible to provide a custom naming function to the loadAll mechanism as a block.
		For an example look at the defaultNameFunction of GMResourceLoader.
		If you want to load singles resource files and give them specific names use:
			loadResourceFromDrive: aFilename withName: aName"
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
	It is not part of the library api.
	We clean the previously stored file from the filesystem to clean up behind us."
	GMTestResourceFixtures clearResourcesOnDisk.