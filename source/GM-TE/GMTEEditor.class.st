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
	#'squeak_changestamp' : 'TW 5/19/2024 17:18'
}
GMTEEditor class >> createTileViewerWithBuilder: aBuilder [
	^aBuilder pluggablePanelSpec new
		name: 'tile viewer';
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
	#'squeak_changestamp' : 'TW 5/19/2024 17:28'
}
GMTEEditor class >> new [

	|builder spec morph|
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
	(morph submorphNamed: 'tile store') addMorph: Morph new.
	(morph submorphNamed: 'tile store') addMorph: (Morph new
		color: Color red;
		yourself).
	morph openInWorld
]
