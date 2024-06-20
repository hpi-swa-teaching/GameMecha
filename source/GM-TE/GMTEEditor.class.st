Class {
	#name : #GMTEEditor,
	#superclass : #Model,
	#instVars : [
		'commandBar',
		'tileStore',
		'tileViewer',
		'layerViewer',
		'trayViewer',
		'tileMapMatrix',
		'selectedLayers',
		'selectedTile',
		'ratio',
		'savedSinceModified',
		'inspector',
		'morphBuilders',
		'layerData',
		'backgroundTile'
	],
	#category : #'GM-TE-UI'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 6/14/2024 12:18'
}
GMTEEditor class >> fromTileHeight: aHeight widht: aWidth [

	|builder spec morph tileMatrixMorph tileStore panel tileViewer commandBar layerViewer trayViewer selectedTile|
	super new.
	builder := ToolBuilder default.
	spec := builder pluggableWindowSpec new
			model: Model new;
			label: 'GM Tile Editor';
			children: {
				self createCommandBarSpecWithBuilder: builder.
				self createTileViewerSpecWithBuilder: builder.
				self createTilestoreSpecWithBuilder: builder.
				self createTraySpecWithBuilder: builder.
				self createLayersSpecWithBuilder: builder};
			minimumExtent: 550@300;
			yourself.
	morph := builder build: spec.
	
	commandBar := morph submorphNamed: 'command bar'.
	commandBar vResizing: #rigid.
	tileStore := morph submorphNamed: 'tile store'.
	tileViewer := morph submorphNamed: 'tile viewer'.
	layerViewer := morph submorphNamed: 'layers'.
	trayViewer := morph submorphNamed: 'tray'.
	
	panel := GMTETileContainer withParent: tileStore.

	tileStore morph addMorph: panel.
	
	"tileStore on: #mouseMove send: [Transcript show: 'hello'] to: self."
	"tileStore morph layoutPolicy: (ProportionalLayout new).
	panel layoutFrame: (LayoutFrame fractions: (0@0 corner: 1@1))."
	
	selectedTile := ImageMorph new.
	selectedTile visible:false.
	"TODO: Make this nicer."
	"selectedTile position: (trayViewer position + (10@10)); visible:false."
	trayViewer morph beTransparent;addMorph: selectedTile.
	
	tileViewer borderWidth: 2. 
	tileViewer borderColor: tileStore borderColor.
	
	"TODO 16 by 16 is a magic number. Where do we store tile dimensions?"
	(commandBar submorphNamed: 'import') action: [
		"TODO make multiple sprite sets available?"
		Transcript show: tileStore morph extent.
		panel removeAllMorphs;
		extent:tileStore extent;
		addAllMorphs: (GMTEEditor loadTileSetWithDimensions: 16@16 source: selectedTile).
		].

	tileMatrixMorph := GMTETileMap tileWidth: aWidth tileHeight: aHeight padding: 0.15 sizeRatio: 1.

	(commandBar submorphNamed: 'export') action: [
		tileMatrixMorph exportAsImage].

	tileViewer addMorph: tileMatrixMorph.		
	
	tileMatrixMorph 
		position: (tileMatrixMorph owner position);
		hResizing: #spaceFill; 
		vResizing: #spaceFill.
	
	morph openInWorld.
	
	tileMatrixMorph updateMap.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JS 6/15/2024 13:04'
}
GMTEEditor class >> getTileMapFromFileBinary: aFileBinary [

    ^GMTETileMap newFrom: (GMTEEditor privateGetEditableTileMapFromFileBinary: aFileBinary)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JS 6/19/2024 10:42'
}
GMTEEditor class >> getTileMapFromFilePath: aFilePath [

    ^GMTETileMap newFrom: (GMTEEditor privateGetEditableTileMapFromFilePath: aFilePath)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JS 6/15/2024 13:05'
}
GMTEEditor class >> getTileMapFromProjectName: aName withPath: aPath [

    ^GMTEEditor getTileMapFromFileBinary: ((GitAssetLoader for: aName) loadAsset: aPath)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JS 6/15/2024 13:04'
}
GMTEEditor class >> privateGetEditableTileMapFromFileBinary: aFileBinary [

    |aFileStream tileMap|
    aFileStream := (MultiByteBinaryOrTextStream with: aFileBinary) binary reset.
    tileMap := aFileStream fileInObjectAndCode.
    (tileMap isKindOf: GMTEEditableTileMap) ifFalse: [^nil].
    ^tileMap
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JS 6/15/2024 13:04'
}
GMTEEditor class >> privateGetEditableTileMapFromFilePath: aFilePath [

    ^GMTEEditor privateGetEditableTileMapFromFileBinary: (FileStream readOnlyFileNamed: aFilePath) binary contentsOfEntireFile
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 5/28/2024 15:05'
}
GMTEEditor class >> register [
	"Maybe call this on new?"
	TheWorldMenu registerOpenCommand: {'TileMap Editor'. {GMTEEditor. #new}}
]

{
	#category : #'button functions',
	#'squeak_changestamp' : 'TW 6/20/2024 16:22'
}
GMTEEditor >> addLayer [

	| newLayerNumber |
	
	newLayerNumber :=  self layerCount + 1.

	self tileMapMatrix tileMatrixStack pushLayer.
	self
		storeLayerN: newLayerNumber;
		selectOnlyLayer: newLayerNumber.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 6/19/2024 23:08'
}
GMTEEditor >> backgroundTile [
	^ backgroundTile
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 23:28'
}
GMTEEditor >> backgroundTile: anObject [

	backgroundTile := anObject.
	
	"TODO: keep this here? TileMap must know backgorund Tiles"
	self tileMapMatrix backgroundTiles: anObject
]

{
	#category : #building,
	#'squeak_changestamp' : 'Alex M 6/14/2024 01:29'
}
GMTEEditor >> buildWith: builder [
	"called it builder instead of aBuilder since every other implementation does that"
	| newMorph selectedTile panel | 
	
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
		minimumExtent: 550@400).
			
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

	selectedTile := GMTETileSelector new 
		visible: false; 
		yourself.
		
	"TODO: Work in progress."
	self trayViewer morph: GMTETileTray new.
	self trayViewer morph
		addMorph: selectedTile.
		
	self tileViewer 
		borderWidth: 2;
		borderColor: tileStore borderColor.
	
	self initializeDefaultTileMapMatrix.
		
	^newMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 5/22/2024 00:59'
}
GMTEEditor >> commandBar [

	^ commandBar
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 5/22/2024 00:59'
}
GMTEEditor >> commandBar: anObject [

	commandBar := anObject.
]

{
	#category : #'file loading',
	#'squeak_changestamp' : 'Alex M 6/14/2024 12:57'
}
GMTEEditor >> confirmPreviewOf: morphArray withDimensions: aPoint withTileSize: aNumber [
	"TODO: Could break with too big tilesets. Maybe filter only first 100 tiles?"
	|img imgwrapper dialog|
	
	imgwrapper := ScrollPane new.
	
	img := Morph new
		beTransparent;
		extent:(aPoint);
		yourself.
	(img layoutPolicy: TableLayout new)
	listDirection: #leftToRight;
	wrapDirection: #leftToRight.
	
	(morphArray reversed) do: [:morph| 
		img addMorph: (ImageMorph new image: (morph image scaledToWidth: aNumber); borderColor: (Color red); borderWidth:1;yourself).
	].
	
	imgwrapper extent: ((img width min: 1700) @ (img height min: 800)).
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
	^ dialog getUserResponseAtHand.
]

{
	#category : #building,
	#'squeak_changestamp' : 'TW 6/11/2024 19:29'
}
GMTEEditor >> createAttributeSpecWithBuilder: aBuilder descriptor: aString getter: aSelector setter: anotherSelector model: aModel [

		^self withMorphOf: (aBuilder pluggablePanelSpec new
			frame: (LayoutFrame
			fractions: (0@0 corner: 1@1));
			layout: #proportional;
			children: {
				aBuilder pluggableStaticTextSpec new
				model: aModel;
				frame: (LayoutFrame offsets: (0@0 corner: 120@30));
				text: aString.
				
				aBuilder pluggableInputFieldSpec new
				model: aModel;
				indicateUnacceptedChanges: false;
				frame: (LayoutFrame offsets: (120@0 corner: 180@30));
				getText: aSelector;
				setText: anotherSelector.
			};
			yourself) do: [:morph |
				morph layoutPolicy: TableLayout new]
]

{
	#category : #building,
	#'squeak_changestamp' : 'TW 6/9/2024 18:11'
}
GMTEEditor >> createCommandBarSpecWithBuilder: aBuilder [
	^aBuilder pluggablePanelSpec new
		name: 'command bar';
		model: self;
		children: {aBuilder pluggableButtonSpec new
			name: 'import';
			label: 'Import ...';
			model: self;
			frame: (LayoutFrame fractions: (0.0 @ 0 corner: 0.33 @ 1) offsets: nil);
			action: #importMenu.
			
			aBuilder pluggableButtonSpec new
			name: 'export';
			label: 'Export as ...';
			model: self;
			action: #exportMenu;
			frame: (LayoutFrame fractions: (0.33 @ 0 corner: 0.66 @ 1) offsets: nil).

			aBuilder pluggableButtonSpec new
			frame: (LayoutFrame fractions: (0.66 @ 0 corner: 1 @ 1) offsets: nil);
			name: 'openInWorld';
			label: 'Open in World';
			model: self;
			action: #openTileMapInWorld.
			}
			;

		verticalResizing: #shrinkWrap;
		
		frame: (LayoutFrame
			fractions: (0@0 corner: 1@0) offsets:(0@0 corner: 0@30));
		yourself
]

{
	#category : #building,
	#'squeak_changestamp' : 'Alex M 6/14/2024 00:56'
}
GMTEEditor >> createInspectorSpecWithBuilder: aBuilder [

		^aBuilder pluggableScrollPaneSpec new
			frame: (LayoutFrame fractions: (1 @ 0 corner: 1 @ 0.25)
			offsets: (-175@ 30 corner: 0@30));
			padding: (Rectangle left: 3 right: 0 top: 0 bottom: 0);
			hScrollBarPolicy: #never;
			layout: #vertical;
			name: 'inspector';
			children: {
			self createAttributeSpecWithBuilder: aBuilder descriptor: 'Padding:' getter: #getPaddingAsString setter: #setPadding: model: self.
			
			self createAttributeSpecWithBuilder: aBuilder descriptor: 'Tile Ratio:' getter: #getTileRatioAsString setter: #setTileRatio: model: self.
			
			self createAttributeSpecWithBuilder: aBuilder descriptor: 'Grid Width:' getter: #getGridWidthAsString setter: #setGridWidth: model: self.

			self createAttributeSpecWithBuilder: aBuilder descriptor: 'Grid Height:' getter: #getGridHeightAsString setter: #setGridHeight: model: self.
			};
			verticalResizing: #shrinkWrap;
			horizontalResizing: #shrinkWrap;
			yourself.
]

{
	#category : #building,
	#'squeak_changestamp' : 'TW 6/20/2024 16:00'
}
GMTEEditor >> createLayersSpecWithBuilder: aBuilder [

	^aBuilder pluggablePanelSpec new
		name: 'layer viewer';
		model: self;
		frame: (LayoutFrame
			fractions: (1@0.25 corner: 1@1)
			offsets: (-175@30 corner: 0@0));
		children: {
			aBuilder pluggableButtonSpec new
			name: 'addLayer';
			label: 'add Layer';
			model: self;
			action: #addLayer;
			frame: (LayoutFrame fractions: (0 @ 0 corner: 1 @ 0) offsets: (0 @ 0 corner: 0 @ 30)).
			
			aBuilder pluggableMultiSelectionListSpec new
			name: 'layers';
			model: self;
			list: #getLayerList;
			getSelectionList: #layerAt:;
			setSelectionList: #layerAt:put:;
			autoDeselect: false;
			frame: (LayoutFrame fractions: (0 @ 0 corner: 1 @ 1) offsets: (0 @ 30 corner: 0 @ 0))};
		verticalResizing: #shrinkWrap;
		
		yourself
]

{
	#category : #building,
	#'squeak_changestamp' : 'Alex M 6/14/2024 00:48'
}
GMTEEditor >> createTileViewerSpecWithBuilder: aBuilder [
	"TODO: Maybe rename function to something more appropriate?"
	^aBuilder pluggablePanelSpec new
		name: 'main panel';
		model:self;
		frame: (LayoutFrame fractions: (0.2 @ 0 corner: 1 @ 0.8)
		offsets: (0@ 30 corner: -175@0));
		"layout: #vertical;"
		children: {
		
			self createToolBarSpecWithBuilder: aBuilder.
					
			aBuilder pluggablePanelSpec new
				name: 'tile viewer';
				layout: #horizontal;
				model:self;
				frame: (LayoutFrame
					fractions: (0@0 corner: 1@1)
					offsets: (0@30 corner: 0@ 0)).
		 };
		
		minimumExtent:150@150;
		yourself
]

{
	#category : #building,
	#'squeak_changestamp' : 'TW 6/9/2024 18:12'
}
GMTEEditor >> createTilestoreSpecWithBuilder: aBuilder [

		^aBuilder pluggableScrollPaneSpec new
			frame: (LayoutFrame fractions: (0 @ 0 corner: 0.2 @ 1)
			offsets: (0@ 30 corner: 0@0));
			name: 'tile store';
			spacing: 10@10;
			children: {};
			spacing: 20;
			verticalResizing: #shrinkWrap;
			horizontalResizing: #shrinkWrap;
			"minimumWidth:100;"
			yourself.

]

{
	#category : #building,
	#'squeak_changestamp' : 'TW 6/20/2024 17:17'
}
GMTEEditor >> createToolBarSpecWithBuilder: aBuilder [
	^aBuilder pluggablePanelSpec new
		name: 'toolbar';
		model: self;
		frame: (LayoutFrame
			fractions: (0@0 corner: 1@0) offsets:(0@0 corner: 0@30));
		children: {
			aBuilder pluggableButtonSpec new
			name: 'reset';
			label: 'Reset Layer';
			model: self;
			action:#resetSelectedLayers;
			frame: (LayoutFrame fractions: (0 @ 0 corner: 0.17 @ 1) offsets: nil).
			aBuilder pluggableButtonSpec new
			name: 'toggleVisual';
			label: 'Toggle Grid';
			model: self;
			action: #toggleGrid;
			frame: (LayoutFrame fractions: (0.17 @ 0 corner: 0.34 @ 1) offsets: nil).
			aBuilder pluggableButtonSpec new
			name: 'toggleBackground';
			label: 'Toggle Background Tiles';
			model: self;
			action: #toggleBackgroundTiles;
			frame: (LayoutFrame fractions: (0.34 @ 0 corner: 0.5 @ 1) offsets: nil).
			aBuilder pluggableButtonSpec new
			name: 'renameLayer';
			label: 'Rename';
			model: self;
			action: #renameLayer;
			frame: (LayoutFrame fractions: (0.5 @ 0 corner: 0.6 @ 1) offsets: nil).
			aBuilder pluggableButtonSpec new
			name: 'moveLayer';
			model:self;
			action: #moveLayerDown;
			frame: (LayoutFrame fractions: (0.6 @ 0 corner: 0.7 @ 1) offsets: nil);
			label: '^'.
			aBuilder pluggableButtonSpec new
			name: 'mergeLayers';
			model:self;
			action: #mergeSelectedLayers;
			frame: (LayoutFrame fractions: (0.7 @ 0 corner: 0.8 @ 1) offsets: nil);
			label: 'Merge'.
			aBuilder pluggableButtonSpec new
			name: 'deleteLayers';
			model:self;
			action: #deleteLayer;
			frame: (LayoutFrame fractions: (0.8 @ 0 corner: 0.9 @ 1) offsets: nil);
			label: 'Delete Layer'.
			aBuilder pluggableButtonSpec new
			name: 'toggleLayerVisibility';
			model:self;
			action: #toggleLayerVisibility;
			frame: (LayoutFrame fractions: (0.9 @ 0 corner: 1 @ 1) offsets: nil);
			label: 'Show/Hide Layer'};
			
		verticalResizing: #shrinkWrap;
		yourself
]

{
	#category : #building,
	#'squeak_changestamp' : 'Alex M 6/14/2024 00:49'
}
GMTEEditor >> createTraySpecWithBuilder: aBuilder [
	^aBuilder pluggableScrollPaneSpec new
		name: 'tray';
		frame: (LayoutFrame fractions: (0.2 @ 0.8 corner:  1 @ 1) offsets: (0 @ 0 corner: -175 @ 0));
		minimumHeight:75;
		yourself
]

{
	#category : #'layer button functions',
	#'squeak_changestamp' : 'Alex M 6/17/2024 23:41'
}
GMTEEditor >> deleteLayer [
	
	[self tileMapMatrix tileMatrixStack removeLayerAt: self selectedLayer] on: AssertionFailure do: [^ nil].
	self layerList removeAt: self selectedLayer.
	self changed: #getLayerList.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/20/2024 16:19'
}
GMTEEditor >> deselectAllLayers [

	self selectedLayers: Set new.
	self changed: #selectedLayers
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/20/2024 16:06'
}
GMTEEditor >> deselectLayer: anIndex [

	self selectedLayers remove: anIndex.
	self changed: #selectedLayers
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 5/22/2024 16:36'
}
GMTEEditor >> deselectTile [

	"TODO implement the lower part: resetting selected tile in tray view"
	self selectTile: nil.
	self tileMapMatrix tileSelectionSet highlightImage: nil.
	"self trayViewer submorphs first 
		visible:true;
		image: (anObject image scaledToWidth:75)."
]

{
	#category : #'button functions',
	#'squeak_changestamp' : 'TW 5/22/2024 11:36'
}
GMTEEditor >> exportAsImage [
	
	self tileMapMatrix exportAsImage
]

{
	#category : #'button functions',
	#'squeak_changestamp' : 'jj 6/11/2024 20:00'
}
GMTEEditor >> exportAsMorph [
	
	(self tileMapMatrix copy model: nil) saveOnFile. 
	self savedSinceModified: true
]

{
	#category : #building,
	#'squeak_changestamp' : 'TW 6/5/2024 02:02'
}
GMTEEditor >> exportMenu [

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
	#category : #helper,
	#'squeak_changestamp' : 'JS 6/15/2024 12:57'
}
GMTEEditor >> getFileWithFileChooser [

	^UIManager default chooseFileMatchingSuffixes: {'morph'}
]

{
	#category : #tilemap,
	#'squeak_changestamp' : 'TW 6/11/2024 16:42'
}
GMTEEditor >> getGridHeight [

	self tileMapMatrix 
		ifNotNil: [^self tileMapMatrix mapTileHeight]
		ifNil: [^nil]
]

{
	#category : #tilemap,
	#'squeak_changestamp' : 'TW 6/11/2024 17:35'
}
GMTEEditor >> getGridHeightAsString [

	^self getGridHeight asString
]

{
	#category : #tilemap,
	#'squeak_changestamp' : 'TW 6/11/2024 16:42'
}
GMTEEditor >> getGridWidth [

	self tileMapMatrix 
		ifNotNil: [^self tileMapMatrix mapTileWidth]
		ifNil: [^nil]
]

{
	#category : #tilemap,
	#'squeak_changestamp' : 'TW 6/11/2024 17:35'
}
GMTEEditor >> getGridWidthAsString [

	^self getGridWidth asString
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'TW 6/20/2024 16:15'
}
GMTEEditor >> getLayerList [

	^self layerData collect: [:layerData | layerData first]
]

{
	#category : #tilemap,
	#'squeak_changestamp' : 'TW 6/11/2024 19:04'
}
GMTEEditor >> getPadding [

	self tileMapMatrix 
		ifNotNil: [^self tileMapMatrix mapPadding]
		ifNil: [^nil]
]

{
	#category : #tilemap,
	#'squeak_changestamp' : 'Alex M 6/17/2024 23:34'
}
GMTEEditor >> getPaddingAsString [

	^ self getPadding asString
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'TW 6/20/2024 16:43'
}
GMTEEditor >> getSelectedLayer [

	self assert: self singleLayerSelected.
	^ self selectedLayers anyOne
]

{
	#category : #tilemap,
	#'squeak_changestamp' : 'Alex M 6/17/2024 23:34'
}
GMTEEditor >> getTileRatio [

	self tileMapMatrix 
		ifNotNil: [^ self tileMapMatrix tileSizeRatio]
		ifNil: [^ nil]
]

{
	#category : #tilemap,
	#'squeak_changestamp' : 'Alex M 6/17/2024 23:34'
}
GMTEEditor >> getTileRatioAsString [

	^ self getTileRatio asString
]

{
	#category : #'button functions',
	#'squeak_changestamp' : 'JS 6/15/2024 13:03'
}
GMTEEditor >> import [
	"TODO make multiple sprite sets available?"
	| tiles tileHeight dimensions|
	tileHeight := FillInTheBlankMorph request: 'Enter tile height (width is calculated by ratio)' initialAnswer: '16'.
	
	(tileHeight = '')
		ifTrue: [^ nil]
		ifFalse:[tileHeight := tileHeight asInteger].
	
	dimensions := (tileHeight @ (tileHeight * (self ratio))).
	tiles := self loadTileSetWithDimensions: dimensions.
	
	tiles
		ifNil: [^ nil].
	
	self tileStore morph 
		removeAllMorphs;
		addAllMorphs: tiles
]

{
	#category : #'button functions',
	#'squeak_changestamp' : 'JS 6/19/2024 10:52'
}
GMTEEditor >> importFromMorph [
	"import tilemap into editor from a .morph file"

	|stream tileMap|
	stream := self getFileWithFileChooser.

    	stream ifNil: [^self].
    	tileMap := GMTEEditor privateGetEditableTileMapFromFilePath: stream.
    	self openTileMapInEditor: tileMap
	
]

{
	#category : #building,
	#'squeak_changestamp' : 'TW 6/5/2024 12:01'
}
GMTEEditor >> importMenu [

	| aMenuSpec builder|
	builder := ToolBuilder default.
	aMenuSpec := builder pluggableMenuSpec new.

	aMenuSpec
		add: 'Tileset'
		target: self
		selector: #import
		argumentList: {};
		
		add: 'Tilemap'
		target: self
		selector: #importFromMorph
		argumentList: {}.
		
	builder open: aMenuSpec
]

{
	#category : #initialisation,
	#'squeak_changestamp' : 'TW 6/20/2024 16:15'
}
GMTEEditor >> initialize [

	super initialize.
	self
		layerData: OrderedCollection new;
		selectedLayers: Set new;
		storeLayerN: 1;
		selectLayer: 1;
		morphBuilders: Dictionary new;
		open;
		ratio: 1;
		savedSinceModified: true
]

{
	#category : #initialisation,
	#'squeak_changestamp' : 'Alex M 6/11/2024 14:33'
}
GMTEEditor >> initializeDefaultTileMapMatrix [

	self initializeTileMapMatrixWithHeight: 10 width: 10
]

{
	#category : #initialisation,
	#'squeak_changestamp' : 'TW 6/11/2024 19:06'
}
GMTEEditor >> initializeTileMapMatrixWithHeight: aHeight width: aWidth [

	self tileMapMatrix: (GMTEEditableTileMap tileWidth: aWidth tileHeight: aHeight padding: 0.15 sizeRatio: 1 model: self).
	self tileViewer addMorph: self tileMapMatrix.		
	self tileMapMatrix 
		position: (self tileMapMatrix owner position);
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
	#'squeak_changestamp' : 'TW 6/5/2024 02:44'
}
GMTEEditor >> inspector [

	^ inspector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/5/2024 02:44'
}
GMTEEditor >> inspector: anObject [

	inspector := anObject.
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'TW 6/20/2024 16:18'
}
GMTEEditor >> layerAt: anIndex [

	^ self selectedLayers includes: anIndex
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'TW 6/20/2024 16:10'
}
GMTEEditor >> layerAt: anIndex put: aBool [

	aBool
		ifTrue: [self selectLayer: anIndex]
		ifFalse: [self deselectLayer: anIndex]
]

{
	#category : #'button functions',
	#'squeak_changestamp' : 'TW 6/20/2024 16:21'
}
GMTEEditor >> layerCount [

	^ self tileMapMatrix tileMatrixStack layerCount
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/20/2024 16:14'
}
GMTEEditor >> layerData [

	^ layerData
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/20/2024 15:48'
}
GMTEEditor >> layerData: anObject [

	layerData := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 5/22/2024 00:59'
}
GMTEEditor >> layerViewer [

	^ layerViewer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 5/22/2024 00:59'
}
GMTEEditor >> layerViewer: anObject [

	layerViewer := anObject.
]

{
	#category : #'file loading',
	#'squeak_changestamp' : 'Alex M 6/14/2024 13:02'
}
GMTEEditor >> loadTileSetWithDimensions: aPoint [
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
	0 to: (form height - tileHeight) by: tileHeight do:[:y|
		0 to: (form width - tileWidth) by: tileWidth do: [:x|
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
			previews add: (ImageMorph new image: tile)
		].
	].
	
	"TODO: This is maybe not the nicest way to write it. Maybe put more of it into confirmPreview?"
	previewTileSize := (form width max: 500) / (form width / tileWidth).
	previewDimensions := (form extent / aPoint * previewTileSize) + (2*((form width / tileWidth)@(form height / tileHeight))).
	(self confirmPreviewOf: previews withDimensions: previewDimensions withTileSize: previewTileSize) ifFalse:[^ nil].

	^ morphs.
]

{
	#category : #'layer button functions',
	#'squeak_changestamp' : 'TW 6/20/2024 15:49'
}
GMTEEditor >> mergeLayerDown [
	
	
	(self selectedLayer <= 1)
		ifTrue: [^nil].
	
	
	self layerList
		at: self selectedLayer put: (self layerList at: self selectedLayer - 1);
		removeAt: self selectedLayer - 1.
	self tileMapMatrix tileMatrixStack blendLayer: self selectedLayer - 1 with: self selectedLayer.
	self selectedLayer: self selectedLayer - 1.
	self changed: #getLayerList
]

{
	#category : #'layer button functions',
	#'squeak_changestamp' : 'TW 6/20/2024 17:17'
}
GMTEEditor >> mergeSelectedLayers [
	
	(self selectedLayers size > 1)
		ifTrue: [self tileMapMatrix mergeLayers: self selectedLayers]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/11/2024 15:54'
}
GMTEEditor >> morphBuilders [

	^ morphBuilders
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/11/2024 15:54'
}
GMTEEditor >> morphBuilders: anObject [

	morphBuilders := anObject.
]

{
	#category : #'layer button functions',
	#'squeak_changestamp' : 'TW 6/20/2024 17:03'
}
GMTEEditor >> moveLayerDown [
	
	| selectedLayer |
	
	(self singleLayerSelected)
		ifFalse: [^ nil].
	
	selectedLayer := self getSelectedLayer.
	(selectedLayer == 1)
		ifFalse: [self swapLayer: selectedLayer with: selectedLayer - 1]
]

{
	#category : #building,
	#'squeak_changestamp' : 'Alex M 5/28/2024 15:42'
}
GMTEEditor >> onClose [
	"PopUpMenu inform:'You should save'."
	"TODO: Give chance to save"
	
	self savedSinceModified
		ifFalse: [
			(PopUpMenu confirm: 'Save before closing?')
				ifTrue: [self exportAsMorph]]
]

{
	#category : #initialisation,
	#'squeak_changestamp' : 'TW 5/28/2024 01:43'
}
GMTEEditor >> open [
  
	| newMorph |
	
	newMorph := (ToolBuilder default build: self).
      newMorph openInWorld.
	self tileViewer submorphs first updateMap.
      ^newMorph
]

{
	#category : #helper,
	#'squeak_changestamp' : 'JS 6/15/2024 13:01'
}
GMTEEditor >> openTileMapInEditor: aTileMap [


    aTileMap tileSelectionSet highlightImage: nil.
    self tileMapMatrix: aTileMap.
    aTileMap model: self.
    self tileViewer
        removeAllMorphs;
        addMorph: aTileMap.

    self changed: #getLayerList
]

{
	#category : #'button functions',
	#'squeak_changestamp' : 'Ivo Zilkenat 6/18/2024 19:10'
}
GMTEEditor >> openTileMapInWorld [
	"open the current tileMap into world"
	
	(GMTETileMap newFromEditableTileMap: self tileMapMatrix)
		position: 0@0;
		openInWorld
]

{
	#category : #tilemap,
	#'squeak_changestamp' : 'Alex M 6/17/2024 23:34'
}
GMTEEditor >> parseGridSize: aText [

	| newSize |
	newSize := self parseSize: aText.
	(newSize notNil and: [newSize isInteger and: [0 < newSize and: [newSize < 200]]])
		ifTrue: [ ^newSize]
		ifFalse: [ ^nil].
]

{
	#category : #tilemap,
	#'squeak_changestamp' : 'Alex M 6/17/2024 23:34'
}
GMTEEditor >> parsePaddingSize: aText [

	| newSize |
	newSize := self parseSize: aText.
	(newSize notNil and: [0 <= newSize and: [newSize <= 0.9]])
		ifTrue: [^ newSize]
		ifFalse: [^ nil].
]

{
	#category : #tilemap,
	#'squeak_changestamp' : 'Alex M 6/17/2024 23:33'
}
GMTEEditor >> parseSize: aText [

	[aText asNumber] on: NumberParserError do: [^ nil].
	^ aText asNumber
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 5/23/2024 02:24'
}
GMTEEditor >> ratio [
	^ ratio
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 5/23/2024 02:24'
}
GMTEEditor >> ratio: anObject [
	ratio := anObject
]

{
	#category : #'layer button functions',
	#'squeak_changestamp' : 'TW 6/20/2024 16:46'
}
GMTEEditor >> renameLayer [

	| newName selectedLayer |
	self singleLayerSelected
		ifTrue: [
			selectedLayer := self getSelectedLayer.
			newName := FillInTheBlankMorph 
			request: 'New Name:' initialAnswer: (self getLayerList at: selectedLayer).
			newName
				ifNotNil: [self updateLayerNameOf: selectedLayer to: newName]]

	
]

{
	#category : #'button functions',
	#'squeak_changestamp' : 'TW 6/20/2024 16:38'
}
GMTEEditor >> resetAllLayers [
	"TODO: maybe combine this with updatTile: inLayer: FromEvent: . Currently not working with layers."
	
	self tileMapMatrix resetAllLayers
]

{
	#category : #'button functions',
	#'squeak_changestamp' : 'TW 6/20/2024 16:39'
}
GMTEEditor >> resetLayer: anIndex [
	"TODO: maybe combine this with updatTile: inLayer: FromEvent: . Currently not working with layers."
	
	self tileMapMatrix resetLayer: anIndex
]

{
	#category : #'button functions',
	#'squeak_changestamp' : 'TW 6/20/2024 16:38'
}
GMTEEditor >> resetSelectedLayers [
	"TODO: maybe combine this with updatTile: inLayer: FromEvent: . Currently not working with layers."
	
	self selectedLayers do: [:i | self resetLayer: i]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 5/28/2024 10:42'
}
GMTEEditor >> savedSinceModified [

	^ savedSinceModified
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 5/28/2024 10:42'
}
GMTEEditor >> savedSinceModified: anObject [

	savedSinceModified := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/20/2024 16:22'
}
GMTEEditor >> selectAllLayers [

	1 to: self layerCount do: [:i | self selectLayer: i].
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/20/2024 16:05'
}
GMTEEditor >> selectLayer: anIndex [

	self selectedLayers add: anIndex.
	self changed: #selectedLayers
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/20/2024 16:22'
}
GMTEEditor >> selectOnlyLayer: anIndex [

	self 
		deselectAllLayers;
		selectLayer: anIndex.
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 5/24/2024 00:40'
}
GMTEEditor >> selectTile: anObject [
	
	"TODO: might be problematic with tray. Maybe give tiles in the store IDs?"
	(anObject = self selectedTile)
	ifTrue:[self unselectTile]
	ifFalse:[
		self selectedTile: anObject.
		self tileMapMatrix tileSelectionSet highlightImage: anObject fullResolutionSprite.
		self trayViewer morph submorphs first
			visible:true;
			image: (anObject fullResolutionSprite scaledToWidth:75).
	]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/20/2024 16:15'
}
GMTEEditor >> selectedLayers [

	^ selectedLayers
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/20/2024 15:44'
}
GMTEEditor >> selectedLayers: anObject [

	selectedLayers := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 5/22/2024 11:52'
}
GMTEEditor >> selectedTile [

	^ selectedTile
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 5/22/2024 16:11'
}
GMTEEditor >> selectedTile: anObject [

	selectedTile := anObject.
]

{
	#category : #tilemap,
	#'squeak_changestamp' : 'TW 6/11/2024 18:12'
}
GMTEEditor >> setGridHeight: aText [

	| newSize |
	
	newSize := self parseGridSize: aText.
	newSize
		ifNotNil: [
			self tileMapMatrix rescaleMapWidth: self getGridWidth height: newSize].
	^true
		

]

{
	#category : #tilemap,
	#'squeak_changestamp' : 'Alex M 6/13/2024 17:27'
}
GMTEEditor >> setGridWidth: aText [
	
	"TODO: Fix visual layer bug"
	
	| newSize |
	
	newSize := self parseGridSize: aText.
	newSize
		ifNotNil: [self tileMapMatrix rescaleMapWidth: newSize height: self getGridHeight].
	^true

]

{
	#category : #tilemap,
	#'squeak_changestamp' : 'TW 6/11/2024 19:05'
}
GMTEEditor >> setPadding: aText [

	| newSize |
	
	newSize := self parsePaddingSize: aText.
	newSize
		ifNotNil: [self tileMapMatrix rescaleMapWidth: self getGridWidth height: self getGridHeight padding: newSize].
	^true

]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'TW 6/20/2024 15:53'
}
GMTEEditor >> singleLayerSelected [

	^ self selectedLayers size == 1
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/20/2024 16:15'
}
GMTEEditor >> storeLayerN: aNumber [

	self layerData add: {'Layer ', aNumber . True}.
	self changed: #getLayerList.
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'TW 6/20/2024 17:00'
}
GMTEEditor >> swapLayer: anIndex with: anotherIndex [
	
	
	| selectionOfA |
	self layerData swap: anIndex with: anotherIndex.
	self tileMapMatrix tileMatrixStack swapLayer: anIndex with: anotherIndex.
	selectionOfA := self layerAt: anIndex.
	self 
		layerAt: anIndex put: (self layerAt: anotherIndex);
		layerAt: anotherIndex put: selectionOfA;
		changed: #getLayerList;
		changed: #layerAt:
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 5/22/2024 11:35'
}
GMTEEditor >> tileMapMatrix [

	^ tileMapMatrix
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 5/22/2024 11:35'
}
GMTEEditor >> tileMapMatrix: anObject [

	tileMapMatrix := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 5/22/2024 00:59'
}
GMTEEditor >> tileStore [

	^ tileStore
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 5/22/2024 00:59'
}
GMTEEditor >> tileStore: anObject [

	tileStore := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 5/22/2024 00:59'
}
GMTEEditor >> tileViewer [

	^ tileViewer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 5/22/2024 00:59'
}
GMTEEditor >> tileViewer: anObject [

	tileViewer := anObject.
]

{
	#category : #'button functions',
	#'squeak_changestamp' : 'Alex M 6/20/2024 00:12'
}
GMTEEditor >> toggleBackgroundTiles [
	self tileMapMatrix toggleBackgroundLayer.
]

{
	#category : #'button functions',
	#'squeak_changestamp' : 'Alex M 6/15/2024 19:18'
}
GMTEEditor >> toggleGrid [

	self tileMapMatrix toggleVisualLayer
]

{
	#category : #'layer button functions',
	#'squeak_changestamp' : 'Alex M 6/18/2024 12:45'
}
GMTEEditor >> toggleLayerVisibility [
	
	self tileMapMatrix tileMatrixStack toggleLayerVisibility: self selectedLayer.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 5/22/2024 00:59'
}
GMTEEditor >> trayViewer [

	^ trayViewer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 5/22/2024 00:59'
}
GMTEEditor >> trayViewer: anObject [

	trayViewer := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 5/23/2024 19:52'
}
GMTEEditor >> unselectTile [

	self selectedTile: nil.
	self tileMapMatrix tileSelectionSet highlightImage: nil.
	self trayViewer morph submorphs first visible:false.
]

{
	#category : #building,
	#'squeak_changestamp' : 'TW 6/20/2024 16:49'
}
GMTEEditor >> updateLayerNameOf: anIndex to: aString [

	| visibility |
	visibility := (self layerData at: anIndex) second.
	
	self layerData at: anIndex put: {aString . visibility}.
	self changed: #getLayerList
]

{
	#category : #building,
	#'squeak_changestamp' : 'TW 6/11/2024 15:22'
}
GMTEEditor >> withMorphOf: aSpec do: aBlock [

	| id |
	id := UUID new asString.
	morphBuilders at: id put: aBlock.
	
	aSpec name: id.
	^ aSpec
]
