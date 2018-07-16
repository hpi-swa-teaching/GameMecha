write on disk
createImagesOnDisk
	PNGReadWriter putForm: self planet onFileNamed: self planetPath.
	PNGReadWriter putForm: self projectile onFileNamed: self projectilePath.
	PNGReadWriter putForm: self spaceship1 onFileNamed: self spaceship1Path.
	PNGReadWriter putForm: self spaceship2 onFileNamed: self spaceship2Path.