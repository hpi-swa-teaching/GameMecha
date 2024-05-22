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
		'layerList'
	],
	#category : #'GM-TE'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 5/21/2024 14:08'
}
GMTEEditor class >> createActiveTileDisplayWithBuilder: aBuilder [
	^aBuilder pluggableScrollPaneSpec new
		name: 'active tile display';
		frame: (LayoutFrame fractions: (0.2 @ 0.8 corner:  0.3 @ 1) offsets: nil);
		yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 5/21/2024 10:40'
}
GMTEEditor class >> createCommandBarWithBuilder: aBuilder [
	^aBuilder pluggablePanelSpec new
		name: 'command bar';
		children: {aBuilder pluggableButtonSpec new
			name: 'export';
			label: 'Export';
			frame: (LayoutFrame fractions: (0 @ 0 corner: 0.33 @ 1) offsets: nil).
			aBuilder pluggableButtonSpec new
			frame: (LayoutFrame fractions: (0.33 @ 0 corner: 0.66 @ 1) offsets: nil);
			action: [GMTEEditor loadTileSetWithDimensions: 16@16];
			name: 'import';
			label: 'Import'.
			aBuilder pluggableButtonSpec new
			frame: (LayoutFrame fractions: (0.66 @ 0 corner: 1 @ 1) offsets: nil);
			name: 'openInWorld';
			label: 'Open in World'};
		
		"margin: 0@0;"
		verticalResizing: #shrinkWrap;
		
		"frame: (LayoutFrame fractions: (0 @ 0 corner: 1 @ 0.1) offsets: nil);"
		frame: (LayoutFrame
			fractions: (0@0 corner: 1@0)
			offsets: (0@0 corner: 0@ 50));
		yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 5/22/2024 01:15'
}
GMTEEditor class >> createLayersWithBuilder: aBuilder [
	^aBuilder pluggableListSpec new
		name: 'layers';
		"frame: (LayoutFrame fractions: (0.8 @ 0.1 corner: 1 @ 1) offsets: nil);"
		frame: (LayoutFrame
		fractions: (0.8@0 corner: 1@1)
		offsets: (0@ 50 corner: 0@0));
		"A LOT OF MOCKUP CODE"
		model:self;
		getSelected: #selectedLayer;
		setSelected: #selectedLayer:;
		list: #layerList;
		autoDeselect: false;
		yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 5/22/2024 01:15'
}
GMTEEditor class >> createLayersWithBuilder: aBuilder for: aModel [
	^aBuilder pluggableListSpec new
		name: 'layers';
		"frame: (LayoutFrame fractions: (0.8 @ 0.1 corner: 1 @ 1) offsets: nil);"
		frame: (LayoutFrame
		fractions: (0.8@0 corner: 1@1)
		offsets: (0@ 50 corner: 0@0));
		"A LOT OF MOCKUP CODE"
		model: aModel;
		getSelected: #selectedLayer;
		setSelected: #selectedLayer:;
		list: #layerList;
		autoDeselect: false;
		yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 5/21/2024 15:49'
}
GMTEEditor class >> createTileViewerWithBuilder: aBuilder [
	^aBuilder pluggablePanelSpec new
		name: 'tile viewer';
		layout: #horizontal;
		frame: (LayoutFrame fractions: (0.2 @ 0 corner: 0.8 @ 0.8)
		offsets: (0@ 50 corner: 0@0));
		yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 5/21/2024 14:08'
}
GMTEEditor class >> createTilestoreWithBuilder: aBuilder [

		^aBuilder pluggableScrollPaneSpec new
			frame: (LayoutFrame fractions: (0 @ 0 corner: 0.2 @ 1)
			offsets: (0@ 50 corner: 0@0));
			name: 'tile store';
			"layout: #vertical;"
			spacing: 10@10;
			children: {};
			padding: 10;
			spacing: 20;
			verticalResizing: #shrinkWrap;
			horizontalResizing: #shrinkWrap;
			yourself.

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 5/21/2024 14:08'
}
GMTEEditor class >> createTrayWithBuilder: aBuilder [
	^aBuilder pluggableScrollPaneSpec new
		name: 'tray';
		frame: (LayoutFrame fractions: (0.3 @ 0.8 corner:  0.8 @ 1) offsets: nil);
		yourself
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 5/21/2024 02:09'
}
GMTEEditor class >> loadTileSetWithDimensions: aPoint [
	"The source argument is mostly for debugging. Make it nicer with objects"
	"Do we really leaves this here or do we create an extra class for"
 
	| fc stream form tile tile_width tile_height image morphs|
	
	fc := FileChooser new.
	fc initializeAsSystemWindowWithCaptionPane.
	fc setCaption: 'Select a picture file' translated.
	fc setSuffixes: {'png' . 'gif' . 'bmp' . 'jpg' . 'jpeg' }.
	stream := fc open.
	
	stream ifNil: [^ nil].
	
	form := Form fromBinaryStream: stream.
	
	morphs := OrderedCollection new.
	
	tile_width := aPoint x.
	tile_height := aPoint y.
	"TODO: refactor into non C-like code"
	0 to: (form height - tile_height) by: tile_height do:[:y|
		0 to: (form width - tile_width) by: tile_width do: [:x|
			tile := form contentsOfArea: (Rectangle origin: x@y extent: tile_width@tile_height).
			image := GMTETileSelector new
			image: (tile scaledToWidth: 50).
			morphs add: image.
		].
	].

	^ morphs.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 5/21/2024 02:09'
}
GMTEEditor class >> loadTileSetWithDimensions: aPoint source: anImageMorph [
	"The source argument is mostly for debugging. Make it nicer with objects"
	"Do we really leaves this here or do we create an extra class for"
 
	| fc stream form tile tile_width tile_height image morphs|
	
	fc := FileChooser new.
	fc initializeAsSystemWindowWithCaptionPane.
	fc setCaption: 'Select a picture file' translated.
	fc setSuffixes: {'png' . 'gif' . 'bmp' . 'jpg' . 'jpeg' }.
	stream := fc open.
	
	stream ifNil: [^ nil].
	
	form := Form fromBinaryStream: stream.
	
	morphs := OrderedCollection new.
	
	tile_width := aPoint x.
	tile_height := aPoint y.
	"TODO: refactor into non C-like code"
	0 to: (form height - tile_height) by: tile_height do:[:y|
		0 to: (form width - tile_width) by: tile_width do: [:x|
			tile := form contentsOfArea: (Rectangle origin: x@y extent: tile_width@tile_height).
			image := GMTETileSelector new
			image: (tile scaledToWidth: 50);
			source: anImageMorph.
			morphs add: image.
		].
	].

	^ morphs.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 5/21/2024 15:19'
}
GMTEEditor class >> new2 [

	|builder spec morph tileMatrixMorph tileStore tileViewer commandBar layerViewer trayViewer selectedTile|
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
				self createLayersWithBuilder: builder.
				self createActiveTileDisplayWithBuilder: builder};
			yourself.
	morph := builder build: spec.
	
	commandBar := morph submorphNamed: 'command bar'.
	commandBar vResizing: #rigid.
	tileStore := morph submorphNamed: 'tile store'.
	tileViewer := morph submorphNamed: 'tile viewer'.
	layerViewer := morph submorphNamed: 'layers'.
	trayViewer := morph submorphNamed: 'tray'.
	
	selectedTile := ImageMorph new.
	"TODO: Make this nicer."
	selectedTile position: (trayViewer position + (10@10)); visible:false.
	trayViewer addMorph: selectedTile.
	
	tileViewer borderWidth: 2. 
	tileViewer borderColor: tileStore borderColor.
	
	"TODO 16 by 16 is a magic number. Where do we store tile dimensions?"
	(commandBar submorphNamed: 'import') action: [
		"TODO make multiple sprite sets available?"
		tileStore morph removeAllMorphs;
		addAllMorphs: (GMTEEditor loadTileSetWithDimensions: 16@16 source: selectedTile)].

	tileMatrixMorph := GMTETileMap tileWidth: 10 tileHeight: 10 padding: 0.15 sizeRatio: 1.

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
	#'squeak_changestamp' : 'TW 5/21/2024 17:11'
}
GMTEEditor class >> openNewInstance [

	self new open
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 5/21/2024 01:55'
}
GMTEEditor class >> selectLayer: aLayer [
	Transcript show: aLayer.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 5/21/2024 02:04'
}
GMTEEditor class >> selectedLayer [
	"TODO: Save layer in some object"
	^ 'Layer 1'.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 5/22/2024 01:16'
}
GMTEEditor >> buildWith: builder [
	"called it builder instead of aBuilder since every other implementation does that"
	| newMorph selectedTile tileMatrixMorph| 
	
	newMorph := builder build: (builder pluggableWindowSpec new
		model: self;
		label: 'GM Tile Editor';
		children: {
			GMTEEditor createCommandBarWithBuilder: builder.
			GMTEEditor createTileViewerWithBuilder: builder.
			GMTEEditor createTilestoreWithBuilder: builder.
			GMTEEditor createTrayWithBuilder: builder.
			GMTEEditor createLayersWithBuilder: builder for: self.
			GMTEEditor createActiveTileDisplayWithBuilder: builder}).
			
	self commandBar: (newMorph submorphNamed: 'command bar').
	self commandBar vResizing: #rigid.
	self tileStore: (newMorph submorphNamed: 'tile store').
	self tileViewer: (newMorph submorphNamed: 'tile viewer').
	self layerViewer: (newMorph submorphNamed: 'layers').
	self trayViewer: (newMorph submorphNamed: 'tray').
	

	selectedTile := ImageMorph new.
	"TODO: Make this nicer."
	selectedTile position: (trayViewer position + (10@10)); visible:false.
	trayViewer addMorph: selectedTile.
	
	self tileViewer borderWidth: 2. 
	self tileViewer borderColor: tileStore borderColor.
	
	"TODO 16 by 16 is a magic number. Where do we store tile dimensions?"
	(self commandBar submorphNamed: 'import') action: [
		"TODO make multiple sprite sets available?"
		self tileStore morph removeAllMorphs;
		addAllMorphs: (GMTEEditor loadTileSetWithDimensions: 16@16 source: selectedTile)].

	tileMatrixMorph := GMTETileMap tileWidth: 10 tileHeight: 10 padding: 0.15 sizeRatio: 1.

	(self commandBar submorphNamed: 'export') action: [
		tileMatrixMorph exportAsImage].

	self tileViewer addMorph: tileMatrixMorph.		
	
	tileMatrixMorph 
		position: (tileMatrixMorph owner position);
		hResizing: #spaceFill; 
		vResizing: #spaceFill.
		
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 5/22/2024 01:16'
}
GMTEEditor >> initialize [

	super initialize.
	self selectedLayer: self layerList first.
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
