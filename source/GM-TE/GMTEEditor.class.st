Class {
	#name : #GMTEEditor,
	#superclass : #Morph,
	#category : #'GM-TE'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 5/20/2024 20:51'
}
GMTEEditor class >> createCommandBarWithBuilder: aBuilder [
	^aBuilder pluggablePanelSpec new
		name: 'command bar';
		children: {aBuilder pluggableButtonSpec new
			name: 'export';
			label: 'Export';
			frame: (LayoutFrame fractions: (0 @ 0 corner: 0.3 @ 1) offsets: nil).
			aBuilder pluggableButtonSpec new
			frame: (LayoutFrame fractions: (0.3 @ 0 corner: 0.6 @ 1) offsets: nil);
			action: [GMTEEditor loadTileSetWithDimensions: 16@16];
			name: 'import';
			label: 'Import'.
			aBuilder pluggableButtonSpec new
			frame: (LayoutFrame fractions: (0.6 @ 0 corner: 0.9 @ 1) offsets: nil);
			name: 'openInWorld';
			label: 'Open in World'};
		
		"margin: 0@0;"
		"verticalResizing: #rigid;"
		
		frame: (LayoutFrame fractions: (0 @ 0 corner: 1 @ 0.1) offsets: nil);
		yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 5/19/2024 17:18'
}
GMTEEditor class >> createLayersWithBuilder: aBuilder [
	^aBuilder pluggablePanelSpec new
		name: 'layers';
		frame: (LayoutFrame fractions: (0.8 @ 0.1 corner: 1 @ 1) offsets: nil);
		yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 5/20/2024 15:44'
}
GMTEEditor class >> createTileViewerWithBuilder: aBuilder [
	^aBuilder pluggablePanelSpec new
		name: 'tile viewer';
		layout: #horizontal;
		frame: (LayoutFrame fractions: (0.2 @ 0.1 corner: 0.8 @ 0.8) offsets: nil);
		yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 5/20/2024 16:46'
}
GMTEEditor class >> createTilestoreWithBuilder: aBuilder [

		^aBuilder pluggableScrollPaneSpec new
			frame: ((0 @ 0.1) corner: 0.2 @ 1);
			name: 'tile store';
			layout: #vertical;
			children: {};
			padding: 10;
			spacing: 20;
			verticalResizing: #shrinkWrap;
			horizontalResizing: #shrinkWrap;
			yourself.

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 5/19/2024 17:19'
}
GMTEEditor class >> createTrayWithBuilder: aBuilder [
	^aBuilder pluggablePanelSpec new
		name: 'tray';
		frame: (LayoutFrame fractions: (0.2 @ 0.8 corner:  0.8 @ 1) offsets: nil);
		yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 5/20/2024 17:44'
}
GMTEEditor class >> loadTileSetWithDimensions: aPoint [
	
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
	#'squeak_changestamp' : 'Ivo Zilkenat 5/20/2024 21:02'
}
GMTEEditor class >> new [

	|builder spec morph tileMatrixMorph tileStore tileViewer commandBar|
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
	tileViewer borderWidth: 2. 
	tileViewer borderColor: tileStore borderColor.
	
	"TODO 16 by 16 is a magic number. Where do we store tile dimensions?"
	(commandBar submorphNamed: 'import') action: [
		"TODO make multiple sprite sets available?"
		tileStore morph removeAllMorphs;
		addAllMorphs: (GMTEEditor loadTileSetWithDimensions: 16@16)].

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
