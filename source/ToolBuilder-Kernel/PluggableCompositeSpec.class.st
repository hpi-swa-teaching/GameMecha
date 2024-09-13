"
A composite user interface element.

Instance variables:
	children	<Symbol|Collection>	Symbol to retrieve children or children directly
	layout	<Symbol> The layout for this composite.

"
Class {
	#name : #PluggableCompositeSpec,
	#superclass : #PluggableWidgetSpec,
	#instVars : [
		'children',
		'layout',
		'wantsResizeHandles',
		'spacing'
	],
	#category : #'ToolBuilder-Kernel',
	#'squeak_changestamp' : 'ar 2/11/2005 21:58'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/9/2005 19:19'
}
PluggableCompositeSpec >> children [
	"Answer the selector to retrieve this panel's children"
	^children
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/9/2005 19:19'
}
PluggableCompositeSpec >> children: aSymbol [
	"Indicate the selector to retrieve this panel's children"
	children := aSymbol
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/9/2005 18:33'
}
PluggableCompositeSpec >> layout [
	"Answer the symbol indicating the layout of the composite:
		#proportional (default): Use frames as appropriate.
		#horizontal: Arrange the elements horizontally
		#vertical: Arrange the elements vertically.
	"
	^layout ifNil:[#proportional]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/9/2005 18:17'
}
PluggableCompositeSpec >> layout: aSymbol [
	"Answer the symbol indicating the layout of the composite:
		#proportional (default): Use frames as appropriate.
		#horizontal: Arrange the elements horizontally
		#vertical: Arrange the elements vertically.
	"
	layout := aSymbol
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 4/29/2015 15:54'
}
PluggableCompositeSpec >> spacing [
	"...between components of this widget."
	
	^ spacing
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 4/29/2015 15:54'
}
PluggableCompositeSpec >> spacing: numberOrPoint [

	spacing := numberOrPoint.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 4/29/2015 17:32'
}
PluggableCompositeSpec >> wantsResizeHandles [

	^ wantsResizeHandles
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 4/28/2015 13:17'
}
PluggableCompositeSpec >> wantsResizeHandles: aBoolean [

	wantsResizeHandles := aBoolean.
]
