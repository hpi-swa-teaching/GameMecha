Class {
	#name : #GMTEEditor,
	#superclass : #Morph,
	#category : #'GM-TE'
}

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
	#'squeak_changestamp' : 'Alex M 5/21/2024 10:43'
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
		setSelected: #selectLayer:;
		list: #layerList;
		autoDeselect: false;
		yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 5/21/2024 10:40'
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
	#'squeak_changestamp' : 'Alex M 5/21/2024 10:48'
}
GMTEEditor class >> createTilestoreWithBuilder: aBuilder [

		^aBuilder pluggableScrollPaneSpec new
			frame: (LayoutFrame fractions: (0 @ 0 corner: 0.2 @ 1)
			offsets: (0@ 50 corner: 0@0));
			name: 'tile store';
			layout: #vertical;
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
	#'squeak_changestamp' : 'Alex M 5/21/2024 02:15'
}
GMTEEditor class >> createTrayWithBuilder: aBuilder [
	^aBuilder pluggableScrollPaneSpec new
		name: 'tray';
		frame: (LayoutFrame fractions: (0.2 @ 0.8 corner:  0.8 @ 1) offsets: nil);
		yourself
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
	#'squeak_changestamp' : 'Alex M 5/21/2024 10:11'
}
GMTEEditor class >> new [

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
				self createLayersWithBuilder: builder};
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
