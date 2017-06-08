preloading
preloadRecursive: folder
	self preload: folder.
	(self allDirectoriesIn: folder)
		do: [:dir | self preloadRecursive: folder , '/' , dir]