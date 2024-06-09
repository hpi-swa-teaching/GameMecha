"
Tree item for PluggableTreeMorph. My model is the tree morph. I keep track of my parent item and the index in my parent's list of children to support selective refreshing.
"
Class {
	#name : #PluggableTreeItemNode,
	#superclass : #ListItemWrapper,
	#instVars : [
		'parent',
		'index'
	],
	#category : #'ToolBuilder-Morphic',
	#'squeak_changestamp' : 'mt 2/1/2016 10:24'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/12/2005 00:16'
}
PluggableTreeItemNode >> acceptDroppingObject: anotherItem [
	^model dropNode: anotherItem on: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/12/2005 00:16'
}
PluggableTreeItemNode >> asString [
	^model printNode: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/12/2005 00:16'
}
PluggableTreeItemNode >> balloonText [
	^model balloonTextForNode: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/12/2005 00:02'
}
PluggableTreeItemNode >> canBeDragged [
	^model isDraggableNode: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/12/2005 00:03'
}
PluggableTreeItemNode >> contents [
	^model contentsOfNode: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/12/2005 00:16'
}
PluggableTreeItemNode >> hasContents [
	^model hasNodeContents: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/12/2005 00:04'
}
PluggableTreeItemNode >> icon [
	^model iconOfNode: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 1/24/2016 17:27'
}
PluggableTreeItemNode >> index [

	^ index
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 1/24/2016 17:27'
}
PluggableTreeItemNode >> index: anInteger [

	index := anInteger.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/12/2005 01:00'
}
PluggableTreeItemNode >> item [
	^item
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 3/7/2015 10:15'
}
PluggableTreeItemNode >> parent [
	^ parent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 3/7/2015 10:14'
}
PluggableTreeItemNode >> parent: aNode [
	parent := aNode.
]

{
	#category : #private,
	#'squeak_changestamp' : 'mt 7/28/2020 09:56'
}
PluggableTreeItemNode >> refresh [
	
	self parent ifNil: [^ self].
	self setItem: (self parent contents
		at: self index
		ifAbsent: [self error: 'No support for changed child count yet!'])
			item.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ar 2/12/2005 00:16'
}
PluggableTreeItemNode >> wantsDroppedObject: anotherItem [
	^model wantsDroppedNode: anotherItem on: self
]
