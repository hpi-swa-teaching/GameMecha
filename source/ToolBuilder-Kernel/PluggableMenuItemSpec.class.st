Class {
	#name : #PluggableMenuItemSpec,
	#superclass : #ToolBuilderSpec,
	#instVars : [
		'label',
		'action',
		'checked',
		'enabled',
		'separator',
		'subMenu',
		'checkable'
	],
	#category : #'ToolBuilder-Kernel'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/28/2006 17:23'
}
PluggableMenuItemSpec >> action [
	"Answer the action associated with the receiver"
	^action
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/28/2006 17:23'
}
PluggableMenuItemSpec >> action: aMessageSend [
	"Answer the action associated with the receiver"
	action := aMessageSend
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'fbs 6/18/2013 17:34'
}
PluggableMenuItemSpec >> analyzeLabel [
	"For Morphic compatiblity. Some labels include markup such as <on>, <off> etc.
	Analyze the label for these annotations and take appropriate action."
	| marker |
	marker := label copyFrom: 1 to: (label indexOf: $>).
	(marker = '<on>' or:[marker = '<yes>']) ifTrue:[
		checkable := true.
		checked := true.
		label := label copyFrom: marker size+1 to: label size.
	].
	(marker = '<off>' or:[marker = '<no>']) ifTrue:[
		checkable := true.
		checked := false.
		label := label copyFrom: marker size+1 to: label size.
	].

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'fbs 6/18/2013 17:27'
}
PluggableMenuItemSpec >> beCheckable [
	checkable := true.
]

{
	#category : #building,
	#'squeak_changestamp' : 'ar 2/28/2006 17:23'
}
PluggableMenuItemSpec >> buildWith: builder [
	^ builder buildPluggableMenuItem: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/28/2006 17:28'
}
PluggableMenuItemSpec >> checked [
	"Answer whether the receiver is checked"
	^checked ifNil:[false]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/28/2006 17:21'
}
PluggableMenuItemSpec >> checked: aBool [
	"Indicate whether the receiver is checked"
	checked := aBool.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/28/2006 17:28'
}
PluggableMenuItemSpec >> enabled [
	"Answer whether the receiver is enabled"
	^enabled ifNil:[true]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/28/2006 17:21'
}
PluggableMenuItemSpec >> enabled: aBool [
	"Indicate whether the receiver is enabled"
	enabled := aBool
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'fbs 6/18/2013 17:34'
}
PluggableMenuItemSpec >> initialize [
	checkable := false.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'fbs 6/18/2013 17:27'
}
PluggableMenuItemSpec >> isCheckable [
	^ checkable
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/28/2006 17:20'
}
PluggableMenuItemSpec >> label [
	"Answer the receiver's label"
	^label
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/28/2006 17:21'
}
PluggableMenuItemSpec >> label: aString [
	"Set the receiver's label"
	label := aString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/28/2006 17:28'
}
PluggableMenuItemSpec >> separator [
	"Answer whether the receiver should be followed by a separator"
	^separator ifNil:[false]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/28/2006 17:22'
}
PluggableMenuItemSpec >> separator: aBool [
	"Indicate whether the receiver should be followed by a separator"
	separator := aBool.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/28/2006 17:22'
}
PluggableMenuItemSpec >> subMenu [
	"Answer the receiver's subMenu"
	^subMenu
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/28/2006 17:22'
}
PluggableMenuItemSpec >> subMenu: aMenuSpec [
	"Answer the receiver's subMenu"
	subMenu := aMenuSpec
]
