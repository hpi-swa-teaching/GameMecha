basic
testKeyDownHandler
	| keyboard counter|
	keyboard := Keyboard new.
	counter := 0.
	keyboard registerKeyDown: [counter := counter +1.] for: 'a' asCharacter .
	self assert: counter equals: 0.
	keyboard onKeyDown: ((KeyboardEvent new) keyValue: 'a').
	self assert: counter equals: 1.
	keyboard registerKeyDown: [counter := counter +1.] for: 'a' asCharacter .
	keyboard onKeyDown: ((KeyboardEvent new) keyValue: 'a').
	self assert: counter equals: 3.

