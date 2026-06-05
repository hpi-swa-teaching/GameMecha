game logic
checkPosition

	| farAwayDistance |
	
	farAwayDistance := 900px.
	(self center - self game center) r abs > farAwayDistance ifTrue: [self game deleteQueue add: self]