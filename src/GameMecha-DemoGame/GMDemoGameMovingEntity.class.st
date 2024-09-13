"
A GMDemoGameMovingEntity provides more refined behavior for moving entities.
"
Class {
	#name : #GMDemoGameMovingEntity,
	#superclass : #GMDemoGameEntity,
	#instVars : [
		'velocity'
	],
	#category : #'GameMecha-DemoGame',
	#'squeak_changestamp' : 'NK 7/24/2018 16:59'
}

{
	#category : #'game logic',
	#'squeak_changestamp' : 'AZ 6/19/2018 17:38'
}
GMDemoGameMovingEntity >> isOutOfGame [
	"this simple check does not require precision, so we decided not to use the collision detection"
	^ (self spatialMorph bounds intersects: self game bounds) not
]

{
	#category : #'game logic',
	#'squeak_changestamp' : 'AZ 6/12/2018 21:04'
}
GMDemoGameMovingEntity >> move [
	self spatialMorph position: self spatialMorph position + self velocity.
]

{
	#category : #'game logic',
	#'squeak_changestamp' : 'AZ 6/19/2018 17:41'
}
GMDemoGameMovingEntity >> resolveCollisions [
	"the entity asks the collisionHandler for all morphs colliding with it. Then it will treat the collision. renderedMorph is called to abstract between aCollisionMoprhs which are game entities and ones which are TransformationMorphs containing game entities"
	(self game collisionHandler morphsCollidingWith: self spatialMorph)
		do: [:aCollisionMorph | self collidedWith: aCollisionMorph renderedMorph].
]

{
	#category : #'stepping and presenter',
	#'squeak_changestamp' : 'AZ 6/12/2018 21:52'
}
GMDemoGameMovingEntity >> step [
	self 
		move;
		resolveCollisions.
	self isOutOfGame ifTrue: [self kill].
]

{
	#category : #'stepping and presenter',
	#'squeak_changestamp' : 'AZ 6/5/2018 21:56'
}
GMDemoGameMovingEntity >> stepTime [
	^ GMDemoGame stepTime
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 6/5/2018 21:54'
}
GMDemoGameMovingEntity >> velocity [
	^ velocity ifNil: [velocity := 0 @ 0]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 6/5/2018 21:54'
}
GMDemoGameMovingEntity >> velocity: anObject [
	velocity := anObject
]
