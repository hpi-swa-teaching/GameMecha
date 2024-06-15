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
	#'squeak_changestamp' : 'TW 5/22/2024 16:12'
}
GMTETileSelector >> handlesMouseDown: evt [
	"TODO: make this useful."
	self model selectTile: self.
	^ true.
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
