"
A common window. Expects to see change/update notifications when the label should change.

Instance variables:
	label	<String|Symbol> The selector under which to retrieve the label or the label directly
	extent	<Point>	The (initial) extent of the window.
	closeAction		<Symbol>	The action to perform when the window is closed.
"
Class {
	#name : #PluggableWindowSpec,
	#superclass : #PluggableCompositeSpec,
	#instVars : [
		'label',
		'extent',
		'closeAction',
		'multiWindowStyle',
		'defaultFocus'
	],
	#category : #'ToolBuilder-Kernel',
	#'squeak_changestamp' : '<historical>'
}

{
	#category : #building,
	#'squeak_changestamp' : 'ar 2/12/2005 18:16'
}
PluggableWindowSpec >> buildWith: builder [
	^builder buildPluggableWindow: self.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 9/17/2005 21:00'
}
PluggableWindowSpec >> closeAction [
	"Answer the receiver's closeAction"
	^closeAction
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 9/17/2005 21:00'
}
PluggableWindowSpec >> closeAction: aSymbol [
	"Answer the receiver's closeAction"
	closeAction := aSymbol.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ct 10/20/2021 16:04'
}
PluggableWindowSpec >> defaultFocus [
	"The name of the widget that should be initially focused or nil."
	^ defaultFocus
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ct 10/20/2021 16:04'
}
PluggableWindowSpec >> defaultFocus: anObject [
	"The name of the widget that should be initially focused or nil."
	defaultFocus := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/9/2005 18:30'
}
PluggableWindowSpec >> extent [
	"Answer the window's (initial) extent"
	^extent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/9/2005 18:30'
}
PluggableWindowSpec >> extent: aPoint [
	"Indicate the window's (initial) extent"
	extent := aPoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/9/2005 18:29'
}
PluggableWindowSpec >> label [
	"Answer the selector for retrieving the window's label"
	^label
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/9/2005 18:30'
}
PluggableWindowSpec >> label: aString [
	"Indicate the selector for retrieving the window's label"
	label := aString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'eem 7/1/2010 11:31'
}
PluggableWindowSpec >> multiWindowStyle [
	"Answer the value of multiWindowStyle, a Symbol or nil"
	^multiWindowStyle
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'eem 6/30/2010 11:44'
}
PluggableWindowSpec >> multiWindowStyle: aSymbol [
	"Set the value of multiWindowStyle, one of #labelButton or #tabbed"

	multiWindowStyle := aSymbol
]
