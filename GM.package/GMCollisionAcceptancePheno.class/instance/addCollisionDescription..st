collisionchecks
addCollisionDescription: collisionText
	self collisionDescriptions addItem: 
		{self collisionMorphs first class asString, ' ', self collisionMorphs second class asString.
		collisionText}.