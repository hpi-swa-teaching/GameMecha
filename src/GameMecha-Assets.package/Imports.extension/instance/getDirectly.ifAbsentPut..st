*GameMecha-Assets
getDirectly: normalizedName ifAbsentPut: computeBlock
	"use this instead of get: if you want to skip uri-path-conversion"
	^ imports
		at: normalizedName
		ifAbsentPut: [computeBlock cull: normalizedName].