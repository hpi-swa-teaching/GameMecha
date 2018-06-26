initialization
initializeKeyMorphs
	self class testedKeys do: [:testedKey |
		self keyMorphs add: (GMKeyHandlerAcceptanceTestKeyMorph new
			label: testedKey first;
			listenToKey: testedKey second;
			parent: self;
			yourself)].
	self keyMorphs do: [:keyMorph | self addMorph: keyMorph].