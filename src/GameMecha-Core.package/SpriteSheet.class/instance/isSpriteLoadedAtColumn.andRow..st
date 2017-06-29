accessing
isSpriteLoadedAtColumn: column andRow: row
	^self cachedElements includesKey:  (column@row).