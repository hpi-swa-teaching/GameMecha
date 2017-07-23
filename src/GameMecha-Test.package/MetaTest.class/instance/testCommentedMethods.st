best category
testCommentedMethods
	"fail, if any long Method inside the GameMecha-package has no comment"
	|methods|
	methods := self allOurMethods
		select:[:method | method linesOfCode >= 12 and: [(method getSource string includes: $") not]].
	
	self openInspectorIfNecessaryOn: methods withLabel: 'UncommentedLongMethods'.