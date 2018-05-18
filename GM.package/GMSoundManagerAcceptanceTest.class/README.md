Im am an acceptance test for the gmsoundhandler. I can be opened like any other morph.
I cannot play sounds repeatedly. Use the musicHandler instead.

How to use me (also see initialize):
1. get singleton instance from soundmanager
2. load resources from your project asset directory. Sounds only need to be loaded once into cache.
3.1 get sounds previously loaded from the cache using #playSound: aString
3.2 play music previously loaded from the cache using #playMusic: aString. Loudness can be adjusted with #loudness: aNumber. Only one music can be played at once, it is repeated forever. Stop the music with #stopMusic.