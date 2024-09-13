accessing
getBrushRadius

	self brush ifNil: [^ nil].
	
	^ self brush radius