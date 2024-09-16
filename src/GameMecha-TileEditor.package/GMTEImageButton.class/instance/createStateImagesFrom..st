visual properties
createStateImagesFrom: anIconName
	
	| unpressedColor hoveredColor pressedColor disabledColor image |
	
	image := self class getIcon: anIconName.
	
	unpressedColor := UserInterfaceTheme current get: #titleTextColor for: MenuMorph.
	hoveredColor := UserInterfaceTheme current get: #highlightTextColor for: SimpleHierarchicalListMorph.
	pressedColor := UserInterfaceTheme current get: #errorColor for: TestRunner.
	disabledColor := UserInterfaceTheme current get: #disabledTextColor for: MenuItemMorph.
	
	self stateSprites at: 'unpressed' put: (self dyeSprite: image with: unpressedColor).
	self stateSprites at: 'hovered' put: (self dyeSprite: image with: hoveredColor).
	self stateSprites at: 'pressed' put: (self dyeSprite: image with: pressedColor).
	self stateSprites at: 'disabled' put: (self dyeSprite: image with: disabledColor)