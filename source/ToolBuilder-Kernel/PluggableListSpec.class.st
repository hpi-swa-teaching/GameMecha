"
A single selection list element.

Instance variables:
	list		<Symbol>	The selector to retrieve the list elements.
	getIndex	<Symbol>	The selector to retrieve the list selection index.
	setIndex	<Symbol>	The selector to set the list selection index.
	getSelected	<Symbol>	The selector to retrieve the list selection.
	setSelected	<Symbol>	The selector to set the list selection.
	menu	<Symbol>	The selector to offer (to retrieve?) the context menu.
	keyPress <Symbol>	The selector to invoke for handling keyboard shortcuts.
	autoDeselect	<Boolean>	Whether the list should allow automatic deselection or not.
	dragItem	<Symbol>	Selector to initiate a drag action on an item
	dropItem	<Symbol>	Selector to initiate a drop action of an item
	dropAccept	<Symbol>	Selector to determine whether a drop would be accepted
"
Class {
	#name : #PluggableListSpec,
	#superclass : #PluggableWidgetSpec,
	#instVars : [
		'list',
		'getIndex',
		'setIndex',
		'getSelected',
		'setSelected',
		'menu',
		'keyPress',
		'autoDeselect',
		'dragItem',
		'dragType',
		'dropItem',
		'dropAccept',
		'doubleClick',
		'listSize',
		'listItem',
		'keystrokePreview',
		'icon',
		'vScrollBarPolicy',
		'hScrollBarPolicy',
		'dragStarted',
		'helpItem',
		'filterableList',
		'clearFilterAutomatically',
		'itemAlignment',
		'itemPadding'
	],
	#category : #'ToolBuilder-Kernel',
	#'squeak_changestamp' : 'ar 7/15/2005 11:54'
}

{
	#category : #'accessing - selection',
	#'squeak_changestamp' : 'ar 2/12/2005 16:42'
}
PluggableListSpec >> autoDeselect [
	"Answer whether this tree can be automatically deselected"
	^autoDeselect ifNil:[true]
]

{
	#category : #'accessing - selection',
	#'squeak_changestamp' : 'ar 2/12/2005 16:41'
}
PluggableListSpec >> autoDeselect: aBool [
	"Indicate whether this tree can be automatically deselected"
	autoDeselect := aBool
]

{
	#category : #building,
	#'squeak_changestamp' : 'ar 2/12/2005 18:16'
}
PluggableListSpec >> buildWith: builder [
	^builder buildPluggableList: self
]

{
	#category : #'accessing - list',
	#'squeak_changestamp' : 'mt 8/10/2016 15:43'
}
PluggableListSpec >> clearFilterAutomatically [
	^ clearFilterAutomatically
]

{
	#category : #'accessing - list',
	#'squeak_changestamp' : 'mt 8/10/2016 15:43'
}
PluggableListSpec >> clearFilterAutomatically: aBoolean [
	clearFilterAutomatically := aBoolean.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jcg 12/12/2009 10:34'
}
PluggableListSpec >> doubleClick [
	"Answer the selector to perform when a double-click occurs"
	^doubleClick
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jcg 12/12/2009 10:34'
}
PluggableListSpec >> doubleClick: aSymbol [
	"Set the selector to perform when a double-click occurs"
	doubleClick := aSymbol.
]

{
	#category : #'accessing - drag and drop',
	#'squeak_changestamp' : 'ar 7/15/2005 11:07'
}
PluggableListSpec >> dragItem [
	"Answer the selector for dragging an item"
	^dragItem
]

{
	#category : #'accessing - drag and drop',
	#'squeak_changestamp' : 'ar 7/15/2005 11:07'
}
PluggableListSpec >> dragItem: aSymbol [
	"Set the selector for dragging an item"
	dragItem := aSymbol
]

{
	#category : #'accessing - drag and drop',
	#'squeak_changestamp' : 'mt 11/4/2015 14:38'
}
PluggableListSpec >> dragStarted [
	^ dragStarted
]

{
	#category : #'accessing - drag and drop',
	#'squeak_changestamp' : 'mt 11/4/2015 14:38'
}
PluggableListSpec >> dragStarted: symbol [
	dragStarted := symbol.
]

{
	#category : #'accessing - drag and drop',
	#'squeak_changestamp' : 'mt 3/4/2021 15:03'
}
PluggableListSpec >> dragType [
	"Answer the selector to determine the type that can be used configure the drop."

	^ dragType
]

{
	#category : #'accessing - drag and drop',
	#'squeak_changestamp' : 'mt 3/4/2021 15:03'
}
PluggableListSpec >> dragType: aSymbol [
	"Answer the selector to determine the type that can be used configure the drop."
	
	dragType := aSymbol.
]

{
	#category : #'accessing - drag and drop',
	#'squeak_changestamp' : 'ar 7/15/2005 11:54'
}
PluggableListSpec >> dropAccept [
	"Answer the selector to determine whether a drop would be accepted"
	^dropAccept
]

{
	#category : #'accessing - drag and drop',
	#'squeak_changestamp' : 'ar 7/15/2005 11:55'
}
PluggableListSpec >> dropAccept: aSymbol [
	"Answer the selector to determine whether a drop would be accepted"
	dropAccept := aSymbol.
]

{
	#category : #'accessing - drag and drop',
	#'squeak_changestamp' : 'ar 7/15/2005 11:07'
}
PluggableListSpec >> dropItem [
	"Answer the selector for dropping an item"
	^dropItem
]

{
	#category : #'accessing - drag and drop',
	#'squeak_changestamp' : 'ar 7/15/2005 11:07'
}
PluggableListSpec >> dropItem: aSymbol [
	"Set the selector for dropping an item"
	dropItem := aSymbol
]

{
	#category : #'accessing - list',
	#'squeak_changestamp' : 'mt 8/10/2016 14:53'
}
PluggableListSpec >> filterableList [
	^ filterableList
]

{
	#category : #'accessing - list',
	#'squeak_changestamp' : 'mt 8/10/2016 14:53'
}
PluggableListSpec >> filterableList: aBoolean [
	filterableList := aBoolean.
]

{
	#category : #'accessing - selection',
	#'squeak_changestamp' : 'ar 2/9/2005 18:21'
}
PluggableListSpec >> getIndex [
	"Answer the selector for retrieving the list's selection index"
	^getIndex
]

{
	#category : #'accessing - selection',
	#'squeak_changestamp' : 'ar 2/9/2005 18:21'
}
PluggableListSpec >> getIndex: aSymbol [
	"Indicate the selector for retrieving the list's selection index"
	getIndex := aSymbol
]

{
	#category : #'accessing - selection',
	#'squeak_changestamp' : 'ar 2/10/2005 22:33'
}
PluggableListSpec >> getSelected [
	"Answer the selector for retrieving the list selection"
	^getSelected
]

{
	#category : #'accessing - selection',
	#'squeak_changestamp' : 'ar 2/10/2005 22:33'
}
PluggableListSpec >> getSelected: aSymbol [
	"Indicate the selector for retrieving the list selection"
	getSelected := aSymbol
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 4/19/2015 07:40'
}
PluggableListSpec >> hScrollBarPolicy [

	^ hScrollBarPolicy
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 4/19/2015 07:41'
}
PluggableListSpec >> hScrollBarPolicy: aSymbol [
	"#always, #never, #whenNeeded"

	hScrollBarPolicy := aSymbol.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 4/5/2016 10:18'
}
PluggableListSpec >> helpItem [
	
	^ helpItem
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 4/5/2016 10:18'
}
PluggableListSpec >> helpItem: selector [
	
	helpItem := selector.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'cwp 12/8/2011 12:01'
}
PluggableListSpec >> icon [
	^ icon
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'cwp 12/8/2011 12:02'
}
PluggableListSpec >> icon: aSelector [
	icon := aSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 10/23/2019 11:18'
}
PluggableListSpec >> itemAlignment [
	"Define the alignment of each list item in its layout cell. The value can encode both horizontal and vertical dimensions."
	
	^ itemAlignment
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 10/23/2019 11:18'
}
PluggableListSpec >> itemAlignment: aSymbol [
	"For convenience, map #left and #right to their correct values. At least for Morphic."
	
	aSymbol == #left ifTrue: [^ itemAlignment := #leftCenter].
	aSymbol == #right ifTrue: [^ itemAlignment := #rightCenter].
	
	itemAlignment := aSymbol.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 10/23/2019 11:35'
}
PluggableListSpec >> itemPadding [
	
	^ itemPadding
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 10/23/2019 11:36'
}
PluggableListSpec >> itemPadding: numberOrPointOrRectangle [
	
	itemPadding := numberOrPointOrRectangle.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/9/2005 18:23'
}
PluggableListSpec >> keyPress [
	"Answer the selector for invoking the list's keyPress handler"
	^keyPress
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/9/2005 18:23'
}
PluggableListSpec >> keyPress: aSymbol [
	"Indicate the selector for invoking the list's keyPress handler"
	keyPress := aSymbol
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'MAD 3/15/2010 11:34'
}
PluggableListSpec >> keystrokePreview [
	"Answer the selector to determine whether to allow the model a preview of keystrokes"
	^ keystrokePreview
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'MAD 3/15/2010 11:35'
}
PluggableListSpec >> keystrokePreview: aSymbol [
	"The selector to determine whether to allow the model a preview of keystrokes"
	keystrokePreview := aSymbol.
]

{
	#category : #'accessing - list',
	#'squeak_changestamp' : 'ar 2/9/2005 18:20'
}
PluggableListSpec >> list [
	"Answer the selector for retrieving the list contents"
	^list
]

{
	#category : #'accessing - list',
	#'squeak_changestamp' : 'ar 2/9/2005 19:24'
}
PluggableListSpec >> list: aSymbol [
	"Indicate the selector for retrieving the list contents"
	list := aSymbol.
]

{
	#category : #'accessing - list',
	#'squeak_changestamp' : 'mtf 9/27/2007 11:13'
}
PluggableListSpec >> listItem [
	"Answer the selector for retrieving the list element"
	^listItem
]

{
	#category : #'accessing - list',
	#'squeak_changestamp' : 'mtf 9/27/2007 11:13'
}
PluggableListSpec >> listItem: aSymbol [
	"Indicate the selector for retrieving the list element"
	listItem := aSymbol.
]

{
	#category : #'accessing - list',
	#'squeak_changestamp' : 'mtf 9/27/2007 11:11'
}
PluggableListSpec >> listSize [
	"Answer the selector for retrieving the list size"
	^listSize
]

{
	#category : #'accessing - list',
	#'squeak_changestamp' : 'mtf 9/27/2007 11:12'
}
PluggableListSpec >> listSize: aSymbol [
	"Indicate the selector for retrieving the list size"
	listSize := aSymbol.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/9/2005 18:22'
}
PluggableListSpec >> menu [
	"Answer the selector for retrieving the list's menu"
	^menu
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/9/2005 18:22'
}
PluggableListSpec >> menu: aSymbol [
	"Indicate the selector for retrieving the list's menu"
	menu := aSymbol
]

{
	#category : #'accessing - selection',
	#'squeak_changestamp' : 'ar 2/9/2005 18:21'
}
PluggableListSpec >> setIndex [
	"Answer the selector for setting the list's selection index"
	^setIndex
]

{
	#category : #'accessing - selection',
	#'squeak_changestamp' : 'ar 2/9/2005 18:21'
}
PluggableListSpec >> setIndex: aSymbol [
	"Answer the selector for setting the list's selection index"
	setIndex := aSymbol
]

{
	#category : #'accessing - selection',
	#'squeak_changestamp' : 'ar 2/10/2005 22:34'
}
PluggableListSpec >> setSelected [
	"Answer the selector for setting the list selection"
	^setSelected
]

{
	#category : #'accessing - selection',
	#'squeak_changestamp' : 'ar 2/10/2005 22:33'
}
PluggableListSpec >> setSelected: aSymbol [
	"Indicate the selector for setting the list selection"
	setSelected := aSymbol
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 4/19/2015 07:42'
}
PluggableListSpec >> vScrollBarPolicy [

	^ vScrollBarPolicy
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 4/19/2015 07:42'
}
PluggableListSpec >> vScrollBarPolicy: aSymbol [
	"#always, #never, #whenNeeded"
	
	vScrollBarPolicy := aSymbol.
]
