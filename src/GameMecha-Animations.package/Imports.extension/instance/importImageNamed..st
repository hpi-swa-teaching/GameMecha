*GameMecha-Animations-IO
importImageNamed: fullName 
	| form |
	form := [Form fromFileNamed: fullName]
				on: Error
				do: [:ex | ex return: nil].
	form ifNil: [^ nil].
	self importObject: form named: fullName.
	^ form.