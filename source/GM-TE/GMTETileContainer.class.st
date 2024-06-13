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
	#'squeak_changestamp' : 'Alex M 6/14/2024 01:52'
}
GMTETileContainer >> step [
	| n gap minTileSize |
		
	(self parent isNil or: [self parent extent = self extent])
		ifTrue: [^nil].
	
	self extent: parent extent.
	minTileSize := 40. "Magic number currently."
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
