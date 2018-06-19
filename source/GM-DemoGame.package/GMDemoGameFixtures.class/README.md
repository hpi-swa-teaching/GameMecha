This class has class methods containing all assets used in the demoGame. This way, the game is distibutable and you won't have to download the images and sounds separately. If you also want to save assets inside of a method you can call the following method in the workspace:
for sounds:
GMResourceLocator soundManager loadResourceIntoMethod: aMethodSymbol ofClass: aClass fromFile: aFilename
and for images:
GMResourceLocator imageManager loadResourceIntoMethod: aMethodSymbol ofClass: aClass fromFile: aFilename

for example:
GMResourceLocator imageManager loadResourceIntoMethod: #planet ofClass: GMDemoGameFixtures  fromFile: 'planer.png'
where 'planet.png' is located inside of the 'Resources' folder.