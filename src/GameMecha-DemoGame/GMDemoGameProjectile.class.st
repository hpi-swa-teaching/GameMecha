"
A GMDemoGameProjectile is the projectile shot by the spaceship.
"
Class {
	#name : #GMDemoGameProjectile,
	#superclass : #GMDemoGameMovingEntity,
	#instVars : [
		'creator'
	],
	#category : #'GameMecha-DemoGame',
	#'squeak_changestamp' : 'NK 7/24/2018 17:00'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 6/12/2018 19:57'
}
GMDemoGameProjectile class >> defaultExtent [
	^ 20 @ 20
]

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 6/12/2018 17:11'
}
GMDemoGameProjectile class >> maxVelocity [
	^ 20
]

{
	#category : #collision,
	#'squeak_changestamp' : 'AZ 6/12/2018 16:40'
}
GMDemoGameProjectile >> collidedWith: anEntity [
	anEntity collidedWithProjectile: self.
]

{
	#category : #collision,
	#'squeak_changestamp' : 'AZ 6/12/2018 16:24'
}
GMDemoGameProjectile >> collidedWithPlanet: aPlanet [
	self kill.
]

{
	#category : #collision,
	#'squeak_changestamp' : 'AZ 6/12/2018 15:57'
}
GMDemoGameProjectile >> collidedWithProjectile: aProjectile [
	aProjectile kill.
	self kill.
]

{
	#category : #collision,
	#'squeak_changestamp' : 'AZ 6/12/2018 16:00'
}
GMDemoGameProjectile >> collidedWithSpaceship: aSpaceship [
	aSpaceship collidedWithProjectile: self.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 6/12/2018 15:58'
}
GMDemoGameProjectile >> creator [
	^ creator
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 6/12/2018 15:58'
}
GMDemoGameProjectile >> creator: anObject [
	creator := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'brh 7/10/2018 19:14'
}
GMDemoGameProjectile >> initialize [
	super initialize.
	self 
		registerAtGame;
		"the porjectile should be able to collide with other entities. Thus it needs to have a collisionDetectionStrategy."
		gmCollisionDetectionStrategy: GMCircleCollisionDetectionShape new;
		"sets the image to a form stored in a method (see also: GMDemoGameFixtures class comment)"
		image: (self game imageLoader at: GMDemoGameFixtures projectilePath withSize: self class defaultExtent).
]
