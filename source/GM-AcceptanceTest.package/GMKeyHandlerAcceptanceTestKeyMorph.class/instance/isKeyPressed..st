key handling
isKeyPressed: aCharacter
	"First use-case of the keyHandling, ask for pressed keys:
	After we have registered the GMKeyHandler with gmRegisterToKeyHandler (see initialize), we are now able to ask whether a specific key
	(specified as a character) is pressed"
	^ self parent isKeyPressed: aCharacter