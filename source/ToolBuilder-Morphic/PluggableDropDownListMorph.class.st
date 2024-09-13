Class {
	#name : #PluggableDropDownListMorph,
	#superclass : #AlignmentMorph,
	#instVars : [
		'model',
		'listSelector',
		'selectionSelector',
		'selectionSetter'
	],
	#category : #'ToolBuilder-Morphic'
}

{
	#category : #drawing,
	#'squeak_changestamp' : 'mt 8/21/2019 13:46'
}
PluggableDropDownListMorph >> basicPanel [
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
	#category : #accessing,
	#'squeak_changestamp' : 'rww 9/11/2010 13:34'
}
PluggableDropDownListMorph >> currentSelection [

	^ self model perform: selectionSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'rww 9/11/2010 13:34'
}
PluggableDropDownListMorph >> currentSelection: obj [

	^ self model perform: selectionSetter with: obj
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'rww 9/11/2010 14:22'
}
PluggableDropDownListMorph >> horizontalPanel [
	^self basicPanel
		cellPositioning: #center;
		listDirection: #leftToRight;
		yourself.
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'topa 7/12/2016 00:18'
}
PluggableDropDownListMorph >> installDropDownList [

	| aButton aLabel |
	aButton := PluggableButtonMorph on: self model getState: nil action: nil.
	aLabel := (StringMorph contents: self model currentRemoteVatId translated
				font: (StrikeFont familyName: TextStyle defaultFont familyName
							pointSize: TextStyle defaultFont pointSize - 1)).
	self addMorph: (self horizontalPanel
		addMorphBack: aLabel;
		addMorphBack: aButton;
		yourself).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'rww 9/11/2010 13:33'
}
PluggableDropDownListMorph >> list [
	"Answer the value of list"

	^ self model perform: self listSelector.
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'rww 9/11/2010 13:32'
}
PluggableDropDownListMorph >> listSelector [
	"Answer the value of listSelector"

	^ listSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'rww 9/11/2010 13:32'
}
PluggableDropDownListMorph >> listSelector: anObject [
	"Set the value of listSelector"

	listSelector := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'rww 9/11/2010 13:33'
}
PluggableDropDownListMorph >> model [
	^ model
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'rww 9/11/2010 13:32'
}
PluggableDropDownListMorph >> model: anObject [
	"Set the value of model"

	model := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'rww 9/11/2010 13:32'
}
PluggableDropDownListMorph >> selectionSelector [
	"Answer the value of selectionSelector"

	^ selectionSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'rww 9/11/2010 13:32'
}
PluggableDropDownListMorph >> selectionSelector: anObject [
	"Set the value of selectionSelector"

	selectionSelector := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'rww 9/11/2010 13:32'
}
PluggableDropDownListMorph >> selectionSetter [
	"Answer the value of selectionSetter"

	^ selectionSetter
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'rww 9/11/2010 13:32'
}
PluggableDropDownListMorph >> selectionSetter: anObject [
	"Set the value of selectionSetter"

	selectionSetter := anObject
]
