Class {
	#name : #GMTEStaticCoordinateMatrix,
	#superclass : #Matrix,
	#instVars : [
		'coordinateSystem'
	],
	#category : #'GameMecha-TileEditor'
}

{
	#category : #private,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/8/2024 21:22'
}
GMTEStaticCoordinateMatrix class >> rows: aNumber1 columns: aNumber2 [

	| newMatrix |
	newMatrix := super rows: aNumber1 columns: aNumber2.
	^ newMatrix coordinateSystem: (GMTECoordinateSystem 
		width: newMatrix columnCount 
		height: newMatrix rowCount)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:41'
}
GMTEStaticCoordinateMatrix >> coordinateSystem [

	^ coordinateSystem
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/22/2024 01:15'
}
GMTEStaticCoordinateMatrix >> coordinateSystem: anObject [

	coordinateSystem := anObject
]

{
	#category : #navigating,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:41'
}
GMTEStaticCoordinateMatrix >> getAtCoordinate: aCoordinate [
	"Given a point relative to the coordinate system origin (center of matrix) return the value stored in the matrix at that point"

	| correctedPos |
	correctedPos := self coordinateSystem virtualToPos: aCoordinate.
	^ self at: correctedPos y at: correctedPos x
]

{
	#category : #asserting,
	#'squeak_changestamp' : 'jj 6/23/2024 13:47'
}
GMTEStaticCoordinateMatrix >> validIndex: aPoint [

	(aPoint y between: 1 and: self rowCount) ifFalse: [^false].
	(aPoint x between: 1 and: self columnCount) ifFalse: [^false].
	^ true
]
