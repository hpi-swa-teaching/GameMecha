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
	#category : #'GM-TE-UI'
}

{
	#category : #forms,
	#'squeak_changestamp' : 'JS 7/11/2024 15:40'
}
GMTEBrush >> calculateOffsetsForRadius: aRadius [
    	
	|offsets|
	offsets := OrderedCollection new.
    	(0-radius to: radius) do: [:dx |
        	(0-radius to: radius) do: [:dy |
            	((dx squared + dy squared) <= aRadius squared) ifTrue: [offsets add: dx @ dy]]].

	^offsets
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/6/2024 12:48'
}
GMTEBrush >> currentBrush [
	^ currentBrush
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/6/2024 12:48'
}
GMTEBrush >> currentBrush: anObject [
	currentBrush := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/9/2024 08:47'
}
GMTEBrush >> currentMatrixIndex [
	^ currentMatrixIndex
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/9/2024 08:47'
}
GMTEBrush >> currentMatrixIndex: anObject [
	currentMatrixIndex := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JS 7/11/2024 13:59'
}
GMTEBrush >> executeWithMatrixIndex: anIndex andLayer: aLayer [

	self currentMatrixIndex: anIndex.
	self layer: aLayer.
	^ self currentBrush value
]

{
	#category : #forms,
	#'squeak_changestamp' : 'JS 7/11/2024 14:07'
}
GMTEBrush >> fillBrush [

	| collection startTile visited |
	self resetOutputSet.
	self currentMatrixIndex ifNil: [^nil].
	
	visited := Matrix rows: (self layer rowCount) columns: self layer columnCount.
    	collection := OrderedCollection new.
	startTile := self layer at: self currentMatrixIndex y at: self currentMatrixIndex x.
	
	collection add: self currentMatrixIndex.
	visited at: self currentMatrixIndex y at: self currentMatrixIndex x put: true.
	
	self fillDfsWithVisited: visited andIndex: self currentMatrixIndex andOriginTile: startTile andCollection: collection.
	self outputSet: collection asSet.

    ^ self outputSet
]

{
	#category : #forms,
	#'squeak_changestamp' : 'JS 7/11/2024 13:58'
}
GMTEBrush >> fillDfsWithVisited: aVisitedMatrix andIndex: anIndex andOriginTile: anOriginTile andCollection: aCollection [

	| borderingOffsets |
	self flag: 'REFACTOR!'.
	borderingOffsets := {(-1)@0. 0@(-1). 1@0. 0@1}.
	borderingOffsets do: [:offset |
		| newIndex newTile |
		newIndex := offset + anIndex.
		((self layer inBounds: newIndex) and: [(aVisitedMatrix at: newIndex y at: newIndex x) isNil]) ifTrue:[
			newTile := self layer at: newIndex y at: newIndex x.
			anOriginTile
				ifNil: [newTile ifNil: [aCollection add: newIndex.
					aVisitedMatrix at: newIndex y at: newIndex x put: true.
					self fillDfsWithVisited: aVisitedMatrix andIndex: newIndex andOriginTile: anOriginTile andCollection: aCollection]]
				ifNotNil: [
					(newTile isNil not and: [anOriginTile imageForm bits hash = newTile imageForm bits hash]) ifTrue: [
						aCollection add: newIndex.
						aVisitedMatrix at: newIndex y at: newIndex x put: true.
						self fillDfsWithVisited: aVisitedMatrix andIndex: newIndex andOriginTile: anOriginTile andCollection: aCollection]]]]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/9/2024 08:49'
}
GMTEBrush >> firstMatrixIndex [
	^ firstMatrixIndex
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/9/2024 08:49'
}
GMTEBrush >> firstMatrixIndex: anObject [
	firstMatrixIndex := anObject
]

{
	#category : #forms,
	#'squeak_changestamp' : 'JS 7/11/2024 13:59'
}
GMTEBrush >> initialize [

	super initialize.
	self resetOutputSet
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/6/2024 14:51'
}
GMTEBrush >> layer [
	^ layer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/6/2024 14:51'
}
GMTEBrush >> layer: anObject [
	layer := anObject
]

{
	#category : #forms,
	#'squeak_changestamp' : 'JS 7/11/2024 16:16'
}
GMTEBrush >> lineBrush [

    	| offsets |
	self resetOutputSet.
	(self currentMatrixIndex isNil or: [self firstMatrixIndex isNil]) ifTrue: [^nil].
	
    	offsets := self calculateOffsetsForRadius: self offsetCorrectedRadius.
	
	(self rasterizeLineBetweenAStart: self firstMatrixIndex andAnEnd: self currentMatrixIndex) do: [:point |
		offsets do: [:offset | 
			self outputSet add: (point + offset)]].

	^(self outputSet)

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
	#'squeak_changestamp' : 'Valentin Teutschbein 7/9/2024 21:18'
}
GMTEBrush >> outputSet [
	^ outputSet
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/9/2024 21:18'
}
GMTEBrush >> outputSet: anObject [
	outputSet := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/6/2024 12:48'
}
GMTEBrush >> radius [
	^ radius
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/9/2024 22:08'
}
GMTEBrush >> radius: anObject [
	radius := anObject
]

{
	#category : #forms,
	#'squeak_changestamp' : 'JS 7/11/2024 16:14'
}
GMTEBrush >> radiusBrush [

    	| offsets |
    	self currentMatrixIndex ifNil: [^nil].

	offsets := self calculateOffsetsForRadius: self offsetCorrectedRadius.

	offsets do: [:i | 
		self outputSet add: (self currentMatrixIndex + i)].

    ^ self outputSet

]

{
	#category : #forms,
	#'squeak_changestamp' : 'JS 7/11/2024 16:16'
}
GMTEBrush >> rasterizeLineBetweenAStart: aStartPoint andAnEnd: anEndPoint [
	"implementation of Bresenhams Line Algorithm"
	
	| collection deltaX deltaY stepX stepY error error2 x y |
	
	self flag: 'todo: method extraction? - Ich glaube geht schlecht'.
	
    	deltaX := (anEndPoint x - aStartPoint x) abs.
    	deltaY := (anEndPoint y - aStartPoint y) abs.
    	stepX := (aStartPoint x < anEndPoint x) ifTrue: [1] ifFalse: [-1].
    	stepY := (aStartPoint y < anEndPoint y) ifTrue: [1] ifFalse: [-1].
    	error := deltaX - deltaY.
    	x := aStartPoint x.
    	y := aStartPoint y.

    	collection := OrderedCollection new.

    	[
        	| point |
        	point := x @ y.
		collection add: point.
        	(x = anEndPoint x and: [y = anEndPoint y]) ifTrue: [
			^collection].
        	error2 := 2 * error.
        	(error2 > (0 - deltaY)) ifTrue: [
            	error := error - deltaY.
            	x := x + stepX].
        	(error2 < deltaX) ifTrue: [
            	error := error + deltaX.
            	y := y + stepY]
    	] repeat

]

{
	#category : #forms,
	#'squeak_changestamp' : 'JS 7/11/2024 16:29'
}
GMTEBrush >> rectangleBrush [

	self resetOutputSet.
    	(self currentMatrixIndex isNil or: [self firstMatrixIndex isNil]) ifTrue: [^nil].

	self flag: 'besser machen?'.
    	(self currentMatrixIndex x min: self firstMatrixIndex x) to: (self currentMatrixIndex x max: self firstMatrixIndex x) do: [:row |
        	(self currentMatrixIndex y min: self firstMatrixIndex y) to: (self currentMatrixIndex y max: self firstMatrixIndex y) do: [:col | 
			self outputSet add: (row @ col)]].

    ^ self outputSet

]

{
	#category : #select,
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
