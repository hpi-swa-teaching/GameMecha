Class {
	#name : #PluggableMenuSpec,
	#superclass : #ToolBuilderSpec,
	#instVars : [
		'label',
		'model',
		'items'
	],
	#category : #'ToolBuilder-Kernel'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'cwp 6/9/2005 00:22'
}
PluggableMenuSpec class >> withModel: aModel [
	^ self new model: aModel
]

{
	#category : #construction,
	#'squeak_changestamp' : 'ar 2/28/2006 17:26'
}
PluggableMenuSpec >> add: aString action: aMessageSend [
	| item |
	item := self addMenuItem.
	item label: aString.
	item action: aMessageSend.
	^item
]

{
	#category : #construction,
	#'squeak_changestamp' : 'ar 2/28/2006 17:25'
}
PluggableMenuSpec >> add: aString target: anObject selector: aSelector argumentList: anArray [
	^self add: aString action: (MessageSend 
				receiver: anObject 
				selector: aSelector
				arguments: anArray).
]

{
	#category : #construction,
	#'squeak_changestamp' : 'ct 2/21/2022 01:10'
}
PluggableMenuSpec >> addLine [
	"For compatibility with MenuMorph/CustomMenu."

	^ self addSeparator
]

{
	#category : #construction,
	#'squeak_changestamp' : 'ar 10/5/2009 21:46'
}
PluggableMenuSpec >> addList: aList [
	"Add the given items to this menu, where each item is a pair (<string> <actionSelector>)..  If an element of the list is simply the symobl $-, add a line to the receiver.  The optional third element of each entry, if present, provides balloon help."

	aList do: [:tuple |
		(tuple == #-)
			ifTrue: [self addSeparator]
			ifFalse:[ | item |
				item := self add: tuple first target: model selector: tuple second argumentList: #().
				tuple size > 2 ifTrue:[item help: tuple third]]]
]

{
	#category : #construction,
	#'squeak_changestamp' : 'ar 2/28/2006 17:27'
}
PluggableMenuSpec >> addMenuItem [
	| item |
	item := self newMenuItem.
	self items add: item.
	^item
]

{
	#category : #construction,
	#'squeak_changestamp' : 'ar 2/28/2006 17:25'
}
PluggableMenuSpec >> addSeparator [
	self items isEmpty ifTrue:[^nil].
	self items last separator: true.
]

{
	#category : #construction,
	#'squeak_changestamp' : 'ar 9/7/2009 14:17'
}
PluggableMenuSpec >> analyzeItemLabels [
	"Analyze the item labels"
	items do:[:item| item analyzeLabel].

]

{
	#category : #construction,
	#'squeak_changestamp' : 'ar 9/7/2009 14:18'
}
PluggableMenuSpec >> buildWith: builder [
	self analyzeItemLabels.
	^ builder buildPluggableMenu: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/28/2006 17:27'
}
PluggableMenuSpec >> items [
	^ items ifNil: [items := OrderedCollection new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/28/2006 17:12'
}
PluggableMenuSpec >> label [
	^label
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/28/2006 17:12'
}
PluggableMenuSpec >> label: aString [
	label := aString.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'cwp 6/8/2005 23:36'
}
PluggableMenuSpec >> model [
	^ model
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'cwp 6/8/2005 23:36'
}
PluggableMenuSpec >> model: anObject [ 
	model := anObject
]

{
	#category : #construction,
	#'squeak_changestamp' : 'ar 2/28/2006 17:27'
}
PluggableMenuSpec >> newMenuItem [
	^PluggableMenuItemSpec new
]
