"
It is not good code right now. Maybe find a nicer solution later
"
Class {
	#name : #GMTETileContainer,
	#superclass : #Morph,
	#instVars : [
		'parent'
	],
	#category : #'GM-TE',
	#'squeak_changestamp' : 'Alex M 5/21/2024 16:50'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 5/21/2024 16:55'
}
GMTETileContainer class >> withParent: aParent [
	|container|
	container := GMTETileContainer new.
	container
		parent: aParent;
		beTransparent.
	(container layoutPolicy: TableLayout new)
	listDirection: #leftToRight;
	wrapDirection: #leftToRight.
	^container
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 5/24/2024 00:35'
}
GMTETileContainer >> extent: anExtent [
	| n gap |
	super extent: anExtent.
	"n := self width / 30.
	gap := self width - (n floor * 30) / n.
	self submorphs do: [ :tile|
		tile extent: (30 + gap - 2)
	]"
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 5/21/2024 16:49'
}
GMTETileContainer >> parent [
	^ parent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 5/21/2024 16:49'
}
GMTETileContainer >> parent: anObject [
	parent := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 5/24/2024 00:37'
}
GMTETileContainer >> step [
	| n gap minTileSize |
	self parent ifNotNil:[self extent: parent extent ].
	minTileSize := 40. "Magic number currently".
	n := self width / minTileSize.
	gap := self width - (n floor * minTileSize) / n.
	self submorphs do: [ :tile|
		tile extent: (minTileSize + gap - 2)
	]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 5/21/2024 16:49'
}
GMTETileContainer >> stepTime [
	^1
]
