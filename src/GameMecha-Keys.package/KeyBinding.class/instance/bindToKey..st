accessing
bindToKey: aKey
	self keys add: (KeyHandler preprocessInput: aKey).
	self keyString 
		ifNil: [self keyString: aKey asString] 
		ifNotNilDo: [:string| self keyString: string, ' | ', aKey].