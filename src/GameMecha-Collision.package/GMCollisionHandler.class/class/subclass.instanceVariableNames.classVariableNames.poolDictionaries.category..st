backwards-compatibility
subclass: aSymbol instanceVariableNames: ivarString classVariableNames: cvarString poolDictionaries: pString category: cString

	self deprecated: 'Warning: ', aSymbol, ' inherits from GMCollisionHandler (deprecated). ', 'Automatically redirected to GMCollisionManager.'.
	
	^ ClassBuilder new
		superclass: GMCollisionManager
		subclass: aSymbol
		instanceVariableNames: ivarString
		classVariableNames: cvarString
		poolDictionaries: pString
		category: cString