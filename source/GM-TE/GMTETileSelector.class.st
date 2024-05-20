Class {
	#name : #GMTETileSelector,
	#superclass : #ImageMorph,
	#category : #'GM-TE'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 5/20/2024 18:29'
}
GMTETileSelector >> handlesMouseDown: evt [
	"handlesMouseStillDown: for tiles"
	Transcript show: 'test'.
	^ true.
]
