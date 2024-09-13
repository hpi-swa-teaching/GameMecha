"
A GMCollisionDetectionShape is an abstract class which provides an interface for different CollisionDetectionStrategies. Each CollisionDetectionStrategy implements collision detection behavior for a specific shape
"
Class {
	#name : #GMCollisionDetectionShape,
	#superclass : #Object,
	#instVars : [
		'owner'
	],
	#category : #'GameMecha-Collisions',
	#'squeak_changestamp' : 'NK 7/24/2018 15:54'
}

{
	#category : #collision,
	#'squeak_changestamp' : 'AZ 5/15/2018 20:43'
}
GMCollisionDetectionShape >> isCollidingWith: aMorph [
	self subclassResponsibility.
]

{
	#category : #collision,
	#'squeak_changestamp' : 'AZ 5/15/2018 20:43'
}
GMCollisionDetectionShape >> isCollidingWithCircle: aMorph [
	self subclassResponsibility.
]

{
	#category : #collision,
	#'squeak_changestamp' : 'AZ 5/15/2018 20:43'
}
GMCollisionDetectionShape >> isCollidingWithRectangle: aMorph [
	self subclassResponsibility.
]

{
	#category : #collision,
	#'squeak_changestamp' : 'AZ 5/22/2018 21:30'
}
GMCollisionDetectionShape >> isCollidingWithRotatedRectangle: aMorph [
	self subclassResponsibility.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 5/15/2018 21:44'
}
GMCollisionDetectionShape >> owner [
	^ owner
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 5/15/2018 21:44'
}
GMCollisionDetectionShape >> owner: anObject [
	owner := anObject
]

{
	#category : #printing,
	#'squeak_changestamp' : 'brh 7/15/2018 14:32'
}
GMCollisionDetectionShape >> storeOn: aStream [
	self class storeOn: aStream.
	aStream nextPutAll: ' new'.
]
