Class {
	#name : #GMTEEditor,
	#superclass : #Model,
	#instVars : [
		'commandBar',
		'tileStore',
		'tileViewer',
		'layerViewer',
		'trayViewer',
		'selectedLayers',
		'selectedTile',
		'ratio',
		'savedSinceModified',
		'inspector',
		'morphBuilders',
		'backgroundTile',
		'tileMap',
		'associatedMorph',
		'commands',
		'currentCommand',
		'brush',
		'brushButtons'
	],
	#category : #'GM-TE-UI'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'jj 6/23/2024 17:15'
}
GMTEEditor class >> editorMinimumExtent [
	"minimum extent of the tile editor"
	
	^ 550 @ 400
]

{
	#category : #fileHandling,
	#'squeak_changestamp' : 'jj 6/23/2024 14:08'
}
GMTEEditor class >> getTileMapFromFileBinary: aFileBinary [
	"creates a tileMap from a file binary"
	
    ^ GMTETileMap newFrom: (GMTEEditor privateGetEditorTileMapFromFileBinary: aFileBinary)
]

{
	#category : #fileHandling,
	#'squeak_changestamp' : 'jj 6/23/2024 14:08'
}
GMTEEditor class >> getTileMapFromFilePath: aFilePath [
	"loads a tileMap from a local file path"
	
    ^ GMTETileMap newFrom: (GMTEEditor privateGetEditorTileMapFromFilePath: aFilePath)
]

{
	#category : #fileHandling,
	#'squeak_changestamp' : 'jj 6/23/2024 14:09'
}
GMTEEditor class >> getTileMapFromProjectName: aName withPath: aPath [
	"loads a tileMap from the git asset browser"
	
    ^ GMTEEditor getTileMapFromFileBinary: ((GitAssetLoader for: aName) loadAsset: aPath)
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TW 6/23/2024 21:37'
}
GMTEEditor class >> getVisibilityIndicator: aBoolean [

	aBoolean
		ifTrue: [^ ' (v)']
		ifFalse: [^ ' (h)']
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'tw 7/12/2024 18:33'
}
GMTEEditor class >> hLayoutFrame: intI ofN: intN [

	^ self hLayoutFrame: intI ofN: intN vSymmetric: 0
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'tw 7/11/2024 17:03'
}
GMTEEditor class >> hLayoutFrame: intI ofN: intN vSymmetric: aFloat [

	^ self hLayoutFrame: intI ofN: intN vUp: aFloat down: aFloat
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'tw 7/11/2024 17:05'
}
GMTEEditor class >> hLayoutFrame: intI ofN: intN vUp: aFloat down: anotherFloat [

	"useful for building buttons, maybe move this to instance? TODO FLAG"
	
	^ LayoutFrame fractions: ((intI - 1 / intN @ aFloat) corner: (intI / intN @ (1 - anotherFloat)))
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'tw 7/12/2024 16:21'
}
GMTEEditor class >> initialize [

	super initialize.
	self register
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TW 7/9/2024 11:28'
}
GMTEEditor class >> maxBrushRadius [

	^ 50
]

{
	#category : #constants,
	#'squeak_changestamp' : 'Ivo Zilkenat 7/9/2024 11:31'
}
GMTEEditor class >> maxNumberOfCommands [
	
	^ 50
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TW 7/9/2024 11:28'
}
GMTEEditor class >> minBrushRadius [

	^ 0
]

{
	#category : #fileHandling,
	#'squeak_changestamp' : 'jj 6/23/2024 14:09'
}
GMTEEditor class >> privateGetEditorTileMapFromFileBinary: aFileBinary [
	"loads a EditorTileMap from a file binary"
	
    |aFileStream tileMap|
    aFileStream := (MultiByteBinaryOrTextStream with: aFileBinary) binary reset.
    tileMap := aFileStream fileInObjectAndCode.
    (tileMap isKindOf: GMTEEditorTileMap) ifFalse: [^ nil].
    ^ tileMap
]

{
	#category : #fileHandling,
	#'squeak_changestamp' : 'jj 6/23/2024 14:07'
}
GMTEEditor class >> privateGetEditorTileMapFromFilePath: aFilePath [
	"loads a EditorTileMap from a local file path"
	 
    ^ GMTEEditor privateGetEditorTileMapFromFileBinary: (FileStream readOnlyFileNamed: aFilePath) binary contentsOfEntireFile
]

{
	#category : #squeakutils,
	#'squeak_changestamp' : 'tw 7/12/2024 16:20'
}
GMTEEditor class >> register [
	"adds the tile editor to app menu"
	
	"Maybe call this on new?"
	TheWorldMenu registerOpenCommand: {'TileMap Editor'. {self. #startup}}
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TW 6/25/2024 15:53'
}
GMTEEditor class >> singleLayerActionNames [

	^ {'buttonMoveLayerDown' . 'buttonMoveLayerUp' . 'buttonRenameLayer'}
]

{
	#category : #startup,
	#'squeak_changestamp' : 'Alex M 7/9/2024 17:59'
}
GMTEEditor class >> startup [
		
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
	#'squeak_changestamp' : 'Alex M 7/9/2024 17:33'
}
GMTEEditor class >> startupMinimumExtent [
	"minimum extent of the startup wizard"
	
	^ 300@200
]

{
	#category : #constants,
	#'squeak_changestamp' : 'jj 6/23/2024 17:33'
}
GMTEEditor class >> tileMapMaxGridSize [
	"the maximum size of the tileMap per dimension"
	
	^ 200
]

{
	#category : #constants,
	#'squeak_changestamp' : 'jj 6/23/2024 17:35'
}
GMTEEditor class >> tileMapMaxPaddingSize [
	"the maximum size of the tileMap padding"
	
	^ 0.9
]

{
	#category : #constants,
	#'squeak_changestamp' : 'jj 6/23/2024 17:33'
}
GMTEEditor class >> tileMapMinGridSize [
	"the minimum size of the tileMap per dimension"
	
	^ 0
]

{
	#category : #constants,
	#'squeak_changestamp' : 'jj 6/23/2024 17:34'
}
GMTEEditor class >> tileMapMinPaddingSize [
	"the minimum size of the tileMap padding"
	
	^ 0
]

{
	#category : #constants,
	#'squeak_changestamp' : 'tw 7/11/2024 16:52'
}
GMTEEditor class >> toolBarVSpace [

	^ 0.1
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'tw 7/12/2024 18:33'
}
GMTEEditor class >> vLayoutFrame: intI ofN: intN [

	^ self vLayoutFrame: intI ofN: intN hSymmetric: 0
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'tw 7/12/2024 18:26'
}
GMTEEditor class >> vLayoutFrame: intI ofN: intN hLeft: aFloat right: anotherFloat [

	"useful for building buttons, maybe move this to instance? TODO FLAG"
	
	^ LayoutFrame fractions: ((aFloat @ (intI - 1 / intN)) corner: (1 - anotherFloat @ (intI / intN)))
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'tw 7/12/2024 18:26'
}
GMTEEditor class >> vLayoutFrame: intI ofN: intN hSymmetric: aFloat [

	^ self vLayoutFrame: intI ofN: intN hLeft: aFloat right: aFloat
]

{
	#category : #'command processing',
	#'squeak_changestamp' : 'Valentin Teutschbein 7/6/2024 11:56'
}
GMTEEditor >> addCommand: aCommand [
	
	"when a new change is made, all timestamps from the 'future' are deleted"
	[self commands size > self currentCommand] whileTrue: [self commands removeLast].

	(self commands size > self class maxNumberOfCommands) ifTrue: [self commands removeFirst.
		self currentCommand: self currentCommand - 1].
	
	self commands add: aCommand.
	self currentCommand: self currentCommand + 1
]

{
	#category : #'layer button functions',
	#'squeak_changestamp' : 'Alex M 7/10/2024 04:07'
}
GMTEEditor >> addLayer [
	"adds a new tileMap layer"
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
	#'squeak_changestamp' : 'jj 6/22/2024 20:35'
}
GMTEEditor >> anyLayerSelected [
	"returns whether any layer is selected"
	
	^ (self selectedLayers size > 0)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/25/2024 15:55'
}
GMTEEditor >> associatedMorph [

	^ associatedMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/25/2024 15:55'
}
GMTEEditor >> associatedMorph: anObject [

	associatedMorph := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 21:51'
}
GMTEEditor >> backgroundTile [
	"the tile used to dynamically fill the background of the map, if the user wishes so"
	
	^ backgroundTile
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/9/2024 15:41'
}
GMTEEditor >> backgroundTile: anObject [
	
	(backgroundTile = anObject)
		ifTrue: [backgroundTile := GMTETile checkerBoardTile]
		ifFalse: [backgroundTile := anObject].
	"TODO: keep this here? TileMap must know backgorund Tiles"
	self tileMap backgroundTiles: backgroundTile
]

{
	#category : #'layer button functions',
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:45'
}
GMTEEditor >> blendSelectedLayers [
	"Fuses the selected layers into one layer"
	
	| bakedLayer |
	(self selectedLayers size > 1)
		ifTrue: [
			bakedLayer := self selectedLayers min.
			self tileMap tileMatrixStack blendLayers: self selectedLayers.
			self selectedLayers remove: bakedLayer.
			self
				deselectAllLayers;
				selectLayer: bakedLayer].
	self changed: #getLayerList
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/6/2024 12:54'
}
GMTEEditor >> brush [
	^ brush
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/6/2024 12:54'
}
GMTEEditor >> brush: anObject [
	brush := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 7/9/2024 18:19'
}
GMTEEditor >> brushButtons [

	^ brushButtons
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 7/9/2024 18:19'
}
GMTEEditor >> brushButtons: anObject [

	brushButtons := anObject.
]

{
	#category : #building,
	#'squeak_changestamp' : 'JS 7/12/2024 18:20'
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
			self createInspectorSpecWithBuilder: builder};
		closeAction: #onClose;
		minimumExtent: GMTEEditor editorMinimumExtent).
	
	newMorph addKeyboardCaptureFilter: self.
	
	self commandBar: (newMorph submorphNamed: 'command bar').
	"self commandBar vResizing: #rigid."
	self tileStore: (newMorph submorphNamed: 'tile store').
	self tileViewer: ((newMorph submorphNamed: 'main panel') submorphNamed: 'tile viewer').
	self layerViewer: (newMorph submorphNamed: 'layer viewer').
	self trayViewer: (newMorph submorphNamed: 'tray').
	self inspector: (newMorph submorphNamed: 'inspector').
	self tileViewer clipSubmorphs: true.
	
	panel := GMTETileContainer withParent: self tileStore.
	self tileStore morph: panel.

	self placeSelectedTileIntoTileTray.
		
	self tileViewer 
		borderWidth: 2;
		borderColor: tileStore borderColor.
	
	self 
		initializeDefaultTileMapMatrix;
		associatedMorph: newMorph.
		
	^ newMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 20:39'
}
GMTEEditor >> commandBar [
	"panel that contains menu button functions"
	
	^ commandBar
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/22/2024 01:14'
}
GMTEEditor >> commandBar: anObject [

	commandBar := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 6/28/2024 19:48'
}
GMTEEditor >> commands [
	^ commands
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 6/28/2024 19:48'
}
GMTEEditor >> commands: anObject [
	commands := anObject
]

{
	#category : #'file loading',
	#'squeak_changestamp' : 'TW 6/23/2024 19:14'
}
GMTEEditor >> confirmPreviewOf: morphArray withDimensions: aPoint withTileSize: aNumber [
	"shows a preview window for an imported tileset"
	
	|img imgwrapper dialog|
	imgwrapper := ScrollPane new.
	
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
	#category : #building,
	#'squeak_changestamp' : 'jj 6/22/2024 20:41'
}
GMTEEditor >> createAttributeSpecWithBuilder: aBuilder descriptor: aString getter: aSelector setter: anotherSelector model: aModel [
	"a helper function to create attribute specs"
	
	^ self withMorphOf: ((aBuilder pluggablePanelSpec new)
		frame: (LayoutFrame
		fractions: (0 @ 0 corner: 1 @ 1));
		layout: #proportional;
		children: {
			(aBuilder pluggableStaticTextSpec new)
			model: aModel;
			frame: (LayoutFrame offsets: (0 @ 0 corner: 120 @ 30));
			text: aString.
			
			(aBuilder pluggableInputFieldSpec new)
			model: aModel;
			indicateUnacceptedChanges: false;
			frame: (LayoutFrame offsets: (120 @ 0 corner: 180 @ 30));
			getText: aSelector;
			setText: anotherSelector
		};
		yourself) do: [:morph |
			morph layoutPolicy: TableLayout new]
]

{
	#category : #building,
	#'squeak_changestamp' : 'tw 7/12/2024 18:57'
}
GMTEEditor >> createAttributeSpecWithBuilder: aBuilder descriptor: aString getter: aSelector setter: anotherSelector model: aModel frame: aFrame [ 
	"a helper function to create attribute specs"
	
	| minTextWidth minInputWidth |
	minTextWidth := (TextStyle defaultFont approxWidthOfText: aString asText).
	minInputWidth := (TextStyle defaultFont approxWidthOfText: '1234' asText).
	
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
	#'squeak_changestamp' : 'tw 7/12/2024 19:01'
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
		minimumWidth: (self getMaximalLengthOfStrings: (OrderedCollection newFrom: {'Padding:' . 'Grid Width:' . 'Grid Height:'}));
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
	#'squeak_changestamp' : 'Alex M 7/11/2024 18:04'
}
GMTEEditor >> createTileViewerSpecWithBuilder: aBuilder [
	"creates the spec for the tile viewer"
	"TODO: Maybe rename function to something more appropriate?"
	
	^ aBuilder pluggablePanelSpec new
		name: 'main panel';
		model:self;
		frame: (LayoutFrame fractions: (0.2 @ 0 corner: 0.8 @ 0.8)
		offsets: (0@ 30 corner: 0@0));
		children: {
		
			self createToolBarSpecWithBuilder: aBuilder.
					
			(aBuilder pluggablePanelSpec new)
				name: 'tile viewer';
				layout: #horizontal;
				model:self;
				frame: (LayoutFrame
					fractions: (0 @ 0 corner: 1 @ 0.9))
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
	#'squeak_changestamp' : 'tw 7/12/2024 17:08'
}
GMTEEditor >> createToolBarSpecWithBuilder: aBuilder [
	"creates the spec for the tool bar"
	
	^ (aBuilder pluggablePanelSpec new)
		name: 'toolbar';
		model: self;
		frame: (LayoutFrame fractions: (0.05@0.9 corner: 0.95@1));
		children: {		
			(aBuilder pluggableImageButtonSpec new)
				name: 'undo';
				description: 'Undo';
				model: self;
				frame: (GMTEEditor hLayoutFrame: 1 ofN: 7 vSymmetric: GMTEEditor toolBarVSpace);
				action: #undo;
				project: 'GameMecha';
				path: '/GMTEIcons/undo.png'.
				
			(aBuilder pluggableImageButtonSpec new)
				name: 'redo';
				description: 'Redo';
				model: self;
				frame: (GMTEEditor hLayoutFrame: 2 ofN: 7 vSymmetric: GMTEEditor toolBarVSpace);
				action: #redo;
				project: 'GameMecha';
				path: '/GMTEIcons/redo.png'.
				
			(aBuilder pluggableImageButtonSpec new)
				groupName: 'radiusBrush';
				description: 'Brush';
				model: self;
				frame: (GMTEEditor hLayoutFrame: 3 ofN: 7 vSymmetric: GMTEEditor toolBarVSpace);
				action: #selectRadiusBrush;
				project: 'GameMecha';
				buttonGroup: self brushButtons;
				path: '/GMTEIcons/brush.png'.
				
			(aBuilder pluggableImageButtonSpec new)
				groupName: 'lineBrush';
				description: 'Line Tool';
				model: self;
				frame: (GMTEEditor hLayoutFrame: 4 ofN: 7 vSymmetric: GMTEEditor toolBarVSpace);
				action: #selectLineBrush;
				project: 'GameMecha';
				buttonGroup: self brushButtons;
				path: '/GMTEIcons/line.png'.
				
			(aBuilder pluggableImageButtonSpec new)
				groupName: 'fillBrush';
				description: 'Fill Tool';
				model: self;
				frame: (GMTEEditor hLayoutFrame: 5 ofN: 7 vSymmetric: GMTEEditor toolBarVSpace);
				action: #selectFillBrush;
				project: 'GameMecha';
				buttonGroup: self brushButtons;
				path: '/GMTEIcons/fill.png'.
				
			(aBuilder pluggableImageButtonSpec new)
				groupName: 'rectangleBrush';
				description: 'Rectangle Tool';
				model: self;
				frame: (GMTEEditor hLayoutFrame: 6 ofN: 7 vSymmetric: GMTEEditor toolBarVSpace);
				action: #selectRectangleBrush;
				project: 'GameMecha';
				buttonGroup: self brushButtons;
				path: '/GMTEIcons/rectangle.png'.
				
			self createAttributeSpecWithBuilder: aBuilder 
				descriptor: 'Radius:' 
				getter: #getBrushRadiusAsString
				setter: #setBrushRadiusFromText: 
				model: self 
				frame: ((GMTEEditor hLayoutFrame: 7 ofN: 7 vSymmetric: GMTEEditor toolBarVSpace)).
			};
			
		verticalResizing: #shrinkWrap;
		yourself
]

{
	#category : #building,
	#'squeak_changestamp' : 'jj 6/22/2024 20:45'
}
GMTEEditor >> createTraySpecWithBuilder: aBuilder [
	"creates the spec for the tile tray"
	
	^ (aBuilder pluggableScrollPaneSpec new)
		name: 'tray';
		frame: (LayoutFrame fractions: (0.2 @ 0.8 corner:  0.8 @ 1) offsets: nil);
		minimumHeight:75;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 6/28/2024 19:48'
}
GMTEEditor >> currentCommand [
	^ currentCommand
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 6/28/2024 19:48'
}
GMTEEditor >> currentCommand: anObject [
	currentCommand := anObject
]

{
	#category : #'layer button functions',
	#'squeak_changestamp' : 'Alex M 7/10/2024 03:49'
}
GMTEEditor >> deleteSelectedLayers [
	"deletes all selected layers unless this would delete all layers"
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
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 20:47'
}
GMTEEditor >> deselectAllLayers [
	"empties the selected layers set"
	
	self
		selectedLayers: Set new;
		changed: #selectedLayers
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/25/2024 17:50'
}
GMTEEditor >> deselectLayer: anIndex [
	"deletes the layer with the provided index"
	
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
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 20:48'
}
GMTEEditor >> deselectTile [
	"deselects the currently chosen tile"
	
	"TODO implement the lower part: resetting selected tile in tray view"
	self selectTile: nil.
	self tileMap tileSelectionSet highlightImage: nil
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 6/25/2024 17:51'
}
GMTEEditor >> disableSingleLayerButtons [

	GMTEEditor singleLayerActionNames do: [:aString | (self associatedMorph submorphNamed: aString) enabled: false ]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 6/25/2024 17:51'
}
GMTEEditor >> enableSingleLayerButtons [

	GMTEEditor singleLayerActionNames do: [:aString | (self associatedMorph submorphNamed: aString) enabled: true ]
]

{
	#category : #'menu button functions',
	#'squeak_changestamp' : 'jj 6/22/2024 20:48'
}
GMTEEditor >> exportAsImage [
	"exports the current tile map as a png"
	
	self tileMap exportAsImage
]

{
	#category : #'menu button functions',
	#'squeak_changestamp' : 'jj 6/23/2024 14:14'
}
GMTEEditor >> exportAsMorph [
	"saves the current tileMap as a .morph file, which allows for reimporting"
	
	(self tileMap copy model: nil) saveOnFile. 
	self savedSinceModified: true
]

{
	#category : #building,
	#'squeak_changestamp' : 'jj 6/22/2024 20:49'
}
GMTEEditor >> exportMenu [
	"creates the menu for the export options"
	
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
	#'squeak_changestamp' : 'mcjj 7/12/2024 18:49'
}
GMTEEditor >> filterEvent: aKeyboardEvent for: anObject [
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
	#'squeak_changestamp' : 'TW 7/9/2024 17:14'
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
	#'squeak_changestamp' : 'jj 6/22/2024 20:51'
}
GMTEEditor >> getFileWithFileChooser [
	"opens a file chooser which allows the user to select a morph file"
	
	^ UIManager default chooseFileMatchingSuffixes: {'morph'}
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 20:51'
}
GMTEEditor >> getGridHeight [
	"returns the height (in tiles) of the tileMap"
	
	self tileMap 
		ifNotNil: [^ self tileMap mapTileHeight]
		ifNil: [^ nil]
]

{
	#category : #inspector,
	#'squeak_changestamp' : 'jj 6/22/2024 20:52'
}
GMTEEditor >> getGridHeightAsString [
	"returns the height (in tiles) of the tileMap as a string"
	
	^ self getGridHeight asString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 20:52'
}
GMTEEditor >> getGridWidth [
	"returns the width (in tiles) of the tileMap"
	
	self tileMap 
		ifNotNil: [^ self tileMap mapTileWidth]
		ifNil: [^ nil]
]

{
	#category : #inspector,
	#'squeak_changestamp' : 'jj 6/22/2024 20:52'
}
GMTEEditor >> getGridWidthAsString [
	"returns the width (in tiles) of the tileMap as a string"
	
	^ self getGridWidth asString
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'TW 6/23/2024 21:50'
}
GMTEEditor >> getLayerList [
	"returns the layer list"
	
	self tileMap ifNil: [^ OrderedCollection new].
	
	^ self tileMap tileMatrixStack collectLayers: [:aLayer | aLayer displayName, (GMTEEditor getVisibilityIndicator: aLayer visible)]
]

{
	#category : #helper,
	#'squeak_changestamp' : 'tw 7/12/2024 19:01'
}
GMTEEditor >> getMaximalLengthOfStrings: anOrderedCollection [

	^ (anOrderedCollection collect: [:aString | TextStyle defaultFont approxWidthOfText: aString asText]) max
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 20:54'
}
GMTEEditor >> getPadding [
	"returns the padding of the tileMap"
	
	self tileMap 
		ifNotNil: [^ self tileMap mapPadding]
		ifNil: [^ nil]
]

{
	#category : #inspector,
	#'squeak_changestamp' : 'jj 6/22/2024 20:54'
}
GMTEEditor >> getPaddingAsString [
	"returns the padding of the tileMap as a string"
	
	^ self getPadding asString
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'jj 6/22/2024 20:55'
}
GMTEEditor >> getSelectedLayer [
	"returns the selected layer, if only one is selected"
	
	self assert: self singleLayerSelected.
	^ self selectedLayers anyOne
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 20:56'
}
GMTEEditor >> getTileRatio [
	"returns the tileSizeRatio of the tileMap"
	
	self tileMap 
		ifNotNil: [^ self tileMap tileSizeRatio]
		ifNil: [^ nil]
]

{
	#category : #inspector,
	#'squeak_changestamp' : 'jj 6/22/2024 20:56'
}
GMTEEditor >> getTileRatioAsString [
	"returns the tileSizeRatio of the tileMap as a string"
	
	^ self getTileRatio asString
]

{
	#category : #'menu button functions',
	#'squeak_changestamp' : 'TW 6/23/2024 20:09'
}
GMTEEditor >> importFromMorph [
	"import tilemap into editor from a .morph file"

	|stream tileMap|
	stream := self getFileWithFileChooser.

    	stream ifNil: [^ self].
    	tileMap := GMTEEditor privateGetEditorTileMapFromFilePath: stream.
    	self openTileMapInEditor: tileMap.
	self
		changed: #getPaddingAsString;
		changed: #getTileRatioAsString;
		changed: #getGridWidthAsString;
		changed: #getGridHeightAsString;
		changed: #getLayerList
]

{
	#category : #'menu button functions',
	#'squeak_changestamp' : 'jj 6/22/2024 20:57'
}
GMTEEditor >> importFromTileset [
	"loads a tileset into the tile store"
	"TODO make multiple sprite sets available?"
	
	| tiles tileHeight dimensions|
	tileHeight := FillInTheBlankMorph request: 'Enter tile height (width is calculated by ratio)' initialAnswer: '16'.
	
	(tileHeight = '')
		ifTrue: [^ nil]
		ifFalse:[tileHeight := tileHeight asInteger].
	
	dimensions := (tileHeight @ (tileHeight * self ratio)).
	tiles := self loadTileSetWithDimensions: dimensions.
	
	tiles ifNil: [^ nil].
	
	self tileStore morph 
		removeAllMorphs;
		addAllMorphs: tiles
]

{
	#category : #building,
	#'squeak_changestamp' : 'jj 6/22/2024 20:57'
}
GMTEEditor >> importMenu [
	"creates the menu for the import options"
	
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
	#'squeak_changestamp' : 'TW 7/9/2024 19:42'
}
GMTEEditor >> initialize [
	"starts the tile editor"
	
	super initialize.
	self
		resetCommands;
		currentCommand: 1;
		selectedLayers: Set new;
		selectLayer: 1;
		brushButtons: GMTEButtonGroup new;
		morphBuilders: Dictionary new;
		open;
		ratio: 1;
		savedSinceModified: true;
		updateButtonEnabled;
		changed: #getLayerList;
		initializeBrush
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'tw 7/12/2024 17:27'
}
GMTEEditor >> initializeBrush [
	"starts the tile editor"
	
	self 
		brush: GMTEBrush new;
		selectRadiusBrush;
		setBrushRadius: 1
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jj 6/23/2024 17:27'
}
GMTEEditor >> initializeDefaultTileMapMatrix [
	"initializes the tileMap with a standard 10 x 10 tileMap"
	
	self initializeTileMapMatrixWithHeight: 10 width: 10
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jj 6/22/2024 20:59'
}
GMTEEditor >> initializeTileMapMatrixWithHeight: aHeight width: aWidth [
	"initializes the tileMap with a tile map with a certain height and width"
	
	self tileMap: (GMTEEditorTileMap tileWidth: aWidth tileHeight: aHeight padding: 0.15 sizeRatio: 1 model: self).
	self tileViewer addMorph: self tileMap.		
	self tileMap 
		position: (self tileMap owner position);
		hResizing: #spaceFill; 
		vResizing: #spaceFill;
		updateMap.
	self
		changed: #getTileRatioAsString;
		changed: #getGridWidthAsString;
		changed: #getGridHeightAsString;
		changed: #getPaddingAsString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 21:02'
}
GMTEEditor >> inspector [
	"the inspector tab that allows to adjust the attributes of the tileMap"
	
	^ inspector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/22/2024 01:32'
}
GMTEEditor >> inspector: anObject [

	inspector := anObject
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'jj 6/22/2024 21:04'
}
GMTEEditor >> layerAt: anIndex [
	"TODO: comment"
	
	^ self selectedLayers includes: anIndex
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'jj 6/22/2024 21:04'
}
GMTEEditor >> layerAt: anIndex put: aBool [
	"TODO: comment"
	
	| multiSelection |
	multiSelection := Sensor shiftPressed.
	
	multiSelection ifFalse: [self selectedLayers removeAll].
	
	(aBool or: [multiSelection not])
		ifTrue: [self selectLayer: anIndex]
		ifFalse: [self deselectLayer: anIndex]
]

{
	#category : #'menu button functions',
	#'squeak_changestamp' : 'jj 6/22/2024 21:04'
}
GMTEEditor >> layerCount [
	"returns the amount of layers in the tileMap"
	
	^ self tileMap tileMatrixStack layerCount
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 21:07'
}
GMTEEditor >> layerViewer [
	"panel that allows for manipulation of the tileMap layers"
	
	^ layerViewer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/22/2024 01:31'
}
GMTEEditor >> layerViewer: anObject [

	layerViewer := anObject
]

{
	#category : #'file loading',
	#'squeak_changestamp' : 'jj 6/23/2024 17:31'
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
	(self confirmPreviewOf: previews withDimensions: previewDimensions withTileSize: previewTileSize) ifFalse:[^nil].

	^ morphs
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 21:11'
}
GMTEEditor >> morphBuilders [
	"collection that contains the morph builders"
	
	^ morphBuilders
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/22/2024 01:31'
}
GMTEEditor >> morphBuilders: anObject [

	morphBuilders := anObject
]

{
	#category : #'layer button functions',
	#'squeak_changestamp' : 'Alex M 7/4/2024 01:21'
}
GMTEEditor >> moveLayerDown [
	"moves the selected layer down by one"
	
	| selectedLayer |
	self singleLayerSelected ifFalse: [^ nil].
	
	selectedLayer := self getSelectedLayer.
	self addCommand: (GMTEMoveLayerCommand fromLayerID: selectedLayer withDirection: -1 withEditor: self).
	(selectedLayer == 1) ifFalse: [self swapLayer: selectedLayer with: selectedLayer - 1]
]

{
	#category : #'layer button functions',
	#'squeak_changestamp' : 'Alex M 7/4/2024 01:26'
}
GMTEEditor >> moveLayerUp [
	"moves the selected layer up by one"
	
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
	#'squeak_changestamp' : 'jj 6/22/2024 21:14'
}
GMTEEditor >> open [
  	"builds the window"
	
	| newMorph |
	newMorph := ToolBuilder default build: self.
      newMorph openInWorld.
	self tileViewer submorphs first updateMap.
      ^ newMorph
]

{
	#category : #helper,
	#'squeak_changestamp' : 'Alex M 7/3/2024 23:57'
}
GMTEEditor >> openTileMapInEditor: aTileMap [
	"loads a tileMap into the editor"
	
	aTileMap tileSelectionSet highlightImage: nil.
	self tileMap: aTileMap.
	aTileMap model: self.
	self tileViewer
		removeAllMorphs;
		addMorph: aTileMap.
	self resetCommands.

    self changed: #getLayerList
]

{
	#category : #'menu button functions',
	#'squeak_changestamp' : 'TW 6/20/2024 21:40'
}
GMTEEditor >> openTileMapInWorld [
	"open the current tileMap into world"
	
	(GMTETileMap newFromEditableTileMap: self tileMap)
		position: 0@0;
		openInWorld
]

{
	#category : #helper,
	#'squeak_changestamp' : 'TW 7/9/2024 11:28'
}
GMTEEditor >> parseBrushRadius: aText [
	"returns a valid brush size if the text can be turned into one"
	
	| newSize |
	newSize := self parseSize: aText.
	(newSize notNil and: [GMTEEditor minBrushRadius <= newSize and: [newSize <= GMTEEditor maxBrushRadius]])
		ifTrue: [^ newSize]
		ifFalse: [^ nil]
]

{
	#category : #helper,
	#'squeak_changestamp' : 'jj 6/23/2024 17:33'
}
GMTEEditor >> parseGridSize: aText [
	"converts an input grid size (height/width) if valid"
	
	| newSize |
	newSize := self parseSize: aText.
	(newSize notNil and: [newSize isInteger and: [GMTEEditor tileMapMinGridSize < newSize and: [newSize < GMTEEditor tileMapMaxGridSize]]])
		ifTrue: [^ newSize]
		ifFalse: [^ nil]
]

{
	#category : #helper,
	#'squeak_changestamp' : 'jj 6/23/2024 17:35'
}
GMTEEditor >> parsePaddingSize: aText [
	"converts an input padding size if valid"
	
	| newSize |
	newSize := self parseSize: aText.
	(newSize notNil and: [GMTEEditor tileMapMinPaddingSize <= newSize and: [newSize <= GMTEEditor tileMapMaxPaddingSize]])
		ifTrue: [^ newSize]
		ifFalse: [^ nil]
]

{
	#category : #helper,
	#'squeak_changestamp' : 'jj 6/22/2024 21:26'
}
GMTEEditor >> parseSize: aText [
	"converts a string into a number"
	
	[^ aText asNumber] on: NumberParserError do: [^ nil]
]

{
	#category : #building,
	#'squeak_changestamp' : 'JS 7/12/2024 18:20'
}
GMTEEditor >> placeSelectedTileIntoTileTray [
	
	| selectedTile |
	selectedTile := GMTETileSelector new 
		visible: false;
		name: 'selectedTile';
		model: self;
		yourself.
		
	self trayViewer morph 
		color: Color transparent;
		addMorph: selectedTile
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 21:27'
}
GMTEEditor >> ratio [
	"the ratio of height to width of tiles"
	
	^ ratio
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 6/22/2024 15:47'
}
GMTEEditor >> ratio: anObject [

	ratio := anObject
]

{
	#category : #'command processing',
	#'squeak_changestamp' : 'Alex M 7/10/2024 14:17'
}
GMTEEditor >> redo [
	
	(self currentCommand < self commands size) 
		ifTrue: [
			self
				savedSinceModified: false;
				currentCommand: self currentCommand + 1.
			(self commands at: self currentCommand) do.
			self savedSinceModified: false]
]

{
	#category : #TODO,
	#'squeak_changestamp' : 'Alex M 7/2/2024 16:35'
}
GMTEEditor >> redoAllCommandsUntil: aValue [
	
	"TODO: This is used for workarounds, better solutions required."
	aValue to: 1 by: -1 do: [:i | (commands at: i) undo].
	1 to: aValue do: [:i | (commands at: i) do]
]

{
	#category : #'layer button functions',
	#'squeak_changestamp' : 'TW 6/23/2024 21:50'
}
GMTEEditor >> renameLayer [
	"renames the selected layer with a user chosen name"
	
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
	#category : #tilemap,
	#'squeak_changestamp' : 'Alex M 7/1/2024 21:04'
}
GMTEEditor >> rescaleGridHeight: aValue [
	
	self tileMap rescaleMapWidth: self getGridWidth height: aValue.
	self changed: #getGridHeightAsString
]

{
	#category : #tilemap,
	#'squeak_changestamp' : 'Alex M 7/1/2024 21:04'
}
GMTEEditor >> rescaleGridWidth: aValue [
	
	self tileMap rescaleMapWidth: aValue height: self getGridHeight.
	self changed: #getGridWidthAsString
]

{
	#category : #'menu button functions',
	#'squeak_changestamp' : 'jj 6/22/2024 21:30'
}
GMTEEditor >> resetAllLayers [
	"resets all layers"
	"TODO: maybe combine this with updateTile: inLayer: FromEvent: . Currently not working with layers."
	
	self tileMap resetAllLayers
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
	#category : #'layer button functions',
	#'squeak_changestamp' : 'Alex M 7/3/2024 23:49'
}
GMTEEditor >> resetLayers: aSet [
	"resets the layers represented by aSet"
	
	"TODO: maybe combine this with updatTile: inLayer: FromEvent: . Currently not working with layers."
	self tileMap resetLayers: aSet
]

{
	#category : #'layer button functions',
	#'squeak_changestamp' : 'jj 6/22/2024 21:30'
}
GMTEEditor >> resetSelectedLayers [
	"resets all selected layers"
	
	"TODO: maybe combine this with updatTile: inLayer: FromEvent: . Currently not working with layers."
	self resetLayers: self selectedLayers
]

{
	#category : #TODO,
	#'squeak_changestamp' : 'tw 7/12/2024 17:46'
}
GMTEEditor >> resetView [

	self tileMap resetView
]

{
	#category : #TODO,
	#'squeak_changestamp' : 'mcjj 7/11/2024 17:52'
}
GMTEEditor >> rotateSelectedTile [
	
	self selectedTile: (self selectedTile rotateBy: #right centerAt: (self selectedTile extent / 2)).
	self tileMap tileSelectionSet removeAllHighlightings.
	self tileMap tileSelectionSet highlightImage: self selectedTile.
	self tileMap tileSelectionSet applyAllHighlightings
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 21:31'
}
GMTEEditor >> savedSinceModified [
	"whether the tileMap has been modified since the last save"
	
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
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 21:33'
}
GMTEEditor >> selectAllLayers [
	"selects all layers"
	
	1 to: self layerCount do: [:i | self selectLayer: i]
	
]

{
	#category : #'menu button functions',
	#'squeak_changestamp' : 'tw 7/12/2024 17:13'
}
GMTEEditor >> selectFillBrush [

	self brushButtons singleSelectNamed: 'fillBrush'.
	self brush selectFillBrush
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/25/2024 17:50'
}
GMTEEditor >> selectLayer: anIndex [
	"select the layer with anIndex"
	
	self selectedLayers add: anIndex.
	self updateButtonEnabled.
	self
		changed: #selectedLayers;
		changed: #layerAt:
	
]

{
	#category : #'menu button functions',
	#'squeak_changestamp' : 'tw 7/12/2024 17:13'
}
GMTEEditor >> selectLineBrush [

	self brushButtons singleSelectNamed: 'lineBrush'.
	self brush selectLineBrush
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 21:35'
}
GMTEEditor >> selectOnlyLayer: anIndex [
	"select only the layer with anIndex"
	
	self 
		deselectAllLayers;
		selectLayer: anIndex
	
]

{
	#category : #'menu button functions',
	#'squeak_changestamp' : 'tw 7/12/2024 17:12'
}
GMTEEditor >> selectRadiusBrush [

	self brushButtons singleSelectNamed: 'radiusBrush'.
	self brush selectRadiusBrush
]

{
	#category : #'menu button functions',
	#'squeak_changestamp' : 'tw 7/12/2024 17:23'
}
GMTEEditor >> selectRectangleBrush [

	self brushButtons singleSelectNamed: 'rectangleBrush'.
	self brush selectRectangleBrush
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 7/12/2024 18:12'
}
GMTEEditor >> selectTile: anObject [
	"selects a tile from the tile store"
	
	"TODO: might be problematic with tray. Maybe give tiles in the store IDs?"
	(anObject = self selectedTile)
	ifTrue: [self unselectTile]
	ifFalse: [
		self selectedTile: anObject fullResolutionSprite.
		self tileMap tileSelectionSet highlightImage: anObject fullResolutionSprite.
		(self trayViewer morph submorphNamed: 'selectedTile')
			visible: true;
			updateSprite: anObject fullResolutionSprite;
			extent: 75@75]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 21:41'
}
GMTEEditor >> selectedLayers [
	"set that contains the selected layers"
	
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
	#'squeak_changestamp' : 'jj 6/22/2024 21:41'
}
GMTEEditor >> selectedTile [
	"selected tile that is placed on the map"
	
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
	#category : #helper,
	#'squeak_changestamp' : 'TW 7/9/2024 12:40'
}
GMTEEditor >> setBrushRadius: aNumber [
	"adjusts the radius of the brush"
	
	self brush radius: aNumber.
	self changed: #getBrushRadiusAsString.
		

]

{
	#category : #helper,
	#'squeak_changestamp' : 'TW 7/9/2024 17:12'
}
GMTEEditor >> setBrushRadiusFromText: aText [
	"adjusts the radius of the brush"
	
	| radius |
	radius := self parseBrushRadius: aText.
	radius ifNil: [^ nil].

	self setBrushRadius: radius.
	^ true
		

]

{
	#category : #tilemap,
	#'squeak_changestamp' : 'Alex M 7/1/2024 21:06'
}
GMTEEditor >> setGridHeight: aText [
	"adjusts the grid height"
	
	| oldHeight newHeight |
	oldHeight := self getGridHeight.
	newHeight := self parseGridSize: aText.
	newHeight ifNotNil: [
		self
			rescaleGridHeight: newHeight;
			addCommand: (GMTETilemapSizeCommand prevValue: oldHeight newValue: newHeight method: #rescaleGridHeight: editor: self)].
	^ true
		

]

{
	#category : #tilemap,
	#'squeak_changestamp' : 'Alex M 7/1/2024 21:06'
}
GMTEEditor >> setGridWidth: aText [
	"adjusts the grid width"
	"TODO: Fix visual layer bug"
	
	| oldWidth newWidth |
	oldWidth := self getGridWidth.
	newWidth := self parseGridSize: aText.
	oldWidth ifNotNil: [
		self
			rescaleGridWidth: newWidth;
			addCommand: (GMTETilemapSizeCommand prevValue: oldWidth newValue: newWidth method: #rescaleGridWidth: editor: self)].
	^ true

]

{
	#category : #tilemap,
	#'squeak_changestamp' : 'jj 6/22/2024 21:42'
}
GMTEEditor >> setPadding: aText [
	"adjusts the map padding"
	
	| newSize |
	newSize := self parsePaddingSize: aText.
	newSize ifNotNil: [self tileMap rescaleMapWidth: self getGridWidth height: self getGridHeight padding: newSize].
	^ true

]

{
	#category : #building,
	#'squeak_changestamp' : 'tw 7/12/2024 17:45'
}
GMTEEditor >> settingsMenu [
	"opens the setting menu"
	
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
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'jj 6/22/2024 21:43'
}
GMTEEditor >> singleLayerSelected [
	"returns whether only one layer is selected"
	
	^ (self selectedLayers size == 1)
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'jj 6/22/2024 21:46'
}
GMTEEditor >> storeLayerN: aNumber [
	"TODO: comment"
	
	self storeLayerN: aNumber withVisibility: true
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'TW 6/23/2024 20:05'
}
GMTEEditor >> swapLayer: anIndex with: anotherIndex [
	"swaps two layers"
	
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
	#'squeak_changestamp' : 'jj 6/22/2024 21:49'
}
GMTEEditor >> tileMap [
	"the tileMap that the editor works on"
	
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
	#'squeak_changestamp' : 'jj 6/22/2024 21:49'
}
GMTEEditor >> tileStore [
	"the panel that shows the imported tilesets"
	
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
	#'squeak_changestamp' : 'jj 6/22/2024 21:50'
}
GMTEEditor >> tileViewer [
	"the panel that contains the tileMap"
	
	^ tileViewer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/22/2024 01:30'
}
GMTEEditor >> tileViewer: anObject [

	tileViewer := anObject
]

{
	#category : #'menu button functions',
	#'squeak_changestamp' : 'jj 6/22/2024 21:51'
}
GMTEEditor >> toggleBackgroundTiles [
	"toggles the dynamic filling of the maps background with the background tile"
	 
	self tileMap toggleBackgroundLayer
]

{
	#category : #'menu button functions',
	#'squeak_changestamp' : 'jj 6/22/2024 21:51'
}
GMTEEditor >> toggleGrid [
	"toggles the visibility of the map grid"
	
	self tileMap toggleHighlightingLayer
]

{
	#category : #'layer button functions',
	#'squeak_changestamp' : 'TW 6/23/2024 20:05'
}
GMTEEditor >> toggleSelectedLayerVisibility [
	"toggles the visibility of the selected layers"
	
	self selectedLayers do: [:i |self tileMap tileMatrixStack toggleLayerVisibility: i].
	self changed: #getLayerList
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 21:52'
}
GMTEEditor >> trayViewer [
	"the panel that contains the selected tile"
	
	^ trayViewer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/22/2024 01:30'
}
GMTEEditor >> trayViewer: anObject [

	trayViewer := anObject
]

{
	#category : #'command processing',
	#'squeak_changestamp' : 'Alex M 7/10/2024 14:17'
}
GMTEEditor >> undo [

	self flag: 'DO THIS USING TILEMAP FUNCTIONS'.
	(self currentCommand > 1) 
		ifTrue: [(self commands at: self currentCommand) undo.
			self
				savedSinceModified: false;
				currentCommand: self currentCommand - 1.
			({GMTETilemapSizeCommand. GMTEDeleteLayersCommand} includes: (self commands at: self currentCommand + 1) class)
				ifTrue: [self redoAllCommandsUntil: self currentCommand].
			self savedSinceModified: false]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 21:52'
}
GMTEEditor >> unselectTile [
	"unselects the currently selected tile"
	
	self selectedTile: nil.
	self tileMap tileSelectionSet highlightImage: nil.
	self trayViewer morph submorphs first visible: false
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 6/25/2024 17:51'
}
GMTEEditor >> updateButtonEnabled [

	self associatedMorph ifNil: [^ nil].

	self singleLayerSelected
		ifTrue: [self enableSingleLayerButtons]
		ifFalse: [self disableSingleLayerButtons].
		
	(self layerAt: 1)
		ifTrue: [(self associatedMorph submorphNamed: 'buttonDeleteLayers') enabled: false]
		ifFalse: [(self associatedMorph submorphNamed: 'buttonDeleteLayers') enabled: true]
]

{
	#category : #building,
	#'squeak_changestamp' : 'jj 6/23/2024 13:45'
}
GMTEEditor >> withMorphOf: aSpec do: aBlock [
	"TODO: comment"
	
	| id |
	id := UUID new asString.
	self morphBuilders at: id put: aBlock.
	
	^ aSpec
		name: id;
		yourself
]
