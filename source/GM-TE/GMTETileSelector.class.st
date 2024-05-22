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
