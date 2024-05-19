Class {
	#name : #GMTEEditor,
	#superclass : #Morph,
	#category : #'GM-TE'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 5/19/2024 16:22'
}
GMTEEditor class >> createCommandBarWithBuilder: aBuilder [
	^aBuilder pluggablePanelSpec new
		name: 'Command Bar';
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
	#'squeak_changestamp' : 'TW 5/19/2024 16:22'
}
GMTEEditor class >> createLayersWithBuilder: aBuilder [
	^aBuilder pluggablePanelSpec new
		name: 'Layers';
		frame: (LayoutFrame fractions: (0.8 @ 0.1 corner: 1 @ 1) offsets: nil);
		yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 5/19/2024 16:34'
}
GMTEEditor class >> createTileViewerWithBuilder: aBuilder [
	^aBuilder pluggablePanelSpec new
		name: 'Tile Viewer';
		frame: (LayoutFrame fractions: (0.2 @ 0.1 corner: 0.8 @ 0.8) offsets: nil);
		yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 5/19/2024 17:07'
}
GMTEEditor class >> createTilestoreWithBuilder: aBuilder [
	| redMorph blueMorph|
	
	redMorph := Morph new
		color: Color red;
		yourself.
	
	blueMorph := Morph new.


	^SquotGUIUtilities buildEvenGrid: {
		aBuilder pluggableButtonSpec new
			label: 'test1';
			color: Color red.
		aBuilder pluggableButtonSpec new
			label: 'test2';
			color: Color blue } ofSize: 1@2 with: aBuilder
		
"^aBuilder pluggablePanelSpec new
		name: 'Tilestore';
		frame: (LayoutFrame fractions: (0 @ 0.1 corner: 0.2 @ 1) offsets: nil);
		children: {redMorph . blueMorph}
		yourself"
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 5/19/2024 16:22'
}
GMTEEditor class >> createTrayWithBuilder: aBuilder [
	^aBuilder pluggablePanelSpec new
		name: 'Tray';
		frame: (LayoutFrame fractions: (0.2 @ 0.8 corner:  0.8 @ 1) offsets: nil);
		yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 5/19/2024 16:20'
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
	morph openInWorld
]
