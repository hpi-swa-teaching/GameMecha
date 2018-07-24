This class has class methods containing all assets used in the demo game. This way, the game is distributable and downloading images and sound seperatly is not necessary. 
If you also want to save assets inside of a method you can call the following method in the workspace:
For sounds:
	GMResourceLocator soundManager loadResourceIntoMethod: aMethodSymbol ofClass: aClass fromFile: aFilename
For images:
	GMResourceLocator imageManager loadResourceIntoMethod: aMethodSymbol ofClass: aClass fromFile: aFilename

for example:
GMResourceLocator imageManager loadResourceIntoMethod: #planet ofClass: GMDemoGameFixtures  fromFile: 'planer.png'
where 'planet.png' is located inside of the 'Resources' folder.