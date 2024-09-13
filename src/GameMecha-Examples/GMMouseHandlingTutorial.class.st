"
This acceptance test is a simple tutorial for basic mouse handling and does not use any of the GM library functions. It is supposed to be opened like any other morph.
When being clicked, the morph will change its color. When the mouse button is hold down, the morph will grow with the step rate specified in mouseStillDownStepRate. Once the mouse button is released the morph jumps to a random position on screen.
In addition, some passive drag and drop behavior is implemented. If the mouse enters the morph while dragging something (to be more precise if the mouse enters the morph while a mouse button is pressed), the morph gets a bold red border. This border disappears when something is dragged out of the morph.

To achieve this behavior some methods for mouse handling have to be overwritten. See all the overwritten methods of this class (all except initialize) for more detail.
"
Class {
	#name : #GMMouseHandlingTutorial,
	#superclass : #Morph,
	#category : #'GameMecha-Examples',
	#'squeak_changestamp' : 'NK 7/25/2018 17:22'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 7/23/2018 00:42'
}
GMMouseHandlingTutorial class >> defaultBorderWidth [
	^ 0
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TP 7/6/2018 20:28'
}
GMMouseHandlingTutorial class >> defaultExtent [
	^ 400 @ 100
]

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 7/23/2018 00:42'
}
GMMouseHandlingTutorial class >> emphasizedBorderWidth [
	^ 10
]

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 7/23/2018 00:43'
}
GMMouseHandlingTutorial class >> growthRate [
	^ 5 @ 5
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'brh 7/12/2018 15:45'
}
GMMouseHandlingTutorial >> handlesMouseDown: anEvent [
	"Has to be overwritten and return true to handle MouseDown"
	^ true
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'AZ 7/15/2018 17:45'
}
GMMouseHandlingTutorial >> handlesMouseOverDragging: anEvent [
	"Has to be overwritten and return true to handle mouseEnterDragging and mouseLeaveDragging"
	^ true
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'brh 7/12/2018 15:44'
}
GMMouseHandlingTutorial >> handlesMouseStillDown: anEvent [
	"Has to be overwritten and return true to handle mouseStillDown"
	^ true
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'AZ 7/10/2018 15:59'
}
GMMouseHandlingTutorial >> initialize [
	super initialize.
	self
		extent: self class defaultExtent;
		color: Color white;
		addMorph: (StringMorph new
			contents: 'click me or drag something over me';
			center: self center;
			yourself).
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'brh 7/12/2018 15:44'
}
GMMouseHandlingTutorial >> mouseDown: anEvent [
	"Overwritten to handle the button down event for a mouse button."
	super mouseDown: anEvent.
	self color: Color random.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'AZ 7/23/2018 00:43'
}
GMMouseHandlingTutorial >> mouseEnterDragging: anEvent [
	"Overwritten to handle the mouse entering the morph while pressing a mouse button."
	self borderColor: Color red.
	self borderWidth: self class emphasizedBorderWidth.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'AZ 7/23/2018 00:43'
}
GMMouseHandlingTutorial >> mouseLeaveDragging: anEvent [
	"Overwritten to handle the mouse leaving the morph while pressing a mouse button."
	self borderWidth: self class defaultBorderWidth.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'AZ 7/23/2018 00:44'
}
GMMouseHandlingTutorial >> mouseStillDown: anEvent [
	"Overwritten to handle mouseStillDown. This event is thrown every step as long as the left mouse button ist 	down.
	Attention the step rate for this is defined in mouseStillDownStepRate
	not in stepTime as it is the case for the 'normal' stepping."
	super mouseStillDown: anEvent.
	self extent: self extent + self class growthRate.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'brh 7/12/2018 15:45'
}
GMMouseHandlingTutorial >> mouseStillDownStepRate [
	"Overwritten to specify the rate of milliseconds at which mouseStillDown is thrown. See mouseStillDown for more details."
	^ 100
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'AZ 7/23/2018 00:29'
}
GMMouseHandlingTutorial >> mouseUp: anEvent [
	"Overwritten to handle the button up event for a mouse button."
	| spawnArea |
	super mouseUp: anEvent.
	self extent: self class defaultExtent.
	spawnArea := self world extent - self extent.
	self position: spawnArea x random @ spawnArea y random.
]
