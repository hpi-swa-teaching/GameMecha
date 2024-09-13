"
A GMDemoGameEntity is the abstract subclass for all demoGameEntities. It provides a common interface and thus helps to avoid bugs and code duplication.
"
Class {
	#name : #GMDemoGameEntity,
	#superclass : #ImageMorph,
	#instVars : [
		'game',
		'isAlive'
	],
	#category : #'GameMecha-DemoGame',
	#'squeak_changestamp' : 'NK 7/24/2018 16:59'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'brh 7/10/2018 19:07'
}
GMDemoGameEntity class >> newFromGame: aGame [
	^ self basicNew
		game: aGame;
		initialize
]

{
	#category : #collision,
	#'squeak_changestamp' : 'AZ 7/15/2018 17:05'
}
GMDemoGameEntity >> collidedWith: anEntity [
	"this method as well as the other collidedWith... methods is not part of the library but instead part of the implementation of the game"
	self subclassResponsibility.
]

{
	#category : #collision,
	#'squeak_changestamp' : 'AZ 6/12/2018 20:43'
}
GMDemoGameEntity >> collidedWithPlanet: aPlanet [
]

{
	#category : #collision,
	#'squeak_changestamp' : 'AZ 6/12/2018 15:56'
}
GMDemoGameEntity >> collidedWithProjectile: aProjectile [
]

{
	#category : #collision,
	#'squeak_changestamp' : 'AZ 6/12/2018 15:56'
}
GMDemoGameEntity >> collidedWithSpaceship: aSpaceship [
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 6/15/2018 23:18'
}
GMDemoGameEntity >> game [
	^ game game
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 6/12/2018 15:38'
}
GMDemoGameEntity >> game: anObject [
	game := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 6/12/2018 18:41'
}
GMDemoGameEntity >> isAlive [
	^ isAlive ifNil: [isAlive := true]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 6/12/2018 18:41'
}
GMDemoGameEntity >> isAlive: anObject [
	isAlive := anObject
]

{
	#category : #'game logic',
	#'squeak_changestamp' : 'AZ 6/19/2018 17:32'
}
GMDemoGameEntity >> kill [
	"to remove a morph properly, it has to be removed from the collision handler and from the demoGame"
	self isAlive ifTrue: 
		[self game removeCollisionMorph: self spatialMorph.
		self spatialMorph abandon.
		self isAlive: false].
]

{
	#category : #'game logic',
	#'squeak_changestamp' : 'brh 7/10/2018 19:02'
}
GMDemoGameEntity >> registerAtGame [
	"to add a morph to the game, it has to be added as a submorph of the GMDemoGame instance and it has to be registered at the collisionHandler if it is supposed to be involved in collisions"
	self game
		addMorph: self spatialMorph;
		addCollisionMorph: self spatialMorph.
]

{
	#category : #'game logic',
	#'squeak_changestamp' : 'AZ 6/19/2018 17:36'
}
GMDemoGameEntity >> spatialMorph [
	"returns the morph which is actually registered at the collisionHandler and a submorph of the game. Due to this method, we won't have to distinguish between 'normal' entities and entieties contained in TransformationMorphs (here: spaceship). If you do not intend to use transformation morphs a method like this probably won't be necessary. If, however, you do intend to use them, you proably will understand the purpose of this method once you understand how to use TransformationMorphs"
	^ self
]
