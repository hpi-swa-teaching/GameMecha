"
PluggableActionButtonSpec is intended as a HINT for the builder that this widget will be used as push (action) button. Unless explicitly supported it will be automatically substituted by PluggableButton.
"
Class {
	#name : #PluggableActionButtonSpec,
	#superclass : #PluggableButtonSpec,
	#category : #'ToolBuilder-Kernel',
	#'squeak_changestamp' : 'dtl 9/19/2011 07:51'
}

{
	#category : #building,
	#'squeak_changestamp' : 'ar 2/12/2005 18:16'
}
PluggableActionButtonSpec >> buildWith: builder [
	^builder buildPluggableActionButton: self
]
