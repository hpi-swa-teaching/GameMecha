Class {
	#name : #GMTEEditor,
	#superclass : #Model,
	#instVars : [
		'tileStore',
		'selectedLayers',
		'selectedTile',
		'ratio',
		'savedSinceModified',
		'inspector',
		'backgroundTile',
		'tileMap',
		'associatedMorph',
		'commands',
		'currentCommand',
		'brush',
		'brushButtons',
		'mapViewer',
		'tileTray'
	],
	#category : #'GM-TE-UI'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'mcjj 7/12/2024 21:41'
}
GMTEEditor class >> editorMinimumExtent [
	"Minimum extent of the tile editor"
	
	^ RealEstateAgent scaleFactor * (700 @ 400)
]

{
	#category : #constants,
	#'squeak_changestamp' : 'mcjj 7/12/2024 21:41'
}
GMTEEditor class >> getInputFieldSize [
	"Attribute input field width"
	
	^ (TextStyle defaultFont approxWidthOfText: '1.00' asText)
]

{
	#category : #fileHandling,
	#'squeak_changestamp' : 'mcjj 7/12/2024 21:41'
}
GMTEEditor class >> getTileMapFromFileBinary: aFileBinary [
	"Creates a tileMap from a file binary"
	
    ^ GMTETileMap newFrom: (GMTEEditor privateGetEditorTileMapFromFileBinary: aFileBinary)
]

{
	#category : #fileHandling,
	#'squeak_changestamp' : 'mcjj 7/12/2024 21:43'
}
GMTEEditor class >> getTileMapFromFilePath: aFilePath [
	"Loads a tileMap from a local file path"
	
    ^ GMTETileMap newFrom: (GMTEEditor privateGetEditorTileMapFromFilePath: aFilePath)
]

{
	#category : #fileHandling,
	#'squeak_changestamp' : 'mcjj 7/12/2024 21:43'
}
GMTEEditor class >> getTileMapFromProjectName: aName withPath: aPath [
	"Loads a tileMap from the git asset browser"
	
    ^ GMTEEditor getTileMapFromFileBinary: ((GitAssetLoader for: aName) loadAsset: aPath)
]

{
	#category : #constants,
	#'squeak_changestamp' : 'mcjj 7/12/2024 21:44'
}
GMTEEditor class >> getVisibilityIndicator: aBoolean [
	
	aBoolean
		ifTrue: [^ ' (v)']
		ifFalse: [^ ' (h)']
]

{
	#category : #utility,
	#'squeak_changestamp' : 'mcjj 7/12/2024 21:47'
}
GMTEEditor class >> hLayoutFrame: intI ofN: intN [
	"Calculates the frame of equal sized specs"
	
	^ self hLayoutFrame: intI ofN: intN vSymmetric: 0
]

{
	#category : #utility,
	#'squeak_changestamp' : 'tw 7/11/2024 17:03'
}
GMTEEditor class >> hLayoutFrame: intI ofN: intN vSymmetric: aFloat [

	^ self hLayoutFrame: intI ofN: intN vUp: aFloat down: aFloat
]

{
	#category : #utility,
	#'squeak_changestamp' : 'mcjj 7/12/2024 21:45'
}
GMTEEditor class >> hLayoutFrame: intI ofN: intN vUp: aFloat down: anotherFloat [
	"useful for building buttons, maybe move this to instance? TODO FLAG"
	
	^ LayoutFrame fractions: ((intI - 1 / intN @ aFloat) corner: (intI / intN @ (1 - anotherFloat)))
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'tw 7/12/2024 16:21'
}
GMTEEditor class >> initialize [

	super initialize.
	self register
]

{
	#category : #constants,
	#'squeak_changestamp' : 'mcjj 7/12/2024 21:48'
}
GMTEEditor class >> maxBrushRadius [
	"Maximum allowed radius for brushes"
	
	^ 50
]

{
	#category : #constants,
	#'squeak_changestamp' : 'mcjj 7/12/2024 21:48'
}
GMTEEditor class >> maxNumberOfCommands [
	"Maximum amount of stored commands"
	
	^ 50
]

{
	#category : #constants,
	#'squeak_changestamp' : 'mcjj 7/12/2024 21:49'
}
GMTEEditor class >> minBrushRadius [
	"Minimum allowed radius for brushes"
	
	^ 0
]

{
	#category : #fileHandling,
	#'squeak_changestamp' : 'mcjj 7/12/2024 21:53'
}
GMTEEditor class >> privateGetEditorTileMapFromFileBinary: aFileBinary [
	"Loads a EditorTileMap from a file binary"
	
    |aFileStream tileMap|
    aFileStream := (MultiByteBinaryOrTextStream with: aFileBinary) binary reset.
    tileMap := aFileStream fileInObjectAndCode.
    (tileMap isKindOf: GMTEEditorTileMap) ifFalse: [^ nil].
    ^ tileMap
]

{
	#category : #fileHandling,
	#'squeak_changestamp' : 'mcjj 7/12/2024 21:53'
}
GMTEEditor class >> privateGetEditorTileMapFromFilePath: aFilePath [
	"Loads a EditorTileMap from a local file path"
	 
    ^ GMTEEditor privateGetEditorTileMapFromFileBinary: (FileStream readOnlyFileNamed: aFilePath) binary contentsOfEntireFile
]

{
	#category : #squeakutils,
	#'squeak_changestamp' : 'mcjj 7/12/2024 21:53'
}
GMTEEditor class >> register [
	"Adds the tile editor to app menu"
	
	"Maybe call this on new?"
	TheWorldMenu registerOpenCommand: {'TileMap Editor'. {self. #startup}}
]

{
	#category : #constants,
	#'squeak_changestamp' : 'mcjj 7/12/2024 21:54'
}
GMTEEditor class >> singleLayerActionNames [
	"Layer actions that only work for one selected layer"
	
	^ {'buttonMoveLayerDown' . 'buttonMoveLayerUp' . 'buttonRenameLayer'}
]

{
	#category : #startup,
	#'squeak_changestamp' : 'mcjj 7/12/2024 21:57'
}
GMTEEditor class >> startup [
		"Opens the editor with a startup wizard"
		
		(DialogWindow new
		title: 'Wizard';
		message: 'Open Existing Project?';
		createButton: 'Yes' translated value: true;
		createCancelButton: 'No' translated  value: false;
		selectedButtonIndex: 2; "NO"
		registerKeyboardShortcuts;
		getUserResponseAtHand)
			ifTrue: [self new importFromMorph]
			ifFalse: [self new]
]

{
	#category : #constants,
	#'squeak_changestamp' : 'mcjj 7/12/2024 21:56'
}
GMTEEditor class >> startupMinimumExtent [
	"Minimum extent of the startup wizard"
	
	^ 300@200
]

{
	#category : #constants,
	#'squeak_changestamp' : 'mcjj 7/12/2024 21:57'
}
GMTEEditor class >> tileMapMaxGridSize [
	"Maximum size of the tileMap per dimension"
	
	^ 200
]

{
	#category : #constants,
	#'squeak_changestamp' : 'mcjj 7/12/2024 21:57'
}
GMTEEditor class >> tileMapMaxPaddingSize [
	"Maximum size of the tileMap padding"
	
	^ 0.9
]

{
	#category : #constants,
	#'squeak_changestamp' : 'mcjj 7/12/2024 21:57'
}
GMTEEditor class >> tileMapMinGridSize [
	"Minimum size of the tileMap per dimension"
	
	^ 0
]

{
	#category : #constants,
	#'squeak_changestamp' : 'mcjj 7/12/2024 21:57'
}
GMTEEditor class >> tileMapMinPaddingSize [
	"Minimum size of the tileMap padding"
	
	^ 0
]

{
	#category : #constants,
	#'squeak_changestamp' : 'tw 7/12/2024 19:22'
}
GMTEEditor class >> toolBarVSpace [

	^ 0.15
]

{
	#category : #utility,
	#'squeak_changestamp' : 'mcjj 7/12/2024 21:58'
}
GMTEEditor class >> vLayoutFrame: intI ofN: intN [
	"Calculates the frame of equal sized specs"
	
	^ self vLayoutFrame: intI ofN: intN hSymmetric: 0
]

{
	#category : #utility,
	#'squeak_changestamp' : 'mcjj 7/12/2024 21:58'
}
GMTEEditor class >> vLayoutFrame: intI ofN: intN hLeft: aFloat right: anotherFloat [
	"useful for building buttons, maybe move this to instance? TODO FLAG"
	
	^ LayoutFrame fractions: ((aFloat @ (intI - 1 / intN)) corner: (1 - anotherFloat @ (intI / intN)))
]

{
	#category : #utility,
	#'squeak_changestamp' : 'tw 7/12/2024 18:26'
}
GMTEEditor class >> vLayoutFrame: intI ofN: intN hSymmetric: aFloat [

	^ self vLayoutFrame: intI ofN: intN hLeft: aFloat right: aFloat
]

{
	#category : #'command processing',
	#'squeak_changestamp' : 'tw 7/12/2024 22:38'
}
GMTEEditor >> addCommand: aCommand [
	"Appends a new command to the list and overwrites all commands that were made in an undone future"
	
	[self commands size > self currentCommand] whileTrue: [self commands removeLast].

	(self commands size > self class maxNumberOfCommands) ifTrue: [self commands removeFirst.
		self currentCommand: self currentCommand - 1].
	
	self commands add: aCommand.
	self currentCommand: self currentCommand + 1
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'tw 7/12/2024 23:04'
}
GMTEEditor >> addLayer [
	
	(self layerCount >= GMTETileMap maxLayers) ifTrue: [^ nil].
	self
		addCommand: (GMTEAddLayerCommand withEditor: self);
		addTilemapLayer
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'Alex M 7/10/2024 04:06'
}
GMTEEditor >> addTilemapLayer [

	self addTilemapLayersAt: {self getLayerList size + 1}
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'Alex M 7/10/2024 04:01'
}
GMTEEditor >> addTilemapLayersAt: aLayerList [

	| newLayerNumber |
	(self layerCount >= GMTETileMap maxLayers) ifTrue: [^ nil].
	newLayerNumber :=  self layerCount + 1.
	
	self tileMap tileMatrixStack pushLayers: aLayerList.
	self 
		selectOnlyLayer: aLayerList last;
		changed: #getLayerList
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'tw 7/12/2024 23:05'
}
GMTEEditor >> anyLayerSelected [
	"Checks whether any layer is selected"
	
	^ (self selectedLayers size > 0)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tw 7/12/2024 21:49'
}
GMTEEditor >> associatedMorph [
	"The morph associated with the model"

	^ associatedMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mcjj 7/12/2024 19:38'
}
GMTEEditor >> associatedMorph: anObject [

	associatedMorph := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tw 7/12/2024 21:49'
}
GMTEEditor >> backgroundTile [
	"The tile used to dynamically fill the background of the map, if the user wishes so"
	
	^ backgroundTile
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tw 7/12/2024 21:51'
}
GMTEEditor >> backgroundTile: anObject [
	
	self flag: 'cursed'.
	(backgroundTile = anObject)
		ifTrue: [backgroundTile := GMTETile checkerBoardTile]
		ifFalse: [backgroundTile := anObject].
	"TODO: keep this here? TileMap must know backgorund Tiles"
	self tileMap backgroundTiles: backgroundTile
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'tw 7/12/2024 23:05'
}
GMTEEditor >> blendLayers: aLayerList [
	"Fuses the layers into one layer"
	
	| bakedLayer |
	(aLayerList size > 1)
		ifTrue: [
			bakedLayer := aLayerList min.
			self tileMap tileMatrixStack blendLayers: aLayerList.
			self
				deselectAllLayers;
				selectLayer: bakedLayer].
	self changed: #getLayerList
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'Alex M 7/12/2024 20:53'
}
GMTEEditor >> blendSelectedLayers [
	"Fuses the selected layers into one layer"
	
	self
		addCommand: (GMTEBlendLayersCommand fromLayers: self selectedLayers editor: self);
		blendLayers: self selectedLayers
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tw 7/12/2024 22:30'
}
GMTEEditor >> brush [
	"The brush associated with the editor"
	
	^ brush
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tw 7/12/2024 21:51'
}
GMTEEditor >> brush: anObject [

	brush := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tw 7/12/2024 22:31'
}
GMTEEditor >> brushButtons [
	"GMTEButtonGroup of the buttons selecting brushes"

	^ brushButtons
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mcjj 7/12/2024 19:38'
}
GMTEEditor >> brushButtons: anObject [

	brushButtons := anObject
]

{
	#category : #building,
	#'squeak_changestamp' : 'tw 7/12/2024 22:10'
}
GMTEEditor >> buildWith: builder [
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
]

{
	#category : #helper,
	#'squeak_changestamp' : 'tw 7/12/2024 22:45'
}
GMTEEditor >> calculateAttributeContainerWidth: label [
	"Calculates the minimum width of an attribute container"
	
	^ (self getSizeOfString: label) + GMTEEditor getInputFieldSize
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tw 7/12/2024 21:52'
}
GMTEEditor >> commands [
	"List of recent commands, used for undo/redo"

	^ commands
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tw 7/12/2024 21:52'
}
GMTEEditor >> commands: anObject [

	commands := anObject
]

{
	#category : #building,
	#'squeak_changestamp' : 'tw 7/12/2024 20:11'
}
GMTEEditor >> createAttributeSpecWithBuilder: aBuilder descriptor: aString getter: aSelector setter: anotherSelector model: aModel frame: aFrame [ 
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
]

{
	#category : #building,
	#'squeak_changestamp' : 'jj 6/22/2024 20:42'
}
GMTEEditor >> createCommandBarSpecWithBuilder: aBuilder [
	"creates the spec for the command bar"
	
	^ aBuilder pluggablePanelSpec new
		name: 'command bar';
		model: self;
		children: {(aBuilder pluggableButtonSpec new)
			name: 'import';
			label: 'Import ...';
			model: self;
			frame: (LayoutFrame fractions: (0 @ 0 corner: 0.3 @ 1) offsets: nil);
			action: #importMenu.
			
			(aBuilder pluggableButtonSpec new)
			name: 'export';
			label: 'Export as ...';
			model: self;
			action: #exportMenu;
			frame: (LayoutFrame fractions: (0.3 @ 0 corner: 0.6 @ 1) offsets: nil).

			(aBuilder pluggableButtonSpec new)
			frame: (LayoutFrame fractions: (0.6 @ 0 corner: 0.9 @ 1) offsets: nil);
			name: 'openInWorld';
			label: 'Open in World';
			model: self;
			action: #openTileMapInWorld.
			
			(aBuilder pluggableButtonSpec new)
			frame: (LayoutFrame fractions: (0.9 @ 0 corner: 1 @ 1) offsets: nil);
			name: 'settings';
			label: '...';
			model: self;
			action: #settingsMenu};

		verticalResizing: #shrinkWrap;
		
		frame: (LayoutFrame
			fractions: (0 @ 0 corner: 1 @ 0) offsets:(0 @ 0 corner: 0 @ 30));
		yourself
]

{
	#category : #building,
	#'squeak_changestamp' : 'tw 7/12/2024 20:07'
}
GMTEEditor >> createInspectorSpecWithBuilder: aBuilder [
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
]

{
	#category : #building,
	#'squeak_changestamp' : 'Alex M 7/11/2024 18:04'
}
GMTEEditor >> createLayersSpecWithBuilder: aBuilder [
	"creates the spec for layer viewer"
	
	^ (aBuilder pluggablePanelSpec new)
		name: 'layer viewer';
		model: self;
		minimumExtent:150 @ 150;
		frame: (LayoutFrame
			fractions: (0.8 @ 0.25 corner: 1 @ 1));
		children: {
			(aBuilder pluggablePanelSpec new)
			frame: (LayoutFrame fractions: (0.85 @ 0 corner: 1 @ 1) offsets: (0 @ 30 corner: 0 @ 0));
			
			children: {
				(aBuilder pluggableImageButtonSpec new)
					model:self;
					action: #addLayer;
					name: 'buttonAddLayer';
					description: 'Add Layer';
					frame: (LayoutFrame fractions: (0 @ 0 corner: 1 @ 0.125));
					project: 'GameMecha';
					path: '/GMTEIcons/add.png'.
			
				(aBuilder pluggableImageButtonSpec new)
					model:self;
					action: #moveLayerDown;
					name: 'buttonMoveLayerDown';
					description: 'Move Layer Down';
					frame: (LayoutFrame fractions: (0 @ 0.125 corner: 1 @ 0.25));
					project: 'GameMecha';
					path: '/GMTEIcons/up.png'.
				
				(aBuilder pluggableImageButtonSpec new)
					model:self;
					action: #moveLayerUp;
					name: 'buttonMoveLayerUp';
					description: 'Move Layer Up';
					frame: (LayoutFrame fractions: (0 @ 0.25 corner: 1 @ 0.375));
					project: 'GameMecha';
					path: '/GMTEIcons/down.png'.
				
				(aBuilder pluggableImageButtonSpec new)
					model: self;
					action: #renameLayer;
					name: 'buttonRenameLayer';
					description: 'Rename Layer';
					frame: (LayoutFrame fractions: (0 @ 0.375 corner: 1 @ 0.5));
					project: 'GameMecha';
					path: '/GMTEIcons/rename.png'.
				
				(aBuilder pluggableImageButtonSpec new)
					model:self;
					action:#resetSelectedLayers;
					name: 'buttonResetLayers';
					description: 'Clear Layer(s)';
					frame: (LayoutFrame fractions: (0 @ 0.5 corner: 1 @ 0.625));
					project: 'GameMecha';
					path: '/GMTEIcons/broom.png'.
				
				(aBuilder pluggableImageButtonSpec new)
					model:self;
					action: #blendSelectedLayers;
					name: 'buttonBlendLayers';
					description: 'Blend Layers';
					frame: (LayoutFrame fractions: (0 @ 0.625 corner: 1 @ 0.75));
					project: 'GameMecha';
					path: '/GMTEIcons/merge.png'.
				
				(aBuilder pluggableImageButtonSpec new)
					model:self;
					action: #deleteSelectedLayers;
					name: 'buttonDeleteLayers';
					description: 'Delete Layer(s)';
					frame: (LayoutFrame fractions: (0 @ 0.75 corner: 1 @ 0.875));
					project: 'GameMecha';
					path: '/GMTEIcons/trash.png'.
				
				(aBuilder pluggableImageButtonSpec new)
					model:self;
					action: #toggleSelectedLayerVisibility;
					name: 'buttonToggleVisibilityLayers';
					description: 'Show/Hide Layer(s)';
					frame: (LayoutFrame fractions: (0 @ 0.875 corner: 1 @ 1));
					project: 'GameMecha';
					path: '/GMTEIcons/eye.png'}.
			
			(aBuilder pluggableMultiSelectionListSpec new)
			name: 'layers';
			model: self;
			list: #getLayerList;
			getSelectionList: #layerAt:;
			setSelectionList: #layerAt:put:;
			autoDeselect: false;
			frame: (LayoutFrame fractions: (0 @ 0 corner: 0.85 @ 1) offsets: (0 @ 30 corner: 0 @ 0))};
		verticalResizing: #shrinkWrap;
		yourself
]

{
	#category : #building,
	#'squeak_changestamp' : 'tw 7/12/2024 19:19'
}
GMTEEditor >> createTileViewerSpecWithBuilder: aBuilder [
	"creates the spec for the tile viewer"
	"TODO: Maybe rename function to something more appropriate?"
	
	^ aBuilder pluggablePanelSpec new
		name: 'main panel';
		model:self;
		frame: (LayoutFrame fractions: (0.2 @ 0 corner: 0.8 @ 0.7)
		offsets: (0@ 30 corner: 0@0));
		children: {					
			(aBuilder pluggablePanelSpec new)
				name: 'tile viewer';
				layout: #horizontal;
				model:self;
				frame: (LayoutFrame
					fractions: (0 @ 0 corner: 1 @ 1))
		 };
		
		minimumExtent:150 @ 150;
		yourself
]

{
	#category : #building,
	#'squeak_changestamp' : 'jj 6/22/2024 20:44'
}
GMTEEditor >> createTilestoreSpecWithBuilder: aBuilder [
	"creates the spec for the tile store"

	^ (aBuilder pluggableScrollPaneSpec new)
		frame: (LayoutFrame fractions: (0 @ 0 corner: 0.2 @ 1)
		offsets: (0@ 30 corner: 0@0));
		name: 'tile store';
		spacing: 10@10;
		children: {};
		spacing: 20;
		verticalResizing: #shrinkWrap;
		horizontalResizing: #shrinkWrap;
		minimumWidth:100;
		yourself

]

{
	#category : #building,
	#'squeak_changestamp' : 'tw 7/12/2024 22:53'
}
GMTEEditor >> createToolBarSpecWithBuilder: aBuilder [
	"creates the spec for the tool bar"
	
	| radiusLabel |
	
	radiusLabel := 'radius:'.
	
	^ (aBuilder pluggablePanelSpec new)
		name: 'toolbar';
		model: self;
		frame: (LayoutFrame fractions: (0.2@0.7 corner: 0.8@0.8));
		minimumHeight: (35 * RealEstateAgent scaleFactor); "slightly magic number, in testing this was pretty. no time to fix until deadline"
		children: {
			self createAttributeSpecWithBuilder: aBuilder 
				descriptor: radiusLabel
				getter: #getBrushRadiusAsString
				setter: #setBrushRadius: 
				model: self 
				frame: ((GMTEEditor hLayoutFrame: 1 ofN: 10 vSymmetric: GMTEEditor toolBarVSpace)).
				
			(aBuilder pluggablePanelSpec new)
				model: self;
				frame: (LayoutFrame fractions: (0.05 @ 0 corner: 1@ 1) offsets: ((self calculateAttributeContainerWidth: radiusLabel) @ 0 corner: 0 @ 0));
				children:  {
					(aBuilder pluggableImageButtonSpec new)
						groupName: 'radiusBrush';
						description: 'Brush';
						model: self;
						frame: (GMTEEditor hLayoutFrame: 1 ofN: 6 vSymmetric: GMTEEditor toolBarVSpace);
						action: #selectRadiusBrush;
						project: 'GameMecha';
						buttonGroup: self brushButtons;
						path: '/GMTEIcons/brush.png'.
					
					(aBuilder pluggableImageButtonSpec new)
						groupName: 'lineBrush';
						description: 'Line Tool';
						model: self;
						frame: (GMTEEditor hLayoutFrame: 2 ofN: 6 vSymmetric: GMTEEditor toolBarVSpace);
						action: #selectLineBrush;
						project: 'GameMecha';
						buttonGroup: self brushButtons;
						path: '/GMTEIcons/line.png'.
						
					(aBuilder pluggableImageButtonSpec new)
						groupName: 'fillBrush';
						description: 'Fill Tool';
						model: self;
						frame: (GMTEEditor hLayoutFrame: 3 ofN: 6 vSymmetric: GMTEEditor toolBarVSpace);
						action: #selectFillBrush;
						project: 'GameMecha';
						buttonGroup: self brushButtons;
						path: '/GMTEIcons/fill.png'.
						
					(aBuilder pluggableImageButtonSpec new)
						groupName: 'rectangleBrush';
						description: 'Rectangle Tool';
						model: self;
						frame: (GMTEEditor hLayoutFrame: 4 ofN: 6 vSymmetric: GMTEEditor toolBarVSpace);
						action: #selectRectangleBrush;
						project: 'GameMecha';
						buttonGroup: self brushButtons;
						path: '/GMTEIcons/rectangle.png'.
						
						(aBuilder pluggableImageButtonSpec new)
						name: 'undo';
						description: 'Undo';
						model: self;
						frame: (GMTEEditor hLayoutFrame: 5 ofN: 6 vSymmetric: GMTEEditor toolBarVSpace);
						action: #undo;
						project: 'GameMecha';
						path: '/GMTEIcons/undo.png'.
						
					(aBuilder pluggableImageButtonSpec new)
						name: 'redo';
						description: 'Redo';
						model: self;
						frame: (GMTEEditor hLayoutFrame: 6 ofN: 6 vSymmetric: GMTEEditor toolBarVSpace);
						action: #redo;
						project: 'GameMecha';
						path: '/GMTEIcons/redo.png'}};
			
		verticalResizing: #shrinkWrap;
		yourself
]

{
	#category : #building,
	#'squeak_changestamp' : 'tw 7/12/2024 19:14'
}
GMTEEditor >> createTraySpecWithBuilder: aBuilder [
	"creates the spec for the tile tray"
	
	^ (aBuilder pluggableScrollPaneSpec new)
		name: 'tray';
		frame: (LayoutFrame fractions: (0.2 @ 0.8 corner:  0.8 @ 1));
		minimumHeight:75;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tw 7/12/2024 21:53'
}
GMTEEditor >> currentCommand [
	"Index of the command whose state the editor is currently in"

	^ currentCommand
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tw 7/12/2024 21:52'
}
GMTEEditor >> currentCommand: anObject [

	currentCommand := anObject
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'tw 7/12/2024 23:05'
}
GMTEEditor >> deleteSelectedLayers [
	"Deletes all selected layers unless this would delete all layers"
	
	(self anyLayerSelected not or: (self selectedLayers size >= self getLayerList size)) ifTrue: [^ nil].
	
	self
		addCommand: (GMTEDeleteLayersCommand fromLayers: self selectedLayers editor: self);
		deleteTilemapLayers: self selectedLayers
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'Alex M 7/7/2024 00:51'
}
GMTEEditor >> deleteTilemapLayers: aLayerList [
	
	self tileMap tileMatrixStack removeLayersAt: aLayerList.
	self 
		deselectAllLayers;
		changed: #getLayerList;
		selectOnlyLayer: self layerCount
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'tw 7/12/2024 21:53'
}
GMTEEditor >> deselectAllLayers [
	"Empties the selected layers set"
	
	self
		selectedLayers: Set new;
		changed: #selectedLayers
	
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'tw 7/12/2024 23:06'
}
GMTEEditor >> deselectLayer: anIndex [
	"Deselects the layer with the provided index"
	
	(self selectedLayers size <= 1) ifTrue: [^ nil].
	
	(self selectedLayers includes: anIndex)
		ifTrue: [
			self selectedLayers remove: anIndex.
			self updateButtonEnabled.
			self
				changed: #selectedLayers;
				changed: #layerAt:]
	
]

{
	#category : #painting,
	#'squeak_changestamp' : 'tw 7/12/2024 23:19'
}
GMTEEditor >> deselectTile [
	"Deselect the currently selected tile"
	
	self selectedTile: nil.
	self tileMap tileSelectionSet highlightImage: nil.
	self tileTray morph submorphs first visible: false
]

{
	#category : #'button manipulation',
	#'squeak_changestamp' : 'tw 7/12/2024 22:36'
}
GMTEEditor >> disableSingleLayerButtons [
	"Disables buttons assigned to actions that are only valid on singular layers"

	GMTEEditor singleLayerActionNames do: [:aString | (self associatedMorph submorphNamed: aString) enabled: false]
]

{
	#category : #'button manipulation',
	#'squeak_changestamp' : 'tw 7/12/2024 22:36'
}
GMTEEditor >> enableSingleLayerButtons [
	"Enables buttons assigned to actions that are only valid on singular layers"

	GMTEEditor singleLayerActionNames do: [:aString | (self associatedMorph submorphNamed: aString) enabled: true ]
]

{
	#category : #'menu buttons',
	#'squeak_changestamp' : 'tw 7/12/2024 23:21'
}
GMTEEditor >> exportAsImage [
	"Exports the current tile map as a png"
	
	exportTilemap := self tileMap veryDeepCopy.
	exportTilemap 
		hideHighlightingLayer;
		resetView;
		exportAsImage
]

{
	#category : #'menu buttons',
	#'squeak_changestamp' : 'tw 7/12/2024 23:10'
}
GMTEEditor >> exportAsMorph [
	"Saves the current tileMap as a .morph file, which allows for reimporting"
	
	((self tileMap veryDeepCopy) 
		model: nil;
		resetView
	) saveOnFile. 
	self savedSinceModified: true
]

{
	#category : #'menu buttons',
	#'squeak_changestamp' : 'tw 7/12/2024 23:10'
}
GMTEEditor >> exportMenu [
	"Creates the menu for the export options"
	
	| aMenuSpec builder|
	builder := ToolBuilder default.
	aMenuSpec := builder pluggableMenuSpec new.

	aMenuSpec
		add: 'Tilemap'
		target: self
		selector: #exportAsMorph
		argumentList: {};
		
		add: 'PNG'
		target: self
		selector: #exportAsImage
		argumentList: {}.
		
	builder open: aMenuSpec
]

{
	#category : #'input handling',
	#'squeak_changestamp' : 'tw 7/12/2024 23:04'
}
GMTEEditor >> filterEvent: aKeyboardEvent for: anObject [
	"Handles keyboard shortcuts"
	
	| key |
	aKeyboardEvent isKeystroke
		ifFalse: [^ aKeyboardEvent].
	
	key := aKeyboardEvent keyCharacter.

	aKeyboardEvent commandKeyPressed ifTrue: [
		key caseOf: {
			[$s] -> [self exportAsMorph].
			[$i] -> [self importFromMorph].
			[$o] -> [self importFromTileset].
			[$g] -> [self toggleGrid].
			[$h] -> [self toggleBackgroundTiles].
		
			[$a] -> [self addLayer].
			[$n] -> [self renameLayer].
			[$c] -> [self resetSelectedLayers].
			[$b] -> [self blendSelectedLayers].
			[$x] -> [self deleteSelectedLayers].
			[$v] -> [self toggleSelectedLayerVisibility].
			
			[$z] -> [self undo].
			[$y] -> [self redo].
			[$r] -> [self rotateSelectedTile].
			[$1] -> [self selectRadiusBrush].
			[$2] -> [self selectLineBrush].
			[$3] -> [self selectFillBrush].
			[$4] -> [self selectRectangleBrush].
		} otherwise: [^ aKeyboardEvent "no hit"].
		^ aKeyboardEvent ignore "hit"].
	
	^ aKeyboardEvent "no hit"
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tw 7/12/2024 21:58'
}
GMTEEditor >> getBrushRadius [

	self brush ifNil: [^ nil].
	
	^ self brush radius
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 7/9/2024 11:30'
}
GMTEEditor >> getBrushRadiusAsString [

	^ self getBrushRadius asString
]

{
	#category : #helper,
	#'squeak_changestamp' : 'tw 7/12/2024 22:45'
}
GMTEEditor >> getFileWithFileChooser [
	"Opens a file chooser which allows the user to select a morph file"
	
	^ UIManager default chooseFileMatchingSuffixes: {'morph'}
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tw 7/12/2024 21:54'
}
GMTEEditor >> getGridHeight [
	"Returns the height (in tiles) of the tileMap"
	
	self tileMap 
		ifNotNil: [^ self tileMap mapTileHeight]
		ifNil: [^ nil]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tw 7/12/2024 22:23'
}
GMTEEditor >> getGridHeightAsString [
	
	^ self getGridHeight asString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tw 7/12/2024 21:54'
}
GMTEEditor >> getGridWidth [
	"Returns the width (in tiles) of the tileMap"
	
	self tileMap 
		ifNotNil: [^ self tileMap mapTileWidth]
		ifNil: [^ nil]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tw 7/12/2024 22:23'
}
GMTEEditor >> getGridWidthAsString [
	
	^ self getGridWidth asString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tw 7/12/2024 23:06'
}
GMTEEditor >> getLayerList [
	"Returns the list of all layers"
	
	self tileMap ifNil: [^ OrderedCollection new].
	
	^ self tileMap tileMatrixStack collectLayers: [:aLayer | aLayer displayName, (GMTEEditor getVisibilityIndicator: aLayer visible)]
]

{
	#category : #helper,
	#'squeak_changestamp' : 'tw 7/12/2024 22:46'
}
GMTEEditor >> getMaximalSizeOfStrings: setOfStrings [

	^ (setOfStrings collect: [:aString | self getSizeOfString: aString]) max
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tw 7/12/2024 21:54'
}
GMTEEditor >> getPadding [
	"Returns the padding of the tileMap"
	
	self tileMap 
		ifNotNil: [^ self tileMap mapPadding]
		ifNil: [^ nil]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tw 7/12/2024 22:23'
}
GMTEEditor >> getPaddingAsString [
	
	^ self getPadding asString
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'tw 7/12/2024 23:06'
}
GMTEEditor >> getSelectedLayer [
	"Returns the selected layer, if only one is selected"
	
	self assert: self singleLayerSelected.
	^ self selectedLayers anyOne
]

{
	#category : #helper,
	#'squeak_changestamp' : 'tw 7/12/2024 22:46'
}
GMTEEditor >> getSizeOfString: aString [
	"How much space does this string need to be displayed in a standard font/size"

	^ TextStyle defaultFont approxWidthOfText: aString asText
]

{
	#category : #'menu buttons',
	#'squeak_changestamp' : 'tw 7/12/2024 23:11'
}
GMTEEditor >> importFromMorph [
	"Import tilemap into editor from a .morph file"

	|stream tileMap|
	stream := self getFileWithFileChooser.

    	stream ifNil: [^ self].
    	tileMap := GMTEEditor privateGetEditorTileMapFromFilePath: stream.
    	self openTileMapInEditor: tileMap.
	self
		changed: #getPaddingAsString;
		changed: #getGridWidthAsString;
		changed: #getGridHeightAsString;
		changed: #getLayerList
]

{
	#category : #'menu buttons',
	#'squeak_changestamp' : 'tw 7/12/2024 23:12'
}
GMTEEditor >> importFromTileset [
	"Loads a tileset into the tile store"
	
	| tiles tileHeight dimensions|
	tileHeight := FillInTheBlankMorph request: 'Enter tile height (width is calculated by ratio)' initialAnswer: '16'.
	
	(tileHeight = '')
		ifTrue: [^ nil]
		ifFalse:[tileHeight := tileHeight asInteger].
	
	dimensions := (tileHeight @ tileHeight).
	tiles := self loadTileSetWithDimensions: dimensions.
	
	tiles ifNil: [^ nil].
	
	self tileStore morph addAllMorphs: tiles
]

{
	#category : #'menu buttons',
	#'squeak_changestamp' : 'tw 7/12/2024 23:12'
}
GMTEEditor >> importMenu [
	"Creates the menu for the import options"
	
	| aMenuSpec builder|
	builder := ToolBuilder default.
	aMenuSpec := builder pluggableMenuSpec new.

	aMenuSpec
		add: 'Tileset'
		target: self
		selector: #importFromTileset
		argumentList: {};
		
		add: 'Tilemap'
		target: self
		selector: #importFromMorph
		argumentList: {}.
		
	builder open: aMenuSpec
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'tw 7/12/2024 23:00'
}
GMTEEditor >> initialize [
	
	super initialize.
	self
		resetCommands;
		currentCommand: 1;
		selectedLayers: Set new;
		selectLayer: 1;
		brushButtons: GMTEButtonGroup new;
		open;
		savedSinceModified: true;
		updateButtonEnabled;
		changed: #getLayerList;
		initializeBrush
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'tw 7/12/2024 23:41'
}
GMTEEditor >> initializeBrush [
	"Necessary so the button knows it is selected"
	
	self 
		brush: GMTEBrush new;
		selectRadiusBrush;
		changed: #getBrushRadiusAsString
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'tw 7/12/2024 23:03'
}
GMTEEditor >> initializeDefaultTileMapMatrix [
	
	self initializeTileMapMatrixWithHeight: 10 width: 10
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'tw 7/12/2024 23:03'
}
GMTEEditor >> initializeTileMapMatrixWithHeight: aHeight width: aWidth [
	"Initializes the tileMap with a tile map with a certain height and width"
	
	self tileMap: (GMTEEditorTileMap tileWidth: aWidth tileHeight: aHeight padding: 0.15 sizeRatio: 1 model: self).
	self mapViewer addMorph: self tileMap.		
	self tileMap 
		position: (self tileMap owner position);
		hResizing: #spaceFill; 
		vResizing: #spaceFill;
		updateMap.
	self
		changed: #getGridWidthAsString;
		changed: #getGridHeightAsString;
		changed: #getPaddingAsString
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'tw 7/12/2024 23:06'
}
GMTEEditor >> layerAt: anIndex [
	"Is this layer selected"
	
	^ self selectedLayers includes: anIndex
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'tw 7/12/2024 23:07'
}
GMTEEditor >> layerAt: anIndex put: aBool [
	"(De-)Selects this layer"
	
	| multiSelection |
	multiSelection := Sensor shiftPressed.
	
	multiSelection ifFalse: [self selectedLayers removeAll].
	
	(aBool or: [multiSelection not])
		ifTrue: [self selectLayer: anIndex]
		ifFalse: [self deselectLayer: anIndex]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tw 7/12/2024 22:22'
}
GMTEEditor >> layerCount [
	"Returns the amount of layers in the tileMap"
	
	^ self tileMap tileMatrixStack layerCount
]

{
	#category : #'file loading',
	#'squeak_changestamp' : 'tw 7/12/2024 22:42'
}
GMTEEditor >> loadTileSetWithDimensions: aPoint [
	"loads a tile set with given tile dimensions"
	"The source argument is mostly for debugging. Make it nicer with objects"
	"Do we really leaves this here or do we create an extra class for"
 
	| fc stream form tile tileWidth tileHeight image morphs previewDimensions previewTileSize alreadyImported previews |
	fc := FileChooser new.
	fc initializeAsSystemWindowWithCaptionPane.
	fc setCaption: 'Select an image file' translated.
	fc setSuffixes: {'png' . 'gif' . 'bmp' . 'jpg' . 'jpeg' }.
	stream := fc open.
	
	stream ifNil: [^ nil].
	
	form := Form fromBinaryStream: stream.
	
	morphs := OrderedCollection new.
	previews := OrderedCollection new.
	alreadyImported := Set new.
	
	tileWidth := aPoint x.
	tileHeight := aPoint y.
	"TODO: refactor into non C-like code"
	0 to: (form height - tileHeight) by: tileHeight do:[:y |
		0 to: (form width - tileWidth) by: tileWidth do: [:x |
			tile := form contentsOfArea: (Rectangle origin: x@y extent: tileWidth@tileHeight).
			image := GMTETileSelector new
				updateSprite: (tile scaledToWidth: 50);
				borderColor: Color orange;
				borderWidth: 1;
				model: self.
			(alreadyImported includes: image imageForm bits hash)
				ifFalse: [alreadyImported add: image imageForm bits hash.
					morphs add: image].
			"TODO: Maybe only send forms"
			previews add: ((ImageMorph new) image: tile)]].
	
	"TODO: This is maybe not the nicest way to write it. Maybe put more of it into confirmPreview?" "TODO: lots of potential magic numbers all over this method"
	previewTileSize := (form width max: 500) / (form width / tileWidth).
	previewDimensions := (form extent / aPoint * previewTileSize) + (2 * ((form width / tileWidth) @ (form height / tileHeight))).
	(self showConfirmationWindowOf: previews withDimensions: previewDimensions withTileSize: previewTileSize) ifFalse:[^nil].

	^ morphs
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tw 7/12/2024 22:09'
}
GMTEEditor >> mapViewer [
	"The panel that contains the tileMap"
	
	^ mapViewer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tw 7/12/2024 22:09'
}
GMTEEditor >> mapViewer: anObject [

	mapViewer := anObject
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'tw 7/12/2024 23:07'
}
GMTEEditor >> moveLayerDown [
	"Moves the selected layer down by one"
	
	| selectedLayer |
	self singleLayerSelected ifFalse: [^ nil].
	
	selectedLayer := self getSelectedLayer.
	self addCommand: (GMTEMoveLayerCommand fromLayerID: selectedLayer withDirection: -1 withEditor: self).
	(selectedLayer == 1) ifFalse: [self swapLayer: selectedLayer with: selectedLayer - 1]
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'tw 7/12/2024 23:07'
}
GMTEEditor >> moveLayerUp [
	"Moves the selected layer up by one"
	
	| selectedLayer |
	self singleLayerSelected ifFalse: [^ nil].
	
	selectedLayer := self getSelectedLayer.
	self addCommand: (GMTEMoveLayerCommand fromLayerID: selectedLayer withDirection: 1 withEditor: self).
	(selectedLayer == self layerCount) ifFalse: [self swapLayer: selectedLayer with: selectedLayer + 1]
]

{
	#category : #building,
	#'squeak_changestamp' : 'Alex M 7/11/2024 00:34'
}
GMTEEditor >> onClose [
	"asks the user whether they want to save their progress"
	
	self savedSinceModified
		ifFalse: [(PopUpMenu confirm: 'Save before closing?')
			ifTrue: [self exportAsMorph]]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'tw 7/12/2024 23:03'
}
GMTEEditor >> open [
  	"Builds the window"
	
	| newMorph |
	newMorph := ToolBuilder default build: self.
      newMorph openInWorld.
	self mapViewer submorphs first updateMap.
      ^ newMorph
]

{
	#category : #helper,
	#'squeak_changestamp' : 'tw 7/12/2024 22:47'
}
GMTEEditor >> openTileMapInEditor: aTileMap [
	"Loads a tileMap into the editor"
	
	aTileMap tileSelectionSet highlightImage: nil.
	self tileMap: aTileMap.
	aTileMap model: self.
	self mapViewer
		removeAllMorphs;
		addMorph: aTileMap.
	self resetCommands.

	self changed: #getLayerList
]

{
	#category : #'menu buttons',
	#'squeak_changestamp' : 'tw 7/12/2024 23:12'
}
GMTEEditor >> openTileMapInWorld [
	"Open the current tileMap into world"
	
	(GMTETileMap newFromEditableTileMap: self tileMap)
		position: 0@0;
		openInWorld
]

{
	#category : #'textual user input',
	#'squeak_changestamp' : 'tw 7/12/2024 22:48'
}
GMTEEditor >> parseBrushRadius: aText [
	"Converts a brush radius if valid"
	
	| newSize |
	newSize := self parseSize: aText.
	(newSize notNil and: [newSize isInteger and: [GMTEEditor minBrushRadius < newSize and: [newSize < GMTEEditor maxBrushRadius]]])
		ifTrue: [^ newSize]
		ifFalse: [^ nil]
]

{
	#category : #'textual user input',
	#'squeak_changestamp' : 'tw 7/12/2024 22:47'
}
GMTEEditor >> parseGridSize: aText [
	"Converts an input grid size (height/width) if valid"
	
	| newSize |
	newSize := self parseSize: aText.
	(newSize notNil and: [newSize isInteger and: [GMTEEditor tileMapMinGridSize < newSize and: [newSize < GMTEEditor tileMapMaxGridSize]]])
		ifTrue: [^ newSize]
		ifFalse: [^ nil]
]

{
	#category : #'textual user input',
	#'squeak_changestamp' : 'tw 7/12/2024 22:47'
}
GMTEEditor >> parsePaddingSize: aText [
	"Converts an input padding size if valid"
	
	| newSize |
	newSize := self parseSize: aText.
	(newSize notNil and: [GMTEEditor tileMapMinPaddingSize <= newSize and: [newSize <= GMTEEditor tileMapMaxPaddingSize]])
		ifTrue: [^ newSize]
		ifFalse: [^ nil]
]

{
	#category : #'textual user input',
	#'squeak_changestamp' : 'tw 7/12/2024 22:48'
}
GMTEEditor >> parseSize: aText [
	"Converts a string into a number"
	
	[^ aText asNumber] on: NumberParserError do: [^ nil]
]

{
	#category : #building,
	#'squeak_changestamp' : 'tw 7/12/2024 22:09'
}
GMTEEditor >> placeSelectedTileIntoTileTray [
	
	| selectedTile |
	selectedTile := GMTETileSelector new 
		visible: false;
		name: 'selectedTile';
		model: self;
		yourself.
		
	self tileTray morph 
		color: Color transparent;
		addMorph: selectedTile
]

{
	#category : #'command processing',
	#'squeak_changestamp' : 'tw 7/12/2024 22:38'
}
GMTEEditor >> redo [
	"Reapplies the next command in the list, if there is one"
	
	(self currentCommand < self commands size) 
		ifTrue: [
			self
				savedSinceModified: false;
				currentCommand: self currentCommand + 1.
			(self commands at: self currentCommand) do.
			self savedSinceModified: false]
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'tw 7/12/2024 23:07'
}
GMTEEditor >> renameLayer [
	"Renames the selected layer with a user chosen name"
	
	| newName selectedLayer |
	self singleLayerSelected
		ifTrue: [
			selectedLayer := self getSelectedLayer.
			newName := FillInTheBlankMorph 
			request: 'New Name:' initialAnswer: (self tileMap tileMatrixStack layerNameOf: selectedLayer).
			(newName isNil or: newName isEmpty)
				ifFalse: [self tileMap tileMatrixStack setLayerNameOf: selectedLayer to: newName]].
	self changed: #getLayerList

	
]

{
	#category : #'tile map',
	#'squeak_changestamp' : 'Alex M 7/12/2024 19:51'
}
GMTEEditor >> rescaleGridDimensions: aPoint [
	
	(self getGridWidth = aPoint x)	ifFalse: [self rescaleGridWidth: aPoint x].
	(self getGridHeight = aPoint y) ifFalse: [self rescaleGridHeight: aPoint y].
]

{
	#category : #'tile map',
	#'squeak_changestamp' : 'Alex M 7/1/2024 21:04'
}
GMTEEditor >> rescaleGridHeight: aValue [
	
	self tileMap rescaleMapWidth: self getGridWidth height: aValue.
	self changed: #getGridHeightAsString
]

{
	#category : #'tile map',
	#'squeak_changestamp' : 'Alex M 7/1/2024 21:04'
}
GMTEEditor >> rescaleGridWidth: aValue [
	
	self tileMap rescaleMapWidth: aValue height: self getGridHeight.
	self changed: #getGridWidthAsString
]

{
	#category : #'command processing',
	#'squeak_changestamp' : 'Alex M 7/3/2024 23:57'
}
GMTEEditor >> resetCommands [

	self
		commands: (LinkedList newFrom: {GMTEPlaceHolderCommand new});
		currentCommand: 1
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'tw 7/12/2024 23:09'
}
GMTEEditor >> resetLayers: aSet [
	"Resets the layers represented by aSet"
	
	self tileMap resetLayers: aSet
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'tw 7/12/2024 23:09'
}
GMTEEditor >> resetSelectedLayers [
	"Resets all selected layers"
	
	self resetLayers: self selectedLayers
]

{
	#category : #'menu buttons',
	#'squeak_changestamp' : 'tw 7/12/2024 23:12'
}
GMTEEditor >> resetView [
	"Centers and fully zooms out the view"

	self tileMap resetView
]

{
	#category : #painting,
	#'squeak_changestamp' : 'tw 7/12/2024 23:14'
}
GMTEEditor >> rotateSelectedTile [
	"Rotates the selected tile clockwise"
	
	self selectedTile: (self selectedTile rotateBy: #right centerAt: (self selectedTile extent / 2)).
	self tileMap tileSelectionSet 
		removeAllHighlightings;
		highlightImage: self selectedTile;
		applyAllHighlightings
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tw 7/12/2024 21:59'
}
GMTEEditor >> savedSinceModified [
	"Whether the tileMap has been modified since the last save"
	
	^ savedSinceModified
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/22/2024 01:30'
}
GMTEEditor >> savedSinceModified: anObject [

	savedSinceModified := anObject
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'tw 7/12/2024 23:09'
}
GMTEEditor >> selectAllLayers [
	"Selects all layers"
	
	1 to: self layerCount do: [:i | self selectLayer: i]
	
]

{
	#category : #painting,
	#'squeak_changestamp' : 'tw 7/12/2024 17:13'
}
GMTEEditor >> selectFillBrush [

	self brushButtons singleSelectNamed: 'fillBrush'.
	self brush selectFillBrush
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'tw 7/12/2024 23:09'
}
GMTEEditor >> selectLayer: anIndex [
	"Select the layer with anIndex"
	
	self selectedLayers add: anIndex.
	self updateButtonEnabled.
	self
		changed: #selectedLayers;
		changed: #layerAt:
	
]

{
	#category : #painting,
	#'squeak_changestamp' : 'tw 7/12/2024 17:13'
}
GMTEEditor >> selectLineBrush [

	self brushButtons singleSelectNamed: 'lineBrush'.
	self brush selectLineBrush
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'tw 7/12/2024 23:09'
}
GMTEEditor >> selectOnlyLayer: anIndex [
	"Select only the layer with anIndex"
	
	self 
		deselectAllLayers;
		selectLayer: anIndex
	
]

{
	#category : #painting,
	#'squeak_changestamp' : 'tw 7/12/2024 17:12'
}
GMTEEditor >> selectRadiusBrush [

	self brushButtons singleSelectNamed: 'radiusBrush'.
	self brush selectRadiusBrush
]

{
	#category : #painting,
	#'squeak_changestamp' : 'tw 7/12/2024 17:23'
}
GMTEEditor >> selectRectangleBrush [

	self brushButtons singleSelectNamed: 'rectangleBrush'.
	self brush selectRectangleBrush
]

{
	#category : #painting,
	#'squeak_changestamp' : 'tw 7/12/2024 23:19'
}
GMTEEditor >> selectTile: anObject [
	"Selects a tile from the tile store"
	
	(anObject fullResolutionSprite  = self selectedTile)
	ifTrue: [self deselectTile]
	ifFalse: [
		self selectedTile: anObject fullResolutionSprite.
		self tileMap tileSelectionSet highlightImage: anObject fullResolutionSprite.
		(self tileTray morph submorphNamed: 'selectedTile')
			visible: true;
			updateSprite: anObject fullResolutionSprite;
			extent: 75@75;
			flag: '@Alexs magic number']
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tw 7/12/2024 22:00'
}
GMTEEditor >> selectedLayers [
	"Set that contains the user selected layers"
	
	^ selectedLayers
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/22/2024 01:30'
}
GMTEEditor >> selectedLayers: anObject [

	selectedLayers := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tw 7/12/2024 22:06'
}
GMTEEditor >> selectedTile [
	"Currently selected form for painting the map"
	
	^ selectedTile
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/22/2024 01:30'
}
GMTEEditor >> selectedTile: anObject [

	selectedTile := anObject
]

{
	#category : #'textual user input',
	#'squeak_changestamp' : 'tw 7/12/2024 23:38'
}
GMTEEditor >> setBrushRadius: userInput [
	"Takes user input, tries to convert it, and if suitable applies it to brush radius"
	
	| newRadius |
	newRadius := self parseBrushRadius: userInput.
	newRadius ifNil: [^ true].
	
	self brush radius: newRadius.
	self changed: #getBrushRadiusAsString.
		

]

{
	#category : #'textual user input',
	#'squeak_changestamp' : 'tw 7/12/2024 23:38'
}
GMTEEditor >> setGridHeight: aText [
	"Takes user input, tries to convert it, and if suitable applies it to grid height"
	
	| oldSize newHeight |
	oldSize := self getGridWidth @ self getGridHeight.
	newHeight := self parseGridSize: aText.
	newHeight ifNil: [^ true].
	
	self
		addCommand: (GMTETilemapSizeCommand prevSize: oldSize newSize: oldSize x @ newHeight editor: self);
		rescaleGridHeight: newHeight.
		
	^ true
		

]

{
	#category : #'textual user input',
	#'squeak_changestamp' : 'tw 7/12/2024 23:38'
}
GMTEEditor >> setGridWidth: aText [
	"Takes user input, tries to convert it, and if suitable applies it to grid width"
	
	| oldSize newWidth |
	oldSize := self getGridWidth @ self getGridHeight.
	newWidth := self parseGridSize: aText.
	newWidth ifNil: [^ true].
	
	self
		addCommand: (GMTETilemapSizeCommand prevSize: oldSize newSize: newWidth @ oldSize y  editor: self);
		rescaleGridWidth: newWidth.
		
	^ true

]

{
	#category : #'textual user input',
	#'squeak_changestamp' : 'tw 7/12/2024 23:38'
}
GMTEEditor >> setPadding: aText [
	"Takes user input, tries to convert it, and if suitable applies it to padding"
	
	| newSize |
	newSize := self parsePaddingSize: aText.
	newSize ifNil: [^ true].
	
	self tileMap rescaleMapWidth: self getGridWidth height: self getGridHeight padding: newSize.
	self changed: #getPaddingAsString.
	
	^ true

]

{
	#category : #'menu buttons',
	#'squeak_changestamp' : 'tw 7/12/2024 23:12'
}
GMTEEditor >> settingsMenu [
	"Opens the extra menu"
	
	| aMenuSpec builder|
	builder := ToolBuilder default.
	aMenuSpec := builder pluggableMenuSpec new.

	aMenuSpec
		add: 'Toggle Grid'
		target: self
		selector: #toggleGrid
		argumentList: {};
		
		add: 'Toggle Background'
		target: self
		selector: #toggleBackgroundTiles
		argumentList: {};
		
		add: 'Reset View'
		target: self
		selector: #resetView
		argumentList: {}.
		
	builder open: aMenuSpec
]

{
	#category : #'file loading',
	#'squeak_changestamp' : 'tw 7/12/2024 22:45'
}
GMTEEditor >> showConfirmationWindowOf: morphArray withDimensions: aPoint withTileSize: aNumber [
	"Shows a preview window for an imported tileset"
	

	|img imgwrapper dialog|
	imgwrapper := ScrollPane new.
	self flag: 'alex schau nochmal drauf pls. magic nums etc'.
	img := Morph new
		beTransparent;
		extent: aPoint;
		yourself.
	(img layoutPolicy: TableLayout new)
	listDirection: #leftToRight;
	wrapDirection: #leftToRight.
	
	(morphArray reversed) do: [:morph| 
		img 
			addMorph: (ImageMorph new image: (morph image scaledToWidth: aNumber); 			
			borderColor: (Color red);
			borderWidth:1;
			yourself)].
	
	imgwrapper extent: (img width min: 1700) @ (img height min: 800). "TODO: is this a magic number we want to get rid off?"
	imgwrapper scroller addMorph: img.

	dialog := DialogWindow new
		title: 'Preview';
		message: 'Import Tileset?';
		addPaneMorph: imgwrapper;
		createButton: 'Yes' translated value: true;
		createCancelButton: 'No' translated  value: false;
		selectedButtonIndex: 1; "YES"
		registerKeyboardShortcuts.
	dialog paneMorph extent: imgwrapper extent.
	
	^ dialog getUserResponseAtHand
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'tw 7/12/2024 23:09'
}
GMTEEditor >> singleLayerSelected [
	"Checks whether only one layer is selected"
	
	^ (self selectedLayers size == 1)
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'tw 7/12/2024 23:10'
}
GMTEEditor >> swapLayer: anIndex with: anotherIndex [
	"Swaps two layers"
	
	| selectionOfA |
	self tileMap tileMatrixStack swapLayer: anIndex with: anotherIndex.
	selectionOfA := self layerAt: anIndex.
	self 
		layerAt: anIndex put: (self layerAt: anotherIndex);
		layerAt: anotherIndex put: selectionOfA;
		changed: #getLayerList;
		changed: #layerAt:
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tw 7/12/2024 22:06'
}
GMTEEditor >> tileMap [
	"The tileMap that the editor works on"
	
	^ tileMap
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/22/2024 01:30'
}
GMTEEditor >> tileMap: anObject [

	tileMap := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tw 7/12/2024 22:07'
}
GMTEEditor >> tileStore [
	"Panel where the user can select tiles"
	
	^ tileStore
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/22/2024 01:30'
}
GMTEEditor >> tileStore: anObject [

	tileStore := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tw 7/12/2024 22:10'
}
GMTEEditor >> tileTray [
	"Lower panel. Shows selected tile, and could be expanded for more utility"
	
	^ tileTray
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tw 7/12/2024 22:10'
}
GMTEEditor >> tileTray: anObject [

	tileTray := anObject
]

{
	#category : #'menu buttons',
	#'squeak_changestamp' : 'tw 7/12/2024 23:12'
}
GMTEEditor >> toggleBackgroundTiles [
	"Toggles the dynamic filling of the maps background with the background tile"
	 
	self tileMap toggleBackgroundLayer
]

{
	#category : #'menu buttons',
	#'squeak_changestamp' : 'tw 7/12/2024 23:12'
}
GMTEEditor >> toggleGrid [
	"Toggles the visibility of the map grid"
	
	self tileMap toggleHighlightingLayer
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'tw 7/12/2024 23:10'
}
GMTEEditor >> toggleSelectedLayerVisibility [
	
	self selectedLayers do: [:i |self tileMap tileMatrixStack toggleLayerVisibility: i].
	self changed: #getLayerList
]

{
	#category : #'command processing',
	#'squeak_changestamp' : 'tw 7/12/2024 22:41'
}
GMTEEditor >> undo [

	(self currentCommand > 1) 
		ifTrue: [(self commands at: self currentCommand) undo.
			self
				savedSinceModified: false;
				currentCommand: self currentCommand - 1;
				savedSinceModified: false]
]

{
	#category : #'button manipulation',
	#'squeak_changestamp' : 'tw 7/12/2024 22:37'
}
GMTEEditor >> updateButtonEnabled [
	"Updates the states of layer buttons, depending on whether they shoudld be enabled or not"

	self associatedMorph ifNil: [^ nil].

	self singleLayerSelected
		ifTrue: [self enableSingleLayerButtons]
		ifFalse: [self disableSingleLayerButtons].
		
	(self layerAt: 1) "Don't delete the first layer"
		ifTrue: [(self associatedMorph submorphNamed: 'buttonDeleteLayers') enabled: false]
		ifFalse: [(self associatedMorph submorphNamed: 'buttonDeleteLayers') enabled: true]
]
