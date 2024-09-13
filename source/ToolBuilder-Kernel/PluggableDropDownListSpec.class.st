Class {
	#name : #PluggableDropDownListSpec,
	#superclass : #PluggableWidgetSpec,
	#instVars : [
		'listSelector',
		'selectionSelector',
		'selectionSetter'
	],
	#category : #'ToolBuilder-Kernel'
}

{
	#category : #building,
	#'squeak_changestamp' : 'rww 9/11/2010 13:36'
}
PluggableDropDownListSpec >> buildWith: builder [
	^builder buildPluggableDropDownList: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'rww 9/11/2010 13:36'
}
PluggableDropDownListSpec >> listSelector [
	"Answer the value of listSelector"

	^ listSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'rww 9/11/2010 13:36'
}
PluggableDropDownListSpec >> listSelector: anObject [
	"Set the value of listSelector"

	listSelector := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'rww 9/11/2010 13:36'
}
PluggableDropDownListSpec >> selectionSelector [
	"Answer the value of selectionSelector"

	^ selectionSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'rww 9/11/2010 13:36'
}
PluggableDropDownListSpec >> selectionSelector: anObject [
	"Set the value of selectionSelector"

	selectionSelector := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'rww 9/11/2010 13:36'
}
PluggableDropDownListSpec >> selectionSetter [
	"Answer the value of selectionSetter"

	^ selectionSetter
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'rww 9/11/2010 13:36'
}
PluggableDropDownListSpec >> selectionSetter: anObject [
	"Set the value of selectionSetter"

	selectionSetter := anObject
]
