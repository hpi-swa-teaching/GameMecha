preloading
preloadFolder: aFolder
	"only load all files that are in this level (no recursive preloading)"
	(self allFilesIn: aFolder)
		do: [:name | self get: aFolder , '/' , name].