ensures
ensureFilesFrom: rootDirectory under: relativeUrls areAt: localPath
	"ensure multiple files from one base url. Return, whether any of these got actually downloaded."
	^ (relativeUrls collect: [:currentPath | self 
		ensureFile: rootDirectory,currentPath 
		isAt: localPath,'/',(self getFileName: currentPath)]) anySatisfy: [:b | b].