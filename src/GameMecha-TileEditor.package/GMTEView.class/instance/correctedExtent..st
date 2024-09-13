conversion
correctedExtent: anExtent
	
	| newX newY |
	newX := (anExtent x min: 1) max: GMTEView minExtentValue.
	newY := (anExtent y min: 1) max: GMTEView minExtentValue.
	
	^ newX @ newY.