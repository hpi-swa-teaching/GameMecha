"
A GMDemoGamePlanet serves as a simple obstacle and doesn't do much.
"
Class {
	#name : #GMDemoGamePlanet,
	#superclass : #GMDemoGameEntity,
	#category : #'GameMecha-DemoGame',
	#'squeak_changestamp' : 'NK 7/24/2018 17:01'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 6/12/2018 19:57'
}
GMDemoGamePlanet class >> defaultExtent [
	^ 200 @ 200
]

{
	#category : #collision,
	#'squeak_changestamp' : 'AZ 6/12/2018 16:23'
}
GMDemoGamePlanet >> collidedWith: anEntity [
	anEntity collidedWithPlanet: self.
]

{
	#category : #collision,
	#'squeak_changestamp' : 'AZ 6/12/2018 16:00'
}
GMDemoGamePlanet >> collidedWithProjectile: aProjectile [
	aProjectile collidedWithPlanet: self.
]

{
	#category : #collision,
	#'squeak_changestamp' : 'AZ 6/12/2018 16:00'
}
GMDemoGamePlanet >> collidedWithSpaceship: aSpaceship [
	aSpaceship collidedWithPlanet: self.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'brh 7/10/2018 19:14'
}
GMDemoGamePlanet >> initialize [
	super initialize.
	self 
		registerAtGame;
		gmCollisionDetectionStrategy: GMCircleCollisionDetectionShape new;
		image: (self game imageLoader at: GMDemoGameFixtures planetPath withSize: self class defaultExtent).
]
