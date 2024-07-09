Class {
	#name : #GMTEBrush,
	#superclass : #Object,
	#instVars : [
		'currentBrush',
		'radius',
		'layer',
		'currentMatrixIndex',
		'firstMatrixIndex'
	],
	#category : #'GM-TE-UI'
}

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
	#'squeak_changestamp' : 'Valentin Teutschbein 7/9/2024 08:47'
}
GMTEBrush >> executeWithMatrixIndex: anIndex andLayer: aLayer [

	self currentMatrixIndex: anIndex.
	self layer: aLayer.
	^ self currentBrush value.
]

{
	#category : #forms,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/9/2024 08:47'
}
GMTEBrush >> fillBrush [

	| collection startTile visited |
	self currentMatrixIndex ifNil: [^nil].
	
	visited := Matrix rows: (self layer rowCount) columns: self layer columnCount.
    	collection := OrderedCollection new.
	startTile := layer at: self currentMatrixIndex y at: self currentMatrixIndex x.
	
	collection add: currentMatrixIndex.
	visited at: self currentMatrixIndex y at: self currentMatrixIndex x put: true.
	
	self fillDfsWithVisited: visited andIndex: self currentMatrixIndex andOriginTile: startTile andCollection: collection.

	^ collection

]

{
	#category : #forms,
	#'squeak_changestamp' : 'JS 7/6/2024 16:46'
}
GMTEBrush >> fillDfsWithVisited: aVisitedMatrix andIndex: anIndex andOriginTile: anOriginTile andCollection: aCollection [

	| borderingOffsets |
	self flag: 'REFACTOR!'.
	borderingOffsets := {(-1)@0. 0@(-1). 1@0. 0@1}.
	borderingOffsets do: [: offset|
		| newIndex newTile |
		newIndex := offset + anIndex.
		((self layer inBounds: newIndex) and: [(aVisitedMatrix at: newIndex y at: newIndex x) isNil]) ifTrue:[
			newTile := self layer at: newIndex y at: newIndex x.
			anOriginTile
				ifNil: [newTile ifNil: [aCollection add: newIndex.
					aVisitedMatrix at: newIndex y at: newIndex x put: true.
					self fillDfsWithVisited: aVisitedMatrix andIndex: newIndex andOriginTile: anOriginTile andCollection: aCollection]]
				ifNotNil: [
					(newTile isNil not and: [anOriginTile imageForm bits hash = newTile imageForm bits hash])
						ifTrue: [aCollection add: newIndex.
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
	#category : #accessing,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/6/2024 12:48'
}
GMTEBrush >> radius [
	^ radius
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/6/2024 12:48'
}
GMTEBrush >> radius: anObject [
	radius := anObject
]

{
	#category : #forms,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/9/2024 09:01'
}
GMTEBrush >> radiusBrush [

    | collection xMin xMax yMin yMax |
    self currentMatrixIndex ifNil: [^nil].

    collection := OrderedCollection new.

    xMin :=  self currentMatrixIndex x - self radius.
    xMax :=  self currentMatrixIndex x + self radius.
    yMin :=  self currentMatrixIndex y - self radius.
    yMax :=  self currentMatrixIndex y + self radius.

    (xMin to: xMax) do: [:x |
        (yMin to: yMax) do: [:y |
            (( self currentMatrixIndex x - x) squared + ( self currentMatrixIndex y - y) squared <= self radius squared) ifTrue: [
                collection add: x@y
            ].
        ].
    ].

    ^collection

]

{
	#category : #forms,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/9/2024 09:09'
}
GMTEBrush >> rectangleBrush [

    | collection startRow endRow startCol endCol |
    (self currentMatrixIndex isNil or: [self firstMatrixIndex isNil]) ifTrue: [^nil].
    collection := OrderedCollection new.

    "Determine the starting and ending rows and columns"

    startRow := (self currentMatrixIndex x min: self firstMatrixIndex x).
    endRow := (self currentMatrixIndex x max: self firstMatrixIndex x).
    startCol := (self currentMatrixIndex y min: self firstMatrixIndex y).
    endCol := (self currentMatrixIndex y max: self firstMatrixIndex y).

    "Fill the collection with all indices within the rectangle"
    startRow to: endRow do: [:row |
        startCol to: endCol do: [:col |
            collection add: (row@col)
        ].
    ].

    ^ collection

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
	#'squeak_changestamp' : 'Valentin Teutschbein 7/6/2024 13:16'
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
