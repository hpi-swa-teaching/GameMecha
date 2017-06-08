preloading
preload: folder
	(self allFilesIn: folder)
		do: [:name | self get: folder , '/' , name].