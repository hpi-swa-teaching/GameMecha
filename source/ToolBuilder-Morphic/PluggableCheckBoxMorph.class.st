Class {
	#name : #PluggableCheckBoxMorph,
	#superclass : #AlignmentMorph,
	#instVars : [
		'model',
		'actionSelector',
		'valueSelector',
		'label'
	],
	#category : #'ToolBuilder-Morphic'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'rww 9/11/2010 03:44'
}
PluggableCheckBoxMorph class >> on: anObject getState: getStateSel action: actionSel label: labelSel [

	^ self new
		on: anObject
		getState: getStateSel
		action: actionSel
		label: labelSel
		menu: nil

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'rww 9/11/2010 03:37'
}
PluggableCheckBoxMorph >> actionSelector [
	"Answer the value of actionSelector"

	^ actionSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'rww 9/11/2010 03:37'
}
PluggableCheckBoxMorph >> actionSelector: anObject [
	"Set the value of actionSelector"

	actionSelector := anObject
]

{
	#category : #installing,
	#'squeak_changestamp' : 'mt 8/21/2019 13:46'
}
PluggableCheckBoxMorph >> basicPanel [
	^BorderedMorph new
		beTransparent;
		extent: 0@0;
		borderWidth: 0;
		layoutInset: 0;
		cellGap: 0;
		layoutPolicy: TableLayout new;
		listCentering: #topLeft;
		cellPositioning: #center;
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		yourself
]

{
	#category : #installing,
	#'squeak_changestamp' : 'rww 9/11/2010 04:10'
}
PluggableCheckBoxMorph >> horizontalPanel [
	^self basicPanel
		cellPositioning: #center;
		listDirection: #leftToRight;
		yourself.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mt 7/3/2019 19:14'
}
PluggableCheckBoxMorph >> initialize [

	super initialize.
	self color: Color transparent.
]

{
	#category : #installing,
	#'squeak_changestamp' : 'mt 7/3/2019 19:04'
}
PluggableCheckBoxMorph >> installButton [

	| aButton |
	aButton := UpdatingThreePhaseButtonMorph checkBox
		target: self model;
		actionSelector: self actionSelector;
		getSelector: self valueSelector;
		label: self label;
		yourself.

	self addMorph: (self horizontalPanel
		addMorphBack: aButton;
		
		yourself).
]

{
	#category : #classification,
	#'squeak_changestamp' : 'mt 4/29/2021 10:21'
}
PluggableCheckBoxMorph >> isButton [

	^ true
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'rww 9/11/2010 03:37'
}
PluggableCheckBoxMorph >> label [
	"Answer the value of label"

	^ label
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'rww 9/11/2010 03:37'
}
PluggableCheckBoxMorph >> label: anObject [
	"Set the value of label"

	label := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'rww 9/11/2010 03:38'
}
PluggableCheckBoxMorph >> model [
	"Answer the value of model"

	^ model.

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'rww 9/11/2010 03:37'
}
PluggableCheckBoxMorph >> model: anObject [
	"Set the value of model"

	model := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'rww 9/11/2010 03:45'
}
PluggableCheckBoxMorph >> on: anObject getState: getStateSel action: actionSel label: labelSel menu: menuSel [

	self model: anObject.
	self valueSelector: getStateSel.
	self actionSelector: actionSel.
	self label: (self model perform: labelSel).

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'rww 9/11/2010 03:37'
}
PluggableCheckBoxMorph >> valueSelector [
	"Answer the value of valueSelector"

	^ valueSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'rww 9/11/2010 03:37'
}
PluggableCheckBoxMorph >> valueSelector: anObject [
	"Set the value of valueSelector"

	valueSelector := anObject
]
