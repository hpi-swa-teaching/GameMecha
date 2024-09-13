building
createAttributeSpecWithBuilder: aBuilder descriptor: aString getter: aSelector setter: anotherSelector model: aModel frame: aFrame 
	"a helper function to create attribute specs"
	
	| minTextWidth minInputWidth |
	minTextWidth := self getSizeOfString: aString.
	minInputWidth := GMTEEditor getInputFieldSize.
	
	^ (aBuilder pluggablePanelSpec new)
		name: 'attributeContainer';
		frame: aFrame;
		layout: #proportional;
		minimumWidth: minTextWidth + minInputWidth;
		children: {
			(aBuilder pluggableStaticTextSpec new)
			model: aModel;
			frame: (LayoutFrame fractions: (0 @ 0 corner: 2 / 3 @ 1));
			text: aString;
			minimumWidth: minTextWidth.
			
			
			(aBuilder pluggableInputFieldSpec new)
			model: aModel;
			indicateUnacceptedChanges: false;
			frame: (LayoutFrame fractions: (2 / 3 @ 0 corner: 1 @ 1));
			getText: aSelector;
			setText: anotherSelector;
			minimumWidth: minInputWidth
		};
		yourself