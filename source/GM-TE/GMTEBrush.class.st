Class {
	#name : #GMTEBrush,
	#superclass : #Object,
	#instVars : [
		'currentBrush',
		'radius',
		'firstMatrixIndex',
		'startMatrixIndex',
		'layer'
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Valentin Teutschbein 7/6/2024 14:55'
}
GMTEBrush >> executeWithMatrixIndex: anIndex andLayer: aLayer [

	self startMatrixIndex: anIndex.
	self layer: aLayer.
	^ self currentBrush value.
]

{
	#category : #forms,
	#'squeak_changestamp' : 'JS 7/6/2024 16:46'
}
GMTEBrush >> fillBrush [

	| collection startTile visited |
	self startMatrixIndex ifNil: [^nil].
	
	visited := Matrix rows: (self layer rowCount) columns: self layer columnCount.
    	collection := OrderedCollection new.
	startTile := layer at: self startMatrixIndex y at: self startMatrixIndex x.
	
	collection add: startMatrixIndex.
	visited at: self startMatrixIndex y at: self startMatrixIndex x put: true.
	
	self fillDfsWithVisited: visited andIndex: self startMatrixIndex andOriginTile: startTile andCollection: collection.

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
	#'squeak_changestamp' : 'Valentin Teutschbein 7/6/2024 12:50'
}
GMTEBrush >> radiusBrush [

    | collection xMin xMax yMin yMax |
    self startMatrixIndex ifNil: [^nil].

    collection := OrderedCollection new.

    xMin :=  self startMatrixIndex x - self radius.
    xMax :=  self startMatrixIndex x + self radius.
    yMin :=  self startMatrixIndex y - self radius.
    yMax :=  self startMatrixIndex y + self radius.

    (xMin to: xMax) do: [:x |
        (yMin to: yMax) do: [:y |
            (( self startMatrixIndex x - x) squared + ( self startMatrixIndex y - y) squared <= self radius squared) ifTrue: [
                collection add: (x@y)
            ].
        ].
    ].

    ^collection

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
	#category : #accessing,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/6/2024 12:48'
}
GMTEBrush >> startMatrixIndex [
	^ startMatrixIndex
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/6/2024 12:48'
}
GMTEBrush >> startMatrixIndex: anObject [
	startMatrixIndex := anObject
]
