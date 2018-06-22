keyboard input
isKeyPressed: aCharacter
	"redirects questions about the keyboard input to GMDemoGame, which is registered at the keyHandler and thus responsible for receiving keyEvents"
	^ self game isKeyPressed: aCharacter