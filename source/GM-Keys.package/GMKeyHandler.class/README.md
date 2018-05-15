A GmKeyHandler can be registered in a Morph by calling gmRegisterToKeyHandler in a Morph subclass. 
Then a morph can request whether a key is pressed using 
Morph >> isKeyPressed: aKey. aKey is a character.
Supported characters: [a-z][0-9][cr, tab, space, backspace, escape, arrowLeft, arrowRight, arrowUp, arrowDown].