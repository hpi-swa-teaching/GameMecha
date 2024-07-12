"
A GMTEBrush is responsible for returning a set of indices that are selected by the user and selecting the interchangeable algorithm for the execution.
"
Class {
	#name : #GMTEBrush,
	#superclass : #Object,
	#instVars : [
		'currentBrush',
		'radius',
		'layer',
		'currentMatrixIndex',
		'firstMatrixIndex',
		'outputSet'
	],
	#category : #'GM-TE-UI',
	#'squeak_changestamp' : 'Valentin Teutschbein 7/12/2024 13:49'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Valentin Teutschbein 7/11/2024 17:01'
}
GMTEBrush class >> borderingOffsets [

	^ {(-1)@0. 0@(-1). 1@0. 0@1}
]

{
	#category : #brushHelper,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/12/2024 14:03'
}
GMTEBrush >> calculateOffsetsForRadius: aRadius [
    	
	|offsets|
	offsets := OrderedCollection new.
    	(0-self radius to: self radius) do: [:dx |
        	(0-self radius to: self radius) do: [:dy |
            	((dx squared + dy squared) <= aRadius squared) ifTrue: [offsets add: dx @ dy]]].

	^ offsets
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/12/2024 13:40'
}
GMTEBrush >> currentBrush [

	^ currentBrush
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 7/12/2024 21:20'
}
GMTEBrush >> currentBrush: anObject [

	currentBrush := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/12/2024 13:41'
}
GMTEBrush >> currentMatrixIndex [

	^ currentMatrixIndex
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 7/12/2024 21:20'
}
GMTEBrush >> currentMatrixIndex: anObject [

	currentMatrixIndex := anObject
]

{
	#category : #execute,
	#'squeak_changestamp' : 'JS 7/12/2024 16:50'
}
GMTEBrush >> executeWithIndex: anIndex andLayer: aLayer [

	anIndex ifNil: [^ nil].
	self currentMatrixIndex: anIndex.
	self layer: aLayer.
	^ self currentBrush value
]

{
	#category : #brushes,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/12/2024 13:26'
}
GMTEBrush >> fillBrush [

	| startTile visited |
	self resetOutputSet.
	
	visited := Matrix rows: (self layer rowCount) columns: self layer columnCount.
	startTile := self layer at: self currentMatrixIndex y at: self currentMatrixIndex x.
	
	self outputSet add: self currentMatrixIndex.
	visited at: self currentMatrixIndex y at: self currentMatrixIndex x put: true.
	
	self fillDfsWithVisited: visited andIndex: self currentMatrixIndex andOriginTile: startTile.

    ^ self outputSet
]

{
	#category : #brushHelper,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/12/2024 13:32'
}
GMTEBrush >> fillDfsWithVisited: aVisitedMatrix andIndex: anIndex andOriginTile: anOriginTile [

	| newIndex newTile |
	GMTEBrush borderingOffsets do: [:offset |
		newIndex := offset + anIndex.
		((self layer inBounds: newIndex) and: [(aVisitedMatrix at: newIndex y at: newIndex x) isNil]) ifTrue:[
			newTile := self layer at: newIndex y at: newIndex x.
			
			(self tile: anOriginTile equalsTile: newTile) ifTrue: [
					self outputSet add: newIndex.
					aVisitedMatrix at: newIndex y at: newIndex x put: true.
					self fillDfsWithVisited: aVisitedMatrix andIndex: newIndex andOriginTile: anOriginTile]]]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/12/2024 13:41'
}
GMTEBrush >> firstMatrixIndex [

	^ firstMatrixIndex
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 7/12/2024 21:20'
}
GMTEBrush >> firstMatrixIndex: anObject [

	firstMatrixIndex := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JS 7/11/2024 13:59'
}
GMTEBrush >> initialize [

	super initialize.
	self resetOutputSet
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/12/2024 13:42'
}
GMTEBrush >> layer [

	^ layer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 7/12/2024 21:20'
}
GMTEBrush >> layer: anObject [

	layer := anObject
]

{
	#category : #brushes,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/12/2024 13:53'
}
GMTEBrush >> lineBrush [

	self resetOutputSet.
	self firstMatrixIndex ifNil: [^ nil].

	(self rasterizeLineBetweenStart: self firstMatrixIndex andEnd: self currentMatrixIndex) do: [:index |
		(self calculateOffsetsForRadius: self offsetCorrectedRadius) do: [:offset | 
			self outputSet add: (index + offset)]].

	^ self outputSet

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 7/11/2024 16:16'
}
GMTEBrush >> offsetCorrectedRadius [
	"In order to display a more intuitive radius for the user, we need to offset it by 1 for the calculations"

	^ self radius - 1
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/12/2024 13:43'
}
GMTEBrush >> outputSet [

	^ outputSet
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 7/12/2024 21:20'
}
GMTEBrush >> outputSet: anObject [

	outputSet := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/11/2024 17:11'
}
GMTEBrush >> radius [

	^ radius
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 7/12/2024 21:20'
}
GMTEBrush >> radius: anObject [

	radius := anObject
]

{
	#category : #brushes,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/11/2024 17:09'
}
GMTEBrush >> radiusBrush [

	(self calculateOffsetsForRadius: self offsetCorrectedRadius) do: [:i | 
		self outputSet add: (self currentMatrixIndex + i)].

    ^ self outputSet

]

{
	#category : #brushHelper,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/12/2024 13:52'
}
GMTEBrush >> rasterizeLineBetweenStart: aStartIndex andEnd: anEndIndex [
	"implementation of Bresenhams Line Algorithm"
	
	| lineIndexCollection deltaX deltaY stepX stepY error error2 x y index |
	
	self flag: 'repeat formatting'.
	
    	deltaX := (anEndIndex x - aStartIndex x) abs.
    	deltaY := (anEndIndex y - aStartIndex y) abs.
    	stepX := (aStartIndex x < anEndIndex x) ifTrue: [1] ifFalse: [-1].
    	stepY := (aStartIndex y < anEndIndex y) ifTrue: [1] ifFalse: [-1].
    	error := deltaX - deltaY.
    	x := aStartIndex x.
    	y := aStartIndex y.

    	lineIndexCollection := OrderedCollection new.

    	[	index := x @ y.
		lineIndexCollection add: index.
        	(x = anEndIndex x and: [y = anEndIndex y]) ifTrue: [^ lineIndexCollection].
        	error2 := 2 * error.
        	(error2 > (0 - deltaY)) ifTrue: [
            	error := error - deltaY.
            	x := x + stepX].
        	(error2 < deltaX) ifTrue: [
            	error := error + deltaX.
            	y := y + stepY]] repeat

]

{
	#category : #brushes,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/12/2024 13:57'
}
GMTEBrush >> rectangleBrush [

	| endCol endRow startCol startRow |
	self resetOutputSet.
    	self firstMatrixIndex ifNil: [^ nil].

	startRow := (self currentMatrixIndex x min: self firstMatrixIndex x).
	endRow := (self currentMatrixIndex x max: self firstMatrixIndex x).
	startCol := (self currentMatrixIndex y min: self firstMatrixIndex y).
	endCol := (self currentMatrixIndex y max: self firstMatrixIndex y).

	startRow to: endRow do: [:row |
 		startCol to: endCol do: [:col |
			self outputSet add: (row@col)]].

    ^ self outputSet

]

{
	#category : #brushHelper,
	#'squeak_changestamp' : 'JS 7/11/2024 13:43'
}
GMTEBrush >> resetOutputSet [

	self outputSet: Set new
]

{
	#category : #select,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/6/2024 15:47'
}
GMTEBrush >> selectFillBrush [

	self currentBrush: [self fillBrush]
]

{
	#category : #select,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/9/2024 22:27'
}
GMTEBrush >> selectLineBrush [

	self currentBrush: [self lineBrush]
]

{
	#category : #select,
	#'squeak_changestamp' : 'TW 7/9/2024 19:18'
}
GMTEBrush >> selectRadiusBrush [

	self currentBrush: [self radiusBrush]
]

{
	#category : #select,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/9/2024 08:55'
}
GMTEBrush >> selectRectangleBrush [

	self currentBrush: [self rectangleBrush]
]

{
	#category : #brushHelper,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/12/2024 13:31'
}
GMTEBrush >> tile: aTile equalsTile: anotherTile [
	
	| tilesNil tilesSame |
	tilesNil := (aTile isNil) and: [anotherTile isNil].
	tilesSame := (aTile isNil not and: [anotherTile isNil not]) and: [aTile imageForm bits hash = anotherTile imageForm bits hash].
	
	^ (tilesNil or: [tilesSame])
]
