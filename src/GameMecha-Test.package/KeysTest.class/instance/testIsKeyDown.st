basic
testIsKeyDown
	| keyboard |
	keyboard := Keyboard new.
	self deny: (keyboard isKeyDown: 'a' ).
	self deny: (keyboard isKeyDown: 'A' ).
	keyboard onKeyDown: ((KeyboardEvent new) keyValue: 'a').
	self assert: (keyboard isKeyDown: 'a').
	self assert: (keyboard isKeyDown: 'A').
      keyboard onKeyUp: ((KeyboardEvent new) keyValue: 'a').
	self deny: (keyboard isKeyDown: 'a' ).
	
	keyboard onKeyDown: ((KeyboardEvent new) keyValue: 'A').
	self assert: (keyboard isKeyDown: 'a').