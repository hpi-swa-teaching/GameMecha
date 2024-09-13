"
This is a simple morph which can move, rotate and collide to be used as a test object in GMCollisionPerformanceTest.
The collision handling is implemented on a very rudimentary level and far away from physical correctness but good enough for performance testing.
"
Class {
	#name : #GMCollisionPerformanceTestEntity,
	#superclass : #Morph,
	#instVars : [
		'velocity',
		'parent'
	],
	#category : #'GameMecha-Examples',
	#'squeak_changestamp' : 'NK 7/25/2018 17:19'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'TP 6/12/2018 22:13'
}
GMCollisionPerformanceTestEntity class >> rotationSpeed [
	^ 0.2
]

{
	#category : #collision,
	#'squeak_changestamp' : 'AZ 7/15/2018 18:03'
}
GMCollisionPerformanceTestEntity >> handleEdgeCollision [
	(self owner right > self parent right or: [self owner left < self parent left])
		ifTrue: [self velocity: self velocity x negated @ self velocity y. self move].
	(self owner top < self parent top or: [self owner bottom > self parent bottom])
		ifTrue: [self velocity: self velocity x @ self velocity y negated. self move].
	
]

{
	#category : #movement,
	#'squeak_changestamp' : 'brh 7/24/2018 20:14'
}
GMCollisionPerformanceTestEntity >> move [
	self move: 1.0.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'AZ 7/15/2018 18:55'
}
GMCollisionPerformanceTestEntity >> move: aFactor [
	self owner center: self owner center + (self velocity * aFactor).
	self owner angle: self owner angle + (self class rotationSpeed * aFactor).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 7/15/2018 18:03'
}
GMCollisionPerformanceTestEntity >> parent [
	^ parent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 7/15/2018 18:03'
}
GMCollisionPerformanceTestEntity >> parent: anObject [
	parent := anObject
]

{
	#category : #collision,
	#'squeak_changestamp' : 'AZ 7/15/2018 18:03'
}
GMCollisionPerformanceTestEntity >> registerAtParentMorph: aMorph [
	self parent: aMorph.
	self addFlexShell.
	self owner gmCollisionDetectionStrategy: GMRotatedRectangleCollisionDetectionShape new.
	self parent addMorph: self owner.
	self parent collisionHandler addCollisionMorph: self owner.
]

{
	#category : #collision,
	#'squeak_changestamp' : 'NK 7/25/2018 11:43'
}
GMCollisionPerformanceTestEntity >> resolveCollisions [
	| collidingMorphs |
	self move: 1.
	collidingMorphs := self parent collisionHandler morphsCollidingWith: self owner.
	collidingMorphs notEmpty ifTrue: [self move: -1. 
		self velocity: self velocity negated].
]

{
	#category : #'stepping and presenter',
	#'squeak_changestamp' : 'TP 7/10/2018 19:37'
}
GMCollisionPerformanceTestEntity >> step [
	self handleEdgeCollision;
		move;
		resolveCollisions.
]

{
	#category : #'stepping and presenter',
	#'squeak_changestamp' : 'TP 6/12/2018 19:36'
}
GMCollisionPerformanceTestEntity >> stepTime [
	^ GMCollisionPerformanceTest stepTime
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TP 6/12/2018 19:06'
}
GMCollisionPerformanceTestEntity >> velocity [
	^ velocity
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TP 6/12/2018 19:06'
}
GMCollisionPerformanceTestEntity >> velocity: anObject [
	velocity := anObject
]
