Class {
	#name : #GMTETileSelector,
	#superclass : #ImageMorph,
	#instVars : [
		'model'
	],
	#category : #'GM-TE'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 5/22/2024 11:59'
}
GMTETileSelector >> handlesMouseDown: evt [
	"TODO: make this useful."
	self model selectedTile: self.
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
