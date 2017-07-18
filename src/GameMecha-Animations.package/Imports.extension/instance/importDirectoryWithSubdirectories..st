*GameMecha-Animations-IO
importDirectoryWithSubdirectories: directoryOrName 
	| dir forms |
	dir := directoryOrName isString
				ifTrue: [FileDirectory default directoryNamed: directoryOrName]
				ifFalse: [directoryOrName].
	dir exists
		ifFalse: [self error: dir fullName , ' does not exist'.
			^ #()].
	forms := OrderedCollection new.
	dir
		withAllSubdirectoriesCollect: [:subdir | forms
				addAll: (self importImageDirectory: dir)].
	^ forms.