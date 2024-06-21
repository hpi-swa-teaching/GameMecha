"
A rectangular morph that works like a button. Can be configured to messages to other objects on click.


"
Class {
	#name : #GMTEImageButton,
	#superclass : #GMTEImageMorph,
	#instVars : [
		'target',
		'actionSelector',
		'arguments',
		'linkedButtons'
	],
	#category : #'GM-TE-UI',
	#'squeak_changestamp' : '<historical>'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 2/7/2024 15:20'
}
GMTEImageButton >> actionSelector [
	"The method called on the target"

	^ actionSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jannis 2/8/2024 18:31'
}
GMTEImageButton >> actionSelector: aSymbolOrString [
	
	actionSelector := aSymbolOrString asSymbol
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 2/7/2024 15:20'
}
GMTEImageButton >> arguments [
	"Arguments for the method that is called on the target"

	^ arguments
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Thomas Wolf 2/4/2024 23:10'
}
GMTEImageButton >> arguments: aCollection [

	arguments := aCollection asArray copy
]

{
	#category : #button,
	#'squeak_changestamp' : 'TW 6/21/2024 00:17'
}
GMTEImageButton >> doButtonAction [
	"Perform the action of this button. The default behavior is to send the button's actionSelector to its target object with its arguments."

	(self target notNil and: [actionSelector notNil]) 
		ifTrue: [self arguments 
			ifNil: [self target perform: self actionSelector]
			ifNotNil: [self target perform: self actionSelector withArguments: arguments]].
	"If this button is not linked with any others, go back to the unpressedImage. If it is, set all linked buttons to their unpressed state, and keep this button pressed, to show the selection."
	self linkedButtons
		ifNil: [self setImageMode: #unpressed]
		ifNotNil: [self linkedButtons do: [:aButton | aButton ~~ self 
			ifTrue: [aButton setImageMode: #unpressed]]]
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'TW 2/6/2024 16:46'
}
GMTEImageButton >> handlesMouseDown: anEvent [

	^ true
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 2/7/2024 15:20'
}
GMTEImageButton >> linkedButtons [
	"All the buttons this button is linked with. Only one of a group of linked buttons is active at once"

	^ linkedButtons
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AlexM 2/8/2024 23:58'
}
GMTEImageButton >> linkedButtons: aCollection [

	linkedButtons := aCollection
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'TW 2/7/2024 15:20'
}
GMTEImageButton >> mouseDown: anEvent [

	super mouseDown: anEvent.
	anEvent yellowButtonPressed 
		ifTrue: [^ self].
	self updateVisualState: anEvent
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'jannis 2/8/2024 18:06'
}
GMTEImageButton >> mouseMove: anEvent [

	self updateVisualState: anEvent
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'TW 2/7/2024 15:20'
}
GMTEImageButton >> mouseUp: anEvent [

	(self containsPoint: anEvent cursorPoint)
		ifTrue: [self doButtonAction]
		ifFalse: [self mouseLeave: anEvent]
]

{
	#category : #'visual properties',
	#'squeak_changestamp' : 'TW 6/21/2024 00:12'
}
GMTEImageButton >> select [
	"Set button to his pressed state and executes button action"

	self setImageMode: #pressed.
	self doButtonAction
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/21/2024 15:48'
}
GMTEImageButton >> setImageMode: aString [

	(aString == #pressed)
		ifTrue: [self color: Color red]
		ifFalse: [
		(aString == #unpressed)
			ifTrue:  [self color: Color black]
			ifFalse: [
			(aString == #hover)
				ifTrue: [self fullResolutionSprite: self hoverImage]
				ifFalse: [^nil]]].
	
	self extent: self extent.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 2/7/2024 15:20'
}
GMTEImageButton >> target [
	"Object the actionSelector method is called on"

	^ target
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Thomas Wolf 2/4/2024 23:10'
}
GMTEImageButton >> target: anObject [

	target := anObject
]

{
	#category : #'visual properties',
	#'squeak_changestamp' : 'TW 6/21/2024 00:12'
}
GMTEImageButton >> updateVisualState: anEvent [

	(self containsPoint: anEvent cursorPoint)
		ifTrue: [self setImageMode: #pressed]
		ifFalse: [self setImageMode: #unpressed]
]
