Class {
	#name : #PluggableImageButtonSpec,
	#superclass : #PluggableButtonSpec,
	#instVars : [
		'path',
		'arguments',
		'project',
		'buttonGroup',
		'description',
		'groupName'
	],
	#category : #'GameMecha-TileEditor'
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
	#'squeak_changestamp' : 'tw 7/12/2024 19:35'
}
PluggableImageButtonSpec >> arguments: anObject [

	arguments := anObject
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
	#'squeak_changestamp' : 'tw 7/12/2024 19:35'
}
PluggableImageButtonSpec >> buttonGroup: anObject [

	buttonGroup := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 7/10/2024 02:02'
}
PluggableImageButtonSpec >> description [
	^ description
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tw 7/12/2024 19:35'
}
PluggableImageButtonSpec >> description: anObject [

	description := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tw 7/12/2024 17:04'
}
PluggableImageButtonSpec >> groupName [

	^ groupName
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'tw 7/12/2024 19:35'
}
PluggableImageButtonSpec >> groupName: anObject [

	groupName := anObject
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
	#'squeak_changestamp' : 'tw 7/12/2024 19:35'
}
PluggableImageButtonSpec >> path: anObject [

	path := anObject
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
	#'squeak_changestamp' : 'tw 7/12/2024 19:35'
}
PluggableImageButtonSpec >> project: anObject [

	project := anObject
]
