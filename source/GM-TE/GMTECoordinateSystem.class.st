Class {
	#name : #GMTECoordinateSystem,
	#superclass : #Object,
	#instVars : [
		'width',
		'height',
		'origin',
		'definitionArea',
		'valueArea'
	],
	#category : #'GM-TE-Math'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:43'
}
GMTECoordinateSystem class >> width: aWidth height: aHeight [
	"comment stating purpose of message"

	| newCoordinateSystem |
	newCoordinateSystem := self new.
	
	^ newCoordinateSystem
		width: aWidth;
		height: aHeight;
		origin: ((aWidth / 2) ceiling)@((aHeight / 2) ceiling);
		definitionArea: (Interval 
			from: newCoordinateSystem origin x negated + 1
			 to: aWidth - newCoordinateSystem origin x);
		valueArea: (Interval
			from: newCoordinateSystem origin y negated + 1
			to: aHeight - newCoordinateSystem origin y)
]

{
	#category : #conversion,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:40'
}
GMTECoordinateSystem >> aspectRatio [

	^ self width / self height
]

{
	#category : #assertion,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:42'
}
GMTECoordinateSystem >> containsPos: aPoint [
	"Check if point (relative to screen origin) is captured by coordinate system"

	^ ((Interval from: 1 to: self width) includes: aPoint x) and: [(Interval from: 1 to: self height) includes: aPoint y]
]

{
	#category : #assertion,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:42'
}
GMTECoordinateSystem >> containsVirtual: aPoint [
	"Check if point (relative to coordinate system origin) is captured by coordinate system"

	^ (self definitionArea includes: aPoint x) and: [self valueArea includes: aPoint y]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:39'
}
GMTECoordinateSystem >> definitionArea [

	^ definitionArea
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:39'
}
GMTECoordinateSystem >> definitionArea: anObject [

	definitionArea := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:39'
}
GMTECoordinateSystem >> height [

	^ height
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:39'
}
GMTECoordinateSystem >> height: anObject [

	height := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:39'
}
GMTECoordinateSystem >> origin [

	^ origin
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:39'
}
GMTECoordinateSystem >> origin: anObject [

	origin := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:39'
}
GMTECoordinateSystem >> valueArea [

	^ valueArea
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:39'
}
GMTECoordinateSystem >> valueArea: anObject [

	valueArea := anObject.
]

{
	#category : #conversion,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:42'
}
GMTECoordinateSystem >> virtualToPos: aPoint [
	"Translate point relativ to coordinate system origin to point relative to screen origin"

	| resultPoint |
	resultPoint := self origin + aPoint.
	self assert: [self containsPos: resultPoint] description: 'coordinate out of bounds'.
	^ resultPoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:39'
}
GMTECoordinateSystem >> width [

	^ width
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:39'
}
GMTECoordinateSystem >> width: anObject [

	width := anObject.
]
