building
createInspectorSpecWithBuilder: aBuilder
	"creates the spec for the inspector tab"
	
	^ aBuilder pluggablePanelSpec new
		frame: (LayoutFrame fractions: (0.8 @ 0 corner: 1 @ 0.25)
		offsets: (0 @ 30 corner: 0 @ 30));
		name: 'inspector';
		children: {
		self createAttributeSpecWithBuilder: aBuilder descriptor: 'Padding:' getter: #getPaddingAsString setter: #setPadding: model: self frame: (GMTEEditor vLayoutFrame: 1 ofN: 3).
		
		self createAttributeSpecWithBuilder: aBuilder descriptor: 'Grid Width:' getter: #getGridWidthAsString setter: #setGridWidth: model: self frame: (GMTEEditor vLayoutFrame: 2 ofN: 3).
		
		self createAttributeSpecWithBuilder: aBuilder descriptor: 'Grid Height:' getter: #getGridHeightAsString setter: #setGridHeight: model: self frame: (GMTEEditor vLayoutFrame: 3 ofN: 3)
		};
		minimumWidth: (self getMaximalSizeOfStrings: (OrderedCollection newFrom: {'Padding:' . 'Grid Width:' . 'Grid Height:'}));
		yourself