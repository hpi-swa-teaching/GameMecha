*GameMecha-Animations-IO
importFileNamed: fullName 
	| localName pathParts form imageName |
	FileDirectory
		splitName: fullName
		to: [:dirPath :lname | 
			localName := lname.
			pathParts := dirPath findTokens: FileDirectory slash].
	form := [Form fromFileNamed: fullName]
				on: Error
				do: [:ex | ex return: nil].
	form
		ifNil: [^ nil].
	imageName := FileDirectory baseNameFor: localName.
	[imports includesKey: imageName]
		whileTrue: [imageName := pathParts isEmpty
						ifTrue: [Utilities
								keyLike: imageName
								satisfying: [:ea | (imports includesKey: ea) not]]
						ifFalse: [pathParts removeLast , '-' , imageName]].
	imports at: imageName put: form.
	^ form