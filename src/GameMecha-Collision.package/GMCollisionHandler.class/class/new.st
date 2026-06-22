backwards-compatibility
new
	"
	Older games might still be based on the class name `GMCollisionHandler`. 
	We therefore still provide it as a symbol in the global context and just overwrite its constructor method to provide backwards compatibility.
	"

	^ GMCollisionManager new