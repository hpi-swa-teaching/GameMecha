game logic
spatialMorph
	"returns the morph which is actually registered at the collisionHandler and a submorph of the game. Due to this method, we won't have to distinguish between 'normal' entities and entieties contained in TransformationMorphs (here: spaceship). If you do not intend to use transformation morphs a method like this probably won't be necessary. If, however, you do intend to use them, you proably will understand the purpose of this method once you understand how to use TransformationMorphs"
	^ self