basic
testIsKeyDown
	| keyboard |
	keyboard := Keyboard new.
	self deny: (keyboard isKeyDown: 'a' ).
	self deny: (keyboard isKeyDown: 'A' ).
	keyboard onKeyDown: (MockKeyboardEvent of: $a).
	self assert: (keyboard isKeyDown: 'a').
	self assert: (keyboard isKeyDown: 'A').
      keyboard onKeyUp: (MockKeyboardEvent of: $a).
	self deny: (keyboard isKeyDown: 'a' ).
	
	keyboard onKeyDown: (MockKeyboardEvent of: $A).
	self assert: (keyboard isKeyDown: 'a').