"
A pluggable tree morph.
"
Class {
	#name : #PluggableTreeMorph,
	#superclass : #SimpleHierarchicalListMorph,
	#instVars : [
		'rootWrappers',
		'selectedWrapper',
		'getRootsSelector',
		'getChildrenSelector',
		'hasChildrenSelector',
		'getLabelSelector',
		'getIconSelector',
		'getSelectedPathSelector',
		'setSelectedPathSelector',
		'setSelectedParentSelector',
		'getHelpSelector',
		'dropItemSelector',
		'wantsDropSelector',
		'dragItemSelector',
		'dragTypeSelector',
		'nodeClass',
		'lastKeystrokeTime',
		'lastKeystrokes',
		'dragStartedSelector',
		'doubleClickSelector'
	],
	#classVars : [
		'FilterByLabelsOnly',
		'MaximumSearchDepth'
	],
	#category : #'ToolBuilder-Morphic',
	#'squeak_changestamp' : 'ar 2/12/2005 04:38'
}

{
	#category : #preferences,
	#'squeak_changestamp' : 'cmm 4/13/2015 21:33'
}
PluggableTreeMorph class >> filterByLabelsOnly [
	<preference: 'Filterable Trees by labels only'
		category: 'scrolling'
		description: 'When using the Filterable Lists option, set this to only match the labels, not the contents, of hierarchical lists.  Otherwise, search both labels and contents will be matched.'
		type: #Boolean>
	^ FilterByLabelsOnly ifNil: [ false ]
]

{
	#category : #preferences,
	#'squeak_changestamp' : 'cmm 3/10/2015 16:29'
}
PluggableTreeMorph class >> filterByLabelsOnly: aBoolean [
	FilterByLabelsOnly := aBoolean
]

{
	#category : #preferences,
	#'squeak_changestamp' : 'cmm 3/10/2015 16:38'
}
PluggableTreeMorph class >> maximumSearchDepth [
	<preference: 'Maximum tree search depth'
		category: 'scrolling'
		description: 'When using the Filterable Lists option, this specifies the maximum depth that will be searched below the current selection in of the hierarchy.'
		type: #Number>
	^ MaximumSearchDepth ifNil: [ 1 ]
]

{
	#category : #preferences,
	#'squeak_changestamp' : 'mt 3/8/2015 15:59'
}
PluggableTreeMorph class >> maximumSearchDepth: anInteger [
	MaximumSearchDepth := anInteger.
]

{
	#category : #'drag and drop',
	#'squeak_changestamp' : 'mt 11/4/2015 12:30'
}
PluggableTreeMorph >> acceptDroppingMorph: aTransferMorph event: evt [ 

	dropItemSelector ifNil: [^ self].
	potentialDropMorph ifNil: [^ self].
	
	model
		perform: dropItemSelector
		withEnoughArguments: {
			aTransferMorph passenger. 
			potentialDropMorph withoutListWrapper. 
			aTransferMorph shouldCopy.
			aTransferMorph}.

	self resetPotentialDropMorph.
	evt hand releaseMouseFocus: self.
	Cursor normal show
]

{
	#category : #'node access',
	#'squeak_changestamp' : 'ar 2/12/2005 00:19'
}
PluggableTreeMorph >> balloonTextForNode: node [
	getHelpSelector ifNil:[^nil].
	^model perform: getHelpSelector with: node item
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'mt 3/13/2015 09:56'
}
PluggableTreeMorph >> basicKeyPressed: aChar [

	self updateLastKeystrokes: aChar.
	
	model okToChange ifFalse: [^ false].
	
	PluggableListMorph filterableLists
		ifTrue: [self triggerFilterTree]
		ifFalse: [self selectNextMorphByFilter].
	
	^ true
]

{
	#category : #geometry,
	#'squeak_changestamp' : 'cmm 3/31/2015 17:01'
}
PluggableTreeMorph >> bottomVisibleRowIndex [
	| itemAtBottom |
	itemAtBottom := self itemFromPoint: self bottomLeft + (3 @ -3).
	^ itemAtBottom
		ifNil: [ scroller submorphs size ]
		ifNotNil:
			[ : item | scroller submorphs indexOf: item ]
]

{
	#category : #geometry,
	#'squeak_changestamp' : 'cmm 3/31/2015 16:46'
}
PluggableTreeMorph >> charactersOccluded [
	^ self visibleItems
		inject: 0
		into:
			[ : sum : each | sum + each charactersOccluded ]
]

{
	#category : #'node access',
	#'squeak_changestamp' : 'topa 9/23/2016 22:26'
}
PluggableTreeMorph >> contentsOfNode: node [

	| children |
	getChildrenSelector ifNil: [^#()].
	children := model perform: getChildrenSelector with: node item.
	^ self nodesForChildren: children inNode: node

]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'pre 4/26/2017 11:25'
}
PluggableTreeMorph >> doubleClick: evt [

	| aMorph |
	aMorph := self itemFromPoint: evt position.
	self model perform: self doubleClickSelector with: aMorph withoutListWrapper

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'pre 4/26/2017 10:22'
}
PluggableTreeMorph >> doubleClickEnabled [

	^ self doubleClickSelector notNil
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'pre 4/25/2017 11:59'
}
PluggableTreeMorph >> doubleClickSelector [

	^ doubleClickSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'pre 4/25/2017 11:59'
}
PluggableTreeMorph >> doubleClickSelector: anObject [

	doubleClickSelector := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mvdg 2/11/2007 13:53'
}
PluggableTreeMorph >> dragItemSelector [
	^dragItemSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mvdg 2/11/2007 13:53'
}
PluggableTreeMorph >> dragItemSelector: aSymbol [
	dragItemSelector := aSymbol.
	aSymbol ifNotNil:[self dragEnabled: true].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 11/4/2015 14:20'
}
PluggableTreeMorph >> dragStartedSelector [
	^ dragStartedSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 11/4/2015 14:20'
}
PluggableTreeMorph >> dragStartedSelector: aSymbol [
	dragStartedSelector := aSymbol.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 6/10/2015 10:05'
}
PluggableTreeMorph >> dragTypeSelector [
	^dragTypeSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 6/10/2015 10:04'
}
PluggableTreeMorph >> dragTypeSelector: aSymbol [
	dragTypeSelector := aSymbol.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/12/2005 00:26'
}
PluggableTreeMorph >> dropItemSelector [
	^dropItemSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mvdg 2/9/2007 21:37'
}
PluggableTreeMorph >> dropItemSelector: aSymbol [
	dropItemSelector := aSymbol.
	aSymbol ifNotNil:[self dropEnabled: true].
]

{
	#category : #'node access',
	#'squeak_changestamp' : 'ar 2/12/2005 00:20'
}
PluggableTreeMorph >> dropNode: srcNode on: dstNode [
	dropItemSelector ifNil:[^nil].
	model perform: dropItemSelector with: srcNode item with: dstNode item
]

{
	#category : #filtering,
	#'squeak_changestamp' : 'cmm 4/1/2015 14:02'
}
PluggableTreeMorph >> filterTree [
	self hasFilter ifFalse:
		[ self removeFilter.
		^ self ].
	self indicateFiltered.
	"Clean up the tree."
	(self selectedMorph
		ifNil: [ self roots ]
		ifNotNil:
			[ : m | {m} ]) do:
		[ : item | | filteredItems |
		item applyFilter: lastKeystrokes.
		item visible ifFalse:
			[ "Do not hide the item where the filter is based on."
			item show.
			item isExpanded ifFalse: [ item toggleExpandedState ] ].
		filteredItems := self filteredItems.
		"If configured as a navigation tool, advance the selection."
		(PluggableTreeMorph maximumSearchDepth = 1 and: [ PluggableTreeMorph filterByLabelsOnly not ]) ifTrue:
			[ |toBeExpanded|
			(filteredItems notEmpty and: [ selectedMorph ~= filteredItems last ]) ifTrue:
				[ self setSelectedMorph:
					(toBeExpanded := selectedMorph
						ifNil: [ filteredItems first ]
						ifNotNil: [ filteredItems after: selectedMorph ]).
				toBeExpanded isExpanded ifFalse: [ toBeExpanded toggleExpandedState ] ] ] ].
	self adjustSubmorphPositions
]

{
	#category : #filtering,
	#'squeak_changestamp' : 'cmm 3/31/2015 20:44'
}
PluggableTreeMorph >> filteredItems [
	"Answer the items which visible because they matched the current filters."
	^ self items select: [ : each | each visible ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/12/2005 00:24'
}
PluggableTreeMorph >> getChildrenSelector [
	^getChildrenSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/12/2005 00:24'
}
PluggableTreeMorph >> getChildrenSelector: aSymbol [
	getChildrenSelector := aSymbol.
]

{
	#category : #selection,
	#'squeak_changestamp' : 'mt 3/7/2015 12:22'
}
PluggableTreeMorph >> getCurrentSelectionItem [
	"Our models are supposed to return real objects, not wrappers. See PluggableTreeItemNode."
	
	| selectedObject |
	selectedObject := self getSelectedSelector
		ifNil: [^ nil]
		ifNotNil: [:symbol | model perform: symbol].
	^ scroller submorphs
		detect: [:each | each complexContents item == selectedObject]
		ifFound: [:each | each complexContents]
		ifNone: [nil]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/12/2005 00:26'
}
PluggableTreeMorph >> getHelpSelector [
	^getHelpSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/12/2005 00:26'
}
PluggableTreeMorph >> getHelpSelector: aSymbol [
	getHelpSelector := aSymbol
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/12/2005 00:25'
}
PluggableTreeMorph >> getIconSelector [
	^getIconSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/12/2005 00:25'
}
PluggableTreeMorph >> getIconSelector: aSymbol [
	getIconSelector := aSymbol
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/12/2005 00:25'
}
PluggableTreeMorph >> getLabelSelector [
	^getLabelSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/12/2005 00:25'
}
PluggableTreeMorph >> getLabelSelector: aSymbol [
	getLabelSelector := aSymbol
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/12/2005 00:57'
}
PluggableTreeMorph >> getMenuSelector [
	^getMenuSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/12/2005 00:57'
}
PluggableTreeMorph >> getMenuSelector: aSymbol [
	getMenuSelector := aSymbol
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/12/2005 00:24'
}
PluggableTreeMorph >> getRootsSelector [
	^getRootsSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/12/2005 00:24'
}
PluggableTreeMorph >> getRootsSelector: aSelector [
	getRootsSelector := aSelector.
	self update: getRootsSelector.
]

{
	#category : #selection,
	#'squeak_changestamp' : 'mt 11/15/2019 15:03'
}
PluggableTreeMorph >> getSelectedPath [
	
	^ self getSelectedPathSelector ifNotNil: [:sel | model perform: sel]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/12/2005 03:33'
}
PluggableTreeMorph >> getSelectedPathSelector [
	^getSelectedPathSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 11/15/2019 15:25'
}
PluggableTreeMorph >> getSelectedPathSelector: aSymbol [
	getSelectedPathSelector := aSymbol.
	self update: getSelectedPathSelector.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 3/7/2015 09:00'
}
PluggableTreeMorph >> getSelectedSelector [
	^getSelectionSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 11/15/2019 15:26'
}
PluggableTreeMorph >> getSelectedSelector: aSymbol [
	getSelectionSelector := aSymbol.
	self update: getSelectionSelector.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/12/2005 00:24'
}
PluggableTreeMorph >> hasChildrenSelector [
	^hasChildrenSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/12/2005 00:25'
}
PluggableTreeMorph >> hasChildrenSelector: aSymbol [
	hasChildrenSelector := aSymbol
]

{
	#category : #filtering,
	#'squeak_changestamp' : 'mt 3/8/2015 16:15'
}
PluggableTreeMorph >> hasFilter [
	^ lastKeystrokes isEmptyOrNil not
]

{
	#category : #'node access',
	#'squeak_changestamp' : 'ar 2/12/2005 00:11'
}
PluggableTreeMorph >> hasNodeContents: node [
	hasChildrenSelector ifNil:[^node contents isEmpty not].
	^model perform: hasChildrenSelector with: node item
]

{
	#category : #'node access',
	#'squeak_changestamp' : 'ar 2/12/2005 00:20'
}
PluggableTreeMorph >> iconOfNode: node [
	getIconSelector ifNil:[^nil].
	^model perform: getIconSelector with: node item
]

{
	#category : #filtering,
	#'squeak_changestamp' : 'mt 3/9/2015 07:57'
}
PluggableTreeMorph >> indicateFiltered [
	"self color: (Color gray: 0.95)."
]

{
	#category : #filtering,
	#'squeak_changestamp' : 'cbc 2/6/2017 11:12'
}
PluggableTreeMorph >> indicateUnfiltered [
	self color: (self userInterfaceTheme color ifNil: [Color white]).
	scroller submorphsDo: [:m |
		m visible: true; backgroundColor: nil].
	self adjustSubmorphPositions.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mt 3/8/2015 16:18'
}
PluggableTreeMorph >> initialize [

	super initialize.
	
	"Filter"
	lastKeystrokeTime := 0.
	lastKeystrokes := ''
]

{
	#category : #'node access',
	#'squeak_changestamp' : 'topa 9/23/2016 22:25'
}
PluggableTreeMorph >> instantiateNodeWithContents: item index: aNumber parent: anObject [

	^ (self nodeClass with: item model: self)
		index: aNumber;
		parent: anObject
]

{
	#category : #'node access',
	#'squeak_changestamp' : 'ar 2/12/2005 00:02'
}
PluggableTreeMorph >> isDraggableNode: node [
	^true
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'cmm 3/31/2015 15:30'
}
PluggableTreeMorph >> items [
	^ scroller submorphs
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'mt 3/8/2015 16:01'
}
PluggableTreeMorph >> keyStroke: event [

	^ (super keyStroke: event)
		ifTrue: [true]
		ifFalse: [self basicKeyPressed: event keyCharacter].
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'mt 4/9/2015 13:48'
}
PluggableTreeMorph >> keyboardFocusChange: aBoolean [ 
	aBoolean ifFalse:
		[ PluggableListMorph clearFilterAutomatically ifTrue:
			[ self hasFilter ifTrue: [ self removeFilter ] ] ].
	super keyboardFocusChange: aBoolean.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/12/2005 00:58'
}
PluggableTreeMorph >> keystrokeActionSelector [
	^keystrokeActionSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/12/2005 00:58'
}
PluggableTreeMorph >> keystrokeActionSelector: aSymbol [
	keystrokeActionSelector := aSymbol
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'pre 4/26/2017 10:42'
}
PluggableTreeMorph >> mouseDown: evt [
	| aMorph selectors |
	
	aMorph := self itemFromPoint: evt position.
	evt yellowButtonPressed  "First check for option (menu) click"
		ifTrue: [
			(PluggableListMorph menuRequestUpdatesSelection and: [model okToChange]) ifTrue: [
				aMorph == selectedMorph 
					ifFalse: [self setSelectedMorph: aMorph]].
			^ self yellowButtonActivity: evt shiftPressed].
	(aMorph notNil and:[aMorph inToggleArea: (aMorph point: evt position from: self)])
		ifTrue:[^self toggleExpandedState: aMorph event: evt]. 
	aMorph ifNil:[^super mouseDown: evt].
	
	aMorph highlightForMouseDown.
	self setProperty: #highlightedMorph toValue: aMorph.
	
	selectors := Array 
		with: #click:
		with: (self doubleClickEnabled ifTrue: [#doubleClick:] ifFalse: [nil])
		with: nil
		with: (self dragEnabled ifTrue:[#startDrag:] ifFalse:[nil]).
	evt hand waitForClicksOrDrag: self event: evt selectors: selectors threshold: HandMorph dragThreshold "pixels".
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 3/6/2015 16:24'
}
PluggableTreeMorph >> nodeClass [
	^ nodeClass ifNil: [PluggableTreeItemNode]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 3/6/2015 16:25'
}
PluggableTreeMorph >> nodeClass: aListWrapperClass [
	nodeClass := aListWrapperClass.
]

{
	#category : #'node access',
	#'squeak_changestamp' : 'mt 10/14/2020 13:46'
}
PluggableTreeMorph >> nodesForChildren: aCollection inNode: anObject [

	^ aCollection isSequenceable
		ifTrue: [aCollection withIndexCollect: 
			[:item :index |
				self instantiateNodeWithContents: item index: index parent: anObject]]
		ifFalse: [ | count |
			count := 0. "artificial index."
			aCollection collect: 
				[:item |
					count := count + 1.
					self instantiateNodeWithContents: item index: count parent: anObject]]
]

{
	#category : #'node access',
	#'squeak_changestamp' : 'ar 2/12/2005 00:20'
}
PluggableTreeMorph >> printNode: node [
	getLabelSelector ifNil:[^node item printString].
	^model perform: getLabelSelector with: node item
]

{
	#category : #filtering,
	#'squeak_changestamp' : 'mt 3/8/2015 16:38'
}
PluggableTreeMorph >> removeFilter [
	lastKeystrokes := String empty.
	self indicateUnfiltered.
]

{
	#category : #filtering,
	#'squeak_changestamp' : 'mt 3/8/2015 16:21'
}
PluggableTreeMorph >> selectNextMorphByFilter [
]

{
	#category : #selection,
	#'squeak_changestamp' : 'mt 11/15/2019 15:05'
}
PluggableTreeMorph >> selectPath: path [

	self
		selectPath: path
		in: (scroller submorphs at: 1 ifAbsent: [^self]).
]

{
	#category : #selection,
	#'squeak_changestamp' : 'mt 11/15/2019 15:04'
}
PluggableTreeMorph >> selectPath: path in: listItem [
	path ifNil: [^self].
	path isEmpty ifTrue: [^self setSelectedMorph: nil].
	listItem withSiblingsDo: [:each | 
		(each complexContents item = path first) ifTrue: [
			each isExpanded ifFalse: [
				each toggleExpandedState.
				self adjustSubmorphPositions.
			].
			each changed.
			path size = 1 ifTrue: [
				^self setSelectedMorph: each
			].
			each firstChild ifNil: [^self setSelectedMorph: nil].
			^self selectPath: path allButFirst in: each firstChild
		].
	].
	^self setSelectedMorph: nil


]

{
	#category : #selection,
	#'squeak_changestamp' : 'mt 8/2/2016 14:08'
}
PluggableTreeMorph >> selectedMorph: aMorph [

	super selectedMorph: aMorph.
		
	"If the update came from the model, make my state consistent again."
	selectedWrapper := aMorph complexContents.
	self setSelectedParentMorph: aMorph.
]

{
	#category : #selection,
	#'squeak_changestamp' : 'pre 4/24/2018 10:22'
}
PluggableTreeMorph >> setSelectedMorph: aMorph [
	
	selectedWrapper := aMorph complexContents.
	
	"Let the model now about the selected object, not wrapper."
	setSelectionSelector ifNotNil: [:symbol |
		model 
			perform: symbol 
			with: (selectedWrapper ifNotNil: [:w | w item])].
		
	self setSelectedParentMorph: aMorph.
	self setSelectedPath: aMorph.
]

{
	#category : #selection,
	#'squeak_changestamp' : 'mt 8/2/2016 14:03'
}
PluggableTreeMorph >> setSelectedParentMorph: aMorph [

	"The model may not have access to the parent object in terms of this tree structure."
	setSelectedParentSelector ifNotNil: [:symbol |
		model
			perform: symbol
			with: (selectedWrapper ifNotNil: [:w | w parent ifNotNil: [:pw | pw item]])].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 3/7/2015 09:30'
}
PluggableTreeMorph >> setSelectedParentSelector [
	^ setSelectedParentSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 3/7/2015 09:30'
}
PluggableTreeMorph >> setSelectedParentSelector: aSymbol [
	setSelectedParentSelector := aSymbol.
]

{
	#category : #selection,
	#'squeak_changestamp' : 'pre 4/24/2018 14:11'
}
PluggableTreeMorph >> setSelectedPath: aMorph [

	| items wrapperPath |
	setSelectedPathSelector ifNotNil: [:setSelectedPathSelector |
		wrapperPath := selectedWrapper 
			ifNil: [#()]
			ifNotNil: [
				wrapperPath := {selectedWrapper} asOrderedCollection.
				[wrapperPath last parent notNil] 
					whileTrue: [wrapperPath addLast: wrapperPath last parent].
				wrapperPath].
		items := wrapperPath collect: [:w | w item].
		model
			perform: setSelectedPathSelector
			with: items].
			

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'pre 4/24/2018 10:23'
}
PluggableTreeMorph >> setSelectedPathSelector [
	^ setSelectedPathSelector

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'pre 4/24/2018 10:23'
}
PluggableTreeMorph >> setSelectedPathSelector: aSymbol [
	setSelectedPathSelector := aSymbol.

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 3/7/2015 08:59'
}
PluggableTreeMorph >> setSelectedSelector [
	^setSelectionSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 3/7/2015 08:59'
}
PluggableTreeMorph >> setSelectedSelector: aSymbol [
	setSelectionSelector := aSymbol
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'mt 3/8/2015 16:38'
}
PluggableTreeMorph >> specialKeyPressed: asciiValue [

	(super specialKeyPressed: asciiValue)
		ifTrue: [^ true].
		
	(#(8 13) includes: asciiValue) ifTrue: [
		"backspace key" 
		self removeFilter.
		^ true].

	^ false
]

{
	#category : #'drag and drop',
	#'squeak_changestamp' : 'mt 11/4/2015 18:40'
}
PluggableTreeMorph >> startDrag: evt [ 
	
	| itemMorph |
	self dragItemSelector ifNil: [^ self].
	evt hand hasSubmorphs ifTrue: [^ self].
	self model okToChange ifFalse: [^ self].
	
	itemMorph := scroller submorphs
		detect: [:any | any highlightedForMouseDown]
		ifNone: [^ self].

	"Prepare visuals."
	itemMorph highlightForMouseDown: false.
	self setSelectedMorph: itemMorph.

	[ "Initiate drag."
		(self model perform: self dragItemSelector with: itemMorph withoutListWrapper) ifNotNil: [:passenger | | ddm |
			ddm := (self valueOfProperty: #dragTransferClass ifAbsent: [TransferMorph]) withPassenger: passenger from: self.
			ddm dragTransferType: (self dragTypeSelector ifNotNil: [:s | self model perform: s with: itemMorph withoutListWrapper]).
			ddm updateFromUserInputEvent: evt.
			self dragStartedSelector ifNotNil: [:s | self model perform: s with: itemMorph with: ddm].
			evt hand grabMorph: ddm].
	] ensure: [
		Cursor normal show.
		evt hand releaseMouseFocus: self].
]

{
	#category : #geometry,
	#'squeak_changestamp' : 'cmm 3/31/2015 15:24'
}
PluggableTreeMorph >> topVisibleRowIndex [
	^ scroller submorphs indexOf: (self itemFromPoint: self topLeft+(3@3))
]

{
	#category : #filtering,
	#'squeak_changestamp' : 'mt 3/13/2015 09:56'
}
PluggableTreeMorph >> triggerFilterTree [

	self removeAlarm: #filterTree.
	self addAlarm: #filterTree after: 300.
]

{
	#category : #updating,
	#'squeak_changestamp' : 'mt 11/15/2019 15:05'
}
PluggableTreeMorph >> update: what [
	what ifNil:[^self].
	what == getRootsSelector ifTrue:[
		self wrapRoots: (model perform: getRootsSelector).
		^ self].
	
	what == getSelectedPathSelector ifTrue:[
		self selectPath: self getSelectedPath.
		^ self].
		
	what == #expandRootsRequested ifTrue: [
		self expandRoots.
		^ self].
	
	super update: what.

]

{
	#category : #updating,
	#'squeak_changestamp' : 'mt 3/7/2015 11:29'
}
PluggableTreeMorph >> update: what with: anObject [

	super update: what with: anObject.
	
	what == #objectChanged ifTrue: [
		self updateFromChangedObject: anObject].
]

{
	#category : #updating,
	#'squeak_changestamp' : 'mt 3/7/2015 11:50'
}
PluggableTreeMorph >> updateFromChangedObject: anObject [

	scroller submorphs
		detect: [:morph | morph complexContents item == anObject]
		ifFound: [:morph | self updateMorph: morph]
		ifNone: ["Ignore the request. Object may not be visible anyway."].
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'mt 3/8/2015 16:35'
}
PluggableTreeMorph >> updateLastKeystrokes: aChar [

	| milliseconds slowKeyStroke |
	milliseconds := Time millisecondClockValue.
	slowKeyStroke := (Time milliseconds: milliseconds since: lastKeystrokeTime)
		> (PluggableListMorph filterableLists ifTrue: [ 500 ] ifFalse: [ 300 ]).
	lastKeystrokeTime := milliseconds.
	
	slowKeyStroke
		ifTrue: [lastKeystrokes := aChar asLowercase asString]
		ifFalse: [lastKeystrokes := lastKeystrokes , aChar asLowercase asString.].
]

{
	#category : #updating,
	#'squeak_changestamp' : 'mt 3/7/2015 11:54'
}
PluggableTreeMorph >> updateMorph: morph [

	morph complexContents refresh.
	morph refresh.
	
	morph isExpanded
		ifFalse: [self changed]
		ifTrue: [
			morph
				toggleExpandedState;
				toggleExpandedState.
			self adjustSubmorphPositions].

]

{
	#category : #'node access',
	#'squeak_changestamp' : 'mt 3/7/2015 11:03'
}
PluggableTreeMorph >> updateNode: node [

]

{
	#category : #geometry,
	#'squeak_changestamp' : 'cmm 4/1/2015 15:01'
}
PluggableTreeMorph >> visibleItems [
	^ self items ifNotEmpty:
		[ : items | items
			copyFrom: self topVisibleRowIndex
			to: self bottomVisibleRowIndex ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/12/2005 00:26'
}
PluggableTreeMorph >> wantsDropSelector [
	^wantsDropSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/12/2005 00:27'
}
PluggableTreeMorph >> wantsDropSelector: aSymbol [
	wantsDropSelector := aSymbol
]

{
	#category : #'drag and drop',
	#'squeak_changestamp' : 'ct 8/20/2020 19:06'
}
PluggableTreeMorph >> wantsDroppedMorph: aTransferMorph event: anEvent [

	dropItemSelector ifNil: [^ false].
	wantsDropSelector ifNil: [^ true].

	aTransferMorph isTransferMorph ifFalse: [^ false].

	^ model perform: wantsDropSelector withEnoughArguments: {
		aTransferMorph passenger.
		aTransferMorph dragTransferType.
		aTransferMorph source.
		aTransferMorph}
]

{
	#category : #'node access',
	#'squeak_changestamp' : 'ar 7/15/2005 12:11'
}
PluggableTreeMorph >> wantsDroppedNode: srcNode on: dstNode [
	dropItemSelector ifNil:[^false].
	wantsDropSelector ifNil:[^true].
	^(model perform: wantsDropSelector with: srcNode with: dstNode) == true
]

{
	#category : #updating,
	#'squeak_changestamp' : 'mt 3/7/2015 10:37'
}
PluggableTreeMorph >> wrapRoots: someObjects [

	rootWrappers := someObjects collect: [:item|
		self nodeClass with: item model: self].
	self list: rootWrappers.
]
