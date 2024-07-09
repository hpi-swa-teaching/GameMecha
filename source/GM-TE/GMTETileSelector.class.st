Class {
	#name : #GMTETileSelector,
	#superclass : #GMTETile,
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
	#'squeak_changestamp' : 'jj 6/22/2024 16:50'
}
GMTETileSelector >> handlesMouseDown: evt [
	
	evt redButtonPressed
		ifTrue: [
			self model selectTile: self.
			^ true]
		ifFalse: [
			self model backgroundTile: self.
			^ false]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/9/2024 15:16'
}
GMTETileSelector >> image: anImage [

	super image: ((FormCanvas on: (GMTETile checkerBoardTile image scaledToSize: anImage extent))
				image: (anImage)
				at: 0@0
				sourceRect: (anImage boundingBox)
				rule: Form blend)
				form.
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
