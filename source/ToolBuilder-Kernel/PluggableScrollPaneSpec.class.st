Class {
	#name : #PluggableScrollPaneSpec,
	#superclass : #PluggableCompositeSpec,
	#instVars : [
		'morph',
		'morphClass',
		'borderWidth',
		'vScrollBarPolicy',
		'hScrollBarPolicy'
	],
	#category : #'ToolBuilder-Kernel'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 7/26/2016 11:24'
}
PluggableScrollPaneSpec >> borderWidth [

	^ borderWidth
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 6/15/2014 07:27:49.47'
}
PluggableScrollPaneSpec >> borderWidth: anObject [

	borderWidth := anObject
]

{
	#category : #building,
	#'squeak_changestamp' : 'mt 6/15/2014 07:20:48.063'
}
PluggableScrollPaneSpec >> buildWith: builder [

	^ builder buildPluggableScrollPane: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 6/5/2016 12:56'
}
PluggableScrollPaneSpec >> hScrollBarPolicy [

	^ hScrollBarPolicy
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 6/15/2014 07:34:08.997'
}
PluggableScrollPaneSpec >> hScrollBarPolicy: anObject [
	"#always, #never, #whenNeeded"

	hScrollBarPolicy := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 6/15/2014 07:17:36.829'
}
PluggableScrollPaneSpec >> morph [

	^ morph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 6/15/2014 07:17:36.953'
}
PluggableScrollPaneSpec >> morph: anObject [

	morph := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 6/15/2014 07:17:37.06'
}
PluggableScrollPaneSpec >> morphClass [

	^ morphClass
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 6/15/2014 07:17:37.166'
}
PluggableScrollPaneSpec >> morphClass: anObject [

	morphClass := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 6/5/2016 12:57'
}
PluggableScrollPaneSpec >> vScrollBarPolicy [

	^ vScrollBarPolicy
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mt 6/15/2014 07:33:45.268'
}
PluggableScrollPaneSpec >> vScrollBarPolicy: anObject [
	"#always, #never, #whenNeeded"
	
	vScrollBarPolicy := anObject
]
