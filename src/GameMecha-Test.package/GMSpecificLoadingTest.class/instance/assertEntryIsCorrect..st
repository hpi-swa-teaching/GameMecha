testing
assertEntryIsCorrect: aString
	self assert: [self resourceManager cache includesKey: aString].
	self assertRessourceType: [self resourceManager at: aString].