Class {
	#name : #PluggableImageButtonSpec,
	#superclass : #PluggableButtonSpec,
	#instVars : [
		'unpressedPath',
		'pressedPath',
		'hoverPath',
		'arguments',
		'project'
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
	#'squeak_changestamp' : 'TW 6/20/2024 20:26'
}
PluggableImageButtonSpec >> buildWith: builder [
	^builder buildPluggableImageButton: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/20/2024 23:22'
}
PluggableImageButtonSpec >> hoverPath [

	^ hoverPath
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/20/2024 23:22'
}
PluggableImageButtonSpec >> hoverPath: anObject [

	hoverPath := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/20/2024 23:22'
}
PluggableImageButtonSpec >> pressedPath [

	^ pressedPath
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/20/2024 23:22'
}
PluggableImageButtonSpec >> pressedPath: anObject [

	pressedPath := anObject.
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

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/20/2024 23:22'
}
PluggableImageButtonSpec >> unpressedPath [

	^ unpressedPath
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/20/2024 23:22'
}
PluggableImageButtonSpec >> unpressedPath: anObject [

	unpressedPath := anObject.
]
