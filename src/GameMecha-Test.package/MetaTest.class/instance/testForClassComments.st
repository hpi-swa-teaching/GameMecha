best category
testForClassComments
	"fail, if any class has no comment"
	|uncommentedClasses|
	uncommentedClasses := ((Smalltalk allClasses 
		select: [:class | class category asString beginsWith: 'GameMecha'])
		select: [:class | class hasComment not])
		collect: [:class | class category asString, '>>', class asString].
	uncommentedClasses isEmpty 
		ifFalse: [uncommentedClasses inspect. Error signal].