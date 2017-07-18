*GameMecha-Assets-IO
importDirectoryWithSubdirectories: uri 
	| dir |
	dir := FileDirectory uri: uri.
	dir exists ifFalse: [self error: dir fullName , ' does not exist'. ^ #()].
	^ (dir withAllSubdirectoriesCollect: [:subdir | self importDirectory: subdir]) flatten.