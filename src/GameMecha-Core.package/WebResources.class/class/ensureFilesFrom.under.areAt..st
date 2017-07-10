as yet unclassified
ensureFilesFrom: rootDirectory under: relativeUrls areAt: localPath
	"TODO: rename under"
	
	|anyDownloaded downloaded|
  	anyDownloaded := false.
  	relativeUrls do: 
    		[:currentPath | downloaded := self 
      	ensureFile: rootDirectory,currentPath 
      	isAt: localPath,'\',(self getFileName: currentPath).
    	anyDownloaded ifFalse: [anyDownloaded := downloaded]
    	].

	^anyDownloaded.