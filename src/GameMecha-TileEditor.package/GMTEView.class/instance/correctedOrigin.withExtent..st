conversion
correctedOrigin: anOrigin withExtent: anExtent

	| newX newY |
	"Assuming: (0, 0) <= anExtent <= (1, 1)"
	newX := anOrigin x.
	newY := anOrigin y.
	
	(newX < 0) ifTrue: [newX := 0].	
	(newX + anExtent x > 1) ifTrue: [newX := 1 - anExtent x].

	(newY < 0) ifTrue: [newY := 0].	
	(newY + anExtent y > 1) ifTrue: [newY := 1 - anExtent y].
	
	^ newX @ newY