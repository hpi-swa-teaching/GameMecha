A GmKeyHandler can be registered in a Morph by calling gmRegisterToKeyHandler in a Morph subclass. 
Then a morph can request whether a key is pressed using 
Morph >> isKeyPressed: aKey. aKey is a character.
As a second option it is possible to register a block or a method to a specific key. Afterwards when you send gmEvaluateRegisteredEvents (e.g. from a step method of a Morph) and the specific key is pressed the block/method registered for that key is executed.
Supported characters: [a-z][0-9][cr, tab, space, backspace, escape, arrowLeft, arrowRight, arrowUp, arrowDown] (see the initializeKeyLookupXXX methods on class side).