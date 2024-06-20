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
		'actWhen',
		'mouseDownTime',
		'unpressedImage',
		'pressedImage',
		'clickSound',
		'linkedButtons',
		'unpressedPath',
		'pressedPath',
		'soundPath',
		'tilePosition',
		'fractionalExtent'
	],
	#category : #'GM-TE-UI',
	#'squeak_changestamp' : '<historical>'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 2/7/2024 15:20'
}
GMTEImageButton class >> prepareButtonDoing: anAction withArguments: anOrderedCollection unpressedPath: anUnpressedPath pressedPath: aPressedPath at: aTileCoordinate fractionalExtent: aPoint soundPath: aSoundPath [

	^ self new
		actionSelector: anAction;
		arguments: anOrderedCollection;
		unpressedPath: anUnpressedPath;
		pressedPath: aPressedPath;
		soundPath: aSoundPath;
		fractionalExtent: aPoint;
		tilePosition: aTileCoordinate
]

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
	#category : #accessing,
	#'squeak_changestamp' : 'TW 2/7/2024 15:20'
}
GMTEImageButton >> clickSound [
	"Sound which is played once the button is clicked"

	^ clickSound
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AlexM 2/8/2024 23:55'
}
GMTEImageButton >> clickSound: aSound [

	clickSound := aSound
]

{
	#category : #'visual properties',
	#'squeak_changestamp' : 'TW 2/6/2024 16:47'
}
GMTEImageButton >> deselect [
	"Set button to his unpressed state"

	self image: self unpressedImage
]

{
	#category : #button,
	#'squeak_changestamp' : 'jannis 2/8/2024 18:02'
}
GMTEImageButton >> doButtonAction [
	"Perform the action of this button. The default behavior is to send the button's actionSelector to its target object with its arguments."

	self clickSound copy play.
	(self target notNil and: [actionSelector notNil]) 
		ifTrue: [self target perform: self actionSelector withArguments: arguments].
	"If this button is not linked with any others, go back to the unpressedImage. If it is, set all linked buttons to their unpressed state, and keep this button pressed, to show the selection."
	self linkedButtons
		ifNil: [self image: self unpressedImage]
		ifNotNil: [self linkedButtons do: [:aButton | aButton ~~ self 
			ifTrue: [aButton deselect]]]
]

{
	#category : #'visual properties',
	#'squeak_changestamp' : 'TW 2/8/2024 11:22'
}
GMTEImageButton >> extent: anExtent [
	"Override BALLS_ImageMorph extent functionality to modify both images at once"

	self
		image: (self image scaledToSize: anExtent);
		unpressedImage: (self unpressedImage scaledToSize: anExtent);
		pressedImage: (self pressedImage scaledToSize: anExtent).
	super extent: anExtent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 2/7/2024 14:36'
}
GMTEImageButton >> fractionalExtent [

	^ fractionalExtent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AlexM 2/8/2024 23:55'
}
GMTEImageButton >> fractionalExtent: anExtent [

	fractionalExtent := anExtent
]

{
	#category : #materialising,
	#'squeak_changestamp' : 'jannis 2/8/2024 18:02'
}
GMTEImageButton >> getBuiltBy: aPageBuilder for: aPage [
	"Loads its various images, sounds and calculates its graphical properties in order to manifest as an actual usable button. Adds itself to the page"

	self
		target: aPage;
		unpressedImage: (aPageBuilder resourceManager loadForm: self unpressedPath);
		pressedImage: (aPageBuilder resourceManager loadForm: self pressedPath);
		image: self unpressedImage;
		clickSound: (aPageBuilder resourceManager loadSound: self soundPath);
		extent: (aPageBuilder screen fractionsToPixels: self fractionalExtent);
		center: (aPageBuilder matrix getAtCoordinate: self tilePosition) center.
	
	aPage addMorph: self.
	^ self
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
	#category : #accessing,
	#'squeak_changestamp' : 'TW 2/6/2024 16:29'
}
GMTEImageButton >> pressedImage [
	"Image of the button when pressed"

	^ pressedImage
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AlexM 2/8/2024 23:59'
}
GMTEImageButton >> pressedImage: anImage [

	pressedImage := anImage
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 2/7/2024 14:14'
}
GMTEImageButton >> pressedPath [

	^ pressedPath
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AlexM 2/9/2024 00:00'
}
GMTEImageButton >> pressedPath: aPath [

	pressedPath := aPath
]

{
	#category : #'visual properties',
	#'squeak_changestamp' : 'TW 2/6/2024 16:47'
}
GMTEImageButton >> select [
	"Set button to his pressed state and executes button action"

	self image: self pressedImage.
	self doButtonAction
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 2/7/2024 14:14'
}
GMTEImageButton >> soundPath [

	^ soundPath
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AlexM 2/9/2024 00:00'
}
GMTEImageButton >> soundPath: aPath [

	soundPath := aPath
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
	#category : #accessing,
	#'squeak_changestamp' : 'TW 2/7/2024 14:14'
}
GMTEImageButton >> tilePosition [

	^ tilePosition
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AlexM 2/9/2024 00:01'
}
GMTEImageButton >> tilePosition: aPoint [

	tilePosition := aPoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 2/6/2024 16:29'
}
GMTEImageButton >> unpressedImage [
	"Image of the button when unpressed"

	^ unpressedImage
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AlexM 2/9/2024 00:01'
}
GMTEImageButton >> unpressedImage: anImage [

	unpressedImage := anImage
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 2/7/2024 14:14'
}
GMTEImageButton >> unpressedPath [

	^ unpressedPath
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AlexM 2/9/2024 00:01'
}
GMTEImageButton >> unpressedPath: aPath [

	unpressedPath := aPath
]

{
	#category : #'visual properties',
	#'squeak_changestamp' : 'AlexM 2/9/2024 00:02'
}
GMTEImageButton >> updateVisualState: anEvent [

	(self containsPoint: anEvent cursorPoint)
		ifTrue: [self image: self pressedImage]
		ifFalse: [self image: self unpressedImage]
]
