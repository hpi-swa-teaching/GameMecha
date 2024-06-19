Class {
	#name : #GMTETileSelector,
	#superclass : #GMTEImageMorph,
	#instVars : [
		'model'
	],
	#category : #'GM-TE-UI'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 5/24/2024 00:34'
}
GMTETileSelector >> extent: anExtent [
	super extent: anExtent.
	self
		borderColor: Color orange;
		borderWidth: 1
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 6/19/2024 23:15'
}
GMTETileSelector >> handlesMouseDown: evt [
	"TODO: make this useful."
	evt redButtonPressed
		ifTrue: [self model selectTile: self. ^ true]
		ifFalse: [self model backgroundTile: self. ^ false]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 5/22/2024 11:58'
}
GMTETileSelector >> model [
	^ model
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 5/22/2024 11:58'
}
GMTETileSelector >> model: anObject [
	model := anObject
]
