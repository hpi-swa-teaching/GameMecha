tests
testForClassComments
	"fail, if any class has no comment"
	|uncommentedClasses|
	uncommentedClasses := ((Smalltalk allClasses 
		select: [:class | class category asString beginsWith: 'GameMecha'])
		select: [:class | class hasComment not])
		collect: [:class | class category asString, '>>', class asString].
		
	self openInspectorIfNecessaryOn: uncommentedClasses  withLabel: 'UncommentedClasses'.