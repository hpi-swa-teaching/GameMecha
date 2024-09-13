"
PluggableMultiSelectionListSpec specifies a list with multiple selection behavior.

Instance variables:
	getSelectionList	<Symbol>	The message to retrieve the multiple selections.
	setSelectionList	<Symbol>	The message to indicate multiple selections.
"
Class {
	#name : #PluggableMultiSelectionListSpec,
	#superclass : #PluggableListSpec,
	#instVars : [
		'getSelectionList',
		'setSelectionList'
	],
	#category : #'ToolBuilder-Kernel',
	#'squeak_changestamp' : 'ar 2/12/2005 13:31'
}

{
	#category : #building,
	#'squeak_changestamp' : 'ar 2/12/2005 18:16'
}
PluggableMultiSelectionListSpec >> buildWith: builder [
	^builder buildPluggableMultiSelectionList: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/12/2005 13:32'
}
PluggableMultiSelectionListSpec >> getSelectionList [
	"Answer the message to retrieve the multiple selections"
	^getSelectionList
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/12/2005 13:32'
}
PluggableMultiSelectionListSpec >> getSelectionList: aSymbol [
	"Indicate the message to retrieve the multiple selections"
	getSelectionList := aSymbol
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/12/2005 13:32'
}
PluggableMultiSelectionListSpec >> setSelectionList [
	"Answer the message to indicate multiple selections"
	^setSelectionList
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/12/2005 13:32'
}
PluggableMultiSelectionListSpec >> setSelectionList: aSymbol [
	"Indicate the message to indicate multiple selections"
	setSelectionList := aSymbol
]
