best category
testCommentedMethods
	"fail, if any long Method inside the GameMecha-package has no comment"
	|methods|
	methods := self allOurMethods
		select:[:method | method linesOfCode >= 12 and: [(method getSource string includes: $") not]].
	
	methods isEmpty 
		ifFalse: [Inspector openOn: methods. Error signal].