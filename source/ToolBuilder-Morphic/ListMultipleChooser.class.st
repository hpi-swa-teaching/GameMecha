"
I am like the ListChooser but for multiple choices. I have no extra search field. Enable the preference #filterableLists if lists get too big to choose from. Also, I do not support adding new items to the choice.
"
Class {
	#name : #ListMultipleChooser,
	#superclass : #Model,
	#instVars : [
		'selection',
		'labels',
		'values',
		'title',
		'choice'
	],
	#category : #'ToolBuilder-Morphic-Tools',
	#'squeak_changestamp' : 'mt 4/14/2015 17:09'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'mt 4/14/2015 17:23'
}
ListMultipleChooser class >> chooseFrom: someLabels title: aString [

	^ self chooseIndexListFrom: someLabels title: aString
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'mt 4/14/2015 15:51'
}
ListMultipleChooser class >> chooseIndexListFrom: someObjects title: aString [

	^ self new
		title: aString;
		labels: (someObjects collect: [:ea | ea asString]);
		choose
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'mt 4/14/2015 15:51'
}
ListMultipleChooser class >> chooseItemListFrom: someObjects title: aString [

	^ self new
		title: aString;
		labels: (someObjects collect: [:ea | ea asString]);
		values: someObjects;
		choose
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'mt 2/9/2022 14:24'
}
ListMultipleChooser class >> defaultTitle [

	^ 'Please choose multiple' translated
]

{
	#category : #preferences,
	#'squeak_changestamp' : 'mt 7/10/2016 20:16'
}
ListMultipleChooser class >> themeProperties [

	^ super themeProperties,  {
		{ #okColor. 'Colors'. 'Color for the OK button.' }.
		{ #cancelColor. 'Colors'. 'Color for the Cancel button.' }.
	}
]

{
	#category : #actions,
	#'squeak_changestamp' : 'mt 4/14/2015 15:29'
}
ListMultipleChooser >> accept [

	choice := #accepted.
	self changed: #close.
]

{
	#category : #updating,
	#'squeak_changestamp' : 'mt 7/10/2016 20:15'
}
ListMultipleChooser >> applyUserInterfaceTheme [

	super applyUserInterfaceTheme.
	
	self
		changed: #okColor;
		changed: #cancelColor.
]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'mt 7/22/2016 15:52'
}
ListMultipleChooser >> buildWith: builder [

	| dialogSpec choicesSpec |
	dialogSpec := builder pluggableDialogSpec new
		model: self;
		extent: self initialExtent;
		title: #title;
		children: OrderedCollection new;
		buttons: OrderedCollection new.
		
	choicesSpec := builder pluggableMultiSelectionListSpec new
		model: self;
		list: #labels;
		setIndex: #selectedIndex:;
		getIndex: #selectedIndex;
		setSelectionList: #selectionAt:put:;
		getSelectionList: #selectionAt:;
		frame: (0@0 corner: 1@1).
	dialogSpec children add: choicesSpec.
	
	"Buttons"
	dialogSpec buttons add: (
		builder pluggableButtonSpec new
			model: self;
			label: 'accept';
			color: (self userInterfaceTheme okColor ifNil: [Color r: 0.49 g: 0.749 b: 0.49]);
			action: #accept).
			
	dialogSpec buttons add: (
		builder pluggableButtonSpec new
			model: self;
			label: 'cancel';
			color: (self userInterfaceTheme cancelColor ifNil: [Color r: 1 g: 0.6 b: 0.588]);
			action: #cancel).
				
	^ builder build: dialogSpec
]

{
	#category : #actions,
	#'squeak_changestamp' : 'mt 4/14/2015 15:29'
}
ListMultipleChooser >> cancel [

	choice := #cancelled.
	self changed: #close.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'mt 7/21/2016 10:31'
}
ListMultipleChooser >> choose [

	
"	self changed: #inputRequested with: #selectedIndex.
"	
	ToolBuilder open: self.
	^ self selectedValues
]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'mt 3/14/2022 14:52'
}
ListMultipleChooser >> initialExtent [

	| listFont listStyle itemCount maxItemSize |
	listFont := Preferences standardListFont.
	listStyle := listFont asNewTextStyle.
	itemCount := labels size.
	maxItemSize := (labels take: 15) inject: 0 into: [:max :item | max max: item asString size].
	
	^ (listStyle compositionWidthFor: (maxItemSize min: 50 max: 35))
		@ (ToolBuilder default listHeightFor: (itemCount min: 15 max: 5))
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 4/14/2015 15:11'
}
ListMultipleChooser >> labels [

	^ labels
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 4/14/2015 15:12'
}
ListMultipleChooser >> labels: someStrings [

	labels := someStrings.
	self changed: #labels.
]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'mt 2/9/2022 14:14'
}
ListMultipleChooser >> preferredExtent [

	| listFont cellSize |
	listFont := Preferences standardListFont.
	cellSize := (listFont widthOf: $x) @ listFont lineGridForMorphs.
	
	^  ((labels inject: 0 into: [:max :item | max max: (listFont widthOfString: item asString)]) + cellSize x "breathing space")
		@ (ToolBuilder default listHeightFor: labels size)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 4/14/2015 15:12'
}
ListMultipleChooser >> selectedIndex [
	"Sigh. Required from widget..."
	^ 0
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 4/14/2015 15:12'
}
ListMultipleChooser >> selectedIndex: anIndex [
	"Sigh. Required from widget..."
	self changed: #selectedIndex.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 4/14/2015 15:30'
}
ListMultipleChooser >> selectedValues [
	
	| i |
	choice ~~ #accepted ifTrue: [^ nil].
	
	i := 0.
	^ self values select: [:object | i := i + 1. self selection at: i]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 4/14/2015 15:14'
}
ListMultipleChooser >> selection [

	^ selection ifNil: [selection := Array new: self values size withAll: false]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 4/14/2015 15:55'
}
ListMultipleChooser >> selectionAt: index [

	^ self selection at: index
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ct 1/24/2020 21:21'
}
ListMultipleChooser >> selectionAt: index put: boolean [

	self selection at: index put: boolean.
	self changed: #selectionAt:
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 2/9/2022 14:26'
}
ListMultipleChooser >> title [

	^ (title isNil or: [ title isEmpty ])
		ifTrue: [ title := self class defaultTitle ]
		ifFalse: [ title ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 4/14/2015 15:27'
}
ListMultipleChooser >> title: aString [

	title := aString.
	self changed: #title.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 4/14/2015 15:14'
}
ListMultipleChooser >> values [

	^ values ifNil: [values := (1 to: self labels size) asArray]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 4/14/2015 15:11'
}
ListMultipleChooser >> values: someObjects [

	values := someObjects.
]
