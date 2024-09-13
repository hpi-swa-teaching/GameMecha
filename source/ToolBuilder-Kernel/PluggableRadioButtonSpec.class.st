"
PluggableRadioButton is intended as a HINT for the builder that this widget will be used as radio button. Unless explicitly supported it will be automatically substituted by PluggableButton.
"
Class {
	#name : #PluggableRadioButtonSpec,
	#superclass : #PluggableButtonSpec,
	#category : #'ToolBuilder-Kernel',
	#'squeak_changestamp' : 'ar 2/12/2005 23:14'
}

{
	#category : #building,
	#'squeak_changestamp' : 'ar 2/12/2005 18:16'
}
PluggableRadioButtonSpec >> buildWith: builder [
	^builder buildPluggableRadioButton: self
]
