collisionchecks
addCollisionDescription: collisionText
	self collisionDescriptions addItem: 
		{self collisionMorph collisionMorphs first class asString, ' ', self collisionMorph collisionMorphs second class asString.
		collisionText}.