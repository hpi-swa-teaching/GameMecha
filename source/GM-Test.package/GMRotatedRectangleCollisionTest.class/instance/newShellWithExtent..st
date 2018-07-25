testing
newShellWithExtent: anExtent
	^ self newMorphWithOwner
		extent: anExtent;
		center: 0 @ 0;
		addFlexShell;
		owner