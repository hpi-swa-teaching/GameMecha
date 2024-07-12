"
Subclasses implement a do: and undo: method to undo operations in the Tile Editor
"
Class {
	#name : #GMTECommand,
	#superclass : #Object,
	#classVars : [
		'GMTEAddLayerCommand'
	],
	#category : #'GM-TE-UI',
	#'squeak_changestamp' : 'Alex M 7/12/2024 22:18'
}

{
	#category : #execution,
	#'squeak_changestamp' : 'Alex M 6/28/2024 01:43'
}
GMTECommand >> do [
	
	self subclassResponsibility
]

{
	#category : #execution,
	#'squeak_changestamp' : 'Alex M 6/28/2024 01:43'
}
GMTECommand >> undo [
	
	self subclassResponsibility
]
