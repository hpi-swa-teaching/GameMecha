Im am an acceptance test for the GMSoundManager class.
I am responsible for demonstrating how to load sounds into the cache as well as play sounds and music.

How to use the GMSoundManager (also see initialize):
1. get singleton instance from GMSoundManager.
2. load resources from your project asset directory. Sounds only need to be loaded into cache once.
3. get sounds previously loaded from the cache using playSound: aString.
4. play music by using playMusic: aString. stop the music by using pauseMusic.