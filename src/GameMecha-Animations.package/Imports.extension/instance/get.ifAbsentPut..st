*GameMecha-Animations
get: name ifAbsentPut: computeBlock
	|normalized|
	normalized := self normalizeFileName: name.
	^ imports
		at: normalized
		ifAbsentPut: computeBlock.