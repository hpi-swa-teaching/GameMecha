Class {
	#name : #GMTEEditor,
	#superclass : #Model,
	#instVars : [
		'commandBar',
		'tileStore',
		'tileViewer',
		'layerViewer',
		'trayViewer',
		'selectedLayer',
		'layerList',
		'tileMapMatrix',
		'selectedTile',
		'ratio'
	],
	#category : #'GM-TE'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 5/22/2024 14:42'
}
GMTEEditor class >> confirmPreviewOf: morphArray withDimensions: aPoint withTileSize: aNumber [
	"TODO: Could break with too big tilesets. Maybe filter only first 100 tiles?"
	|img dialog|
	
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

	dialog := DialogWindow new
		title: 'Preview';
		message: 'Import Tileset?';
		addPaneMorph: img;
		createButton: 'Yes' translated value: true;
		createCancelButton: 'No' translated  value: false;
		selectedButtonIndex: 1; "YES"
		registerKeyboardShortcuts.
	dialog paneMorph extent: img extent.
	^ dialog getUserResponseAtHand.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 5/21/2024 20:07'
}
GMTEEditor class >> fromTileHeight: aHeight widht: aWidth [

	|builder spec morph tileMatrixMorph tileStore panel tileViewer commandBar layerViewer trayViewer selectedTile|
	super new.
	builder := ToolBuilder default.
	spec := builder pluggableWindowSpec new
			model: Model new;
			label: 'GM Tile Editor';
			children: {
				self createCommandBarWithBuilder: builder.
				self createTileViewerWithBuilder: builder.
				self createTilestoreWithBuilder: builder.
				self createTrayWithBuilder: builder.
				self createLayersWithBuilder: builder};
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
	
	tileStore on: #mouseMove send: [Transcript show: 'hello'] to: self.
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
	#'squeak_changestamp' : 'Alex M 5/21/2024 02:00'
}
GMTEEditor class >> layerList [
	^ {'Layer 1'. 'Layer 2'}
]

{
	#category : #building,
	#'squeak_changestamp' : 'Alex M 5/23/2024 21:09'
}
GMTEEditor >> buildWith: builder [
	"called it builder instead of aBuilder since every other implementation does that"
	| newMorph selectedTile panel | 
	
	newMorph := builder build: (builder pluggableWindowSpec new
		model: self;
		label: 'GM Tile Editor';
		children: {
			self createCommandBarWithBuilder: builder.
			self createTileViewerWithBuilder: builder.
			self createTilestoreWithBuilder: builder.
			self createTrayWithBuilder: builder.
			self createLayersWithBuilder: builder.};
		closeAction: #onClose;
		minimumExtent: 550@400).
			
	self commandBar: (newMorph submorphNamed: 'command bar').
	"self commandBar vResizing: #rigid."
	self tileStore: (newMorph submorphNamed: 'tile store').
	self tileViewer: ((newMorph submorphNamed: 'main panel') submorphNamed: 'tile viewer').
	self layerViewer: (newMorph submorphNamed: 'layers').
	self trayViewer: (newMorph submorphNamed: 'tray').
	tileViewer clipSubmorphs: true.
	panel := GMTETileContainer withParent: self tileStore.

	self tileStore morph: panel.

	selectedTile := ImageMorph new visible:false;yourself.
	"TODO: Make this nicer."
	trayViewer morph beTransparent.
	trayViewer morph addMorph: selectedTile.
	
	self tileViewer borderWidth: 2. 
	self tileViewer borderColor: tileStore borderColor.
	
	self initializeTileMapMatrix.
		
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
	#category : #building,
	#'squeak_changestamp' : 'Alex M 5/24/2024 18:31'
}
GMTEEditor >> createCommandBarWithBuilder: aBuilder [
	^aBuilder pluggablePanelSpec new
		name: 'command bar';
		model: self;
		children: {aBuilder pluggableButtonSpec new
			name: 'export';
			label: 'Export';
			model: self;
			action: #exportAsMorph;
			frame: (LayoutFrame fractions: (0 @ 0 corner: 0.25 @ 1) offsets: nil).
			aBuilder pluggableButtonSpec new
			name: 'saveAsImage';
			label: 'Save As Image';
			model: self;
			frame: (LayoutFrame fractions: (0.25 @ 0 corner: 0.5 @ 1) offsets: nil);
			action: #exportAsImage.
			aBuilder pluggableButtonSpec new
			name: 'import';
			label: 'Import';
			model: self;
			frame: (LayoutFrame fractions: (0.5 @ 0 corner: 0.75 @ 1) offsets: nil);
			action: #import.
			aBuilder pluggableButtonSpec new
			frame: (LayoutFrame fractions: (0.75 @ 0 corner: 1 @ 1) offsets: nil);
			name: 'openInWorld';
			label: 'Open in World'};

		verticalResizing: #shrinkWrap;
		
		frame: (LayoutFrame
			fractions: (0@0 corner: 1@0) offsets:(0@0 corner: 0@30));
		yourself
]

{
	#category : #building,
	#'squeak_changestamp' : 'Alex M 5/23/2024 01:51'
}
GMTEEditor >> createLayersWithBuilder: aBuilder [
	^aBuilder pluggableListSpec new
		name: 'layers';
		"frame: (LayoutFrame fractions: (0.8 @ 0.1 corner: 1 @ 1) offsets: nil);"
		frame: (LayoutFrame
		fractions: (0.8@0 corner: 1@1)
		offsets: (0@30 corner: 0@0));
		"A LOT OF MOCKUP CODE"
		model: self;
		getSelected: #selectedLayer;
		setSelected: #selectedLayer:;
		list: #layerList;
		autoDeselect: false;
		"minimumWidth:100;"
		yourself
]

{
	#category : #building,
	#'squeak_changestamp' : 'Alex M 5/23/2024 01:51'
}
GMTEEditor >> createTileViewerWithBuilder: aBuilder [
	"TODO: Maybe rename function to something more appropriate?"
	^aBuilder pluggablePanelSpec new
		name: 'main panel';
		model:self;
		frame: (LayoutFrame fractions: (0.2 @ 0 corner: 0.8 @ 0.8)
		offsets: (0@ 30 corner: 0@0));
		"layout: #vertical;"
		children: {
		
			self createToolBarWithBuilder: aBuilder.
					
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
	#'squeak_changestamp' : 'Alex M 5/23/2024 01:51'
}
GMTEEditor >> createTilestoreWithBuilder: aBuilder [

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
	#'squeak_changestamp' : 'Alex M 5/23/2024 01:47'
}
GMTEEditor >> createToolBarWithBuilder: aBuilder [
	^aBuilder pluggablePanelSpec new
		name: 'toolbar';
		model: self;
		frame: (LayoutFrame
			fractions: (0@0 corner: 1@0) offsets:(0@0 corner: 0@30));
		children: {aBuilder pluggableButtonSpec new
			name: 'reset';
			label: 'Reset';
			model: self;
			action:#resetAll;
			frame: (LayoutFrame fractions: (0 @ 0 corner: 0.25 @ 1) offsets: nil).
			aBuilder pluggableButtonSpec new
			name: 'button2';
			label: 'Button 2';
			model: self;
			frame: (LayoutFrame fractions: (0.25 @ 0 corner: 0.5 @ 1) offsets: nil).
			aBuilder pluggableButtonSpec new
			name: 'button3';
			label: 'Button 3';
			model: self;
			frame: (LayoutFrame fractions: (0.5 @ 0 corner: 0.75 @ 1) offsets: nil).
			aBuilder pluggableButtonSpec new
			frame: (LayoutFrame fractions: (0.75 @ 0 corner: 1 @ 1) offsets: nil);
			name: 'button4';
			model:self;
			label: 'Button 4'};
			
		verticalResizing: #shrinkWrap;
		yourself
]

{
	#category : #building,
	#'squeak_changestamp' : 'Alex M 5/23/2024 10:00'
}
GMTEEditor >> createTrayWithBuilder: aBuilder [
	^aBuilder pluggableScrollPaneSpec new
		name: 'tray';
		frame: (LayoutFrame fractions: (0.2 @ 0.8 corner:  0.8 @ 1) offsets: nil);
		minimumHeight:75;
		yourself
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
	#'squeak_changestamp' : 'Alex M 5/24/2024 18:18'
}
GMTEEditor >> exportAsMorph [
	
	self tileMapMatrix saveOnFile
]

{
	#category : #'button functions',
	#'squeak_changestamp' : 'TW 5/23/2024 13:57'
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
		addAllMorphs: tiles.
]

{
	#category : #initialisation,
	#'squeak_changestamp' : 'Alex M 5/23/2024 02:25'
}
GMTEEditor >> initialize [

	super initialize.
	self
		open;
		selectedLayer: self layerList first;
		ratio:1
]

{
	#category : #initialisation,
	#'squeak_changestamp' : 'TW 5/22/2024 16:41'
}
GMTEEditor >> initializeTileMapMatrix [

	self tileMapMatrix: (GMTEEditableTileMap tileWidth: 10 tileHeight: 10 padding: 0.15 sizeRatio: 1 model: self).
	self tileViewer addMorph: tileMapMatrix.		
	self tileMapMatrix 
		position: (tileMapMatrix owner position);
		hResizing: #spaceFill; 
		vResizing: #spaceFill.
]

{
	#category : #initialisation,
	#'squeak_changestamp' : 'TW 5/22/2024 16:41'
}
GMTEEditor >> initializeTileMapMatrixWithHeight: aHeight width: aWidth [

	self tileMapMatrix: (GMTEEditableTileMap tileWidth: aWidth tileHeight: aHeight padding: 0.15 sizeRatio: 1 model: self).
	self tileViewer addMorph: tileMapMatrix.		
	self tileMapMatrix 
		position: (tileMapMatrix owner position);
		hResizing: #spaceFill; 
		vResizing: #spaceFill.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 5/22/2024 01:14'
}
GMTEEditor >> layerList [

	^{'Layer 1'. 'Layer 2'}
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 5/22/2024 01:14'
}
GMTEEditor >> layerList: anObject [

	layerList := anObject.
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 5/24/2024 00:30'
}
GMTEEditor >> loadTileSetWithDimensions: aPoint [
	"The source argument is mostly for debugging. Make it nicer with objects"
	"Do we really leaves this here or do we create an extra class for"
 
	| fc stream form tile tileWidth tileHeight image morphs previewDimensions previewTileSize alreadyImported previews |
	
	fc := FileChooser new.
	fc initializeAsSystemWindowWithCaptionPane.
	fc setCaption: 'Select a picture file' translated.
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
	(GMTEEditor confirmPreviewOf: previews withDimensions: previewDimensions withTileSize: previewTileSize) ifFalse:[^ nil].

	^ morphs.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 5/23/2024 02:03'
}
GMTEEditor >> onClose [
	"PopUpMenu inform:'You should save'."
	"TODO: Give chance to save"
]

{
	#category : #initialisation,
	#'squeak_changestamp' : 'TW 5/22/2024 09:58'
}
GMTEEditor >> open [
  
	| newMorph |
	newMorph := (ToolBuilder default build: self).
      newMorph openInWorld.
	self tileViewer submorphs first updateMap.
      ^newMorph
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
	#category : #'button functions',
	#'squeak_changestamp' : 'TW 5/23/2024 00:13'
}
GMTEEditor >> resetAll [

	self tileMapMatrix resetAll
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
	#'squeak_changestamp' : 'TW 5/22/2024 01:14'
}
GMTEEditor >> selectedLayer [

	^ selectedLayer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 5/22/2024 01:14'
}
GMTEEditor >> selectedLayer: anObject [

	selectedLayer := anObject.
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
