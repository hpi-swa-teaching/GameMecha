weAre
testOpenTodos
	"inspect a collection of all methods which contain TODOs, regex can be exchanged"
	"HOPMain todoLocator"
	|query methods |
	self shouldFindTodos ifFalse: [^self].
	query := (FillInTheBlankMorph request: 'Search query:' initialAnswer: '*todo*').
	
	methods := ((self allOurMethods
		select:[:method| (query match: method getSource string)])).
	
	self openInspectorIfNecessaryOn: methods withLabel: 'OpenTodos'.