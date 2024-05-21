Class {
	#name : #GMTETileSelector,
	#superclass : #ImageMorph,
	#instVars : [
		'source'
	],
	#category : #'GM-TE'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 5/21/2024 02:57'
}
GMTETileSelector >> handlesMouseDown: evt [
	"TODO: make this useful."
	source ifNotNil: [source visible:true; image: (self image scaledToWidth:75)].
	^ true.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 5/21/2024 02:23'
}
GMTETileSelector >> source [
	^ source
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 5/21/2024 02:23'
}
GMTETileSelector >> source: anObject [
	source := anObject
]
