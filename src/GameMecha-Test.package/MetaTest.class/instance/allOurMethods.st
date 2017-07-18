best category
allOurMethods
	"all methods that we have written (from our classes and from extension methods)"
	^ 
	((((Smalltalk allClasses
		select: [:c | (c category asString beginsWith: 'GameMecha')])
		collect: [:c | {c methodDictionary associations. c class methodDictionary associations}])
		flatten)
	union:
	(((Smalltalk allClasses 
		select: [:class | 
		((class allMethodCategoriesIntegratedThrough: class) anySatisfy: [:category | category asString beginsWith: '*GameMecha'])
		or: [(class class allMethodCategoriesIntegratedThrough: class class) anySatisfy: [:category | category asString beginsWith: '*GameMecha']]])
	collect: [:c | ((c allMethodCategoriesIntegratedThrough: c)
			select: [:cat | cat asString beginsWith: '*GameMecha'])
		collect: [:cat | (c methodsInCategory: cat)
			collect: [:mName | mName -> (c methodDict at: mName ifAbsent: [c class methodDict at: mName])]]]) flatten))
	collect: [:a | a value].