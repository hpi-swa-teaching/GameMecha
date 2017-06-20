best category
testForPointAtMethodEnd
	"inspect a collection of all methods which contain TODOs, regex can be exchanged"
	"HOPMain todoLocator"
	|classes methods|
	classes := (Smalltalk allClasses 
		select: [:class | class category asString prefixMatchesRegex: 'GameMecha']).
	
	methods := ((((classes
		collect:[:class | class methodDictionary associations])flatten union: (classes
		collect: [:class | class class methodDictionary associations]) flatten) 
		select:[:method| ('*.' match: method value getSource string) not])
		asOrderedCollection sorted)
		collect: [:method | method value methodClass -> method key].
	
	methods isEmpty 
		ifFalse: [Inspector openOn: methods. Error signal].