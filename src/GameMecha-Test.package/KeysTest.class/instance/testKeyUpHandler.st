basic
testKeyUpHandler
	| keyboard counter|
	keyboard := Keyboard new.
	counter := 0.
	keyboard registerKeyUp: [counter := counter +1.] for: 'a' asCharacter .
	self assert: counter equals: 0.
	
	keyboard onKeyDown: ((KeyboardEvent new) keyValue: 'a').
	self assert: counter equals: 0.
	
	keyboard onKeyUp: ((KeyboardEvent new) keyValue: 'a').
	self assert: counter equals: 1.

