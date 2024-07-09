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
		'stateSprites',
		'enabled',
		'selected',
		'buttonGroup'
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
	#'squeak_changestamp' : 'TW 7/9/2024 18:24'
}
GMTEImageButton >> basicButtonGroup: aCollection [

	buttonGroup := aCollection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/25/2024 15:28'
}
GMTEImageButton >> basicEnabled: anObject [

	enabled := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 7/9/2024 18:20'
}
GMTEImageButton >> buttonGroup [
	"All the buttons this button is linked with. Only one of a group of linked buttons is active at once"

	^ buttonGroup
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 7/9/2024 18:30'
}
GMTEImageButton >> buttonGroup: aCollection [

	self basicButtonGroup: aCollection.
	aCollection add: self
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
	#'squeak_changestamp' : 'TW 7/9/2024 18:22'
}
GMTEImageButton >> doButtonAction [
	"Perform the action of this button. The default behavior is to send the button's actionSelector to its target object with its arguments."

	(self target notNil and: [self actionSelector notNil]) 
		ifTrue: [self arguments 
			ifNil: [self target perform: self actionSelector]
			ifNotNil: [self target perform: self actionSelector withArguments: self arguments]].
	"If this button is not linked with any others, go back to the unpressedImage. If it is, set all linked buttons to their unpressed state, and keep this button pressed, to show the selection."
	self buttonGroup
		ifNil: [self setImageMode: #unpressed]
		ifNotNil: [self buttonGroup do: [:aButton | (aButton ~~ self) ifTrue: [aButton setImageMode: #unpressed]]]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/6/2024 23:07'
}
GMTEImageButton >> dyeSprite: anImage with: aColor [

	^ anImage copy
		replaceColor: Color white withColor: Color transparent;
		"replaceColor: Color black withColor: aColor;
		yourself"
		dyed: aColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/25/2024 15:23'
}
GMTEImageButton >> enabled [

	^ enabled
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/25/2024 15:33'
}
GMTEImageButton >> enabled: aBoolean [

	aBoolean
		ifTrue: [
			self basicEnabled: true.
			self setImageMode: 'unpressed']
		ifFalse: [
			self basicEnabled: false.
			self setImageMode: 'disabled']
			
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
	#'squeak_changestamp' : 'TW 7/9/2024 19:01'
}
GMTEImageButton >> initialize [
	
	super initialize.
	self
		selected: false; 
		stateSprites: Dictionary new
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'TW 7/9/2024 18:52'
}
GMTEImageButton >> mouseDown: anEvent [

	self enabled ifFalse: [^ nil].

	super mouseDown: anEvent.
	anEvent yellowButtonPressed ifTrue: [^ self].
	
	self updateVisualState: anEvent
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'TW 6/25/2024 15:41'
}
GMTEImageButton >> mouseLeave: anEvent [

	self enabled ifFalse: [^ nil].
	
	self updateVisualState: anEvent
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'TW 6/25/2024 15:41'
}
GMTEImageButton >> mouseMove: anEvent [

	self enabled ifFalse: [^ nil].

	self updateVisualState: anEvent
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'TW 7/9/2024 19:14'
}
GMTEImageButton >> mouseUp: anEvent [

	self enabled ifFalse: [^ nil].

	(self containsPoint: anEvent cursorPoint)
		ifTrue: [self doButtonAction]
		ifFalse: [self mouseLeave: anEvent].
	self buttonGroup ifNotNil: [self buttonGroup singleSelect: self].
	self updateVisualState: anEvent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 7/9/2024 19:41'
}
GMTEImageButton >> select [

		self buttonGroup ifNotNil: [self buttonGroup singleSelect: self].
		self doButtonAction.
		self setImageMode: 'pressed'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 7/9/2024 19:01'
}
GMTEImageButton >> selected [

	^ selected
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 7/9/2024 19:01'
}
GMTEImageButton >> selected: anObject [

	selected := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/25/2024 15:39'
}
GMTEImageButton >> setImageMode: aString [
	
	self fullResolutionSprite: (self stateSprites at: aString).
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
	#'squeak_changestamp' : 'TW 7/9/2024 19:11'
}
GMTEImageButton >> updateVisualState: anEvent [


	self buttonGroup
		ifNil: [
			(self containsPoint: Sensor cursorPoint)
				ifTrue: [anEvent redButtonPressed
					ifTrue: [self setImageMode: 'pressed']
					ifFalse:[self setImageMode: 'hovered']]
				ifFalse: [self setImageMode: 'unpressed']]
		ifNotNil: [
			self selected
				ifFalse: [
					(self containsPoint: Sensor cursorPoint)
						ifTrue: [anEvent redButtonPressed
							ifTrue: [self setImageMode: 'pressed']
							ifFalse:[self setImageMode: 'hovered']]
						ifFalse: [self setImageMode: 'unpressed']]]
]
