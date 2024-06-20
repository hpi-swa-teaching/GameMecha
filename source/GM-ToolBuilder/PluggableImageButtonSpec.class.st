Class {
	#name : #PluggableImageButtonSpec,
	#superclass : #PluggableButtonSpec,
	#instVars : [
		'unpressedPath',
		'pressedPath',
		'hoverPath'
	],
	#category : #'GM-ToolBuilder'
}

{
	#category : #building,
	#'squeak_changestamp' : 'TW 6/20/2024 20:26'
}
PluggableImageButtonSpec >> buildWith: builder [
	^builder buildPluggableImageButton: self
]
