"
I am a simple dialog to allow the user to pick from a list of strings or symbols.
I support keyboard and mouse navigation, and interactive filtering of the displayed items.

You can specify whether you want the index, or the value of the selected item. If you're interested in the value, you can also allow users to Add a new value not in the list.

cmd-s or <enter> or double-click answers the currently selected item's value/index;
cmd-l or <escape> or closing the window answers nil/zero.

Now using ToolBuilder, so needs Morphic-MAD.381.

Released under the MIT Licence.
"
Class {
	#name : #ListChooser,
	#superclass : #Model,
	#instVars : [
		'selectedIndex',
		'items',
		'searchText',
		'addAllowed',
		'result',
		'title',
		'listMorph',
		'dialogMorph'
	],
	#category : #'ToolBuilder-Morphic-Tools',
	#'squeak_changestamp' : 'MAD 3/14/2010 16:20'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'mt 2/9/2022 14:25'
}
ListChooser class >> chooseFrom: aList [

	^ self 
		chooseFrom: aList 
		title: self defaultTitle
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'MAD 3/14/2010 15:31'
}
ListChooser class >> chooseFrom: aList title: aString [
	^ self
		chooseIndexFrom: aList 
		title: aString
		addAllowed: false
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'mt 2/9/2022 14:25'
}
ListChooser class >> chooseIndexFrom: aList [
	
	^ self 
		chooseIndexFrom: aList 
		title: self defaultTitle
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'mt 2/9/2022 14:21'
}
ListChooser class >> chooseIndexFrom: aList title: aString [

	^ self
		chooseIndexFrom: aList 
		title: aString
		addAllowed: false
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'mt 2/9/2022 14:21'
}
ListChooser class >> chooseIndexFrom: aList title: aString addAllowed: aBoolean [

	^ self new
		chooseIndexFrom: aList 
		title: aString
		addAllowed: aBoolean
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'mt 2/9/2022 14:25'
}
ListChooser class >> chooseItemFrom: aList [

	^ self 
		chooseItemFrom: aList 
		title: self defaultTitle
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'MAD 3/14/2010 15:25'
}
ListChooser class >> chooseItemFrom: aList title: aString [
	^ self
		chooseItemFrom: aList 
		title: aString
		addAllowed: false
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'mt 2/9/2022 14:21'
}
ListChooser class >> chooseItemFrom: aList title: aString addAllowed: aBoolean [

	^ self new
		chooseItemFrom: aList 
		title: aString
		addAllowed: aBoolean
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'mt 2/9/2022 14:24'
}
ListChooser class >> defaultTitle [

	^ 'Please choose' translated
]

{
	#category : #examples,
	#'squeak_changestamp' : 'MAD 3/14/2010 15:37'
}
ListChooser class >> testDictionary [
	^ self 
		chooseItemFrom: (Dictionary newFrom: {#a->1. 2->#b.})
		title: 'Pick from Dictionary' "gives values, not keys"
]

{
	#category : #examples,
	#'squeak_changestamp' : 'MAD 3/14/2010 15:27'
}
ListChooser class >> testIndex [
	^ self 
		chooseIndexFrom: (Smalltalk classNames , Smalltalk traitNames) asOrderedCollection
		title: 'Pick a class'
]

{
	#category : #examples,
	#'squeak_changestamp' : 'MAD 3/14/2010 15:29'
}
ListChooser class >> testItem [
	^ self 
		chooseItemFrom: (Smalltalk classNames , Smalltalk traitNames) asOrderedCollection
		title: 'Pick a class'
]

{
	#category : #examples,
	#'squeak_changestamp' : 'MAD 3/14/2010 15:31'
}
ListChooser class >> testItemAdd [
	^ self 
		chooseItemFrom: (Smalltalk classNames , Smalltalk traitNames) asOrderedCollection
		title: 'Pick or Add:'
		addAllowed: true
]

{
	#category : #examples,
	#'squeak_changestamp' : 'MAD 3/15/2010 16:08'
}
ListChooser class >> testLongTitle [
	^ self 
		chooseItemFrom: #(this is a list of values that aren/t the point here)
		title: 'Pick from some values from this list'
]

{
	#category : #examples,
	#'squeak_changestamp' : 'MAD 3/14/2010 15:33'
}
ListChooser class >> testSet [
	^ self 
		chooseItemFrom: #(a list of values as a Set) asSet
		title: 'Pick from Set'
]

{
	#category : #preferences,
	#'squeak_changestamp' : 'mt 7/10/2016 20:02'
}
ListChooser class >> themeProperties [

	^ super themeProperties,  {
		{ #okColor. 'Colors'. 'Color for the OK button.' }.
		{ #cancelColor. 'Colors'. 'Color for the Cancel button.' }.
		{ #addColor. 'Colors'. 'Color for a normal button.' }.
		{ #disabledColor. 'Colors'. 'Color for a disabled button.' }.
	}
]

{
	#category : #actions,
	#'squeak_changestamp' : 'ct 9/12/2020 14:42'
}
ListChooser >> accept [
	"if the user submits with no valid entry, make them start over"
	
	| choice |
	self canAccept ifFalse: [
		self canAdd ifTrue: [^ self add].
		^ self changed: #textSelection].
	
	choice := self selectedItem.
	
	self canAdd ifTrue: [
		"Ask the user whether to add the new item or choose the list selection."
		(UserDialogBoxMorph
			confirm: 'You can either choose an existing item or add a new one.\What do you want?' translated withCRs
			title: 'Choose or Add' translated
			trueChoice: choice asString
			falseChoice: self searchText asString at: self currentHand position)
				ifNil: ["Cancelled" self result: nil. ^ self]
				ifNotNil: [:answer |
					answer ifTrue: [self result: choice] ifFalse: [self result: self searchText asString]]
		] ifFalse: [self result: choice].
	
	self changed: #close.
]

{
	#category : #colors,
	#'squeak_changestamp' : 'mt 7/22/2016 15:50'
}
ListChooser >> acceptColor [
	
	self canAdd ifTrue: [^ self addColor].
	
	^ self canAccept 
		ifTrue: [ self userInterfaceTheme okColor ifNil: [(Color r: 0.49 g: 0.749 b: 0.49)] ]
		ifFalse: [ self userInterfaceTheme disabledColor ifNil: [Color lightGray] ]
]

{
	#category : #colors,
	#'squeak_changestamp' : 'mt 7/20/2016 13:59'
}
ListChooser >> acceptLabel [

	^ self canAdd
		ifFalse: ['Choose' translated]
		ifTrue: [self canAccept
			ifTrue: ['Choose or Add' translated]
			ifFalse: ['Add' translated]]
]

{
	#category : #actions,
	#'squeak_changestamp' : 'MAD 3/13/2010 18:56'
}
ListChooser >> acceptText: someText [
	"the text morph wants to tell us about its contents but I don't care, I'm only interested in the list"
	self accept
]

{
	#category : #actions,
	#'squeak_changestamp' : 'mt 7/19/2016 11:33'
}
ListChooser >> add [
	"if the user submits with no valid entry, make them start over"
	self canAdd ifFalse: [^ self changed: #textSelection].
	self result: self searchText asString.
	self changed: #close.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 8/5/2016 09:57'
}
ListChooser >> addAllowed [

	^ addAllowed ifNil: [false]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 7/14/2016 17:19'
}
ListChooser >> addAllowed: anObject [

	addAllowed := anObject
]

{
	#category : #colors,
	#'squeak_changestamp' : 'mt 7/10/2016 20:01'
}
ListChooser >> addColor [
	
	^ self canAdd 
		ifTrue: [ self userInterfaceTheme addColor ifNil: [Color blue muchLighter] ]
		ifFalse: [ self userInterfaceTheme disabledColor ifNil: [Color lightGray] ]
]

{
	#category : #updating,
	#'squeak_changestamp' : 'mt 7/21/2016 09:23'
}
ListChooser >> applyUserInterfaceTheme [

	super applyUserInterfaceTheme.
	
	self
		changed: #okColor;
		changed: #cancelColor;
		changed: #addColor.
]

{
	#category : #building,
	#'squeak_changestamp' : 'ct 1/3/2022 23:51'
}
ListChooser >> buildWith: builder [

	| dialogSpec searchBarHeight listSpec fieldSpec |
	
	searchBarHeight := self searchBarHeight.
	
	dialogSpec := builder pluggableDialogSpec new
		model: self;
		title: #title;
		closeAction: #closed;
		extent: self initialExtent;
		autoCancel: true; "Behave like a pop-up menu. Historical reasons."
		children: OrderedCollection new;
		buttons: OrderedCollection new;
		yourself.
	
	listSpec := builder pluggableListSpec new.
	listSpec 
		model: self;
		list: #items; 
		getIndex: #selectedIndex; 
		setIndex: #selectedIndex:; 
		doubleClick: #accept;
		"keystrokePreview: #keyStrokeFromList:;"
		autoDeselect: false;
		filterableList: true;
		clearFilterAutomatically: false;
		name: #list;
		frame: (LayoutFrame fractions: (0@0 corner: 1@1) offsets: (0@searchBarHeight corner: 0@0)).
	dialogSpec children add: listSpec.
	
	fieldSpec := builder pluggableInputFieldSpec new.
	fieldSpec 
		model: self;
		name: #searchText ;
		getText: #searchText;
		editText: #searchText:;
		setText: #acceptText:;
		selection: #textSelection;
		menu: nil;
		indicateUnacceptedChanges: false;
		askBeforeDiscardingEdits: false;
		help: (self addAllowed ifTrue: ['Type new or filter existing...' translated] ifFalse: ['Type to filter existing...' translated]);
		frame: (LayoutFrame fractions: (0@0 corner: 1@0) offsets: (0@0 corner: 0@searchBarHeight)).
	dialogSpec children add: fieldSpec.
	
	"Buttons"
	dialogSpec buttons add: (
		builder pluggableButtonSpec new
			model: self; 
			label: #acceptLabel;
			action: #accept;
			enabled: #canAcceptOrAdd;
			color: #acceptColor).

	dialogSpec buttons add: (
		builder pluggableButtonSpec new
			model: self; 
			label: 'Cancel' translated;
			action: #cancel;
			color: #cancelColor).
		
	dialogMorph := builder build: dialogSpec.
	dialogMorph addKeyboardCaptureFilter: self ; positionOverWidgetNamed: #searchText.
	listMorph := builder widgetAt: #list.
	listMorph allowEmptyFilterResult: true.
	
	^ dialogMorph
]

{
	#category : #testing,
	#'squeak_changestamp' : 'MAD 3/13/2010 18:56'
}
ListChooser >> canAccept [
	^ self selectedIndex > 0
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mt 7/19/2016 12:12'
}
ListChooser >> canAcceptOrAdd [
	^ self canAccept or: [self canAdd]
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mt 7/22/2016 10:41'
}
ListChooser >> canAdd [
	^ self addAllowed
		and: [self searchText asString withBlanksTrimmed notEmpty]
		and: [self selectedItem asString ~= self searchText asString]
]

{
	#category : #actions,
	#'squeak_changestamp' : 'mt 7/19/2016 11:33'
}
ListChooser >> cancel [

	self result: nil.
	self changed: #close.
]

{
	#category : #colors,
	#'squeak_changestamp' : 'mt 7/22/2016 15:51'
}
ListChooser >> cancelColor [
	
	^ self userInterfaceTheme cancelColor ifNil: [Color r: 1 g: 0.6 b: 0.588]
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'ul 2/27/2017 00:28'
}
ListChooser >> chooseIndexFrom: labelList title: aString [
	| choice |
	choice := self chooseItemFrom: labelList title: aString addAllowed: false.
	^ self items indexOf: choice
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'ul 2/27/2017 00:28'
}
ListChooser >> chooseIndexFrom: labelList title: aString addAllowed: aBoolean [
	| choice |
	choice := self chooseItemFrom: labelList title: aString addAllowed: false.
	self addAllowed: aBoolean.
	^ self items indexOf: choice
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'mt 7/14/2016 17:21'
}
ListChooser >> chooseItemFrom: labelList title: aString addAllowed: aBoolean [

	self items: labelList asOrderedCollection.
	self title: aString.
	self addAllowed: aBoolean.

	ToolBuilder open: self.
	^ self result
]

{
	#category : #actions,
	#'squeak_changestamp' : 'mt 7/14/2016 17:23'
}
ListChooser >> closed [
	
	self selectedIndex: 0.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'nice 10/28/2016 00:49'
}
ListChooser >> filterEvent: aKeyboardEvent for: aMorph [

	| char |
	aKeyboardEvent isKeystroke ifFalse: [^ aKeyboardEvent].
	aKeyboardEvent anyModifierKeyPressed ifTrue: [^ aKeyboardEvent].
	
	char := aKeyboardEvent keyCharacter.
	
	char = Character backspace
		ifTrue: [self searchText: (self searchText asString ifNotEmpty: [:s | s allButLast]). ^ aKeyboardEvent ignore].
	char = Character delete
		ifTrue: [self searchText: (self searchText asString ifNotEmpty: [:s | s allButFirst]). ^ aKeyboardEvent ignore].
	(char = Character cr or: [char = Character enter])
		ifTrue: [self accept. aKeyboardEvent ignore].
	char = Character escape 
		ifTrue: [self cancel. aKeyboardEvent ignore].
	(char asInteger between: 32 and: 126)
		ifTrue: [self searchText: self searchText asString, char asString. aKeyboardEvent ignore].
	(char = Character arrowUp or: [char = Character arrowDown
		or: [char = Character pageUp or: [char = Character pageDown
		or: [char = Character home or: [char = Character end]]]]])
		ifTrue: [listMorph keyStroke: aKeyboardEvent. ^aKeyboardEvent ignore].
	
	^ aKeyboardEvent
]

{
	#category : #building,
	#'squeak_changestamp' : 'mt 3/14/2022 14:46'
}
ListChooser >> initialExtent [

	| listFont listStyle itemCount maxItemSize |
	listFont := Preferences standardListFont.
	listStyle := listFont asNewTextStyle.
	itemCount := items size.
	maxItemSize := (items take: 15) inject: 0 into: [:max :item | max max: item asString size].

	^ (listStyle compositionWidthFor: (maxItemSize min: 50 max: 35))
		@ ((ToolBuilder default listHeightFor: (itemCount min: 15 max: 5))
			+ self searchBarHeight
			+ ToolBuilder default dialogSpacing)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 7/14/2016 17:19'
}
ListChooser >> items [

	^ items
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 7/14/2016 17:19'
}
ListChooser >> items: anObject [

	items := anObject
]

{
	#category : #building,
	#'squeak_changestamp' : 'mt 2/9/2022 14:14'
}
ListChooser >> preferredExtent [

	| listFont cellSize |
	listFont := Preferences standardListFont.
	cellSize := (listFont widthOf: $x) @ listFont lineGridForMorphs.
	
	^  ((items inject: 0 into: [:max :item | max max: (listFont widthOfString: item asString)]) + cellSize x "breathing space")
		@ ((ToolBuilder default listHeightFor: items size)
			+ self searchBarHeight
			+ ToolBuilder default dialogSpacing)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 7/14/2016 17:19'
}
ListChooser >> result [

	^ result
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 7/14/2016 17:19'
}
ListChooser >> result: anObject [

	result := anObject
]

{
	#category : #building,
	#'squeak_changestamp' : 'mt 2/7/2022 19:57'
}
ListChooser >> searchBarHeight [

	^ ToolBuilder default inputFieldHeight
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'MAD 3/13/2010 18:56'
}
ListChooser >> searchText [
	^ searchText ifNil: [ searchText := '' ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 10/11/2019 13:16'
}
ListChooser >> searchText: aString [
	searchText := aString.
	listMorph listFilterSet: aString asString.
	
	self changed: #searchText.
	self changed: #canAcceptOrAdd.
	self changed: #acceptLabel.
	self changed: #buttons.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 8/5/2016 09:29'
}
ListChooser >> selectedIndex [
	^ selectedIndex ifNil: [ self items size min: 1 ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 7/21/2016 09:18'
}
ListChooser >> selectedIndex: anInt [
	selectedIndex := anInt.
	self changed: #selectedIndex.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 7/22/2016 10:40'
}
ListChooser >> selectedItem [

	^  self items at: self selectedIndex ifAbsent: []
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 7/19/2016 12:00'
}
ListChooser >> textSelection [
	^ self searchText size +1 to: self searchText size 
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 2/9/2022 14:26'
}
ListChooser >> title [

	^ (title isNil or: [ title isEmpty ])
		ifTrue: [ title := self class defaultTitle ]
		ifFalse: [ title ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'MAD 3/13/2010 18:56'
}
ListChooser >> title: aString [
	title := aString.
]
