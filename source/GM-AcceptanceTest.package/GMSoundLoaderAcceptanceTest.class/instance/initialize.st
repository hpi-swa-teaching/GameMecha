as yet unclassified
initialize
	"GMSoundManager is a singleton, so we can access it globally."
	GMSoundLoader new
		"The GMSoundManager can load all files out of a given folder into the cache.
		Files are cached with their full name as string as their key(ex: 'picture.png'), relative folder directories are ignored.
		If you want to load singles resource files and give them specific names use:
			loadResourceIntoCache: filename withName: nameOfKey"
		loadAllResourcesFrom: GMTestResourceFixtures testResourceFolder;
		"Tune the loudness. Here it is muted for testing purposes.		
		Sound values have a range of 0.0 to 1.0"
		loudness: 0.0;
		"You can access and play a sound by its key."
		playSound: GMTestResourceFixtures testSoundNameWAV;
		"Music is played in the same way as a sound. The only difference is that you can only play one music at a time and it loops.
		If you start another music the first one is stopped."
		playMusic: GMTestResourceFixtures testSoundNameWAV;
		"If you heard enough of your music you can pause it."
		pauseMusic.