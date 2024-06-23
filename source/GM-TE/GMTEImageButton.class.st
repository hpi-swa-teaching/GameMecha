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
		'linkedButtons',
		'stateSprites'
	],
	#category : #'GM-TE-UI',
	#'squeak_changestamp' : '<historical>'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 16:48'
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
	#'squeak_changestamp' : 'jj 6/22/2024 16:48'
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
	#'squeak_changestamp' : 'jj 6/22/2024 16:48'
}
GMTEImageButton >> createStateImagesFrom: anImage [
	
	| unpressedColor hoveredColor pressedColor disabledColor |
	unpressedColor := UserInterfaceTheme current get: #titleTextColor for: MenuMorph.
	hoveredColor := UserInterfaceTheme current get: #highlightTextColor for: SimpleHierarchicalListMorph.
	pressedColor := UserInterfaceTheme current get: #errorColor for: TestRunner.
	disabledColor := UserInterfaceTheme current get: #disabledTextColor for: MenuItemMorph.
	
	self stateSprites at: 'unpressed' put: (self dyeSprite: anImage with: unpressedColor).
	self stateSprites at: 'hovered' put: (self dyeSprite: anImage with: hoveredColor).
	self stateSprites at: 'pressed' put: (self dyeSprite: anImage with: pressedColor).
	self stateSprites at: 'disabled' put: (self dyeSprite: anImage with: disabledColor)
]

{
	#category : #button,
	#'squeak_changestamp' : 'jj 6/23/2024 13:44'
}
GMTEImageButton >> doButtonAction [
	"Perform the action of this button. The default behavior is to send the button's actionSelector to its target object with its arguments."

	(self target notNil and: [self actionSelector notNil]) 
		ifTrue: [self arguments 
			ifNil: [self target perform: self actionSelector]
			ifNotNil: [self target perform: self actionSelector withArguments: self arguments]].
	"If this button is not linked with any others, go back to the unpressedImage. If it is, set all linked buttons to their unpressed state, and keep this button pressed, to show the selection."
	self linkedButtons
		ifNil: [self setImageMode: #unpressed]
		ifNotNil: [self linkedButtons do: [:aButton | (aButton ~~ self) ifTrue: [aButton setImageMode: #unpressed]]]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 16:48'
}
GMTEImageButton >> dyeSprite: anImage with: aColor [

	^ anImage copy
		replaceColor: Color white withColor: Color transparent;
		replaceColor: Color black withColor: aColor;
		yourself
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'jj 6/22/2024 16:48'
}
GMTEImageButton >> handlesMouseDown: anEvent [

	^ true
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'jj 6/22/2024 16:48'
}
GMTEImageButton >> handlesMouseMove: anEvent [

	^ true
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'jj 6/22/2024 16:48'
}
GMTEImageButton >> handlesMouseOver: anEvent [

	^ true
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TW 6/22/2024 01:13'
}
GMTEImageButton >> initialize [
	
	super initialize.
	self stateSprites: Dictionary new
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 16:49'
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
	#'squeak_changestamp' : 'jj 6/22/2024 16:49'
}
GMTEImageButton >> mouseDown: anEvent [

	super mouseDown: anEvent.
	anEvent yellowButtonPressed ifTrue: [^ self].
	
	self updateVisualState: anEvent
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'Alex M 6/21/2024 20:38'
}
GMTEImageButton >> mouseLeave: anEvent [

	self updateVisualState: anEvent
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'Alex M 6/21/2024 20:34'
}
GMTEImageButton >> mouseMove: anEvent [

	self updateVisualState: anEvent
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'Alex M 6/21/2024 20:41'
}
GMTEImageButton >> mouseUp: anEvent [

	(self containsPoint: anEvent cursorPoint)
		ifTrue: [self doButtonAction]
		ifFalse: [self mouseLeave: anEvent].
	self updateVisualState: anEvent
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
	#'squeak_changestamp' : 'TW 6/23/2024 18:47'
}
GMTEImageButton >> setImageMode: aString [
	
	(aString == #pressed)
		ifTrue: [
			self fullResolutionSprite: (self stateSprites at: 'pressed')]
		ifFalse: [
			(aString == #unpressed)
				ifTrue:  [
					self fullResolutionSprite: (self stateSprites at: 'unpressed')]
				ifFalse: [
					(aString == #hovered)
						ifTrue: [self fullResolutionSprite: (self stateSprites at: 'hovered')]
						ifFalse: [^ nil]]].
			
	self extent: self extent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 16:49'
}
GMTEImageButton >> stateSprites [

	^ stateSprites
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 6/22/2024 15:07'
}
GMTEImageButton >> stateSprites: anObject [

	stateSprites := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 16:49'
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
	#'squeak_changestamp' : 'Alex M 6/22/2024 01:44'
}
GMTEImageButton >> updateVisualState: anEvent [

	(self containsPoint: Sensor cursorPoint)
		ifTrue: [ anEvent redButtonPressed
			ifTrue: [self setImageMode: #pressed]
			ifFalse:[self setImageMode: #hovered]]
		ifFalse: [self setImageMode: #unpressed]
]
