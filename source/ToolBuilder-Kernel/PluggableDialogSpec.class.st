Class {
	#name : #PluggableDialogSpec,
	#superclass : #PluggableCompositeSpec,
	#instVars : [
		'title',
		'message',
		'extent',
		'buttons',
		'closeAction',
		'exclusive',
		'autoCancel'
	],
	#category : #'ToolBuilder-Kernel'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 1/17/2018 08:46'
}
PluggableDialogSpec >> autoCancel [
	"Automatically cancel the dialog if the user clicks outside its bounds."
	
	^ autoCancel
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 8/5/2016 09:44'
}
PluggableDialogSpec >> autoCancel: aBoolean [
	autoCancel := aBoolean.
]

{
	#category : #building,
	#'squeak_changestamp' : 'mt 7/14/2016 09:42'
}
PluggableDialogSpec >> buildWith: builder [
	^builder buildPluggableDialog: self.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 7/13/2016 16:31'
}
PluggableDialogSpec >> buttons [

	^ buttons
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 7/13/2016 16:31'
}
PluggableDialogSpec >> buttons: anObject [

	buttons := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 7/14/2016 08:24'
}
PluggableDialogSpec >> closeAction [

	^ closeAction
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 7/14/2016 08:24'
}
PluggableDialogSpec >> closeAction: anObject [

	closeAction := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 8/5/2016 09:44'
}
PluggableDialogSpec >> exclusive [
	^ exclusive
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 8/5/2016 09:44'
}
PluggableDialogSpec >> exclusive: aBoolean [
	exclusive := aBoolean.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 7/13/2016 16:31'
}
PluggableDialogSpec >> extent [

	^ extent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 7/13/2016 16:31'
}
PluggableDialogSpec >> extent: anObject [

	extent := anObject
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 7/14/2016 16:24'
}
PluggableDialogSpec >> horizontalResizing [
	^ #rigid
]

{
	#category : #'window compatibility',
	#'squeak_changestamp' : 'mt 7/14/2016 08:42'
}
PluggableDialogSpec >> label [
	^ self title
]

{
	#category : #'window compatibility',
	#'squeak_changestamp' : 'mt 7/14/2016 08:43'
}
PluggableDialogSpec >> label: stringOrSymbol [
	self title: stringOrSymbol.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 7/13/2016 16:31'
}
PluggableDialogSpec >> message [

	^ message
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 7/13/2016 16:31'
}
PluggableDialogSpec >> message: anObject [

	message := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 7/13/2016 16:31'
}
PluggableDialogSpec >> title [

	^ title
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 7/13/2016 16:31'
}
PluggableDialogSpec >> title: anObject [

	title := anObject
]

{
	#category : #'layout hints',
	#'squeak_changestamp' : 'mt 7/14/2016 16:24'
}
PluggableDialogSpec >> verticalResizing [
	^ #rigid
]
