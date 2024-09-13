"
A GMDemoGame represents the level in which the demo game takes place. To play the game, open an instance of this class. The DemoGame is responsible for setting everything up and for holding the collisionHandler.
Every morph which wants to be considered during collision detection has to be registered at the collisionHandler. A morph registering at the collisionHandler needs to have a collisionDetectionShape.
Furthermore, the demo game is responsible for listening to keyboard inputs. Other entities may ask it whether certain keys are pressed. Only one morph at a time can have the keyboard focus and consequently receive keyboard events.

Some methods are exessively commented because the game's purpose is to explain implementation examples of the GM library, normally you wouldn't do this.

To play use W,A,S,D and the arrow keys.
"
Class {
	#name : #GMDemoGame,
	#superclass : #Morph,
	#instVars : [
		'collisionHandler',
		'players',
		'imageLoader',
		'soundLoader'
	],
	#category : #'GameMecha-DemoGame',
	#'squeak_changestamp' : 'brh 7/25/2018 19:31'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 6/12/2018 21:46'
}
GMDemoGame class >> gameExtent [
	^ 1500 @ 900
]

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 6/12/2018 17:08'
}
GMDemoGame class >> resetKey [
	^ $r
]

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 6/12/2018 21:46'
}
GMDemoGame class >> spawnPositionPlayer1 [
	^ 100 @ 100
]

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 6/12/2018 21:46'
}
GMDemoGame class >> spawnPositionPlayer2 [
	^ self gameExtent - (100 @ 100)
]

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 6/5/2018 20:26'
}
GMDemoGame class >> stepTime [
	^ 30
]

{
	#category : #'submorphs-add/remove',
	#'squeak_changestamp' : 'brh 7/10/2018 18:12'
}
GMDemoGame >> abandon [
	GMDemoGameFixtures clearResourcesOnDisk.
	super abandon.
]

{
	#category : #collision,
	#'squeak_changestamp' : 'AZ 7/15/2018 16:59'
}
GMDemoGame >> addCollisionMorph: aMorph [
	self collisionHandler addCollisionMorph: aMorph.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 6/5/2018 20:22'
}
GMDemoGame >> collisionHandler [
	^ collisionHandler ifNil: [collisionHandler := GMCollisionHandler new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 6/5/2018 20:22'
}
GMDemoGame >> collisionHandler: anObject [
	collisionHandler := anObject
]

{
	#category : #'game logic',
	#'squeak_changestamp' : 'brh 6/15/2018 23:40'
}
GMDemoGame >> controlsPlayer1 [
	^ OrderedDictionary newFrom: {
		#leftKey -> $a.
		#rightKey -> $d.
		#downKey -> $s.
		#upKey -> $w.}
]

{
	#category : #'game logic',
	#'squeak_changestamp' : 'brh 6/15/2018 23:40'
}
GMDemoGame >> controlsPlayer2 [
	^ OrderedDictionary newFrom: {
		#leftKey -> Character arrowLeft.
		#rightKey -> Character arrowRight.
		#downKey -> Character arrowDown.
		#upKey -> Character arrowUp.}
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 6/19/2018 17:30'
}
GMDemoGame >> game [
	^ self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 7/15/2018 00:01'
}
GMDemoGame >> imageLoader [
	^ imageLoader ifNil: [imageLoader := GMImageLoader new
		loadAllResourcesFromDrive: GMDemoGameFixtures resourceFolder;
		yourself]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 7/10/2018 18:19'
}
GMDemoGame >> imageLoader: anObject [
	imageLoader := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'brh 7/10/2018 18:29'
}
GMDemoGame >> initialize [
	super initialize.
	
	"We are not shipping the resources with the game but creating them on the fly on disk. Most users won't need this."
	GMDemoGameFixtures clearResourcesOnDisk.
	GMDemoGameFixtures createResourcesOnDisk.
	
	self extent: self class gameExtent;
		color: Color white;
		"the next method will allow demoGame to understand the message: isKeyPressed: aCharacter"
		gmRegisterToKeyHandler;
		initializePlanets;
		spawnPlayers.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'brh 7/10/2018 19:08'
}
GMDemoGame >> initializePlanets [
	(GMDemoGamePlanet newFromGame: self) center: self center.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 6/12/2018 21:28'
}
GMDemoGame >> players [
	^ players ifNil: [players := OrderedCollection new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 6/12/2018 21:27'
}
GMDemoGame >> players: anObject [
	players := anObject
]

{
	#category : #collision,
	#'squeak_changestamp' : 'AZ 7/15/2018 17:00'
}
GMDemoGame >> removeCollisionMorph: aMorph [
	self collisionHandler removeCollisionMorph: aMorph.
]

{
	#category : #'game logic',
	#'squeak_changestamp' : 'AZ 6/12/2018 21:39'
}
GMDemoGame >> resetPlayers [
	self players do: [:aPlayer | aPlayer kill].
	self spawnPlayers.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 7/15/2018 00:01'
}
GMDemoGame >> soundLoader [
	^ soundLoader ifNil: [soundLoader := GMSoundLoader new
		loadAllResourcesFromDrive: GMDemoGameFixtures resourceFolder;
		yourself]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 7/10/2018 18:20'
}
GMDemoGame >> soundLoader: anObject [
	soundLoader := anObject
]

{
	#category : #'game logic',
	#'squeak_changestamp' : 'brh 7/10/2018 19:02'
}
GMDemoGame >> spawnPlayerWithControls: aDictionary andForm: aForm at: aPoint [
	| aPlayer |
	aPlayer := (GMDemoGameSpaceship newFromGame: self)
		controls: aDictionary;
		image: aForm;
		yourself.
	aPlayer spatialMorph position: aPoint + self position.
	self players add: aPlayer.
	^ aPlayer

]

{
	#category : #'game logic',
	#'squeak_changestamp' : 'brh 7/25/2018 19:28'
}
GMDemoGame >> spawnPlayers [
	self spawnPlayerWithControls: self controlsPlayer1
		andForm: (self imageLoader at: GMDemoGameFixtures spaceship1Path 
			withSize: GMDemoGameSpaceship defaultExtent)
		at: self class spawnPositionPlayer1.
	(self spawnPlayerWithControls: self controlsPlayer2
		andForm: (self imageLoader at: GMDemoGameFixtures spaceship2Path 
			withSize: GMDemoGameSpaceship defaultExtent)
		at: self class spawnPositionPlayer2)
		transformationMorph angle: Float pi.
]

{
	#category : #'stepping and presenter',
	#'squeak_changestamp' : 'NK 7/25/2018 12:44'
}
GMDemoGame >> step [
	"demoGame can call isKeyPressed: aCharacter only after it has registered to the key handler during initialization"
	(self gmIsKeyPressed: self class resetKey) ifTrue: [self resetPlayers].
]

{
	#category : #'stepping and presenter',
	#'squeak_changestamp' : 'AZ 6/12/2018 17:10'
}
GMDemoGame >> stepTime [
	^ self class stepTime
]
