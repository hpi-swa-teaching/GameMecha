Extension { #name : #MorphicToolBuilder }

{
	#category : #'*GameMecha-TileEditor',
	#'squeak_changestamp' : 'tw 7/12/2024 17:05'
}
MorphicToolBuilder >> buildPluggableImageButton: aSpec [
	| widget project enabled |
	project := aSpec project.
	widget := GMTEImageButton new
		name: aSpec name;
		target: aSpec model;
		groupName: aSpec groupName;
		actionSelector: aSpec action;
		createStateImagesFrom: ((GitAssetLoader for: project) loadForm: aSpec path) copy.
	
	aSpec buttonGroup ifNotNil: [widget buttonGroup: aSpec buttonGroup].
	
	aSpec description ifNotNil: [widget setBalloonText: aSpec description].
	
	enabled := aSpec enabled.
	enabled isSymbol ifFalse: [widget enabled:enabled].
	
	self register: widget id: aSpec name.
	widget setImageMode: #unpressed.
	
	aSpec arguments
		ifNotNil: [widget arguments: aSpec arguments].
	self buildHelpFor: widget spec: aSpec. 
	self setFrame: aSpec frame in: widget.
	self setLayoutHintsFor: widget spec: aSpec.
	parent ifNotNil:[self add: widget to: parent].
	^ widget
]

{
	#category : #'*GameMecha-TileEditor',
	#'squeak_changestamp' : 'Alex M 6/21/2024 19:44'
}
MorphicToolBuilder >> buildPluggableStaticText: aSpec [
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
]
