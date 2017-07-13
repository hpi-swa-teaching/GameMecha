tests
testForPointAtMethodEnd
	"fail, if any Method inside the GameMecha-package does not end with a dot."
	|classes methods|
	classes := (Smalltalk allClasses 
		select: [:class | class category asString beginsWith: 'GameMecha']).
	
	methods := ((((classes
		collect:[:class | class methodDictionary associations])flatten union: (classes
		collect: [:class | class class methodDictionary associations]) flatten) 
		select:[:method| ('*.' match: method value getSource string) not])
		asOrderedCollection sorted)
		collect: [:method | method value methodClass -> method key].
	
	self openInspectorIfNecessaryOn: methods withLabel: 'MissingPoints'.