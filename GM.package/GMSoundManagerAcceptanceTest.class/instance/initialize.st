as yet unclassified
initialize
	"GMSoundManager is a singleton, so we can access it globally. 
	If you are a Swa student and don't know what a singleton is you maybe should start visiting the lectures."
	GMSoundManager instance
		"Our GMSoundManager can load all files out of a given folder into the cache.
		 After that they are cached and can be accessed via their names."
		loadAllResourcesFrom: TestResourceFixtures testResourceFolder;
		"Tune the loudness. Because sound can be annoying (especially in automated tests) we mute it in this test.
		If you want to load singles resource files and give them specific names usw: loadResourceIntoCache: filename withName: nameInCache"
		loudness: 0.0;
		"You can access and play a Sound by its name. If you did not specify different this name is the same as the filename."
		playSound: TestResourceFixtures testSoundNameWAV;
		"Music is played in the same way as a Sound. The only difference is that you can only play one music at a time.
		If you start another music the first one ist stopped."
		playMusic: TestResourceFixtures testSoundNameWAV;
		"If you have enough from your music you can pause it."
		pauseMusic.