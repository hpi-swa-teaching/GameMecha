execution
undo

	self editor addTilemapLayersAt: (self layers copyFrom: 2 to: self layers size).
	self tileMap silentlyResetLayers: (Set with: layers first).
		
	self restoreTiles
	