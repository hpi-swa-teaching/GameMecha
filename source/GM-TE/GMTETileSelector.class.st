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
	#'squeak_changestamp' : 'Alex M 6/22/2024 14:57'
}
GMTETileSelector >> extent: anExtent [

	super extent: anExtent.
	self
		borderColor: Color orange;
		borderWidth: 1
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 6/22/2024 14:58'
}
GMTETileSelector >> handlesMouseDown: evt [
	
	evt redButtonPressed
		ifTrue: [
			self model selectTile: self.
			^true]
		ifFalse: [
			self model backgroundTile: self.
			^false]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 6/22/2024 14:58'
}
GMTETileSelector >> model [

	^model
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 6/22/2024 14:58'
}
GMTETileSelector >> model: anObject [

	model := anObject
]
