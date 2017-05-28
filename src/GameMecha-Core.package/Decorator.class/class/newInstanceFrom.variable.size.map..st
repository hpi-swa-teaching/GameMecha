as yet unclassified
newInstanceFrom: oldInstance variable: variable size: instSize map: map
	^ self wrap: (oldInstance wrappedObject class newInstanceFrom: oldInstance variable: variable size: instSize map: map).