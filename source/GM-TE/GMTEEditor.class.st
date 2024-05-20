Class {
	#name : #GMTEEditor,
	#superclass : #Morph,
	#category : #'GM-TE'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 5/19/2024 17:18'
}
GMTEEditor class >> createCommandBarWithBuilder: aBuilder [
	^aBuilder pluggablePanelSpec new
		name: 'command bar';
		children: {aBuilder pluggableButtonSpec new
			label: 'Export';
			frame: (LayoutFrame fractions: (0 @ 0 corner: 0.3 @ 1) offsets: nil).
			aBuilder pluggableButtonSpec new
			frame: (LayoutFrame fractions: (0.3 @ 0 corner: 0.6 @ 1) offsets: nil);
			label: 'Import'.
			aBuilder pluggableButtonSpec new
			frame: (LayoutFrame fractions: (0.6 @ 0 corner: 0.9 @ 1) offsets: nil);
			label: 'Open in World'};
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
	#'squeak_changestamp' : 'JS 5/19/2024 17:12'
}
GMTEEditor class >> createTileViewerWithBuilder: aBuilder [
	^aBuilder pluggablePanelSpec new
		name: 'Tile Viewer';
		layout: #horizontal;
		frame: (LayoutFrame fractions: (0.2 @ 0.1 corner: 0.8 @ 0.8) offsets: nil);
		yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 5/19/2024 17:28'
}
GMTEEditor class >> createTilestoreWithBuilder: aBuilder [

		^aBuilder pluggablePanelSpec new
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
	#'squeak_changestamp' : 'Ivo Zilkenat 5/20/2024 19:57'
}
GMTEEditor class >> new [

	|builder spec morph tileMatrixMorph tileStore tileViewer|
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
	tileStore := morph submorphNamed: 'tile store'.
	tileViewer := (morph submorphNamed: 'Tile Viewer').

	tileStore addMorph: Morph new.
	tileStore addMorph: (Morph new
		color: Color red;
		yourself).

	tileMatrixMorph := GMTETileMap tileWidth: 20 tileHeight: 20 padding: 0.15 sizeRatio: 1.

	tileViewer addMorph: tileMatrixMorph.		
	
	tileMatrixMorph 
		position: (tileMatrixMorph owner position);
		hResizing: #spaceFill; 
		vResizing: #spaceFill.
	
	morph openInWorld.
	
	tileMatrixMorph updateMap.
]
