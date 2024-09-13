building
buildWith: builder
	"builds the editor with ToolBuilder"
	"called it builder instead of aBuilder since every other implementation does that"
	
	| newMorph panel | 
	"TODO: Build process contains a lot of magic numbers regarding relative/absolute positioning"
	newMorph := builder build: (builder pluggableWindowSpec new
		model: self;
		label: 'GM Tile Editor';
		children: {
			self createCommandBarSpecWithBuilder: builder.
			self createTileViewerSpecWithBuilder: builder.
			self createTilestoreSpecWithBuilder: builder.
			self createTraySpecWithBuilder: builder.
			self createLayersSpecWithBuilder: builder.
			self createInspectorSpecWithBuilder: builder.
			self createToolBarSpecWithBuilder: builder.};
		closeAction: #onClose;
		minimumExtent: GMTEEditor editorMinimumExtent).
	
	newMorph addKeyboardCaptureFilter: self.
	
	"self commandBar vResizing: #rigid."
	self tileStore: (newMorph submorphNamed: 'tile store').
	self mapViewer: ((newMorph submorphNamed: 'main panel') submorphNamed: 'tile viewer').
	self tileTray: (newMorph submorphNamed: 'tray').
	self mapViewer clipSubmorphs: true.
	
	panel := GMTETileContainer withParent: self tileStore.
	self tileStore morph: panel.

	self placeSelectedTileIntoTileTray.
		
	self mapViewer 
		borderWidth: 2;
		borderColor: tileStore borderColor.
	
	self 
		initializeDefaultTileMapMatrix;
		associatedMorph: newMorph.
		
	^ newMorph