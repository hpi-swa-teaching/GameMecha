A Keyboard is an Object that caches the current state of all the keys and can execute handlers on event.

Instance Variables
	keyDownHandlers:		Dictionary
	keyUpHandlers:		Dictionary
	pressedKeys:		Set

keyDownHandlers
	- all the BlockClosures that get executed whenever a specific Key is pressed

keyUpHandlers
	- all the BlockClosures that get executed whenever a specific Key is released

pressedKeys
	- the set of all currently pressed keys