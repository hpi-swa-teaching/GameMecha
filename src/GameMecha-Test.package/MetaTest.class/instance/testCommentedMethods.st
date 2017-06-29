best category
testCommentedMethods
	"fail, if any long Method inside the GameMecha-package has no comment"
	|classes methods|
	classes := (Smalltalk allClasses 
		select: [:class | class category asString beginsWith: 'GameMecha']).
	
	methods := (((classes
		collect:[:class | class methodDictionary associations])flatten union: (classes
		collect: [:class | class class methodDictionary associations]) flatten)
		select:[:method | method value linesOfCode > 12 and: [(method value getSource string includes: $") not]]).
	
	methods isEmpty 
		ifFalse: [Inspector openOn: methods. Error signal].