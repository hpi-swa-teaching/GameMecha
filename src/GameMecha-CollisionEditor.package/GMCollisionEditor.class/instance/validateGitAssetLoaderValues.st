import-export
validateGitAssetLoaderValues

	self gitAssetProjectName ifNil: [self gitAssetProjectName: (UIManager default request: 'Please enter your projectname here')].
	self gitAssetProjectBasePath ifNil: [self gitAssetProjectBasePath: (UIManager default request: 'Please enter your basePath here')]