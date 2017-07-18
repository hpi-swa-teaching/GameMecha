*GameMecha-Assets
at: key ifPresent: oneArgBlock ifAbsentPut: absentBlock
	"Lookup the given key in the receiver. If it is present, answer the value of
	 evaluating oneArgBlock with the value associated with the key. Otherwise
	 add the value of absentBlock under the key, and answer that value."

	| index value |
	index := self scanFor: key.
	(array at: index) ifNotNil:
		[:element|
		 ^oneArgBlock value: element value].
	value := absentBlock value.
	self atNewIndex: index put: (self associationClass key: key value: value).
	^value.