game logic
spatialMorph
	"returns the morph which is actually registered at the collisionHandler and a submorph of the game. due to this method, we won't have to distinguish between 'normal' entities and entieties contained in TransformationMorphs (here: spaceship)."
	^ self