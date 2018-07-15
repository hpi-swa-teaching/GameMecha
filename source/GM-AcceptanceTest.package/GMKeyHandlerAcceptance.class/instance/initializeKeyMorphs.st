initialization
initializeKeyMorphs
	self keyMorphs: (self class testedKeys collect: [:testedKey |
		GMKeyHandlerAcceptanceKeyMorph new
			label: testedKey first;
			listenToKey: testedKey second;
			parent: self;
			yourself]).
	self keyMorphs do: [:keyMorph | self addMorph: keyMorph].