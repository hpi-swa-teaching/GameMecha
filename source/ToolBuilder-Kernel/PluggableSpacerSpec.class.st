Class {
	#name : #PluggableSpacerSpec,
	#superclass : #PluggableWidgetSpec,
	#instVars : [
		'extent'
	],
	#category : #'ToolBuilder-Kernel'
}

{
	#category : #building,
	#'squeak_changestamp' : 'mt 5/3/2015 14:47'
}
PluggableSpacerSpec >> buildWith: builder [
	^builder buildPluggableSpacer: self
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 12/30/2021 14:51'
}
PluggableSpacerSpec >> extent [

	^ extent ifNil: [(TextStyle defaultFont widthOf: $x) asPoint]
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 5/3/2015 14:52'
}
PluggableSpacerSpec >> extent: aPoint [

	extent := aPoint.
]

{
	#category : #convenience,
	#'squeak_changestamp' : 'mt 5/3/2015 14:53'
}
PluggableSpacerSpec >> fillSpaceHorizontally [

	self horizontalResizing: #spaceFill.
]

{
	#category : #convenience,
	#'squeak_changestamp' : 'mt 5/3/2015 14:53'
}
PluggableSpacerSpec >> fillSpaceVertically [

	self verticalResizing: #spaceFill.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 5/3/2015 14:55'
}
PluggableSpacerSpec >> horizontalResizing [

	^ super horizontalResizing ifNil: [#rigid]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 5/3/2015 14:55'
}
PluggableSpacerSpec >> verticalResizing [

	^ super verticalResizing ifNil: [#rigid]
]
