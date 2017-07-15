as yet unclassified
userTest
	"Testing if keyboard layout is valid"
	|background keyHandler keyBinding pushedAButton testedButtons|
	
	testedButtons := OrderedCollection new.
	testedButtons add: #keyEscape.
	testedButtons addAll: (65 asCharacter to: 90 asCharacter).
	testedButtons addAll: (48 asCharacter to: 57 asCharacter).
	
	background := RectangleMorph new openInWorld.
	keyBinding := KeyBinding new.
	keyBinding handleAllEvents.
	keyBinding onDownDo: [pushedAButton := true].
	keyHandler := KeyHandler new.
	keyHandler addBinding: keyBinding as: #anything.
	background registerKeyboardBindings: keyHandler.
	background extent: 800@600.
		
	testedButtons do: [:code| |prompt |
		pushedAButton := false.
		prompt := ('Press the ', code asString, ' key') asMorph.
		prompt position: 300@100.
		background addMorph: prompt.
		[pushedAButton] whileFalse: [background currentWorld doOneSubCycle].
		self assert: (background eventHandler isKeyDown: code).
		background removeMorph: prompt.
		].
		
	background delete.