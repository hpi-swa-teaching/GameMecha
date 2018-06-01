as yet unclassified
currentCollisionCheck
 	^ GMCollisionCheck new
		firstMorph: self collisionMorphs first veryDeepCopy;
		secondMorph: self collisionMorphs second veryDeepCopy.