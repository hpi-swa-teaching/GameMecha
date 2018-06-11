collisionchecks
addCollisionDescription: collisionText
	self flag: #todo.
	self collisionDescriptions addItem: 
		{self collisionMorph collisionMorphs first class asString, ' ', self collisionMorph collisionMorphs second class asString.
		collisionText}.