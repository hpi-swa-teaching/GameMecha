collisionchecks
addCollisionDescription: aString
	self collisionDescriptions addItem: 
		{self collisionMorph collisionMorphs first class asString, ' ', self collisionMorph collisionMorphs second class asString.
		aString}.