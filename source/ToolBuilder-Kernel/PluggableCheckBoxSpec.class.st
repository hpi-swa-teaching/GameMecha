"
PluggableCheckBox is intended as a HINT for the builder that this widget will be used as check box. Unless explicitly supported it will be automatically substituted by PluggableButton.
"
Class {
	#name : #PluggableCheckBoxSpec,
	#superclass : #PluggableButtonSpec,
	#category : #'ToolBuilder-Kernel',
	#'squeak_changestamp' : 'ar 2/12/2005 23:13'
}

{
	#category : #building,
	#'squeak_changestamp' : 'ar 2/12/2005 18:16'
}
PluggableCheckBoxSpec >> buildWith: builder [
	^builder buildPluggableCheckBox: self
]
