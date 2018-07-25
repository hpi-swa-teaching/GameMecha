This class has class methods containing all assets used in the demo game. This way, the game is distributable and downloading images and sound separately is not necessary. 
If you also want to save assets inside of a method you can call the following method in the workspace:
	<GMResourceLoader subclass here> new storeResourceInMethod: aSelector inInstance: anInstance fromFile: aFilename
for example:
	GMImageLoader new storeResourceInMethod: #createdMethod inInstance: GMDemoGameFixtures new fromFile: 'planet.png'
where 'planet.png' is located inside of the 'Resources' folder. This creates "createdMethod" on the class side of GMDemoGameFixtures 