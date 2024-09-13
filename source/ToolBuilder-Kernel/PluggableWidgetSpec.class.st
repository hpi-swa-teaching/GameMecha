"
The abstract superclass for all widgets.

Instance variables:
	model	<Object>	The object the various requests should be directed to.
	frame	<Rectangle> The associated layout frame for this object (if any).

"
Class {
	#name : #PluggableWidgetSpec,
	#superclass : #ToolBuilderSpec,
	#instVars : [
		'model',
		'frame',
		'color',
		'minimumExtent',
		'margin',
		'padding',
		'horizontalResizing',
		'verticalResizing'
	],
	#category : #'ToolBuilder-Kernel',
	#'squeak_changestamp' : 'ar 2/9/2005 18:40'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 5/5/2010 22:35'
}
PluggableWidgetSpec >> color [
	"Answer the selector for retrieving the button's color"
	^color
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 5/5/2010 22:35'
}
PluggableWidgetSpec >> color: aSymbol [
	"Indicate the selector for retrieving the button's color"
	color := aSymbol
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/9/2005 18:26'
}
PluggableWidgetSpec >> frame [
	"Answer the receiver's layout frame"
	^frame
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/9/2005 18:27'
}
PluggableWidgetSpec >> frame: aRectangle [
	"Indicate the receiver's layout frame"
	frame := aRectangle
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 5/3/2015 10:13'
}
PluggableWidgetSpec >> horizontalResizing [

	^ horizontalResizing
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 5/3/2015 10:14'
}
PluggableWidgetSpec >> horizontalResizing: aSymbol [
	"#rigid, #spaceFill, #shrinkWrap"

	horizontalResizing := aSymbol.
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 4/29/2015 16:03'
}
PluggableWidgetSpec >> margin [
	"Space outside the widgets border.
	See: http://www.w3.org/wiki/The_CSS_layout_model_-_boxes_borders_margins_padding"
	
	^ margin
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 4/29/2015 15:59'
}
PluggableWidgetSpec >> margin: numberOrPointOrRectangle [

	margin := numberOrPointOrRectangle.
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 4/24/2015 10:32'
}
PluggableWidgetSpec >> minimumExtent [

	^ minimumExtent ifNil: [-1 @ -1]
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 4/24/2015 10:21'
}
PluggableWidgetSpec >> minimumExtent: aPoint [

	minimumExtent := aPoint.
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 4/24/2015 10:22'
}
PluggableWidgetSpec >> minimumHeight [

	^ self minimumExtent y
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 4/24/2015 10:22'
}
PluggableWidgetSpec >> minimumHeight: aNumber [

	self minimumExtent: self minimumExtent x @ aNumber.
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 4/24/2015 10:22'
}
PluggableWidgetSpec >> minimumWidth [

	^ self minimumExtent x
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 4/24/2015 10:21'
}
PluggableWidgetSpec >> minimumWidth: aNumber [

	self minimumExtent: aNumber @ self minimumExtent y.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/9/2005 18:28'
}
PluggableWidgetSpec >> model [
	"Answer the model for which this widget should be built"
	^model
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/9/2005 18:28'
}
PluggableWidgetSpec >> model: aModel [
	"Indicate the model for which this widget should be built"
	model := aModel.
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 4/29/2015 16:02'
}
PluggableWidgetSpec >> padding [
	"Space inside the widget's border.
	See: http://www.w3.org/wiki/The_CSS_layout_model_-_boxes_borders_margins_padding"
	
	^ padding
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 4/29/2015 16:03'
}
PluggableWidgetSpec >> padding: numberOrPointOrRectangle [

	padding := numberOrPointOrRectangle.
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 5/3/2015 10:13'
}
PluggableWidgetSpec >> verticalResizing [

	^ verticalResizing
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 5/3/2015 10:14'
}
PluggableWidgetSpec >> verticalResizing: aSymbol [
	"#rigid, #spaceFill, #shrinkWrap"

	verticalResizing := aSymbol.
]
