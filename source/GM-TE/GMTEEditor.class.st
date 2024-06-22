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
		'layerData',
		'backgroundTile',
		'tileMap'
	],
	#category : #'GM-TE-UI'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 6/22/2024 16:03'
}
GMTEEditor class >> getTileMapFromFileBinary: aFileBinary [

    ^ GMTETileMap newFrom: (GMTEEditor privateGetEditableTileMapFromFileBinary: aFileBinary)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 6/22/2024 16:03'
}
GMTEEditor class >> getTileMapFromFilePath: aFilePath [

    ^ GMTETileMap newFrom: (GMTEEditor privateGetEditableTileMapFromFilePath: aFilePath)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 6/22/2024 16:03'
}
GMTEEditor class >> getTileMapFromProjectName: aName withPath: aPath [

    ^ GMTEEditor getTileMapFromFileBinary: ((GitAssetLoader for: aName) loadAsset: aPath)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 6/22/2024 16:03'
}
GMTEEditor class >> privateGetEditableTileMapFromFileBinary: aFileBinary [

    |aFileStream tileMap|
    aFileStream := (MultiByteBinaryOrTextStream with: aFileBinary) binary reset.
    tileMap := aFileStream fileInObjectAndCode.
    (tileMap isKindOf: GMTEEditorTileMap) ifFalse: [^ nil].
    ^ tileMap
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 6/22/2024 16:03'
}
GMTEEditor class >> privateGetEditableTileMapFromFilePath: aFilePath [

    ^ GMTEEditor privateGetEditableTileMapFromFileBinary: (FileStream readOnlyFileNamed: aFilePath) binary contentsOfEntireFile
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 6/22/2024 15:10'
}
GMTEEditor class >> register [

	"Maybe call this on new?"
	TheWorldMenu registerOpenCommand: {'TileMap Editor'. {GMTEEditor. #new}}
]

{
	#category : #'menu button functions',
	#'squeak_changestamp' : 'jj 6/22/2024 16:31'
}
GMTEEditor >> addLayer [

	| newLayerNumber |
	newLayerNumber :=  self layerCount + 1.

	self tileMap tileMatrixStack pushLayer.
	self
		storeLayerN: newLayerNumber;
		selectOnlyLayer: newLayerNumber
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'jj 6/22/2024 16:31'
}
GMTEEditor >> anyLayerSelected [

	^ (self selectedLayers size > 0)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 16:32'
}
GMTEEditor >> backgroundTile [

	^ backgroundTile
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/20/2024 21:40'
}
GMTEEditor >> backgroundTile: anObject [

	backgroundTile := anObject.
	
	"TODO: keep this here? TileMap must know backgorund Tiles"
	self tileMap backgroundTiles: anObject
]

{
	#category : #'layer button functions',
	#'squeak_changestamp' : 'jj 6/22/2024 16:32'
}
GMTEEditor >> blendSelectedLayers [
	
	| bakedLayer |
	(self selectedLayers size > 1)
		ifTrue: [
			bakedLayer := self selectedLayers min.
			self tileMap blendLayers: self selectedLayers.
			self selectedLayers remove: bakedLayer.
			self forgetLayers: self selectedLayers.
			self
				deselectAllLayers;
				selectLayer: bakedLayer]
]

{
	#category : #building,
	#'squeak_changestamp' : 'jj 6/22/2024 16:32'
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
		model:self;
		yourself.
		
	"TODO: Work in progress."
	self trayViewer morph: GMTETileTray new.
	self trayViewer morph
		addMorph: selectedTile.
		
	self tileViewer 
		borderWidth: 2;
		borderColor: tileStore borderColor.
	
	self initializeDefaultTileMapMatrix.
		
	^ newMorph
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'jj 6/22/2024 16:32'
}
GMTEEditor >> collectLayerData [

	self layerData: OrderedCollection new.
	1 to: self layerCount do: [ :i | 
		self storeLayerN: i withVisibility: (self tileMap tileMatrixStack layerVisible: i)]
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 16:33'
}
GMTEEditor >> commandBar [

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
	#category : #'file loading',
	#'squeak_changestamp' : 'jj 6/22/2024 16:34'
}
GMTEEditor >> confirmPreviewOf: morphArray withDimensions: aPoint withTileSize: aNumber [
	
	|img imgwrapper dialog|
	imgwrapper := ScrollPane new.
	
	img := Morph new
		beTransparent;
		extent: aPoint;
		yourself.
	(img layoutPolicy: TableLayout new)
	listDirection: #leftToRight;
	wrapDirection: #leftToRight.
	
	(morphArray reversed) do: [ :morph| 
		img 
			addMorph: (ImageMorph new image: (morph image scaledToWidth: aNumber); 			borderColor: (Color red);
			borderWidth:1;
			yourself)].
	
	imgwrapper extent: (img width min: 1700) @ (img height min: 800).
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
	#'squeak_changestamp' : 'jj 6/22/2024 16:36'
}
GMTEEditor >> createAttributeSpecWithBuilder: aBuilder descriptor: aString getter: aSelector setter: anotherSelector model: aModel [

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
	#'squeak_changestamp' : 'jj 6/22/2024 16:35'
}
GMTEEditor >> createCommandBarSpecWithBuilder: aBuilder [

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
	#'squeak_changestamp' : 'jj 6/22/2024 16:38'
}
GMTEEditor >> createInspectorSpecWithBuilder: aBuilder [

	^ aBuilder pluggableScrollPaneSpec new
		frame: (LayoutFrame fractions: (0.8 @ 0 corner: 1 @ 0.25)
		offsets: (0 @ 30 corner: 0 @ 30));
		padding: (Rectangle left: 3 right: 0 top: 0 bottom: 0);
		hScrollBarPolicy: #never;
		layout: #vertical;
		name: 'inspector';
		children: {
		self createAttributeSpecWithBuilder: aBuilder descriptor: 'Padding:' getter: #getPaddingAsString setter: #setPadding: model: self.
		
		self createAttributeSpecWithBuilder: aBuilder descriptor: 'Tile Ratio:' getter: #getTileRatioAsString setter: #setTileRatio: model: self.
		
		self createAttributeSpecWithBuilder: aBuilder descriptor: 'Grid Width:' getter: #getGridWidthAsString setter: #setGridWidth: model: self.

		self createAttributeSpecWithBuilder: aBuilder descriptor: 'Grid Height:' getter: #getGridHeightAsString setter: #setGridHeight: model: self
		};
		verticalResizing: #shrinkWrap;
		horizontalResizing: #shrinkWrap;
		yourself
]

{
	#category : #building,
	#'squeak_changestamp' : 'jj 6/22/2024 16:39'
}
GMTEEditor >> createLayersSpecWithBuilder: aBuilder [

	^ (aBuilder pluggablePanelSpec new)
		name: 'layer viewer';
		model: self;
		frame: (LayoutFrame
			fractions: (0.8 @ 0.25 corner: 1 @ 1)
			offsets: (0 @ 30 corner: 0 @ 0));
		children: {
			(aBuilder pluggableButtonSpec new)
			name: 'addLayer';
			label: 'add Layer';
			model: self;
			action: #addLayer;
			frame: (LayoutFrame fractions: (0 @ 0 corner: 1 @ 0) offsets: (0 @ 0 corner: 0 @ 30)).
			
			(aBuilder pluggablePanelSpec new)
			frame: (LayoutFrame fractions: (1 @ 0 corner: 1 @ 1) offsets: (-30 @ 30 corner: 0 @ 0));
			
			children: {				
				(aBuilder pluggableImageButtonSpec new)
					model:self;
					action: #moveLayerDown;
					frame: (LayoutFrame fractions: (0 @ 0 corner: 1 @ 0.083));
					project: 'GameMecha';
					path: '/GMTEIcons/up.png'.
				
				(aBuilder pluggableImageButtonSpec new)
					model:self;
					action: #moveLayerUp;
					frame: (LayoutFrame fractions: (0 @ 0.083 corner: 1 @ 0.166));
					project: 'GameMecha';
					path: '/GMTEIcons/down.png'.
				
				(aBuilder pluggableImageButtonSpec new)
					model: self;
					action: #renameLayer;
					frame: (LayoutFrame fractions: (0 @ 0.166 corner: 1 @ 0.333));
					project: 'GameMecha';
					path: '/GMTEIcons/rename.png'.
				
				(aBuilder pluggableImageButtonSpec new)
					model:self;
					action:#resetSelectedLayers;
					frame: (LayoutFrame fractions: (0 @ 0.333 corner: 1 @ 0.5));
					project: 'GameMecha';
					path: '/GMTEIcons/broom.png'.
				
				(aBuilder pluggableImageButtonSpec new)
					model:self;
					action: #blendSelectedLayers;
					frame: (LayoutFrame fractions: (0 @ 0.5 corner: 1 @ 0.666));
					project: 'GameMecha';
					path: '/GMTEIcons/merge.png'.
				
				(aBuilder pluggableImageButtonSpec new)
					model:self;
					action: #deleteSelectedLayers;
					frame: (LayoutFrame fractions: (0 @ 0.666 corner: 1 @ 0.833));
					project: 'GameMecha';
					path: '/GMTEIcons/trash.png'.
				
				(aBuilder pluggableImageButtonSpec new)
					model:self;
					action: #toggleSelectedLayerVisibility;
					frame: (LayoutFrame fractions: (0 @ 0.833 corner: 1 @ 1));
					project: 'GameMecha';
					path: '/GMTEIcons/eye.png'}.
			
			(aBuilder pluggableMultiSelectionListSpec new)
			name: 'layers';
			model: self;
			list: #getLayerList;
			getSelectionList: #layerAt:;
			setSelectionList: #layerAt:put:;
			autoDeselect: false;
			frame: (LayoutFrame fractions: (0 @ 0 corner: 1 @ 1) offsets: (0 @ 30 corner: -30 @ 0))};
		verticalResizing: #shrinkWrap;
		yourself
]

{
	#category : #building,
	#'squeak_changestamp' : 'jj 6/22/2024 16:40'
}
GMTEEditor >> createTileViewerSpecWithBuilder: aBuilder [
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
					fractions: (0@0 corner: 1@1)
					offsets: (0@30 corner: 0@ 0))
		 };
		
		minimumExtent:150@150;
		yourself
]

{
	#category : #building,
	#'squeak_changestamp' : 'jj 6/22/2024 16:41'
}
GMTEEditor >> createTilestoreSpecWithBuilder: aBuilder [

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
	#'squeak_changestamp' : 'jj 6/22/2024 16:41'
}
GMTEEditor >> createToolBarSpecWithBuilder: aBuilder [

	^ (aBuilder pluggablePanelSpec new)
		name: 'toolbar';
		model: self;
		frame: (LayoutFrame fractions: (0@0 corner: 1@0) offsets:(0@0 corner: 0@30));
		children: {};
			
		verticalResizing: #shrinkWrap;
		yourself
]

{
	#category : #building,
	#'squeak_changestamp' : 'jj 6/22/2024 16:41'
}
GMTEEditor >> createTraySpecWithBuilder: aBuilder [

	^ (aBuilder pluggableScrollPaneSpec new)
		name: 'tray';
		frame: (LayoutFrame fractions: (0.2 @ 0.8 corner:  0.8 @ 1) offsets: nil);
		minimumHeight:75;
		yourself
]

{
	#category : #'layer button functions',
	#'squeak_changestamp' : 'jj 6/22/2024 16:41'
}
GMTEEditor >> deleteSelectedLayers [
	
	(self anyLayerSelected not or: (self selectedLayers size >= self getLayerList size)) ifTrue: [^ nil].
	
	self tileMap removeLayers: self selectedLayers.
	self 
		forgetLayers: self selectedLayers;
		deselectAllLayers
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 6/22/2024 15:34'
}
GMTEEditor >> deselectAllLayers [

	self
		selectedLayers: Set new;
		changed: #selectedLayers
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 6/22/2024 15:34'
}
GMTEEditor >> deselectLayer: anIndex [
	
	(self selectedLayers size <= 1) ifTrue: [^ nil].
	
	(self selectedLayers includes: anIndex)
		ifTrue: [
			self selectedLayers remove: anIndex.
			self
				changed: #selectedLayers;
				changed: #layerAt:]
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 6/22/2024 15:35'
}
GMTEEditor >> deselectTile [

	"TODO implement the lower part: resetting selected tile in tray view"
	self selectTile: nil.
	self tileMap tileSelectionSet highlightImage: nil
]

{
	#category : #'menu button functions',
	#'squeak_changestamp' : 'TW 6/20/2024 21:40'
}
GMTEEditor >> exportAsImage [
	
	self tileMap exportAsImage
]

{
	#category : #'menu button functions',
	#'squeak_changestamp' : 'TW 6/20/2024 21:40'
}
GMTEEditor >> exportAsMorph [
	
	(self tileMap copy model: nil) saveOnFile. 
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
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'jj 6/22/2024 16:42'
}
GMTEEditor >> forgetLayers: aSet [

	| toBeForgotten |
	toBeForgotten := self selectedLayers asSortedCollection reversed.
	toBeForgotten do: [:i | self layerData removeAt: i].
	self changed: #getLayerList
]

{
	#category : #helper,
	#'squeak_changestamp' : 'jj 6/22/2024 16:42'
}
GMTEEditor >> getFileWithFileChooser [

	^ UIManager default chooseFileMatchingSuffixes: {'morph'}
]

{
	#category : #tilemap,
	#'squeak_changestamp' : 'jj 6/22/2024 16:42'
}
GMTEEditor >> getGridHeight [

	self tileMap 
		ifNotNil: [^ self tileMap mapTileHeight]
		ifNil: [^ nil]
]

{
	#category : #tilemap,
	#'squeak_changestamp' : 'jj 6/22/2024 16:42'
}
GMTEEditor >> getGridHeightAsString [

	^ self getGridHeight asString
]

{
	#category : #tilemap,
	#'squeak_changestamp' : 'jj 6/22/2024 16:42'
}
GMTEEditor >> getGridWidth [

	self tileMap 
		ifNotNil: [^ self tileMap mapTileWidth]
		ifNil: [^ nil]
]

{
	#category : #tilemap,
	#'squeak_changestamp' : 'jj 6/22/2024 16:42'
}
GMTEEditor >> getGridWidthAsString [

	^ self getGridWidth asString
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'jj 6/22/2024 16:42'
}
GMTEEditor >> getLayerList [

	^ self layerData collect: [ :layerData |
			layerData second 
				ifTrue: [layerData first, ' (v)']
				ifFalse: [layerData first, ' (h)']]
]

{
	#category : #tilemap,
	#'squeak_changestamp' : 'jj 6/22/2024 16:42'
}
GMTEEditor >> getPadding [

	self tileMap 
		ifNotNil: [^ self tileMap mapPadding]
		ifNil: [^ nil]
]

{
	#category : #tilemap,
	#'squeak_changestamp' : 'jj 6/22/2024 16:43'
}
GMTEEditor >> getPaddingAsString [

	^ self getPadding asString
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'jj 6/22/2024 16:43'
}
GMTEEditor >> getSelectedLayer [

	self assert: self singleLayerSelected.
	^ self selectedLayers anyOne
]

{
	#category : #tilemap,
	#'squeak_changestamp' : 'jj 6/22/2024 16:43'
}
GMTEEditor >> getTileRatio [

	self tileMap 
		ifNotNil: [^ self tileMap tileSizeRatio]
		ifNil: [^ nil]
]

{
	#category : #tilemap,
	#'squeak_changestamp' : 'jj 6/22/2024 16:43'
}
GMTEEditor >> getTileRatioAsString [

	^ self getTileRatio asString
]

{
	#category : #'menu button functions',
	#'squeak_changestamp' : 'jj 6/22/2024 16:43'
}
GMTEEditor >> importFromMorph [
	"import tilemap into editor from a .morph file"

	|stream tileMap|
	stream := self getFileWithFileChooser.

    	stream ifNil: [^ self].
    	tileMap := GMTEEditor privateGetEditableTileMapFromFilePath: stream.
    	self openTileMapInEditor: tileMap.
	self
		changed: #getPaddingAsString;
		changed: #getTileRatioAsString;
		changed: #getGridWidthAsString;
		changed: #getGridHeightAsString;
		collectLayerData
]

{
	#category : #'menu button functions',
	#'squeak_changestamp' : 'jj 6/22/2024 16:43'
}
GMTEEditor >> importFromTileset [
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
	#'squeak_changestamp' : 'Alex M 6/22/2024 15:38'
}
GMTEEditor >> importMenu [

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
	#'squeak_changestamp' : 'TW 6/22/2024 01:37'
}
GMTEEditor >> initializeTileMapMatrixWithHeight: aHeight width: aWidth [

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
	#'squeak_changestamp' : 'jj 6/22/2024 16:43'
}
GMTEEditor >> inspector [

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
	#'squeak_changestamp' : 'jj 6/22/2024 16:43'
}
GMTEEditor >> layerAt: anIndex [

	^ self selectedLayers includes: anIndex
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'jj 6/22/2024 16:44'
}
GMTEEditor >> layerAt: anIndex put: aBool [
	
	| multiSelection |
	multiSelection := Sensor shiftPressed.
	
	multiSelection ifFalse: [self selectedLayers removeAll].
	
	(aBool or: [multiSelection not])
		ifTrue: [self selectLayer: anIndex]
		ifFalse: [self deselectLayer: anIndex]
]

{
	#category : #'menu button functions',
	#'squeak_changestamp' : 'jj 6/22/2024 16:44'
}
GMTEEditor >> layerCount [

	^ self tileMap tileMatrixStack layerCount
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 16:44'
}
GMTEEditor >> layerData [

	^ layerData
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/22/2024 01:31'
}
GMTEEditor >> layerData: anObject [

	layerData := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 16:44'
}
GMTEEditor >> layerViewer [

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
	#'squeak_changestamp' : 'jj 6/22/2024 16:44'
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
	0 to: (form height - tileHeight) by: tileHeight do:[ :y |
		0 to: (form width - tileWidth) by: tileWidth do: [ :x |
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
	
	"TODO: This is maybe not the nicest way to write it. Maybe put more of it into confirmPreview?"
	previewTileSize := (form width max: 500) / (form width / tileWidth).
	previewDimensions := (form extent / aPoint * previewTileSize) + (2 * ((form width / tileWidth) @ (form height / tileHeight))).
	(self confirmPreviewOf: previews withDimensions: previewDimensions withTileSize: previewTileSize) ifFalse:[^nil].

	^ morphs
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 16:45'
}
GMTEEditor >> morphBuilders [

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
	#'squeak_changestamp' : 'jj 6/22/2024 16:45'
}
GMTEEditor >> moveLayerDown [
	
	| selectedLayer |
	self singleLayerSelected ifFalse: [^nil].
	
	selectedLayer := self getSelectedLayer.
	(selectedLayer == 1) ifFalse: [self swapLayer: selectedLayer with: selectedLayer - 1]
]

{
	#category : #'layer button functions',
	#'squeak_changestamp' : 'jj 6/22/2024 16:45'
}
GMTEEditor >> moveLayerUp [
	
	| selectedLayer |
	self singleLayerSelected ifFalse: [^nil].
	
	selectedLayer := self getSelectedLayer.
	(selectedLayer == self layerCount) ifFalse: [self swapLayer: selectedLayer with: selectedLayer + 1]
]

{
	#category : #building,
	#'squeak_changestamp' : 'Alex M 6/22/2024 15:44'
}
GMTEEditor >> onClose [
	
	self savedSinceModified
		ifFalse: [(PopUpMenu confirm: 'Save before closing?')
			ifTrue: [self exportAsMorph]]
]

{
	#category : #initialisation,
	#'squeak_changestamp' : 'jj 6/22/2024 16:45'
}
GMTEEditor >> open [
  
	| newMorph |
	newMorph := ToolBuilder default build: self.
      newMorph openInWorld.
	self tileViewer submorphs first updateMap.
      ^ newMorph
]

{
	#category : #helper,
	#'squeak_changestamp' : 'jj 6/22/2024 16:45'
}
GMTEEditor >> openTileMapInEditor: aTileMap [

    aTileMap tileSelectionSet highlightImage: nil.
    self tileMap: aTileMap.
    aTileMap model: self.
    self tileViewer
        removeAllMorphs;
        addMorph: aTileMap.

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
	#category : #tilemap,
	#'squeak_changestamp' : 'jj 6/22/2024 16:45'
}
GMTEEditor >> parseGridSize: aText [

	| newSize |
	newSize := self parseSize: aText.
	(newSize notNil and: [newSize isInteger and: [0 < newSize and: [newSize < 200]]])
		ifTrue: [^ newSize]
		ifFalse: [^ nil]
]

{
	#category : #tilemap,
	#'squeak_changestamp' : 'TW 6/22/2024 01:31'
}
GMTEEditor >> parsePaddingSize: aText [

	| newSize |
	newSize := self parseSize: aText.
	(newSize notNil and: [0 <= newSize and: [newSize <= 0.9]])
		ifTrue: [^ newSize]
		ifFalse: [^ nil]
]

{
	#category : #tilemap,
	#'squeak_changestamp' : 'jj 6/22/2024 16:46'
}
GMTEEditor >> parseSize: aText [

	[^ aText asNumber] on: NumberParserError do: [^ nil]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 16:46'
}
GMTEEditor >> ratio [

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
	#category : #'layer button functions',
	#'squeak_changestamp' : 'TW 6/21/2024 15:46'
}
GMTEEditor >> renameLayer [

	| newName selectedLayer |
	self singleLayerSelected
		ifTrue: [
			selectedLayer := self getSelectedLayer.
			newName := FillInTheBlankMorph 
			request: 'New Name:' initialAnswer: (self layerData at: selectedLayer) first.
			(newName isNil or: newName isEmpty)
				ifFalse: [self updateLayerNameOf: selectedLayer to: newName]]

	
]

{
	#category : #'menu button functions',
	#'squeak_changestamp' : 'TW 6/20/2024 21:40'
}
GMTEEditor >> resetAllLayers [
	"TODO: maybe combine this with updatTile: inLayer: FromEvent: . Currently not working with layers."
	
	self tileMap resetAllLayers
]

{
	#category : #'layer button functions',
	#'squeak_changestamp' : 'TW 6/20/2024 21:41'
}
GMTEEditor >> resetLayers: aSet [
	"TODO: maybe combine this with updatTile: inLayer: FromEvent: . Currently not working with layers."
	
	self tileMap resetLayers: aSet
]

{
	#category : #'layer button functions',
	#'squeak_changestamp' : 'TW 6/20/2024 21:41'
}
GMTEEditor >> resetSelectedLayers [
	"TODO: maybe combine this with updatTile: inLayer: FromEvent: . Currently not working with layers."
	
	self resetLayers: self selectedLayers
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
	#'squeak_changestamp' : 'TW 6/22/2024 01:30'
}
GMTEEditor >> savedSinceModified: anObject [

	savedSinceModified := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 6/22/2024 15:58'
}
GMTEEditor >> selectAllLayers [

	1 to: self layerCount do: [:i | self selectLayer: i]
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 6/20/2024 20:44'
}
GMTEEditor >> selectLayer: anIndex [
	
	self selectedLayers add: anIndex.
	self
		changed: #selectedLayers;
		changed: #layerAt:
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/22/2024 01:30'
}
GMTEEditor >> selectOnlyLayer: anIndex [

	self 
		deselectAllLayers;
		selectLayer: anIndex
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 16:46'
}
GMTEEditor >> selectTile: anObject [
	
	"TODO: might be problematic with tray. Maybe give tiles in the store IDs?"
	(anObject = self selectedTile)
	ifTrue:[self unselectTile]
	ifFalse:[
		self selectedTile: anObject.
		self tileMap tileSelectionSet highlightImage: anObject fullResolutionSprite.
		self trayViewer morph submorphs first
			visible: true;
			updateSprite: anObject fullResolutionSprite;
			extent: 75@75]
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
	#'squeak_changestamp' : 'TW 6/22/2024 01:30'
}
GMTEEditor >> selectedLayers: anObject [

	selectedLayers := anObject
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
	#'squeak_changestamp' : 'TW 6/22/2024 01:30'
}
GMTEEditor >> selectedTile: anObject [

	selectedTile := anObject
]

{
	#category : #tilemap,
	#'squeak_changestamp' : 'jj 6/22/2024 16:47'
}
GMTEEditor >> setGridHeight: aText [

	| newSize |
	newSize := self parseGridSize: aText.
	newSize
		ifNotNil: [
			self tileMap rescaleMapWidth: self getGridWidth height: newSize].
	^ true
		

]

{
	#category : #tilemap,
	#'squeak_changestamp' : 'jj 6/22/2024 16:47'
}
GMTEEditor >> setGridWidth: aText [
	"TODO: Fix visual layer bug"
	
	| newSize |
	newSize := self parseGridSize: aText.
	newSize ifNotNil: [self tileMap rescaleMapWidth: newSize height: self getGridHeight].
	^ true

]

{
	#category : #tilemap,
	#'squeak_changestamp' : 'jj 6/22/2024 16:47'
}
GMTEEditor >> setPadding: aText [

	| newSize |
	newSize := self parsePaddingSize: aText.
	newSize ifNotNil: [self tileMap rescaleMapWidth: self getGridWidth height: self getGridHeight padding: newSize].
	^ true

]

{
	#category : #building,
	#'squeak_changestamp' : 'TW 6/20/2024 22:33'
}
GMTEEditor >> settingsMenu [

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
		argumentList: {}.
		
	builder open: aMenuSpec
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'Alex M 6/22/2024 16:00'
}
GMTEEditor >> singleLayerSelected [

	^ (self selectedLayers size == 1)
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'TW 6/22/2024 00:39'
}
GMTEEditor >> storeLayerN: aNumber [

	self storeLayerN: aNumber withVisibility: true
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'TW 6/22/2024 01:30'
}
GMTEEditor >> storeLayerN: aNumber withVisibility: aBoolean [

	self layerData add: {'Layer ', aNumber . aBoolean}.
	self changed: #getLayerList
]

{
	#category : #'layer manipulation',
	#'squeak_changestamp' : 'jj 6/22/2024 16:47'
}
GMTEEditor >> swapLayer: anIndex with: anotherIndex [
	
	| selectionOfA |
	self layerData swap: anIndex with: anotherIndex.
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
	#'squeak_changestamp' : 'TW 6/20/2024 21:40'
}
GMTEEditor >> tileMap [

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
	#'squeak_changestamp' : 'TW 5/22/2024 00:59'
}
GMTEEditor >> tileStore [

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
	#'squeak_changestamp' : 'TW 5/22/2024 00:59'
}
GMTEEditor >> tileViewer [

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
	#'squeak_changestamp' : 'Alex M 6/22/2024 16:01'
}
GMTEEditor >> toggleBackgroundTiles [

	self tileMap toggleBackgroundLayer
]

{
	#category : #'menu button functions',
	#'squeak_changestamp' : 'TW 6/20/2024 21:40'
}
GMTEEditor >> toggleGrid [

	self tileMap toggleVisualLayer
]

{
	#category : #'layer button functions',
	#'squeak_changestamp' : 'Ivo Zilkenat 6/21/2024 23:39'
}
GMTEEditor >> toggleSelectedLayerVisibility [
	
	self selectedLayers do: [:i |
		self tileMap tileMatrixStack toggleLayerVisibility: i.
		self layerData at: i put: {(self layerData at: i) first . (self layerData at: i) second not}].
	self changed: #getLayerList
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
	#'squeak_changestamp' : 'TW 6/22/2024 01:30'
}
GMTEEditor >> trayViewer: anObject [

	trayViewer := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 6/22/2024 16:02'
}
GMTEEditor >> unselectTile [

	self selectedTile: nil.
	self tileMap tileSelectionSet highlightImage: nil.
	self trayViewer morph submorphs first visible: false
]

{
	#category : #building,
	#'squeak_changestamp' : 'Alex M 6/22/2024 16:02'
}
GMTEEditor >> updateLayerNameOf: anIndex to: aString [

	| visibility |
	visibility := (self layerData at: anIndex) second.
	
	self layerData at: anIndex put: {aString. visibility}.
	self changed: #getLayerList
]

{
	#category : #building,
	#'squeak_changestamp' : 'Alex M 6/22/2024 16:03'
}
GMTEEditor >> withMorphOf: aSpec do: aBlock [

	| id |
	id := UUID new asString.
	morphBuilders at: id put: aBlock.
	
	^ aSpec
		name: id;
		yourself.
]
