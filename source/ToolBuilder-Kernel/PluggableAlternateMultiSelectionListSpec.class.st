Class {
	#name : #PluggableAlternateMultiSelectionListSpec,
	#superclass : #PluggableMultiSelectionListSpec,
	#category : #'ToolBuilder-Kernel'
}

{
	#category : #building,
	#'squeak_changestamp' : 'cmm 2/19/2010 14:26'
}
PluggableAlternateMultiSelectionListSpec >> buildWith: builder [
	^ builder buildPluggableAlternateMultiSelectionList: self
]
