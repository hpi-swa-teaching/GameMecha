accessing
visible: aBool

	visible := aBool.	
		
	self doTiles: [:tile | tile visible: aBool]