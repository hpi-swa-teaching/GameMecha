accessing
initBackground

	self image: ((FormCanvas on: self image)
		image: (self class checkerBoardTile)
		at: 0@0
		sourceRect: (self class checkerBoardTile boundingBox)
		rule: Form blend)
		form