"
The Morphic tool builder.
"
Class {
	#name : #MorphicToolBuilder,
	#superclass : #ToolBuilder,
	#instVars : [
		'widgets',
		'panes',
		'parentMenu'
	],
	#classVars : [
		'ButtonBorderWidth',
		'ButtonMargins',
		'ListBorderWidth',
		'ListMargins',
		'TextBorderWidth',
		'TextMargins'
	],
	#category : #'ToolBuilder-Morphic',
	#'squeak_changestamp' : 'ar 2/11/2005 15:02'
}

{
	#category : #preferences,
	#'squeak_changestamp' : 'mt 2/11/2022 11:39'
}
MorphicToolBuilder class >> applyUserInterfaceTheme [

	TextBorderWidth := nil.
	ListBorderWidth := nil.
	ButtonBorderWidth := nil.
	
	TextMargins := nil.
	ListMargins := nil.
	ButtonMargins := nil.
]

{
	#category : #services,
	#'squeak_changestamp' : 'mt 5/4/2016 13:21'
}
MorphicToolBuilder class >> getBoundsForWindow: morph [

	^ morph bounds
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/11/2005 15:24'
}
MorphicToolBuilder class >> isActiveBuilder [
	"Answer whether I am the currently active builder"
	^Smalltalk isMorphic
]

{
	#category : #services,
	#'squeak_changestamp' : 'mt 5/4/2016 13:21'
}
MorphicToolBuilder class >> setBoundsForWindow: morph to: rectangle [

	^ morph bounds: rectangle
]

{
	#category : #preferences,
	#'squeak_changestamp' : 'mt 2/11/2022 10:57'
}
MorphicToolBuilder class >> themePriority [

	^ 65
]

{
	#category : #preferences,
	#'squeak_changestamp' : 'mt 2/11/2022 11:38'
}
MorphicToolBuilder class >> themeProperties [
	"Let theme switches clear my cache. See #applyUserInterfaceTheme."
	
	^ {
		{ #textBorderWidth. 'tool construction'. ''}.
		{ #listBorderWidth. 'tool construction'. ''}.
		{ #buttonBorderWidth. 'tool construction'. ''}.
		{ #textMargins. 'tool construction'. ''}.
		{ #listMargins. 'tool construction'. ''}.
		{ #buttonMargins. 'tool construction'. ''}.
	}
]

{
	#category : #private,
	#'squeak_changestamp' : 'mt 4/28/2015 15:01'
}
MorphicToolBuilder >> add: aMorph to: aParent [
	
	aMorph layoutFrame
		ifNotNil: [aParent addMorph: aMorph fullFrame: aMorph layoutFrame]
		ifNil: [aParent addMorphBack: aMorph].
]

{
	#category : #'widget classes',
	#'squeak_changestamp' : 'cmm 3/2/2010 17:19'
}
MorphicToolBuilder >> alternateMultiSelectListClass [
	^ AlternatePluggableListMorphOfMany 
]

{
	#category : #updating,
	#'squeak_changestamp' : 'mt 2/11/2022 10:47'
}
MorphicToolBuilder >> applyUserInterfaceTheme [
	"See class side."
]

{
	#category : #private,
	#'squeak_changestamp' : 'stephaneducasse 2/3/2006 22:35'
}
MorphicToolBuilder >> asFrame: aRectangle [
	| frame |
	aRectangle ifNil:[^nil].
	frame := LayoutFrame new.
	frame 
		leftFraction: aRectangle left; 
		rightFraction: aRectangle right; 
		topFraction: aRectangle top; 
		bottomFraction: aRectangle bottom.
	^frame
]

{
	#category : #private,
	#'squeak_changestamp' : 'mt 3/30/2015 09:12'
}
MorphicToolBuilder >> buildHelpFor: widget spec: aSpec [
	aSpec help ifNotNil: [:stringOrSymbol |
		stringOrSymbol isSymbol
			ifTrue: [widget balloonTextSelector: stringOrSymbol]
			ifFalse: [widget balloonText: stringOrSymbol]].
]

{
	#category : #'widgets optional',
	#'squeak_changestamp' : 'mt 3/5/2020 10:35'
}
MorphicToolBuilder >> buildPluggableAlternateMultiSelectionList: aSpec [
	| listMorph listClass |
	aSpec getSelected ifNotNil: [ ^ self error: 'There is no PluggableAlternateListMorphOfManyByItem' ].
	listClass := self alternateMultiSelectListClass.
	listMorph := listClass 
		on: aSpec model
		list: aSpec list
		primarySelection: aSpec getIndex
		changePrimarySelection: aSpec setIndex
		listSelection: aSpec getSelectionList
		changeListSelection: aSpec setSelectionList
		menu: aSpec menu.
	listMorph
		setProperty: #highlightSelector toValue: #highlightMessageList:with: ;
		enableDragNDrop: SystemBrowser browseWithDragNDrop ;
		menuTitleSelector: #messageListSelectorTitle.
	self 
		register: listMorph
		id: aSpec name.
	listMorph
		keystrokeActionSelector: aSpec keyPress ;
		getListElementSelector: aSpec listItem ;
		getListSizeSelector: aSpec listSize;
		getIconSelector: aSpec icon;
		getHelpSelector: aSpec helpItem.
		
	self buildHelpFor: listMorph spec: aSpec.
		
	self 
		setFrame: aSpec frame 
		in: listMorph.
	self setLayoutHintsFor: listMorph spec: aSpec.
	parent ifNotNil: [ self add: listMorph to: parent ].
	panes ifNotNil: [ aSpec list ifNotNil:[panes add: aSpec list ] ].
	^ listMorph
]

{
	#category : #'widgets required',
	#'squeak_changestamp' : 'nice 6/10/2017 17:33'
}
MorphicToolBuilder >> buildPluggableButton: aSpec [
	| widget label state action enabled |
	label := aSpec label.
	state := aSpec state.
	action := aSpec action.
	widget := self buttonClass on: aSpec model
				getState: (state isSymbol ifTrue:[state])
				action: nil
				label: (label isSymbol ifTrue:[label]).
	widget style: aSpec style.
	aSpec changeLabelWhen
		ifNotNil: [ :event | widget whenChanged: event update: aSpec label].
	self register: widget id: aSpec name.
	enabled := aSpec enabled.
	enabled isSymbol
		ifTrue:[widget getEnabledSelector: enabled]
		ifFalse:[widget enabled:enabled].
	widget action: action.
	aSpec color isColor
		ifTrue: [widget offColor: aSpec color]
		ifFalse: [widget getColorSelector: aSpec color].
	self buildHelpFor: widget spec: aSpec. 
	(label isSymbol or:[label == nil]) ifFalse:[widget label: label].
	self setFrame: aSpec frame in: widget.
	self setLayoutHintsFor: widget spec: aSpec.
	parent ifNotNil:[self add: widget to: parent].
	^widget
]

{
	#category : #'widgets optional',
	#'squeak_changestamp' : 'fn 7/19/2019 13:11'
}
MorphicToolBuilder >> buildPluggableCheckBox: spec [

	| widget label state action |
	label := spec label.
	state := spec state.
	action := spec action.
	widget := self checkBoxClass on: spec model
				getState: (state isSymbol ifTrue:[state])
				action: (action isSymbol ifTrue:[action])
				label: (label isSymbol ifTrue:[label]).
	self register: widget id: spec name.

	widget installButton.
	spec color ifNotNil: [:c | widget color: c].
	self setFrame: spec frame in: widget.
	self setLayoutHintsFor: widget spec: spec.
	parent ifNotNil: [:p | self add: widget to: p].
	^widget
]

{
	#category : #'widgets optional',
	#'squeak_changestamp' : 'mt 4/7/2022 09:49'
}
MorphicToolBuilder >> buildPluggableCodePane: aSpec [

	| widget |
	widget := super buildPluggableCodePane: aSpec.
	
	"Override code-specific default properties."
	widget wantsWrapBorder: PluggableTextMorph visualWrapBorder.
	PluggableTextMorph softLineWrapAtVisualWrapBorder
		ifTrue: [widget averageLineLength: PluggableTextMorph visualWrapBorderLimit].
	widget wrapFlag: (aSpec softLineWrap ifNil: [PluggableTextMorph softLineWrap]).
	^ widget
]

{
	#category : #'widgets optional',
	#'squeak_changestamp' : 'mt 4/7/2022 09:49'
}
MorphicToolBuilder >> buildPluggableDialog: aSpec [

	| widget |

	widget := self dialogClass new.
	self register: widget id: aSpec name.
	
	widget model: aSpec model.

	"Set child dependent layout properties. The pane morph holds the special contents."
	widget paneMorph wantsPaneSplitters: (aSpec wantsResizeHandles ifNil: [true]).
	self setLayoutHintsFor: widget paneMorph spec: aSpec.
	widget paneMorph layoutInset: (aSpec padding ifNil: [self dialogPadding]).
	widget morphicLayerNumber: widget class dialogLayer.

	"Performance. Flip the #wantsPaneSplitters flag only after all children where added."
	widget paneMorph cellGap: 0.
	widget paneMorph wantsPaneSplitters: false; wantsGrips: false.
	widget paneMorph removePaneSplitters; removeGrips.

	"Now create the children."
	panes := OrderedCollection new.
	aSpec children isSymbol
		ifTrue: [
			widget getChildrenSelector: aSpec children.
			widget update: aSpec children]
		ifFalse: [
			self buildAll: aSpec children in: widget paneMorph].

	"Avoid strange behavior in #addMorph:fullFrame:"
	widget paneMorph cellGap: (aSpec spacing ifNil: [self dialogSpacing]).
	widget paneMorph wantsPaneSplitters: (aSpec wantsResizeHandles ifNil: [true]).
	widget paneMorph wantsPaneSplitters ifTrue: [
		widget paneMorph wantsGrips: true.	
		widget paneMorph addPaneSplitters; addCornerGrips"; addEdgeGrips".
		widget paneMorph grips do: [:ea | ea showHandle: true]].

	"Increase the line width of the dialog's message to allow that longer messages accompany complex paneMorph contents."
	widget messageMorph averageLineLength: 65.

	"Now create the buttons."
	aSpec buttons isSymbol
		ifTrue: [
			widget getButtonsSelector: aSpec buttons.
			widget update: aSpec buttons]
		ifFalse: [
			self buildAll: aSpec buttons in: widget buttonRowMorph.
			widget updateButtonProperties].

	aSpec title ifNotNil: [:label |
		label isSymbol 
			ifTrue:[widget getTitleSelector: label; update: label]
			ifFalse:[widget title: label]].
	aSpec message ifNotNil: [:label |
		label isSymbol 
			ifTrue:[widget getMessageSelector: label; update: label]
			ifFalse:[widget message: label]].
	
	"Interaction behavior."
	aSpec autoCancel ifNotNil: [:b | widget autoCancel: b].
	aSpec exclusive ifNotNil: [:b | widget exclusive: b].
		
	widget closeDialogSelector: aSpec closeAction.
	self buildHelpFor: widget spec: aSpec. 

	"Everything is shrink-wrapped around the pane morph."
	widget paneMorph extent: (aSpec extent ifNil:[widget initialExtent])
		+ (widget paneMorph layoutInset * 2) asPoint.

	^ widget
]

{
	#category : #'widgets optional',
	#'squeak_changestamp' : 'mt 4/24/2015 10:29'
}
MorphicToolBuilder >> buildPluggableDropDownList: spec [

	| widget model listSelector selectionSelector selectionSetter |
	model := spec model.
	listSelector := spec listSelector.
	selectionSelector := spec selectionSelector.
	selectionSetter := spec selectionSetter.
	widget := self dropDownListClass new
		model: model;
		listSelector: listSelector;
		selectionSelector: selectionSelector;
		selectionSetter: selectionSetter;
		yourself.
	self register: widget id: spec name.

	widget installDropDownList.
	self setFrame: spec frame in: widget.
	self setLayoutHintsFor: widget spec: spec.
	parent ifNotNil:[self add: widget to: parent].
	^widget
]

{
	#category : #'widgets required',
	#'squeak_changestamp' : 'Alex M 6/21/2024 18:55'
}
MorphicToolBuilder >> buildPluggableImageButton: aSpec [
	| widget project |
	project := aSpec project.
	widget := GMTEImageButton new
		target: aSpec model;
		actionSelector: aSpec action;
		createStateImagesFrom: ((GitAssetLoader for: project) loadForm: aSpec path) copy.	
	
	self register: widget id: aSpec name.
	widget setImageMode: #unpressed.
	
	aSpec arguments
		ifNotNil: [widget arguments: aSpec arguments].
	self buildHelpFor: widget spec: aSpec. 
	self setFrame: aSpec frame in: widget.
	self setLayoutHintsFor: widget spec: aSpec.
	parent ifNotNil:[self add: widget to: parent].
	^widget
]

{
	#category : #'widgets optional',
	#'squeak_changestamp' : 'mt 4/27/2015 15:46'
}
MorphicToolBuilder >> buildPluggableInputField: aSpec [
	| widget |
	widget := self buildPluggableText: aSpec.
	widget minimumHeight: 0.
	widget acceptOnCR: true.
	widget hideScrollBarsIndefinitely.
	^widget
]

{
	#category : #'widgets required',
	#'squeak_changestamp' : 'mt 3/4/2021 15:01'
}
MorphicToolBuilder >> buildPluggableList: aSpec [
	| widget listClass getIndex setIndex |
	aSpec getSelected ifNil:[
		listClass := self listClass.
		getIndex := aSpec getIndex.
		setIndex := aSpec setIndex.
	] ifNotNil:[
		listClass := self listByItemClass.
		getIndex := aSpec getSelected.
		setIndex := aSpec setSelected.
	].
	widget := listClass on: aSpec model
				list: aSpec list
				selected: getIndex
				changeSelected: setIndex
				menu: aSpec menu
				keystroke: aSpec keyPress.
	self register: widget id: aSpec name.
	
	widget
		dragItemSelector: aSpec dragItem;
		dropItemSelector: aSpec dropItem;
		wantsDropSelector: aSpec dropAccept;
		dragStartedSelector: aSpec dragStarted;
		dragTypeSelector: aSpec dragType.

	self setListPropertiesFor: widget spec: aSpec.
	^widget
]

{
	#category : #'widgets required',
	#'squeak_changestamp' : 'Igor.Stasenko 1/17/2010 04:20'
}
MorphicToolBuilder >> buildPluggableMenu: menuSpec [ 
	| prior menu |
	prior := parentMenu.
	parentMenu := menu := self menuClass new.
	menuSpec label ifNotNil:[parentMenu addTitle: menuSpec label].
	menuSpec items do:[:each| each buildWith: self].
	parentMenu := prior.
	^menu
]

{
	#category : #'widgets required',
	#'squeak_changestamp' : 'fbs 6/18/2013 17:31'
}
MorphicToolBuilder >> buildPluggableMenuItem: itemSpec [
	| item action label menu |
	item := self menuItemClass new.
	label := (itemSpec isCheckable
		ifTrue: [	itemSpec checked ifTrue: ['<on>'] ifFalse: ['<off>']]
		ifFalse: ['']), itemSpec label.
	item contents: label.
	item isEnabled: itemSpec enabled.
	(action := itemSpec action) ifNotNil:[
		item 
			target: action receiver;
			selector: action selector;
			arguments: action arguments.
	].
	(menu := itemSpec subMenu) ifNotNil:[
		item subMenu: (menu buildWith: self).
	].
	parentMenu ifNotNil:[parentMenu addMorphBack: item].
	itemSpec separator ifTrue:[parentMenu addLine].
	^item
]

{
	#category : #'widgets required',
	#'squeak_changestamp' : 'ct 6/15/2021 14:36'
}
MorphicToolBuilder >> buildPluggableMultiColumnList: aSpec [

	| widget listClass getIndex setIndex |
	aSpec getSelected
		ifNil: [
			listClass := self multiColumnListClass.
			getIndex := aSpec getIndex.
			setIndex := aSpec setIndex]
		ifNotNil: [
			listClass := self multiColumnListByItemClass.
			getIndex := aSpec getSelected.
			setIndex := aSpec setSelected].
	widget := listClass
		on: aSpec model
		list: aSpec list
		selected: getIndex
		changeSelected: setIndex
		menu: aSpec menu
		keystroke: aSpec keyPress.
	self register: widget id: aSpec name.
	
	"	widget
		dragItemSelector: aSpec dragItem;
		dropItemSelector: aSpec dropItem;
		wantsDropSelector: aSpec dropAccept;
		dragStartedSelector: aSpec dragStarted."
	
	self setListPropertiesFor: widget spec: aSpec.
	
	"Be sure to enable the horizontal scrollbar if not all columns are #spaceFill."
	(aSpec columnResizings anySatisfy: [:sym | sym ~= #spaceFill]) ifTrue: [widget hScrollBarPolicy: #whenNeeded].
	
	widget
		cellPositioningForColumns: aSpec itemAlignments;
		cellInsetForColumns: aSpec itemPaddings;
		hResizingForColumns: aSpec columnResizings;
		spaceFillWeightForColumns: aSpec columnSpaceFillWeights.
	widget updateColumns.
	
	^ widget
]

{
	#category : #'widgets required',
	#'squeak_changestamp' : 'ct 7/4/2022 18:45'
}
MorphicToolBuilder >> buildPluggablePanel: aSpec [

	| widget |
	widget := self panelClass new.
	self register: widget id: aSpec name.

	widget model: aSpec model.

	"Set child dependent layout properties."
	self setLayoutHintsFor: widget spec: aSpec.
	widget layoutInset: (aSpec padding ifNil: [self panelPadding]).
	widget wantsPaneSplitters: (aSpec wantsResizeHandles ifNil: [false]).
	"widget wantsGrips: true."
	widget cellGap: (aSpec spacing ifNil: [
		widget wantsPaneSplitters
			ifTrue: [self windowSpacing]
			ifFalse: [self panelSpacing]]).
	
	"Now create the children."
	aSpec children isSymbol
		ifTrue: [
			widget getChildrenSelector: aSpec children.
			widget update: widget getChildrenSelector]
		ifFalse: [
			widget rebuildPaneAfter: [
				self buildAll: aSpec children in: widget]].
	
	self setFrame: aSpec frame in: widget.
	self setLayout: aSpec layout in: widget.
	
	parent ifNotNil:[self add: widget to: parent].

	widget borderWidth: 0.
	self buildHelpFor: widget spec: aSpec. 
	widget color: Color transparent.
	
	^ widget
]

{
	#category : #'widgets optional',
	#'squeak_changestamp' : 'TW 6/10/2024 18:41'
}
MorphicToolBuilder >> buildPluggableScrollPane: spec [

	| widget panel |
	widget := self scrollPaneClass new.
	widget model: spec model.
	self register: widget id: spec name.
	spec children
		ifNotNil: [:obj |
			"Create panel morph to scroll it."
			panel := self pluggablePanelSpec new
				model: spec model;
				children: obj;
				layout: spec layout;
				horizontalResizing: (spec layout == #proportional ifTrue: [#rigid] ifFalse: [#shrinkWrap]);
				verticalResizing: (spec layout == #proportional ifTrue: [#rigid] ifFalse: [#shrinkWrap]);
				buildWith: self.
			widget morph: panel.
			]
		ifNil: [spec morph
			ifNotNil: [:m | widget morph: m]
			ifNil: [widget morphClass: spec morphClass]].
	
	self setFrame: spec frame in: widget.
	self setLayoutHintsFor: widget spec: spec.
	
	parent ifNotNil: [self add: widget to: parent].
	
	spec borderWidth ifNotNil: [:w | widget borderWidth: w].
	
	"Set scroll bar policies. By default, use scroll bars only when needed. Do not follow system-wide preferences here."
	spec hScrollBarPolicy
		caseOf: {
			[#always] -> [widget alwaysShowHScrollBar].
			[#never] -> [widget hideHScrollBarIndefinitely].
			[#whenNeeded] -> [widget showHScrollBarOnlyWhenNeeded] }
		otherwise: [widget showHScrollBarOnlyWhenNeeded].
	spec vScrollBarPolicy
		caseOf: {
			[#always] -> [widget alwaysShowVScrollBar].
			[#never] -> [widget hideVScrollBarIndefinitely].
			[#whenNeeded] -> [widget showVScrollBarOnlyWhenNeeded] }
		otherwise: [widget showVScrollBarOnlyWhenNeeded].
	
	^ widget
]

{
	#category : #'widgets required',
	#'squeak_changestamp' : 'topa 7/8/2015 17:34'
}
MorphicToolBuilder >> buildPluggableSpacer: spec [

	| widget |
	widget := self spacerClass new.
	self register: widget id: spec name.
	
	widget borderWidth: 0.
	widget color: (spec color ifNil: [Color transparent]).
	widget extent: spec extent.

	self buildHelpFor: widget spec: spec. 
	
	self setFrame: spec frame in: widget.
	self setLayoutHintsFor: widget spec: spec.
		
	parent ifNotNil:[self add: widget to: parent].
	^widget
]

{
	#category : #'widgets optional',
	#'squeak_changestamp' : 'Alex M 6/21/2024 19:44'
}
MorphicToolBuilder >> buildPluggableStaticText: aSpec [
	| widget defaultTextColor |
	widget := StringMorph new
		contents: aSpec text.
		
	self register: widget id: aSpec name.
	
	defaultTextColor := UserInterfaceTheme current get: #textColor for: MenuItemMorph.
	defaultTextColor
		ifNil: [defaultTextColor := Color black].
	
	aSpec color
		ifNil: 
			[widget color: defaultTextColor]
		ifNotNil:
			[widget color: aSpec color].

	self buildHelpFor: widget spec: aSpec.
	 
	self setFrame: aSpec frame in: widget.
	self setLayoutHintsForTextField: widget spec: aSpec.
	
	parent ifNotNil:[self add: widget to: parent].
	^ widget
]

{
	#category : #'widgets required',
	#'squeak_changestamp' : 'TW 6/9/2024 18:51'
}
MorphicToolBuilder >> buildPluggableText: aSpec [
	| widget |
	widget := self textPaneClass new.
	aSpec stylerClass ifNotNil: [:c | widget styler: (c new view: widget)].	
	widget
		on: aSpec model
		text: aSpec getText 
		accept: aSpec setText
		readSelection: aSpec selection 
		menu: aSpec menu.
	aSpec textStyle
		ifNotNil: [:ts |
			ts isSymbol
				ifTrue: [widget getTextStyleSelector: ts; update: ts]
				ifFalse: [widget setTextStyle: ts]]
		ifNil: [
			aSpec font ifNotNil: [:f |
				f isSymbol
					ifTrue: [widget getFontSelector: f]
					ifFalse: [widget setTextStyle: f asNewTextStyle]] ].
	
	widget readOnly: aSpec readOnly.
	widget plainTextOnly: aSpec plainTextOnly.
	widget editTextSelector: aSpec editText.
	widget wantsFrameAdornments: aSpec indicateUnacceptedChanges.

	widget askBeforeDiscardingEdits: aSpec askBeforeDiscardingEdits.
	widget setProperty: #alwaysAccept toValue: aSpec askBeforeDiscardingEdits not.

	widget wrapFlag: (aSpec softLineWrap ifNil: [true]).
	
	self register: widget id: aSpec name.
	
	aSpec color isColor
		ifTrue: [widget color: aSpec color]
		ifFalse: [widget getColorSelector: aSpec color].
	widget getTextColorSelector: aSpec textColor.
	self buildHelpFor: widget spec: aSpec.
	 
	self setFrame: aSpec frame in: widget.
	self setLayoutHintsForTextField: widget spec: aSpec.
	
	parent ifNotNil:[self add: widget to: parent].
	^widget
]

{
	#category : #'widgets required',
	#'squeak_changestamp' : 'ct 1/27/2022 02:21'
}
MorphicToolBuilder >> buildPluggableTree: aSpec [
	| widget |
	widget := self treeClass new.
	self register: widget id: aSpec name.

	widget getLabelSelector: aSpec label.
	widget getIconSelector: aSpec icon.

	widget model: aSpec model.
	widget nodeClass: aSpec nodeClass.

	widget getRootsSelector: aSpec roots.
	widget getChildrenSelector: aSpec getChildren.
	widget hasChildrenSelector: aSpec hasChildren.

	widget getSelectedSelector: aSpec getSelected.
	widget setSelectedSelector: aSpec setSelected.
	widget getSelectedPathSelector: aSpec getSelectedPath.
	widget setSelectedPathSelector: aSpec setSelectedPath.

	widget setSelectedParentSelector: aSpec setSelectedParent.

	widget getHelpSelector: aSpec help.
	widget getMenuSelector: aSpec menu.

	widget keystrokeActionSelector: aSpec keyPress.
	widget autoDeselect: aSpec autoDeselect.
	widget doubleClickSelector: aSpec doubleClick.
	
	widget dropItemSelector: aSpec dropItem.
	widget wantsDropSelector: aSpec dropAccept.
	widget dragItemSelector: aSpec dragItem.
	widget dragStartedSelector: aSpec dragStarted.
	widget dragTypeSelector: aSpec dragType.
	
	widget columns: aSpec columns.
	
	"Override default scroll bar policies if needed. Widget will use preference values otherwise."
	aSpec hScrollBarPolicy ifNotNil: [:policy |
		policy caseOf: {
			[#always] -> [widget alwaysShowHScrollBar].
			[#never] -> [widget hideHScrollBarIndefinitely].
			[#whenNeeded] -> [widget showHScrollBarOnlyWhenNeeded]. } ].
	aSpec vScrollBarPolicy ifNotNil: [:policy |
		policy caseOf: {
			[#always] -> [widget alwaysShowVScrollBar].
			[#never] -> [widget hideVScrollBarIndefinitely].
			[#whenNeeded] -> [widget showVScrollBarOnlyWhenNeeded]. } ].	
	
	self setFrame: aSpec frame in: widget.
	self setLayoutHintsFor: widget spec: aSpec.
	
	parent ifNotNil:[self add: widget to: parent].
"	panes ifNotNil:[
		aSpec roots ifNotNil:[panes add: aSpec roots].
	].	"
	^widget
]

{
	#category : #'widgets required',
	#'squeak_changestamp' : 'ct 7/4/2022 18:39'
}
MorphicToolBuilder >> buildPluggableWindow: aSpec [
	| widget |

	aSpec layout == #proportional ifFalse:[
		"This needs to be implemented - probably by adding a single pane and then the rest"
		^self error: 'Not implemented'.
	].

	widget := (self windowClassFor: aSpec) new.
	self register: widget id: aSpec name.
	
	widget model: aSpec model.

	"Set child dependent layout properties."
	MorphicProject worldGridEnabled ifTrue: [
		"Snap both #position and #extent to grid."
		aSpec horizontalResizing ifNil: [aSpec horizontalResizing: #spaceFill].
		aSpec verticalResizing ifNil: [aSpec verticalResizing: #spaceFill]].		
	self setLayoutHintsFor: widget spec: aSpec.
	widget layoutInset: (aSpec padding ifNil: [self windowPadding]).
	widget morphicLayerNumber: widget class windowLayer.
	
	self flag: #todo. "ct: Below, there is a lot of duplication with #buildPluggablePanel:. Can we factor out some of this, or even just collect all children in a PluggablePanelMorph?"
	widget cellGap: (aSpec spacing ifNil: [self windowSpacing]).
	widget wantsGrips: true.
	widget wantsPaneSplitters: (aSpec wantsResizeHandles ifNil: [true]).
	
	"Now create the children."
	panes := OrderedCollection new.
	aSpec children isSymbol
		ifTrue: [
			widget getChildrenSelector: aSpec children.
			widget update: aSpec children]
		ifFalse: [
			widget rebuildPaneAfter: [
				self buildAll: aSpec children in: widget]].
	widget setUpdatablePanesFrom: panes.

	aSpec defaultFocus ifNotNil: [:name |
		widget defaultFocusMorph: name].
	
	aSpec label ifNotNil: [:label|
		label isSymbol 
			ifTrue:[widget getLabelSelector: label]
			ifFalse:[widget setLabel: label]].

	aSpec multiWindowStyle notNil ifTrue:
		[widget savedMultiWindowState: (SavedMultiWindowState on: aSpec model)].

	widget closeWindowSelector: aSpec closeAction.
	self buildHelpFor: widget spec: aSpec. 

	widget bounds: (RealEstateAgent 
		initialFrameFor: widget 
		initialExtent: ((aSpec extent ifNil:[widget initialExtent]) * RealEstateAgent windowScaleFactor * RealEstateAgent scaleFactor) rounded
		world: self currentWorld).

	widget refreshWindowColor.

	^ widget
]

{
	#category : #'widget classes',
	#'squeak_changestamp' : 'Igor.Stasenko 1/17/2010 04:01'
}
MorphicToolBuilder >> buttonClass [
	^ PluggableButtonMorphPlus
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 2/11/2022 12:15'
}
MorphicToolBuilder >> buttonRowHeight [
	
	| multiplier |
	ButtonMargins ifNil: [
		ButtonMargins := (PluggableButtonMorph labelMargins
			ifNil: [0] ifNotNil: [:margins |
				margins isRectangle
					ifTrue: [margins top + margins bottom]
					ifFalse: [margins isPoint
						ifTrue: [margins y + margins y]
						ifFalse: [margins + margins]]]) ].

	multiplier := MorphicProject useCompactButtons
		ifTrue: [1.0] ifFalse: [1.6].
	
	ButtonBorderWidth ifNil: [ButtonBorderWidth := (((UserInterfaceTheme current get: #borderWidth for: PluggableTextMorph) ifNil: [1]) * RealEstateAgent scaleFactor) truncated * 2].
	
	^ (Preferences standardButtonFont lineGrid asFloat * multiplier) truncated "already includes the system's current #scaleFactor"
		+ ButtonMargins "already includes the system's current #scaleFactor"
		+ ButtonBorderWidth
]

{
	#category : #updating,
	#'squeak_changestamp' : 'mt 2/11/2022 10:46'
}
MorphicToolBuilder >> canApplyUserInterfaceTheme [

	^ false
]

{
	#category : #'widget classes',
	#'squeak_changestamp' : 'rww 9/11/2010 03:39'
}
MorphicToolBuilder >> checkBoxClass [
	^ PluggableCheckBoxMorph
]

{
	#category : #opening,
	#'squeak_changestamp' : 'ar 6/5/2005 12:40'
}
MorphicToolBuilder >> close: aWidget [
	"Close a previously opened widget"
	aWidget delete
]

{
	#category : #'widget classes',
	#'squeak_changestamp' : 'Igor.Stasenko 1/17/2010 04:03'
}
MorphicToolBuilder >> codePaneClass [
	^ PluggableTextMorphPlus
]

{
	#category : #'widget classes',
	#'squeak_changestamp' : 'mt 7/13/2016 16:40'
}
MorphicToolBuilder >> dialogClass [
	^ PluggableDialogWindow
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 2/8/2022 13:07'
}
MorphicToolBuilder >> dialogPadding [

	^ ProportionalSplitterMorph gripThickness "already scaled"
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 2/8/2022 12:50'
}
MorphicToolBuilder >> dialogSpacing [

	^ ProportionalSplitterMorph gripThickness "already scaled"
]

{
	#category : #'widget classes',
	#'squeak_changestamp' : 'rww 9/11/2010 14:05'
}
MorphicToolBuilder >> dropDownListClass [
	^ PluggableDropDownListMorph
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 2/10/2022 12:55'
}
MorphicToolBuilder >> helpFieldHeightFor: numLines [

	^ self textFieldHeightFor: numLines font: Preferences standardBalloonHelpFont
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 2/10/2022 12:55'
}
MorphicToolBuilder >> inputFieldHeightFor: numLines [

	^ self textFieldHeightFor: numLines font: TextStyle defaultFont
]

{
	#category : #'widget classes',
	#'squeak_changestamp' : 'Igor.Stasenko 1/17/2010 04:11'
}
MorphicToolBuilder >> listByItemClass [
	^ PluggableListMorphByItemPlus
]

{
	#category : #'widget classes',
	#'squeak_changestamp' : 'Igor.Stasenko 1/17/2010 04:06'
}
MorphicToolBuilder >> listClass [
	^ PluggableListMorphPlus
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 2/11/2022 11:44'
}
MorphicToolBuilder >> listHeightFor: numLines [

	ListMargins ifNil: [
		ListMargins := PluggableListMorph listMargins
			ifNil: [0] ifNotNil: [:margins |
				margins isRectangle
					ifTrue: [margins top + margins bottom]
					ifFalse: [margins isPoint
						ifTrue: [margins y + margins y]
						ifFalse: [margins + margins]]] ].

	ListBorderWidth ifNil: [ListBorderWidth := (((UserInterfaceTheme current get: #borderWidth for: PluggableTextMorph) ifNil: [1]) * RealEstateAgent scaleFactor) truncated * 2].

	^ (Preferences standardListFont lineGridForMorphs * numLines) "already includes the system's current #scaleFactor"
		+ ListMargins "already includes the system's current #scaleFactor"
		+ ListBorderWidth
]

{
	#category : #'widget classes',
	#'squeak_changestamp' : 'Igor.Stasenko 1/17/2010 04:20'
}
MorphicToolBuilder >> menuClass [
	^ MenuMorph
]

{
	#category : #'widget classes',
	#'squeak_changestamp' : 'Igor.Stasenko 1/17/2010 04:20'
}
MorphicToolBuilder >> menuItemClass [
	^ MenuItemMorph
]

{
	#category : #'widget classes',
	#'squeak_changestamp' : 'mt 10/13/2019 11:50'
}
MorphicToolBuilder >> multiColumnListByItemClass [
	^ PluggableMultiColumnListMorphByItem
]

{
	#category : #'widget classes',
	#'squeak_changestamp' : 'tpr 11/7/2017 10:05'
}
MorphicToolBuilder >> multiColumnListClass [
	^ PluggableMultiColumnListMorph
]

{
	#category : #'widget classes',
	#'squeak_changestamp' : 'Igor.Stasenko 1/17/2010 04:14'
}
MorphicToolBuilder >> multiSelectListClass [
	^ PluggableListMorphOfMany
]

{
	#category : #opening,
	#'squeak_changestamp' : 'mt 10/5/2017 08:46'
}
MorphicToolBuilder >> open: anObject [
	"Build and open the object. Answer the widget opened."
	
	^ (self build: anObject) openAsTool
]

{
	#category : #opening,
	#'squeak_changestamp' : 'mt 5/11/2016 13:51'
}
MorphicToolBuilder >> open: anObject label: aString [
	"Build an open the object, labeling it appropriately if it is a window. Answer the widget opened."
	
	| morph |
	morph := self open: anObject.
	morph isSystemWindow
		ifTrue: [morph setLabel: aString]
		ifFalse: [morph name: aString].
	^ morph
]

{
	#category : #'widget classes',
	#'squeak_changestamp' : 'Igor.Stasenko 1/17/2010 04:14'
}
MorphicToolBuilder >> panelClass [
	^ PluggablePanelMorph
]

{
	#category : #private,
	#'squeak_changestamp' : 'ar 9/6/2009 16:14'
}
MorphicToolBuilder >> register: widget id: id [
	id ifNil:[^self].
	widgets ifNil:[widgets := Dictionary new].
	widgets at: id put: widget.
	widget setNameTo: id.
]

{
	#category : #opening,
	#'squeak_changestamp' : 'ar 6/5/2005 12:41'
}
MorphicToolBuilder >> runModal: aWidget [
	"Run the (previously opened) widget modally, e.g., 
	do not return control to the sender before the user has responded."
	[aWidget world notNil] whileTrue: [
		aWidget outermostWorldMorph doOneCycle.
	].

]

{
	#category : #'widget classes',
	#'squeak_changestamp' : 'mt 6/15/2014 07:24:33.104'
}
MorphicToolBuilder >> scrollPaneClass [
	^ PluggableScrollPane
]

{
	#category : #private,
	#'squeak_changestamp' : 'mt 4/14/2015 16:44'
}
MorphicToolBuilder >> setFrame: aRectangle in: widget [
	| frame |
	aRectangle ifNil:[^nil].
	frame := aRectangle isRectangle
		ifTrue: [self asFrame: aRectangle]
		ifFalse: [aRectangle]. "assume LayoutFrame"
	widget layoutFrame: frame.
	widget hResizing: #spaceFill; vResizing: #spaceFill.
]

{
	#category : #private,
	#'squeak_changestamp' : 'mt 5/3/2015 10:20'
}
MorphicToolBuilder >> setLayout: layout in: widget [
	layout == #proportional ifTrue:[
		widget layoutPolicy: ProportionalLayout new.
		^self].
	layout == #horizontal ifTrue:[
		widget layoutPolicy: TableLayout new.
		widget listDirection: #leftToRight.
		"widget cellInset: 1@1.
		widget layoutInset: 1@1."
		widget color: Color transparent.
		"and then some..."
		^self].
	layout == #vertical ifTrue:[
		widget layoutPolicy: TableLayout new.
		widget listDirection: #topToBottom.
		"widget cellInset: 1@1.
		widget layoutInset: 1@1."
		widget color: Color transparent.
		"and then some..."
		^self].
	^self error: 'Unknown layout: ', layout.
]

{
	#category : #private,
	#'squeak_changestamp' : 'mt 5/3/2015 10:19'
}
MorphicToolBuilder >> setLayoutHintsFor: widget spec: aSpec [

	aSpec minimumWidth >= 0
		ifTrue: [widget minimumWidth: aSpec minimumWidth].
	aSpec minimumHeight >= 0
		ifTrue: [widget minimumHeight: aSpec minimumHeight].
	aSpec padding
		ifNotNil: [:p | widget layoutInset: p].
	"aSpec margin
		ifNotNil: [:m | widget layoutOutset: m]."
	
	widget hResizing: (aSpec horizontalResizing ifNil: [#spaceFill]).
	widget vResizing: (aSpec verticalResizing ifNil: [#spaceFill]).
]

{
	#category : #private,
	#'squeak_changestamp' : 'mt 2/19/2022 18:58'
}
MorphicToolBuilder >> setLayoutHintsForTextField: widget spec: aSpec [

	aSpec minimumWidth >= 0
		ifTrue: [widget minimumWidth: aSpec minimumWidth].
	aSpec minimumHeight >= 0
		ifTrue: [widget minimumHeight: aSpec minimumHeight].
	aSpec padding
		ifNotNil: [:p | widget textMorph margins: p].
	"aSpec margin
		ifNotNil: [:m | widget layoutOutset: m]."
	
	widget hResizing: (aSpec horizontalResizing ifNil: [#spaceFill]).
	widget vResizing: (aSpec verticalResizing ifNil: [#spaceFill]).
]

{
	#category : #private,
	#'squeak_changestamp' : 'mt 10/23/2019 11:37'
}
MorphicToolBuilder >> setListPropertiesFor: widget spec: aSpec [
		
	"Override default scroll bar policies if needed. Widget will use preference values otherwise."
	aSpec hScrollBarPolicy ifNotNil: [:policy |
		policy caseOf: {
			[#always] -> [widget alwaysShowHScrollBar].
			[#never] -> [widget hideHScrollBarIndefinitely].
			[#whenNeeded] -> [widget showHScrollBarOnlyWhenNeeded]. } ].
	aSpec vScrollBarPolicy ifNotNil: [:policy |
		policy caseOf: {
			[#always] -> [widget alwaysShowVScrollBar].
			[#never] -> [widget hideVScrollBarIndefinitely].
			[#whenNeeded] -> [widget showVScrollBarOnlyWhenNeeded]. } ].	
	
	widget
		getListElementSelector: aSpec listItem;
		getListSizeSelector: aSpec listSize;
		getIconSelector: aSpec icon;
		getHelpSelector: aSpec helpItem;
		doubleClickSelector: aSpec doubleClick.
	
	widget
		autoDeselect: aSpec autoDeselect;
		keystrokePreviewSelector: aSpec keystrokePreview.
	
	aSpec filterableList ifNotNil: [:b | widget filterableList: b].
	aSpec clearFilterAutomatically ifNotNil: [:b | widget clearFilterAutomatically: b].
	
	aSpec color ifNotNil: [:c | widget color: c].
	self buildHelpFor: widget spec: aSpec. 
			
	self setFrame: aSpec frame in: widget.
	self setLayoutHintsFor: widget spec: aSpec.
	aSpec itemAlignment ifNotNil: [:alignment | widget listMorph cellPositioning: alignment].
	aSpec itemPadding ifNotNil: [:padding | widget listMorph cellInset: padding].
	
	parent ifNotNil:[self add: widget to: parent].
	(panes notNil and: [aSpec list notNil]) ifTrue: [panes add: aSpec list].

]

{
	#category : #'widget classes',
	#'squeak_changestamp' : 'mt 2/9/2022 16:11'
}
MorphicToolBuilder >> spacerClass [

	^ BorderedMorph "See #displayScaleChangedBy:"
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 2/11/2022 11:43'
}
MorphicToolBuilder >> textFieldHeightFor: numLines font: font [

	TextMargins ifNil: [
		TextMargins := PluggableTextMorph textMargins
			ifNil: [0] ifNotNil: [:margins |
				margins isRectangle
					ifTrue: [margins top + margins bottom]
					ifFalse: [margins isPoint
						ifTrue: [margins y + margins y]
						ifFalse: [margins + margins]]] ].

	TextBorderWidth ifNil: [TextBorderWidth := (((UserInterfaceTheme current get: #borderWidth for: PluggableTextMorph) ifNil: [1]) * RealEstateAgent scaleFactor) truncated * 2].

	^ (font lineGrid * numLines) "already includes the system's current #scaleFactor"
		+ TextMargins "already includes the system's current #scaleFactor"
		+ TextBorderWidth
]

{
	#category : #'widget classes',
	#'squeak_changestamp' : 'Igor.Stasenko 1/17/2010 04:15'
}
MorphicToolBuilder >> textPaneClass [
	^ PluggableTextMorphPlus
]

{
	#category : #'widget classes',
	#'squeak_changestamp' : 'Igor.Stasenko 1/17/2010 04:16'
}
MorphicToolBuilder >> treeClass [
	^ PluggableTreeMorph
]

{
	#category : #private,
	#'squeak_changestamp' : 'ar 7/14/2005 22:30'
}
MorphicToolBuilder >> widgetAt: id ifAbsent: aBlock [
	widgets ifNil:[^aBlock value].
	^widgets at: id ifAbsent: aBlock
]

{
	#category : #'widget classes',
	#'squeak_changestamp' : 'Igor.Stasenko 1/17/2010 04:16'
}
MorphicToolBuilder >> windowClass [
	^ PluggableSystemWindow
]

{
	#category : #'widget classes',
	#'squeak_changestamp' : 'mt 7/14/2016 07:56'
}
MorphicToolBuilder >> windowClassFor: aSpec [
	^aSpec multiWindowStyle
		caseOf:
		{	[nil]				->	[PluggableSystemWindow].
			[#labelButton]	->	[PluggableSystemWindowWithLabelButton] }
		otherwise:				[PluggableSystemWindowWithLabelButton]
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 2/8/2022 13:07'
}
MorphicToolBuilder >> windowPadding [

	^ ProportionalSplitterMorph gripThickness "already scaled"
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 2/8/2022 12:47'
}
MorphicToolBuilder >> windowSpacing [

	^ ProportionalSplitterMorph gripThickness "already scaled"
]
