best category
testForPointAtMethodEnd
	"fail, if any Method inside the GameMecha-package does not end with a dot."
	|methods|
	"
	methods := ((self allOurMethods
		select:[:method| ('*.' match: method getSource string) not])).
	
	self openInspectorIfNecessaryOn: methods withLabel: 'MissingPoints'."