visual properties
createStateImagesFrom: anImage
	
	| unpressedColor hoveredColor pressedColor disabledColor |
	unpressedColor := UserInterfaceTheme current get: #titleTextColor for: MenuMorph.
	hoveredColor := UserInterfaceTheme current get: #highlightTextColor for: SimpleHierarchicalListMorph.
	pressedColor := UserInterfaceTheme current get: #errorColor for: TestRunner.
	disabledColor := UserInterfaceTheme current get: #disabledTextColor for: MenuItemMorph.
	
	self stateSprites at: 'unpressed' put: (self dyeSprite: anImage with: unpressedColor).
	self stateSprites at: 'hovered' put: (self dyeSprite: anImage with: hoveredColor).
	self stateSprites at: 'pressed' put: (self dyeSprite: anImage with: pressedColor).
	self stateSprites at: 'disabled' put: (self dyeSprite: anImage with: disabledColor)