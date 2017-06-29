as yet unclassified
testWebResourceLoading
	|img1 img2|
	img1 := 'http://www.carl-bechstein-gymnasium.de/bilder/layout/logo.jpg'.
	img2 := 'https://raw.githubusercontent.com/HPI-SWA-Teaching/SWT17-Project-13/master/default-resources/comic-fire/fireball/fireball_0003.png'.
	
	"first, test htttp, jpg and windows file separators"
	self
		assert: (WebResources ensureFile: img1 isAt: 'webtest\cbg.jpg');
		assert: ((FileDirectory default / 'webtest') fileExists: 'cbg.jpg');

		"also test https, png and linux separators"
		"assert: (WebResources ensureFile: img2 isAt: 'webtest/fire.png');
		assert: ((FileDirectory default / 'webtest') fileExists: 'fire.png');"
	
		"now check, if the images can be loaded into squeak corrently"
		assert: ((ImageCache newOn: 'webtest') getTexture: 'cbg.jpg') extent
		equals: (194@90);
		"assert: ((ImageCache newOn: 'webtest') getTexture: 'fire.png') extent
		equals: 512 asPoint;"
		
		"finally, images should not get reloaded if they already exist"
		deny: (WebResources ensureFile: img1 isAt: 'webtest\cbg.jpg');
		
		"but they should, if you want to"
		assert: (WebResources ensureFile: img1 isAt: 'webtest\cbg.jpg' overwrite: true).