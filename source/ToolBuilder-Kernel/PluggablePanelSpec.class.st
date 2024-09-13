"
A panel with a (possibly changing) set of child elements. Expects to see change/update notifications when the childrens change.
"
Class {
	#name : #PluggablePanelSpec,
	#superclass : #PluggableCompositeSpec,
	#category : #'ToolBuilder-Kernel',
	#'squeak_changestamp' : 'ar 2/11/2005 15:01'
}

{
	#category : #building,
	#'squeak_changestamp' : 'ar 2/12/2005 18:16'
}
PluggablePanelSpec >> buildWith: builder [
	^builder buildPluggablePanel: self.
]
