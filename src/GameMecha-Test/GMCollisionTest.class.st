"
This abstract test provides functionality for testing collision detection.
"
Class {
	#name : #GMCollisionTest,
	#superclass : #TestCase,
	#instVars : [
		'collisionHandler'
	],
	#category : #'GameMecha-Test',
	#'squeak_changestamp' : 'NK 7/24/2018 15:05'
}

{
	#category : #testing,
	#'squeak_changestamp' : 'NK 7/24/2018 15:00'
}
GMCollisionTest class >> isAbstract [
	^ super isAbstract or: [self name = #GMCollisionTest]
]

{
	#category : #testing,
	#'squeak_changestamp' : 'NK 7/23/2018 13:30'
}
GMCollisionTest >> assertCollision: aMorph with: anotherMorph andOffset: aPoint [
	self assertCollision: aMorph with: anotherMorph andOffset: aPoint equals: true
]

{
	#category : #testing,
	#'squeak_changestamp' : 'brh 7/24/2018 21:05'
}
GMCollisionTest >> assertCollision: aMorph with: anotherMorph andOffset: aPoint equals: aBoolean [
	anotherMorph position: aMorph center + aPoint.
	self assertCollision: aMorph with: anotherMorph equals: aBoolean.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'NK 7/23/2018 13:35'
}
GMCollisionTest >> assertCollision: aMorph with: anotherMorph equals: aBoolean [
	self collisionHandler addCollisionMorphs: {aMorph. anotherMorph}.
	self assertCollisionInHandler: aMorph with: anotherMorph equals: aBoolean.
	self collisionHandler removeAllMorphs.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'NK 7/23/2018 13:35'
}
GMCollisionTest >> assertCollisionInHandler: aMorph with: anotherMorph equals: aBoolean [
	self
		assert: (self collisionHandler is: aMorph collidingWith: anotherMorph) equals: aBoolean;
		assert: (self collisionHandler is: anotherMorph collidingWith: aMorph) equals: aBoolean.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 7/15/2018 14:49'
}
GMCollisionTest >> collisionHandler [
	^ collisionHandler ifNil: [collisionHandler := GMCollisionHandler new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 7/15/2018 14:49'
}
GMCollisionTest >> collisionHandler: anObject [
	collisionHandler := anObject
]

{
	#category : #testing,
	#'squeak_changestamp' : 'NK 7/23/2018 13:33'
}
GMCollisionTest >> denyCollision: aMorph with: anotherMorph andOffset: aPoint [
	self assertCollision: aMorph with: anotherMorph andOffset: aPoint equals: false
]
