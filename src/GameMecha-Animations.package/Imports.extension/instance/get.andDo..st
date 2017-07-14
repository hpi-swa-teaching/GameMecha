*GameMecha-Animations
get: name andDo: handler
	|obj|
	"TODO: lazy"
	obj := self get: name ifAbsentPut: [self importFileNamed: name].
	handler value: obj.
	^ obj.