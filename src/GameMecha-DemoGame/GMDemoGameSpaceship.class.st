"
A GMDemoGameSpaceship is the playable spaceship of the demo game.
It is different from the other game entities as it is using the rotatedRectangleCollision and thus has to be a submorph of a TransformationMorph, which, in turn, demands special treatment. For instance: to get the position of an instance of spaceship you cannot simply ask it directly but instead you have to ask for the position of its owner.
"
Class {
	#name : #GMDemoGameSpaceship,
	#superclass : #GMDemoGameMovingEntity,
	#instVars : [
		'transformationMorph',
		'cooldownCounter',
		'controls'
	],
	#category : #'GameMecha-DemoGame',
	#'squeak_changestamp' : 'NK 7/24/2018 17:01'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 6/12/2018 20:18'
}
GMDemoGameSpaceship class >> accelerationSpeed [
	^ 0.5
]

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 6/12/2018 20:18'
}
GMDemoGameSpaceship class >> defaultExtent [
	^ 60 @ 40
]

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 6/12/2018 20:18'
}
GMDemoGameSpaceship class >> maxVelocity [
	^ 10
]

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 6/12/2018 17:12'
}
GMDemoGameSpaceship class >> numberOfCooldownSteps [
	^ 20
]

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 6/12/2018 20:08'
}
GMDemoGameSpaceship class >> turningSpeed [
	^ 0.125
]

{
	#category : #'game logic',
	#'squeak_changestamp' : 'AZ 6/12/2018 21:59'
}
GMDemoGameSpaceship >> accelerate [
	self velocity: self velocity + self accelerationVector.
	self capVelocity.
]

{
	#category : #'game logic',
	#'squeak_changestamp' : 'AZ 6/12/2018 21:58'
}
GMDemoGameSpaceship >> accelerationVector [
	^ self class accelerationSpeed @ 0 rotateBy: self transformationMorph angle about: 0 @ 0
]

{
	#category : #'game logic',
	#'squeak_changestamp' : 'AZ 6/12/2018 21:59'
}
GMDemoGameSpaceship >> capVelocity [
	(self velocity squaredDistanceTo: 0 @ 0) > self class maxVelocity squared ifTrue:
		[self velocity: self velocity normalized * self class maxVelocity].
]

{
	#category : #collision,
	#'squeak_changestamp' : 'AZ 6/12/2018 16:40'
}
GMDemoGameSpaceship >> collidedWith: anEntity [
	anEntity collidedWithSpaceship: self.
]

{
	#category : #collision,
	#'squeak_changestamp' : 'brh 6/15/2018 23:21'
}
GMDemoGameSpaceship >> collidedWithPlanet: aPlanet [
	self velocity: self velocity negated.
]

{
	#category : #collision,
	#'squeak_changestamp' : 'AZ 6/12/2018 21:56'
}
GMDemoGameSpaceship >> collidedWithProjectile: aProjectile [
	self ~~ aProjectile creator ifTrue: 
		[self kill.
		aProjectile kill].
]

{
	#category : #collision,
	#'squeak_changestamp' : 'AZ 6/12/2018 16:02'
}
GMDemoGameSpaceship >> collidedWithSpaceship: aSpaceship [
	self kill.
	aSpaceship kill.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 6/12/2018 16:54'
}
GMDemoGameSpaceship >> controls [
	^ controls
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 6/12/2018 16:54'
}
GMDemoGameSpaceship >> controls: anObject [
	controls := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 6/12/2018 16:09'
}
GMDemoGameSpaceship >> cooldownCounter [
	^ cooldownCounter ifNil: [cooldownCounter := 0]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 6/12/2018 16:08'
}
GMDemoGameSpaceship >> cooldownCounter: anObject [
	cooldownCounter := anObject
]

{
	#category : #'keyboard input',
	#'squeak_changestamp' : 'TP 7/10/2018 16:23'
}
GMDemoGameSpaceship >> gmIsKeyPressed: aCharacter [
	"redirects questions about the keyboard input to GMDemoGame, which is registered at the keyHandler and thus responsible for receiving keyEvents"
	^ self game gmIsKeyPressed: aCharacter
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'brh 7/10/2018 19:13'
}
GMDemoGameSpaceship >> initialize [
	super initialize.
	self initializeTransformationMorph.
	self registerAtGame.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TP 7/10/2018 16:23'
}
GMDemoGameSpaceship >> initializeTransformationMorph [
	"The spaceship should be able to rotate. Therefore, it has to be contained inside of a TransformationMorph"
	self addFlexShell.
	"the rotatedRectangleCollision is a special case: the TransformationMorph containing the colliding Morph has to receive the instance of the GMRotatedRectangleCollisionDetectionShape. Moreover, the TransformationMorph has to be registered at the collisionHandler, not the contained morph."
	self owner gmCollisionDetectionStrategy: GMRotatedRectangleCollisionDetectionShape new.
	"The spaceship is a submorph of the TransformationMorph which will be added as a submorph of the demoGame."
	self transformationMorph: self owner.
]

{
	#category : #'game logic',
	#'squeak_changestamp' : 'AZ 6/12/2018 16:11'
}
GMDemoGameSpaceship >> reduceCooldownCounter [
	self cooldownCounter: (self cooldownCounter - 1 max: 0).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 6/19/2018 17:46'
}
GMDemoGameSpaceship >> spatialMorph [
	"spatialMorph and transformationMorph are the same for the spaceship. We still distinguish between both calls in order to document which aspect of the owner of the spaceship we are using"
	^ self transformationMorph
]

{
	#category : #'game logic',
	#'squeak_changestamp' : 'brh 7/10/2018 19:14'
}
GMDemoGameSpaceship >> spawnProjectile [
	(GMDemoGameProjectile newFromGame: self game)
		center: self spatialMorph center;
		velocity: (1 @ 0 rotateBy: self transformationMorph angle about: 0 @ 0) * GMDemoGameProjectile maxVelocity;
		creator: self.
	self game soundLoader playSound: GMDemoGameFixtures pewSoundPath.
]

{
	#category : #'stepping and presenter',
	#'squeak_changestamp' : 'TP 7/10/2018 16:23'
}
GMDemoGameSpaceship >> step [
	super step.
	self reduceCooldownCounter.
	(self gmIsKeyPressed: (self controls at: #leftKey)) ifTrue: [self turnLeft].
	(self gmIsKeyPressed: (self controls at: #rightKey)) ifTrue: [self turnRight].
	(self gmIsKeyPressed: (self controls at: #upKey)) ifTrue: [self accelerate].
	(self gmIsKeyPressed: (self controls at: #downKey)) ifTrue: [self tryShooting].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 6/5/2018 21:49'
}
GMDemoGameSpaceship >> transformationMorph [
	^ transformationMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 6/5/2018 21:49'
}
GMDemoGameSpaceship >> transformationMorph: anObject [
	transformationMorph := anObject
]

{
	#category : #'game logic',
	#'squeak_changestamp' : 'AZ 6/12/2018 16:12'
}
GMDemoGameSpaceship >> tryShooting [
	self cooldownCounter isZero ifTrue: 
		[self spawnProjectile.
		self cooldownCounter: self class numberOfCooldownSteps].
]

{
	#category : #'game logic',
	#'squeak_changestamp' : 'AZ 6/5/2018 21:52'
}
GMDemoGameSpaceship >> turnLeft [
	self transformationMorph angle: self transformationMorph angle + self class turningSpeed.
]

{
	#category : #'game logic',
	#'squeak_changestamp' : 'AZ 6/5/2018 21:52'
}
GMDemoGameSpaceship >> turnRight [
	self transformationMorph angle: self transformationMorph angle - self class turningSpeed.
]
