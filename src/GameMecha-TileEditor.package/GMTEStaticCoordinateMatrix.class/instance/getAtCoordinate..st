navigating
getAtCoordinate: aCoordinate
	"Given a point relative to the coordinate system origin (center of matrix) return the value stored in the matrix at that point"

	| correctedPos |
	correctedPos := self coordinateSystem virtualToPos: aCoordinate.
	^ self at: correctedPos y at: correctedPos x