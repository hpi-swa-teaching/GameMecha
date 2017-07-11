as yet unclassified
testParseJson
	|files | 
	files := GithubRessources parseJson: (GithubRessourcesTest getSampleJson).
	self assert: (files includes: 'https://raw.githubusercontent.com/HPI-SWA-Teaching/SWT17-Project-13/master/.smalltalk.ston').
	self deny: (files includes: nil).
	
