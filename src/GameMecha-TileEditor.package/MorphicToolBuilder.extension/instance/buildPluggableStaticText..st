*GameMecha-TileEditor
buildPluggableStaticText: aSpec
	| widget defaultTextColor |
	widget := StringMorph new
		contents: aSpec text.
		
	self register: widget id: aSpec name.
	
	defaultTextColor := UserInterfaceTheme current get: #textColor for: MenuItemMorph.
	defaultTextColor
		ifNil: [defaultTextColor := Color black].
	
	aSpec color
		ifNil: 
			[widget color: defaultTextColor]
		ifNotNil:
			[widget color: aSpec color].

	self buildHelpFor: widget spec: aSpec.
	 
	self setFrame: aSpec frame in: widget.
	self setLayoutHintsForTextField: widget spec: aSpec.
	
	parent ifNotNil:[self add: widget to: parent].
	^ widget