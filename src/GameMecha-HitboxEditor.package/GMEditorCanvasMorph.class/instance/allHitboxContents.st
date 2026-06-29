accessing
allHitboxContents

	| containers |
	containers := self viewport submorphs collect: [:m | self containerFor: m].
	containers := containers select: [:c | c notNil].
	^ containers collect: [:c | c content]