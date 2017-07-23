general
getDirectly: name
	"use this instead of get: if you want to skip uri-path-conversion"
	^ self getDirectly: name ifAbsentPut: [:pathName | self importFileNamed: pathName].