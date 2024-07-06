Class {
	#name : #GMTEBrush,
	#superclass : #Object,
	#instVars : [
		'currentBrush',
		'radius',
		'startMatrixIndex'
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
	#'squeak_changestamp' : 'Valentin Teutschbein 7/6/2024 13:17'
}
GMTEBrush >> executeWithMatrixIndex: anIndex [

	self startMatrixIndex: anIndex.
	^ self currentBrush value.
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
