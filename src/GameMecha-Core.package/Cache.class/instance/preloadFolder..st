preloading
preloadFolder: aFolder
	(self allFilesIn: aFolder)
		do: [:name | self get: aFolder , '/' , name].