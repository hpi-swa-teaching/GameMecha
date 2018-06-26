*GM-Core
isKeyPressed: aCharacter
	self flag: #todo.
	self eventHandler isGMKeyHandler ifTrue: [^ self eventHandler isKeyPressed: aCharacter]
	