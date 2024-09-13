"
This is a performance test for the GM collision mechanics. It is supposed to be opened like any other morph.
It spawns a high number of rotating, moving morphs and handles all collisions between them.
"
Class {
	#name : #GMCollisionPerformanceTest,
	#superclass : #Morph,
	#instVars : [
		'collisionHandler'
	],
	#category : #'GameMecha-Examples',
	#'squeak_changestamp' : 'NK 7/24/2018 16:00'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 7/23/2018 00:41'
}
GMCollisionPerformanceTest class >> defaultExtent [
	^ 1500 @ 900
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TP 7/10/2018 19:41'
}
GMCollisionPerformanceTest class >> maxVelocity [
	^ 10
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TP 7/10/2018 19:51'
}
GMCollisionPerformanceTest class >> numberOfColliders [
	^ 100
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TP 6/12/2018 19:43'
}
GMCollisionPerformanceTest class >> stepTime [
	^ 30
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TP 7/10/2018 19:38'
}
GMCollisionPerformanceTest class >> testMorphSize [
	^ 30
]

{
	#category : #collision,
	#'squeak_changestamp' : 'AZ 7/15/2018 18:55'
}
GMCollisionPerformanceTest >> addCollidingMorph [
	GMCollisionPerformanceTestEntity new
		velocity: (self class maxVelocity atRandom) @ (self class maxVelocity atRandom);
		position: (self left to: self right - self class testMorphSize) atRandom @
			(self top to: self bottom - self class testMorphSize) atRandom;
		extent: self class testMorphSize @ self class testMorphSize;
		registerAtParentMorph: self.

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TP 6/12/2018 19:32'
}
GMCollisionPerformanceTest >> collisionHandler [
	^ collisionHandler ifNil: [collisionHandler := GMCollisionHandler new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TP 6/12/2018 19:17'
}
GMCollisionPerformanceTest >> collisionHandler: anObject [
	collisionHandler := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'AZ 7/23/2018 00:41'
}
GMCollisionPerformanceTest >> initialize [
	super initialize.
	self 
		extent: self class defaultExtent;
		color: Color white.
	(self class numberOfColliders) timesRepeat: [self addCollidingMorph].
]
