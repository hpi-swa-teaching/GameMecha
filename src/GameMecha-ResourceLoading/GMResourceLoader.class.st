"
A GMResourceLoader is an abstract class which bundles shared behavior of the specific resource loaders.
A specific ResourceLoader acts as a cache for its supported Types. Furthermore:
	All resources from a folder can be loaded. 
	Specific resources can be loaded from a supplied directory. The directory has to be within the resource folder of squeak.
	Resources can be loaded from drive and stored in methods. It is recommended to not use the resources stored in methods but rather cache them before using them.
	Objects can be loaded into the cache from drive or already created objects.


"
Class {
	#name : #GMResourceLoader,
	#superclass : #Object,
	#instVars : [
		'cache'
	],
	#category : #'GameMecha-ResourceLoading',
	#'squeak_changestamp' : 'NK 7/25/2018 17:27'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 7/3/2018 22:06'
}
GMResourceLoader >> at: aString [
	^ self cache at: (self convertToRelativePath: aString) ifAbsent: [self error: #ResourceNotLoaded]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 5/13/2018 14:09'
}
GMResourceLoader >> cache [
	^ cache ifNil: [cache := Dictionary new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 5/13/2018 14:08'
}
GMResourceLoader >> cache: anObject [
	cache := anObject
]

{
	#category : #storing,
	#'squeak_changestamp' : 'NK 7/25/2018 12:13'
}
GMResourceLoader >> compileMethod: aSelector inInstance: anInstance fromString: aString [
	"meta-programming warning"
	anInstance class compile: ((WriteStream on: '') 
		nextPutAll: aSelector asString;
		nextPutAll: String cr, String tab, '"This is an auto-generated method"';
		nextPutAll: String cr, String tab,  '^ ', aString;
		contents).
]

{
	#category : #filesystem,
	#'squeak_changestamp' : 'brh 7/4/2018 11:05'
}
GMResourceLoader >> contentsFromFile: aFilename [
	^ (FileStream readOnlyFileNamed: (FileDirectory default / aFilename) fullName) binary contents base64Encoded
]

{
	#category : #filesystem,
	#'squeak_changestamp' : 'brh 6/30/2018 22:08'
}
GMResourceLoader >> convertToRelativePath: aFilename [
	^ (FileDirectory uri: aFilename) fullName allButFirst: FileDirectory default fullName size +1 
]

{
	#category : #loading,
	#'squeak_changestamp' : 'NK 7/1/2018 14:38'
}
GMResourceLoader >> defaultNameFunction [
	^ [:foldername :filename | self convertToRelativePath: foldername, filename]
]

{
	#category : #filesystem,
	#'squeak_changestamp' : 'brh 7/3/2018 22:03'
}
GMResourceLoader >> ensureSlashEnding: aFoldername [
	(aFoldername = '' or: [aFoldername endsWithAnyOf: {'/' . '\'}])
		ifTrue:  [^ ''].
	^ FileDirectory slash asString
]

{
	#category : #filesystem,
	#'squeak_changestamp' : 'AZ 7/15/2018 17:34'
}
GMResourceLoader >> filenamesAtDir: aFoldername [
	^ (FileDirectory uri: aFoldername) fileNames
		select: [:filename | self isSupportedType: (FileDirectory extensionFor: filename)]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 5/13/2018 14:10'
}
GMResourceLoader >> flushCache [ 
	self cache: Dictionary new.
]

{
	#category : #loading,
	#'squeak_changestamp' : 'AZ 7/15/2018 17:37'
}
GMResourceLoader >> isSupportedType: aFileExtension [
	self subclassResponsibility.
]

{
	#category : #loading,
	#'squeak_changestamp' : 'AZ 7/15/2018 18:19'
}
GMResourceLoader >> loadAllResourcesFromDrive: aFoldername [
	^ self loadAllResourcesFromDrive: aFoldername withNameFunction: self defaultNameFunction
]

{
	#category : #loading,
	#'squeak_changestamp' : 'brh 7/24/2018 20:55'
}
GMResourceLoader >> loadAllResourcesFromDrive: aFoldername withNameFunction: aBlock [
	| adaptedFoldername |
	adaptedFoldername := aFoldername, (self ensureSlashEnding: aFoldername).
	self cache addAll: ((self filenamesAtDir: adaptedFoldername)
		collect: [:filename | (aBlock value: adaptedFoldername value: filename) -> 
			(self resourceFromDrive: adaptedFoldername, filename)]).
]

{
	#category : #loading,
	#'squeak_changestamp' : 'brh 7/15/2018 00:02'
}
GMResourceLoader >> loadAllResourcesFromDriveWithoutEndings: aFoldername [
	self loadAllResourcesFromDrive: aFoldername withNameFunction: [:foldername :filename |
		self removeFileendingFrom: (self defaultNameFunction value: foldername value: filename)].
]

{
	#category : #loading,
	#'squeak_changestamp' : 'AZ 7/15/2018 17:30'
}
GMResourceLoader >> loadResourceFromDrive: aFilename [
	self cache at: (self convertToRelativePath: aFilename) 
		put: (self resourceFromDrive: aFilename).
]

{
	#category : #loading,
	#'squeak_changestamp' : 'AZ 7/15/2018 17:30'
}
GMResourceLoader >> loadResourceFromDrive: aFilename withName: aName [
	self cache at: aName put: (self resourceFromDrive: aFilename).
]

{
	#category : #loading,
	#'squeak_changestamp' : 'brh 7/15/2018 00:04'
}
GMResourceLoader >> loadResourceFromObject: anObject withName: aString [
	self cache at: aString put: anObject deepCopy.
]

{
	#category : #filesystem,
	#'squeak_changestamp' : 'brh 6/30/2018 22:38'
}
GMResourceLoader >> removeFileendingFrom: aFilename [
	^ aFilename copyUpToLast: FileDirectory extensionDelimiter
]

{
	#category : #loading,
	#'squeak_changestamp' : 'brh 7/14/2018 23:52'
}
GMResourceLoader >> resourceFromDrive: aFilename [
	self subclassResponsibility.
]

{
	#category : #storing,
	#'squeak_changestamp' : 'NK 7/25/2018 12:17'
}
GMResourceLoader >> storeEncodedFileInMethod: aSelector inInstance: anInstance fromFile: aFilename [
	"meta-programming warning"
	| stream |
	stream := (WriteStream on: '') 
		nextPutAll: aSelector asString , String cr , '"This is an auto-generated method."', String cr;
		nextPutAll: ' ^ ';
		store: (self contentsFromFile: aFilename);
		yourself.
	anInstance class compile: stream contents.
]

{
	#category : #storing,
	#'squeak_changestamp' : 'brh 7/24/2018 21:58'
}
GMResourceLoader >> storeResourceInMethod: aSelector inInstance: anInstance fromFile: aFilename [
	self compileMethod: aSelector 
		inInstance: anInstance
		fromString: (self stringFromFile: aFilename).
]
