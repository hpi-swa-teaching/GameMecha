"
I am a tool builder, that is an object which knows how to create concrete widgets from abstract specifications. Those specifications are used by tools which want to be able to function in diverse user interface paradigms, such as MVC, Morphic, Tweak, wxWidgets etc.

The following five specs must be supported by all implementations:
	* PluggableButton
	* PluggableList
	* PluggableText
	* PluggablePanel
	* PluggableWindow

The following specs are optional:
	* PluggableTree: If not supported, the tool builder must answer nil when asked for a pluggableTreeSpec. Substitution will require client support so clients must be aware that some tool builders may not support trees (MVC for example, or Seaside). See examples in FileListPlus or TestRunnerPlus.
	* PluggableMultiSelectionList: If multi-selection lists are not supported, tool builder will silently support regular single selection lists.
	* PluggableInputField: Intended as a HINT for the builder that this widget will be used as a single line input field. Unless explicitly supported it will be automatically substituted by PluggableText.
	* PluggableActionButton: Intended as a HINT for the builder that this widget will be used as push (action) button. Unless explicitly supported it will be automatically substituted by PluggableButton.
	* PluggableRadioButton: Intended as a HINT for the builder that this widget will be used as radio button. Unless explicitly supported it will be automatically substituted by PluggableButton.
	* PluggableCheckBox: Intended as a HINT for the builder that this widget will be used as check box. Unless explicitly supported it will be automatically substituted by PluggableButton.

"
Class {
	#name : #ToolBuilder,
	#superclass : #Object,
	#instVars : [
		'parent'
	],
	#category : #'ToolBuilder-Kernel',
	#'squeak_changestamp' : '<historical>'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'KR 4/28/2006 21:05'
}
ToolBuilder class >> build: aClass [
	^self default build: aClass
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tpr 1/29/2018 11:41'
}
ToolBuilder class >> default [
	"Answer the default tool builder"
	^ Project uiManager toolBuilder

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'dtl 3/21/2015 11:40'
}
ToolBuilder class >> findDefault [
	"Answer a default tool builder"
	| builderClass |
	"Note: The way the following is phrased ensures that you can always make 'more specific' builders merely by subclassing a tool builder and implementing a more specific way of reacting to #isActiveBuilder. For example, a BobsUIToolBuilder can subclass MorphicToolBuilder and (if enabled, say Preferences useBobsUITools) will be considered before the parent (generic MorphicToolBuilder)."
	builderClass := self allSubclasses 
		detect:[:any| any isActiveBuilder and:[
			any subclasses noneSatisfy:[:sub| sub isActiveBuilder]]] ifNone:[nil].
	builderClass ifNotNil: [^builderClass ].
	^self error: 'ToolBuilder not found'
]

{
	#category : #services,
	#'squeak_changestamp' : 'mt 5/4/2016 13:15'
}
ToolBuilder class >> getBoundsForWindow: window [
	"Return the bounds for the given window."

	self subclassResponsibility.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/11/2005 15:23'
}
ToolBuilder class >> isActiveBuilder [
	"Answer whether I am the currently active builder"
	^false
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'ar 2/11/2005 18:15'
}
ToolBuilder class >> open: aClass [
	^self default open: aClass
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'ar 2/11/2005 18:15'
}
ToolBuilder class >> open: aClass label: aString [
	^self default open: aClass label: aString
]

{
	#category : #services,
	#'squeak_changestamp' : 'mt 5/4/2016 13:20'
}
ToolBuilder class >> setBoundsForWindow: window to: rectangle [
	"Set the bounds for the given window."

	self subclassResponsibility.
]

{
	#category : #building,
	#'squeak_changestamp' : 'ar 6/5/2005 12:35'
}
ToolBuilder >> build: anObject [
	"Build the given object using this tool builder"
	^anObject buildWith: self
]

{
	#category : #building,
	#'squeak_changestamp' : 'ar 6/5/2005 12:35'
}
ToolBuilder >> buildAll: aList in: newParent [
	"Build the given set of widgets in the new parent"
	| prior |
	aList ifNil:[^self].
	prior := parent.
	parent := newParent.
	aList do:[:each| each buildWith: self].
	parent := prior.

]

{
	#category : #'widgets optional',
	#'squeak_changestamp' : 'ar 2/12/2005 14:05'
}
ToolBuilder >> buildPluggableActionButton: spec [
	^self buildPluggableButton: spec
]

{
	#category : #'widgets optional',
	#'squeak_changestamp' : 'mt 4/12/2015 18:23'
}
ToolBuilder >> buildPluggableAlternateMultiSelectionList: aSpec [
	
	^ self buildPluggableList: aSpec
]

{
	#category : #'widgets required',
	#'squeak_changestamp' : 'ar 2/9/2005 18:46'
}
ToolBuilder >> buildPluggableButton: aSpec [
	^self subclassResponsibility
]

{
	#category : #'widgets optional',
	#'squeak_changestamp' : 'ar 2/12/2005 14:05'
}
ToolBuilder >> buildPluggableCheckBox: spec [
	^self buildPluggableButton: spec
]

{
	#category : #'widgets optional',
	#'squeak_changestamp' : 'ar 8/18/2009 00:04'
}
ToolBuilder >> buildPluggableCodePane: aSpec [
	^self buildPluggableText: aSpec
]

{
	#category : #'widgets optional',
	#'squeak_changestamp' : 'mt 7/13/2016 16:37'
}
ToolBuilder >> buildPluggableDialog: spec [

	| windowSpec |
	windowSpec := self pluggableWindowSpec new.
	windowSpec children: (spec children ifNil: [OrderedCollection new]).
	
	"TODO: Convert the dialog's message into some element in the children."
		
	spec buttons ifNotNil: [:buttons | windowSpec children addAll: buttons].
	windowSpec
		model: spec model;
		extent: spec extent;
		label: spec title.
	^ self buildPluggableWindow: windowSpec
]

{
	#category : #'widgets optional',
	#'squeak_changestamp' : 'rww 9/11/2010 13:37'
}
ToolBuilder >> buildPluggableDropDownList: spec [
	^self buildPluggableList: spec
]

{
	#category : #'widgets optional',
	#'squeak_changestamp' : 'ar 2/12/2005 18:39'
}
ToolBuilder >> buildPluggableInputField: aSpec [
	^self buildPluggableText: aSpec
]

{
	#category : #'widgets required',
	#'squeak_changestamp' : 'ar 2/9/2005 18:47'
}
ToolBuilder >> buildPluggableList: aSpec [
	^self subclassResponsibility
]

{
	#category : #'widgets required',
	#'squeak_changestamp' : 'mt 4/12/2015 20:47'
}
ToolBuilder >> buildPluggableMenu: menuSpec [ 

	self subclassResponsibility.
]

{
	#category : #'widgets required',
	#'squeak_changestamp' : 'mt 4/12/2015 20:47'
}
ToolBuilder >> buildPluggableMenuItem: menuSpec [ 

	self subclassResponsibility.
]

{
	#category : #'widgets required',
	#'squeak_changestamp' : 'tpr 11/7/2017 10:03'
}
ToolBuilder >> buildPluggableMultiColumnList: aSpec [
	^self subclassResponsibility
]

{
	#category : #'widgets optional',
	#'squeak_changestamp' : 'ar 2/12/2005 14:06'
}
ToolBuilder >> buildPluggableMultiSelectionList: aSpec [
	^self buildPluggableList: aSpec
]

{
	#category : #'widgets required',
	#'squeak_changestamp' : 'ar 6/5/2005 12:30'
}
ToolBuilder >> buildPluggablePanel: aSpec [
	^self subclassResponsibility
]

{
	#category : #'widgets optional',
	#'squeak_changestamp' : 'ar 2/12/2005 14:05'
}
ToolBuilder >> buildPluggableRadioButton: spec [
	^self buildPluggableButton: spec
]

{
	#category : #'widgets optional',
	#'squeak_changestamp' : 'mt 6/15/2014 08:09:41.581'
}
ToolBuilder >> buildPluggableScrollPane: spec [

	^ spec children
		ifNotNil: [self buildPluggablePanel: spec]
		ifNil: [spec morph ifNil: [spec morphClass new]]
]

{
	#category : #'widgets required',
	#'squeak_changestamp' : 'mt 5/3/2015 14:47'
}
ToolBuilder >> buildPluggableSpacer: aSpec [

	^ self subclassResponsibility
]

{
	#category : #'widgets required',
	#'squeak_changestamp' : 'TW 6/9/2024 18:37'
}
ToolBuilder >> buildPluggableStaticText: aSpec [
	^self subclassResponsibility
]

{
	#category : #'widgets required',
	#'squeak_changestamp' : 'ar 2/9/2005 18:47'
}
ToolBuilder >> buildPluggableText: aSpec [
	^self subclassResponsibility
]

{
	#category : #'widgets required',
	#'squeak_changestamp' : 'ar 2/12/2005 00:36'
}
ToolBuilder >> buildPluggableTree: aSpec [
	^self subclassResponsibility
]

{
	#category : #'widgets required',
	#'squeak_changestamp' : 'ar 2/9/2005 18:47'
}
ToolBuilder >> buildPluggableWindow: aSpec [
	^self subclassResponsibility
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 2/7/2022 18:53'
}
ToolBuilder >> buttonRowHeight [
	"Answers the height in pixels a button rowtypically needs serve buttons of clickable size."
	
	^ (Preferences standardButtonFont height * 2.5) truncated
]

{
	#category : #opening,
	#'squeak_changestamp' : 'ar 6/5/2005 12:37'
}
ToolBuilder >> close: aWidget [
	"Close a previously opened widget"
	^self subclassResponsibility
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 2/8/2022 13:07'
}
ToolBuilder >> dialogPadding [

	^ (4 "px" * RealEstateAgent scaleFactor) truncated
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 2/8/2022 12:59'
}
ToolBuilder >> dialogSpacing [

	^ (4 "px" * RealEstateAgent scaleFactor) truncated
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 2/10/2022 12:54'
}
ToolBuilder >> helpFieldHeight [
	
	^ self helpFieldHeightFor: 1
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 2/10/2022 12:53'
}
ToolBuilder >> helpFieldHeightFor: numLines [
	"Answers the height in pixels a help field typically needs to be drawn without clipping using a ProportionalLayout and LayoutFrame."
	
	^ (Preferences standardBalloonHelpFont lineGrid * 3/2) truncated * numLines
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'ar 2/9/2005 19:49'
}
ToolBuilder >> initialize [

]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 2/8/2022 13:24'
}
ToolBuilder >> inputFieldHeight [
	
	^ self inputFieldHeightFor: 1
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 2/7/2022 19:01'
}
ToolBuilder >> inputFieldHeightFor: numLines [
	"Answers the height in pixels an input field typically needs to be drawn without clipping using a ProportionalLayout and LayoutFrame."
	
	^ (TextStyle defaultFont lineGrid * 3/2) truncated * numLines
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 2/7/2022 20:29'
}
ToolBuilder >> listHeight [
	
	^ self listHeightFor: 1
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 2/7/2022 20:29'
}
ToolBuilder >> listHeightFor: numItems [
	"Answers the height in pixels a list typically needs to be drawn without clipping using a ProportionalLayout and LayoutFrame."
	
	^ Preferences standardListFont lineGridForMorphs * numItems
]

{
	#category : #opening,
	#'squeak_changestamp' : 'ar 6/5/2005 12:38'
}
ToolBuilder >> open: anObject [
	"Build and open the object. Answer the widget opened."
	^self subclassResponsibility
]

{
	#category : #opening,
	#'squeak_changestamp' : 'ar 6/5/2005 12:38'
}
ToolBuilder >> open: anObject label: aString [
	"Build an open the object, labeling it appropriately.  Answer the widget opened."
	^self subclassResponsibility
]

{
	#category : #opening,
	#'squeak_changestamp' : 'mt 9/18/2019 16:52'
}
ToolBuilder >> openDebugger: aSpec [
	"Build and open a debugger from the given spec.
	Answer the widget opened. Subclasses can override this
	method if opening a debugger has specific requirements
	different from opening other widgets."
 
	^ self open: aSpec

]

{
	#category : #opening,
	#'squeak_changestamp' : 'eem 10/6/2014 12:36'
}
ToolBuilder >> openDebugger: aSpec label: aString [
	"Build and open a debugger from the given spec, labeling it appropriately.
	Answer the widget opened. Subclasses can override this
	method if opening a debugger has specific requirements
	different from opening other widgets."
 
	^self open: aSpec label: aString

]

{
	#category : #opening,
	#'squeak_changestamp' : 'mt 9/18/2019 16:52'
}
ToolBuilder >> openDebugger: aSpec label: aString closing: topView [
	"Build and open a debugger from the given spec, labeling it appropriately.
	Answer the widget opened. Subclasses can override this
	method if opening a debugger has specific requirements
	different from opening other widgets."
 
	self close: topView.
	^ self open: aSpec label: aString

]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 2/8/2022 13:07'
}
ToolBuilder >> panelPadding [

	^ 0
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 2/8/2022 12:46'
}
ToolBuilder >> panelSpacing [

	^ (2 "px" * RealEstateAgent scaleFactor) truncated
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/9/2005 18:54'
}
ToolBuilder >> parent [
	^parent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/9/2005 18:54'
}
ToolBuilder >> parent: aWidget [
	parent := aWidget
]

{
	#category : #defaults,
	#'squeak_changestamp' : 'ar 2/12/2005 14:18'
}
ToolBuilder >> pluggableActionButtonSpec [
	^PluggableActionButtonSpec
]

{
	#category : #defaults,
	#'squeak_changestamp' : 'cmm 2/19/2010 14:29'
}
ToolBuilder >> pluggableAlternateMultiSelectionListSpec [
	^ PluggableAlternateMultiSelectionListSpec
]

{
	#category : #defaults,
	#'squeak_changestamp' : 'ar 2/10/2005 00:31'
}
ToolBuilder >> pluggableButtonSpec [
	^PluggableButtonSpec
]

{
	#category : #defaults,
	#'squeak_changestamp' : 'ar 2/12/2005 14:18'
}
ToolBuilder >> pluggableCheckBoxSpec [
	^PluggableCheckBoxSpec
]

{
	#category : #defaults,
	#'squeak_changestamp' : 'ar 8/18/2009 00:03'
}
ToolBuilder >> pluggableCodePaneSpec [
	^PluggableCodePaneSpec
]

{
	#category : #defaults,
	#'squeak_changestamp' : 'mt 7/14/2016 08:47'
}
ToolBuilder >> pluggableDialogSpec [
	^PluggableDialogSpec
]

{
	#category : #defaults,
	#'squeak_changestamp' : 'rww 9/11/2010 14:09'
}
ToolBuilder >> pluggableDropDownListSpec [
	^PluggableDropDownListSpec
]

{
	#category : #defaults,
	#'squeak_changestamp' : 'TW 6/20/2024 20:23'
}
ToolBuilder >> pluggableImageButtonSpec [
	^PluggableImageButtonSpec
]

{
	#category : #defaults,
	#'squeak_changestamp' : 'ar 2/11/2005 16:41'
}
ToolBuilder >> pluggableInputFieldSpec [
	^PluggableInputFieldSpec
]

{
	#category : #defaults,
	#'squeak_changestamp' : 'ar 2/10/2005 00:30'
}
ToolBuilder >> pluggableListSpec [
	^PluggableListSpec
]

{
	#category : #defaults,
	#'squeak_changestamp' : 'cwp 6/8/2005 23:24'
}
ToolBuilder >> pluggableMenuSpec [
	^ PluggableMenuSpec
]

{
	#category : #defaults,
	#'squeak_changestamp' : 'tpr 11/7/2017 10:07'
}
ToolBuilder >> pluggableMultiColumnListSpec [
	^PluggableMultiColumnListSpec
]

{
	#category : #defaults,
	#'squeak_changestamp' : 'ar 2/12/2005 13:43'
}
ToolBuilder >> pluggableMultiSelectionListSpec [
	^PluggableMultiSelectionListSpec
]

{
	#category : #defaults,
	#'squeak_changestamp' : 'ar 2/10/2005 00:30'
}
ToolBuilder >> pluggablePanelSpec [
	^PluggablePanelSpec
]

{
	#category : #defaults,
	#'squeak_changestamp' : 'ar 2/12/2005 14:18'
}
ToolBuilder >> pluggableRadioButtonSpec [
	^PluggableRadioButtonSpec
]

{
	#category : #defaults,
	#'squeak_changestamp' : 'mt 6/15/2014 07:47:54.023'
}
ToolBuilder >> pluggableScrollPaneSpec [
	^ PluggableScrollPaneSpec
]

{
	#category : #defaults,
	#'squeak_changestamp' : 'mt 5/3/2015 14:58'
}
ToolBuilder >> pluggableSpacerSpec [
	^ PluggableSpacerSpec
]

{
	#category : #defaults,
	#'squeak_changestamp' : 'TW 6/10/2024 00:22'
}
ToolBuilder >> pluggableStaticTextSpec [
	^PluggableStaticTextSpec
]

{
	#category : #defaults,
	#'squeak_changestamp' : 'ar 2/10/2005 00:31'
}
ToolBuilder >> pluggableTextSpec [
	^PluggableTextSpec
]

{
	#category : #defaults,
	#'squeak_changestamp' : 'ar 2/12/2005 16:53'
}
ToolBuilder >> pluggableTreeSpec [
	^PluggableTreeSpec
]

{
	#category : #defaults,
	#'squeak_changestamp' : 'ar 2/10/2005 00:30'
}
ToolBuilder >> pluggableWindowSpec [
	^PluggableWindowSpec
]

{
	#category : #opening,
	#'squeak_changestamp' : 'ar 6/5/2005 12:39'
}
ToolBuilder >> runModal: aWidget [
	"Run the (previously opened) widget modally, e.g., 
	do not return control to the sender before the user has responded."
	^self subclassResponsibility
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 7/14/2005 22:23'
}
ToolBuilder >> widgetAt: widgetID [
	"Answer the widget with the given ID"
	^self widgetAt: widgetID ifAbsent:[nil]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 7/14/2005 22:23'
}
ToolBuilder >> widgetAt: widgetID ifAbsent: aBlock [
	"Answer the widget with the given ID"
	^aBlock value
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 2/8/2022 12:59'
}
ToolBuilder >> windowPadding [

	^ (4 "px" * RealEstateAgent scaleFactor) truncated
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 2/8/2022 12:59'
}
ToolBuilder >> windowSpacing [

	^ (4 "px" * RealEstateAgent scaleFactor) truncated
]
