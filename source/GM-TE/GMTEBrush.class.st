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
	#'squeak_changestamp' : 'Valentin Teutschbein 7/6/2024 16:26'
}
GMTEBrush >> fillBrush [

    | collection startTile visited |
    self startMatrixIndex ifNil: [^nil].
	visited := Matrix rows: (self layer rowCount) columns: self layer columnCount.
    	collection := OrderedCollection new.
	startTile := layer at: self startMatrixIndex x at: self startMatrixIndex y.
	collection add: startMatrixIndex.
	visited at: self startMatrixIndex x at: self startMatrixIndex y put: true.
	self fillDfsWithVisited: visited andIndex: self startMatrixIndex andOriginTile: startTile andCollection: collection.

    ^ collection

]

{
	#category : #forms,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/6/2024 16:24'
}
GMTEBrush >> fillDfsWithVisited: aVisitedMatrix andIndex: anIndex andOriginTile: anOriginTile andCollection: aCollection [

	| borderingOffsets |
	self flag: 'REFACTOR!'.
	borderingOffsets := {(-1)@0. 0@(-1). 1@0. 0@1}.
	borderingOffsets do: [: offset|
		| newIndex newTile |
		newIndex := offset + anIndex.
		((self layer inBounds: newIndex) and: [(aVisitedMatrix at: newIndex x at: newIndex y) isNil]) ifTrue:[
			newTile := self layer at: newIndex x at: newIndex y.
			anOriginTile
				ifNil: [newTile ifNil: [aCollection add: newIndex.
					aVisitedMatrix at: newIndex x at: newIndex y put: true.
					self fillDfsWithVisited: aVisitedMatrix andIndex: newIndex andOriginTile: anOriginTile andCollection: aCollection]]
				ifNotNil: [
					(newTile isNil not and: [anOriginTile imageForm bits hash = newTile imageForm bits hash])
						ifTrue: [aCollection add: newTile.
							aVisitedMatrix at: newIndex x at: newIndex y put: true.
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
