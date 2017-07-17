keys
inputFromKeyCode: keyCode
	"Mapping for control characters ascii values to their methods names"
	^{
	18 -> #keyAlt.
	17 -> #keyControl.
	16 -> #keyShift.
	32 -> #keySpace.
	9 -> #keyTab.
	8 -> #keyBackspace.
	127 -> #keyDelete.
	20 -> #keyCapslock.
	13 -> #keyEnter.
	27 -> #keyEscape.
	28 -> #keyArrowLeft.
	29 -> #keyArrowRight.
	30 -> #keyArrowUp.
	31 -> #keyArrowDown.
	} asDictionary at: keyCode ifAbsent: [keyCode asCharacter asString ].