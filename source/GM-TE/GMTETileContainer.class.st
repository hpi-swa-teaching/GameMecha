"
Contains and manages layout for TileSelectors.
"
Class {
	#name : #GMTETileContainer,
	#superclass : #Morph,
	#instVars : [
		'parent'
	],
	#category : #'GM-TE-Editor',
	#'squeak_changestamp' : 'mcjj 7/12/2024 22:18'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'tw 7/12/2024 21:38'
}
GMTETileContainer class >> minTileSize [
	"Minimal size of tile"
	
	^ 40 * RealEstateAgent scaleFactor
]

{
	#category : #'instance creation',
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
	#category : #updating,
	#'squeak_changestamp' : 'tw 7/12/2024 21:33'
}
GMTETileContainer >> step [
	"Workaround since ScrollPane doesn't resize it's submorphs. This is to ensure our TileContainer rearranges itself"
	
	| n gap minTileSize |
	(self parent isNil or: [self parent extent = self extent])
		ifTrue: [^ nil].
	
	self extent: self parent extent.
	minTileSize := GMTETileContainer minTileSize. 
	n := self width / minTileSize.
	gap := self width - (n floor * minTileSize) / n.
	self submorphs do: [:tile| tile extent: (minTileSize + gap - 2)] "Edge has a width of 1"
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 16:50'
}
GMTETileContainer >> stepTime [

	^ 1
]
