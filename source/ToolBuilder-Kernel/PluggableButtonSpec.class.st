"
A button, both for firing as well as used in radio-button style (e.g., carrying a selection).

Instance variables:
	action	<Symbol>	The action to perform when the button is fired.
	label	<Symbol|String>	The selector for retrieving the button's label or label directly.
	state	<Symbol>	The selector for retrieving the button's selection state.
	enabled	<Symbo>		The selector for retrieving the button's enabled state.
	color	<Symbo>		The selector for retrieving the button color.
	help	<String>		The balloon help for the button.
"
Class {
	#name : #PluggableButtonSpec,
	#superclass : #PluggableWidgetSpec,
	#instVars : [
		'action',
		'label',
		'state',
		'enabled',
		'style',
		'changeLabelWhen'
	],
	#category : #'ToolBuilder-Kernel',
	#'squeak_changestamp' : 'ar 2/11/2005 21:57'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/9/2005 18:20'
}
PluggableButtonSpec >> action [
	"Answer the action to be performed by the receiver"
	^action
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/9/2005 18:20'
}
PluggableButtonSpec >> action: aSymbol [
	"Indicate the action to be performed by the receiver"
	action := aSymbol
]

{
	#category : #building,
	#'squeak_changestamp' : 'ar 2/12/2005 18:16'
}
PluggableButtonSpec >> buildWith: builder [
	^builder buildPluggableButton: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'dtl 9/24/2011 09:06'
}
PluggableButtonSpec >> changeLabelWhen [
	"When handled in in an update: handler, treat this symbol as notification
	that the button label should be updated."
	^changeLabelWhen
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'dtl 9/24/2011 09:09'
}
PluggableButtonSpec >> changeLabelWhen: aSymbol [
	"When the button handles aSymbol in its update: handler, treat it
	as notification that the button label should be updated."
	changeLabelWhen := aSymbol
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 6/21/2005 10:41'
}
PluggableButtonSpec >> enabled [
	"Answer the selector for retrieving the button's enablement"
	^enabled ifNil:[true]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/11/2005 14:39'
}
PluggableButtonSpec >> enabled: aSymbol [
	"Indicate the selector for retrieving the button's enablement"
	enabled := aSymbol
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/9/2005 18:18'
}
PluggableButtonSpec >> label [
	"Answer the label (or the selector for retrieving the label)"
	^label
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/9/2005 19:44'
}
PluggableButtonSpec >> label: aSymbol [
	"Indicate the selector for retrieving the label"
	label := aSymbol.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/9/2005 18:19'
}
PluggableButtonSpec >> state [
	"Answer the selector for retrieving the button's state"
	^state
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/9/2005 19:44'
}
PluggableButtonSpec >> state: aSymbol [
	"Indicate the selector for retrieving the button's state"
	state := aSymbol.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'dtl 9/24/2011 09:33'
}
PluggableButtonSpec >> style [
	"Treat aSymbol as a hint to modify the button appearance."
	^style


]

{
	#category : #accessing,
	#'squeak_changestamp' : 'dtl 9/24/2011 09:25'
}
PluggableButtonSpec >> style: aSymbol [
	"Use aSymbol as a hint to modify the button appearance."
	style := aSymbol

]
