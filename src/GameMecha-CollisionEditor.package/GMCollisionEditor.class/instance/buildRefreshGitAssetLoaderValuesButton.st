creation
buildRefreshGitAssetLoaderValuesButton

	^ self buildThemeButton: 'reset paths' Target: [
		(UIManager default confirm: 'Do you want to reset the project name and asset path? ')ifTrue: [self refreshGitAssetLoaderValues]]