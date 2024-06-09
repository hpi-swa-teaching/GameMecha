Class {
	#name : #PluggableDialogWindow,
	#superclass : #DialogWindow,
	#instVars : [
		'model',
		'getTitleSelector',
		'getMessageSelector',
		'getChildrenSelector',
		'getButtonsSelector',
		'closeDialogSelector'
	],
	#category : #'ToolBuilder-Morphic'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 7/14/2016 08:36'
}
PluggableDialogWindow >> closeDialogSelector [

	^ closeDialogSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 7/14/2016 08:36'
}
PluggableDialogWindow >> closeDialogSelector: anObject [

	closeDialogSelector := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mt 1/11/2021 17:25'
}
PluggableDialogWindow >> createTitle: aString [
	"Overridden to add an extra expand button. Yet, it depends on the model's interface whether that button will be visible. See #model:."

	| box expandButton|
	super createTitle: aString.

	expandButton := SystemWindowButton new
		name: #expandButton;
		color: Color transparent;
		target: self;
		actionSelector: #expandDialogPane;
		balloonText: 'Expand this dialog' translated;
		borderWidth: 0;
		yourself.
	SystemWindow expandBoxImage scaleIconToDisplay in: [:icon |
		expandButton labelGraphic: icon; extent: icon extent].
	
	box := self submorphNamed: #title.
	box addMorphBack: expandButton.
]

{
	#category : #'submorphs - add/remove',
	#'squeak_changestamp' : 'mt 7/14/2016 08:36'
}
PluggableDialogWindow >> delete [

	self model okToClose ifFalse: [^ self].
	
	self closeDialogSelector ifNotNil: [:sel | self model perform: sel].
	
	self model
		windowIsClosing;
		release.
	self model: nil.
	
	super delete.
]

{
	#category : #running,
	#'squeak_changestamp' : 'mt 3/14/2022 14:49'
}
PluggableDialogWindow >> expandDialogPane [
	"Expand the dialog pane to its preferred extent, including the pane's extra layout inset used for grips. Then try again to move to the dialog's preferred position."

	| extra |
	self flag: #preferredExtentWorkaround. "mt: Working with a widget's min, max, and preferred extent is still very awkward using proportional layouts and layout frames. For now, approximate extra spacing to accommodate ListChooser and ListMultipleChooser only."
	extra := PluggableListMorph listMargins.
	extra := extra topLeft + extra bottomRight.

	self paneMorph extent:
		(self model preferredExtent
			+ (self paneMorph layoutInset * 2) asPoint
			+ extra).
	self moveToPreferredPosition.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 7/14/2016 08:31'
}
PluggableDialogWindow >> getButtonsSelector [

	^ getButtonsSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 7/14/2016 08:31'
}
PluggableDialogWindow >> getButtonsSelector: anObject [

	getButtonsSelector := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 7/14/2016 08:31'
}
PluggableDialogWindow >> getChildrenSelector [

	^ getChildrenSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 7/14/2016 08:31'
}
PluggableDialogWindow >> getChildrenSelector: anObject [

	getChildrenSelector := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 7/14/2016 08:31'
}
PluggableDialogWindow >> getMessageSelector [

	^ getMessageSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 7/14/2016 08:31'
}
PluggableDialogWindow >> getMessageSelector: anObject [

	getMessageSelector := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 7/14/2016 08:31'
}
PluggableDialogWindow >> getTitleSelector [

	^ getTitleSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 7/14/2016 08:31'
}
PluggableDialogWindow >> getTitleSelector: anObject [

	getTitleSelector := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mt 12/6/2021 10:51'
}
PluggableDialogWindow >> initialExtent [
	"Avoid screen-scaling to let the model determine the best initial extent, which might already be based on visible contents such as texts rendered in the default font."
	
	^ model initialExtent
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mt 12/6/2021 10:26'
}
PluggableDialogWindow >> isMorphicModel [
	"I am a MorphicModel because I am a Morph and I offer a #model. Now, my debug menu shows more entries."

	self flag: #discuss. "mt: Maybe subclass from MorphicModel like SystemWindow?"
	^ true
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 7/14/2016 08:17'
}
PluggableDialogWindow >> model [
	^ model
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 1/11/2021 17:13'
}
PluggableDialogWindow >> model: newModel [

	model ifNotNil: [model removeDependent: self].
	newModel ifNotNil: [
		newModel addDependent: self.
		(newModel respondsTo: #preferredExtent)
			ifFalse: [((self submorphNamed: #title) submorphNamed: #expandButton) delete]].
	model := newModel.
]

{
	#category : #updating,
	#'squeak_changestamp' : 'mt 7/14/2016 17:01'
}
PluggableDialogWindow >> update: what [

	what ifNil:[^self].

	what == self getTitleSelector ifTrue:[self title: (model perform: self getTitleSelector)].
	what == self getMessageSelector ifTrue:[self message: (model perform: self getMessageSelector)].
	
	what == self getChildrenSelector ifTrue:[
		self paneMorph removeAllMorphs.
		(self model perform: self getChildrenSelector)
			do: [:m| m hResizing: #spaceFill; vResizing: #spaceFill];
			in: [:children | self paneMorph addAllMorphs: children]].

	what == self getButtonsSelector ifTrue:[
		self buttonRow
			removeAllMorphs;
			addAllMorphs: (self model perform: self getButtonsSelector).
		self updateButtonProperties].
	
	what == #close ifTrue: [^ self delete].

	super update: what.
]

{
	#category : #updating,
	#'squeak_changestamp' : 'mt 7/21/2016 09:16'
}
PluggableDialogWindow >> updateButtonProperties [

	self buttons do: [:ea |
		ea setProperty: #normalColor toValue: ea offColor.
		ea setProperty: #normalLabel toValue: ea label.
		ea hResizing: #rigid; vResizing: #rigid].
	
	self updateButtonExtent.
]
