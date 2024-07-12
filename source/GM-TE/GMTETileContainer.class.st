"
Contains and manages layout for TileSelectors.
"
Class {
	#name : #GMTETileContainer,
	#superclass : #Morph,
	#instVars : [
		'parent'
	],
	#category : #'GM-TE-UI',
	#'squeak_changestamp' : 'mcjj 7/12/2024 22:18'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'jj 6/23/2024 17:13'
}
GMTETileContainer class >> minTileSize [
	"TODO: comment"
	
	^ 40
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'jj 6/22/2024 16:50'
}
GMTETileContainer class >> withParent: aParent [

	^ (GMTETileContainer new)
		parent: aParent;
		beTransparent;
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		wrapDirection: #leftToRight
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 16:50'
}
GMTETileContainer >> parent [

	^ parent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 6/22/2024 15:06'
}
GMTETileContainer >> parent: anObject [

	parent := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'jj 6/23/2024 17:13'
}
GMTETileContainer >> step [

	| n gap minTileSize |
	(self parent isNil or: [self parent extent = self extent])
		ifTrue: [^ nil].
	
	self extent: self parent extent.
	minTileSize := GMTETileContainer minTileSize. 
	n := self width / minTileSize.
	gap := self width - (n floor * minTileSize) / n.
	self submorphs do: [:tile| tile extent: (minTileSize + gap - 2)] "TODO: magic number"
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'jj 6/22/2024 16:50'
}
GMTETileContainer >> stepTime [

	^ 1
]
