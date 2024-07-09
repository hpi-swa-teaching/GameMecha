Class {
	#name : #PluggableImageButtonSpec,
	#superclass : #PluggableButtonSpec,
	#instVars : [
		'path',
		'arguments',
		'project',
		'buttonGroup'
	],
	#category : #'GM-ToolBuilder'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/20/2024 23:22'
}
PluggableImageButtonSpec >> arguments [

	^ arguments
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/20/2024 23:22'
}
PluggableImageButtonSpec >> arguments: anObject [

	arguments := anObject.
]

{
	#category : #building,
	#'squeak_changestamp' : 'Alex M 6/22/2024 16:07'
}
PluggableImageButtonSpec >> buildWith: builder [

	^ builder buildPluggableImageButton: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 7/9/2024 18:23'
}
PluggableImageButtonSpec >> buttonGroup [

	^ buttonGroup
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 7/9/2024 18:23'
}
PluggableImageButtonSpec >> buttonGroup: anObject [

	buttonGroup := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/21/2024 01:16'
}
PluggableImageButtonSpec >> path [

	^ path
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/21/2024 01:16'
}
PluggableImageButtonSpec >> path: anObject [

	path := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/20/2024 23:31'
}
PluggableImageButtonSpec >> project [

	^ project
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/20/2024 23:31'
}
PluggableImageButtonSpec >> project: anObject [

	project := anObject.
]
