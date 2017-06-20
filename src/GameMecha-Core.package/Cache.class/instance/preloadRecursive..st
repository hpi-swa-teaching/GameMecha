preloading
preloadRecursive: folder
	self preloadFolder: folder.
	(self allDirectoriesIn: folder)
		do: [:dir | self preloadRecursive: folder , '/' , dir].