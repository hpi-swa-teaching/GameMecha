*GameMecha-Keys
handlesKeyboard: evt
	^self isWorldMorph or:[evt keyCharacter == Character tab and:[self tabAmongFields]]or:[self eventHandler notNil].