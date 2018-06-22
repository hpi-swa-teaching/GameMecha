stepping and presenter
step
	"demoGame can call isKeyPressed: aCharacter only after it has registered to the key handler during initialization"
	(self isKeyPressed: self class resetKey) ifTrue: [self resetPlayers].