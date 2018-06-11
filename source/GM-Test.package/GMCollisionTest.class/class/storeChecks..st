as yet unclassified
storeChecks: checks
	self cleanup.
	self compile: (String streamContents: [:str |
		str nextPutAll: 'collisionSelectors ^ {'.
		checks
			do: [:check |
				str nextPutAll: '#testAcceptance'. check collisionScenario hash storeOn: str. str nextPut: $..
				self compile: 'testAcceptance', check collisionScenario hash, ' ', check collisionScenario].
		str nextPut: $}]).