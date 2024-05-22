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
	#'squeak_changestamp' : 'Alex M 5/22/2024 13:15'
}
GMTETileContainer >> step [
	self parent ifNotNil:[self extent: parent extent ]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 5/21/2024 16:49'
}
GMTETileContainer >> stepTime [
	^1
]
