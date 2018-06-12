as yet unclassified
storeChecks: checks
	self cleanup.
	self class compile: (String streamContents: [:str |
		str nextPutAll: 'collisionSelectors ^ {'.
		checks
			do: [:check |
				str nextPutAll: '#testAcceptance'. check hash storeOn: str. str nextPut: $..
				self compile: 'testAcceptance', check hash, ' ', check].
		str nextPut: $}]).