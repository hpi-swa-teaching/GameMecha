"
A clickable Morph to select tiles from the tile store.

"
Class {
	#name : #GMTETileSelector,
	#superclass : #GMTETile,
	#instVars : [
		'model'
	],
	#category : #'GameMecha-TileEditor',
	#'squeak_changestamp' : 'mcjj 7/12/2024 22:09'
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
	#category : #'input handling',
	#'squeak_changestamp' : 'mcjj 7/12/2024 21:25'
}
GMTETileSelector >> handlesMouseDown: evt [
	
	^ true
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mcjj 7/12/2024 21:21'
}
GMTETileSelector >> image: anImage [

	super image: ((FormCanvas on: (GMTETile checkerBoardTile image scaledToSize: anImage extent))
				image: (anImage)
				at: 0@0
				sourceRect: (anImage boundingBox)
				rule: Form blend)
				form
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/9/2024 14:07'
}
GMTETileSelector >> initBackground [

	self image: ((FormCanvas on: self image)
		image: (self class checkerBoardTile)
		at: 0@0
		sourceRect: (self class checkerBoardTile boundingBox)
		rule: Form blend)
		form
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 16:51'
}
GMTETileSelector >> model [

	^ model
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 6/22/2024 14:58'
}
GMTETileSelector >> model: anObject [

	model := anObject
]

{
	#category : #'input handling',
	#'squeak_changestamp' : 'mcjj 7/12/2024 21:26'
}
GMTETileSelector >> mouseDown: evt [

	evt redButtonPressed
		ifTrue: [self model selectTile: self]
		ifFalse: [self model backgroundTile: self]
]
