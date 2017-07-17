keys
stringFromKeyCode: keyCode
	"Mapping for control characters ascii values to their names"
	^{
	18 -> #keyAlt.
	17 -> 'Control'.
	16 -> 'Shift'.
	32 -> 'Space'.
	9 -> 'Tab'.
	8 -> 'Backspace'.
	127 -> 'Delete'.
	20 -> 'Capslock'.
	13 -> 'Enter'.
	27 -> 'Escape'.
	28 -> 'Arrow Left'.
	29 -> 'Arrow Right'.
	30 -> 'Arrow Up'.
	31 -> 'Arrow Down'.
	} asDictionary at: keyCode ifAbsent: [keyCode asCharacter asString ].