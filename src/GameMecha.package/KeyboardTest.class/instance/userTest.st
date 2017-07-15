as yet unclassified
userTest
	"Testing if keyboard layout is valid"
	|background keyHandler keyBinding pushedAButton testedButtons|
	
	testedButtons := OrderedCollection new.
	testedButtons addAll: (65 asCharacter to: 90 asCharacter).
	testedButtons addAll: (48 asCharacter to: 57 asCharacter).
	testedButtons add: #keyEscape.
	testedButtons add: #keyControl.
	testedButtons add: #keyShift.
	testedButtons add: #keyCapslock.
	testedButtons add: #keyAlt.
	testedButtons add: #keyBackspace.
	testedButtons add: #keyEnter.
	testedButtons add: #keyDelete.
	testedButtons add: #keySpace.
	testedButtons add: #keyArrowUp.
	testedButtons add: #keyArrowLeft.
	testedButtons add: #keyArrowDown.
	testedButtons add: #keyArrowRight.
	
	background := RectangleMorph new openInWorld.
	keyBinding := KeyBinding new.
	keyBinding handleAllEvents.
	keyBinding onDownDo: [pushedAButton := true].
	keyHandler := KeyHandler new.
	keyHandler addBinding: keyBinding as: #anything.
	background registerKeyHandler: keyHandler.
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