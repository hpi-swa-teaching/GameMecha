as yet unclassified
testWebResourceLoading
  |imports img1 img2 images imageRoot|
  img1 := 'http://www.carl-bechstein-gymnasium.de/bilder/layout/logo.jpg'.
  img2 := 'https://raw.githubusercontent.com/HPI-SWA-Teaching/SWT17-Project-13/master/default-resources/comic-fire/fireball/fireball_0003.png'.
  images := #('/bauphase/webcam.jpg' '/news/images/einweihung.jpg').
  imageRoot := 'http://www.carl-bechstein-gymnasium.de'.
  imports := Imports new.
  
  "first, test htttp, jpg and windows file separators"
  self
    assert: (WebResources ensureFile: img1 isAt: 'GMTest/cbg.jpg');
    assert: ((FileDirectory default / 'GMTest') fileExists: 'cbg.jpg').

    "also test https, png and linux separators"
    "assert: (WebResources ensureFile: img2 isAt: 'webtest/fire.png');
    assert: ((FileDirectory default / 'webtest') fileExists: 'fire.png');"
    
    "also test multiple files from same source"
  self
    assert: (WebResources ensureFilesFrom: imageRoot under: images  areAt: 'GMTest');
    assert: ((FileDirectory default / 'GMTest') fileExists: 'einweihung.jpg');
    assert: ((FileDirectory default / 'GMTest') fileExists: 'webcam.jpg').
  
    "now check, if the images can be loaded into squeak corrently"
    "Debugger halt."
  self
    assert: (imports get: 'GMTest/cbg.jpg') extent
    equals: (194@90);
    assert: (imports get: 'GMTest/einweihung.jpg') extent
    equals: (1090@727);
    assert: (imports get: 'GMTest/webcam.jpg') extent
    equals: (720@576);
    "assert: ((ImageCache newOn: 'webtest') getTexture: 'fire.png') extent
    equals: 512 asPoint;"
    
    "finally, images should not get reloaded if they already exist"
    deny: (WebResources ensureFile: img1 isAt: 'GMTest/cbg.jpg');
    
    "but they should, if you want to"
    assert: (WebResources ensureFile: img1 isAt: 'GMTest/cbg.jpg' overwrite: true).