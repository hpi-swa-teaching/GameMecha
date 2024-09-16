*GameMecha-TileEditor
buildPluggableImageButton: aSpec
	| widget project enabled |
	project := aSpec project.
	widget := GMTEImageButton new
		name: aSpec name;
		target: aSpec model;
		groupName: aSpec groupName;
		actionSelector: aSpec action;
		createStateImagesFrom: aSpec iconName.
	
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