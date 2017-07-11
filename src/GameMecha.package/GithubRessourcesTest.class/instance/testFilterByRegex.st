as yet unclassified
testFilterByRegex
	|files filtered | 
	files := GithubRessources parseJson: (GithubRessourcesTest getSampleJson).
	filtered := GithubRessources filter: files byRegex: '.*'.
	self assert: (filtered includes: 'https://raw.githubusercontent.com/HPI-SWA-Teaching/SWT17-Project-13/master/.smalltalk.ston').
	filtered := GithubRessources filter: files byRegex: '.*\.md'.
	self deny: (filtered includes: 'https://raw.githubusercontent.com/HPI-SWA-Teaching/SWT17-Project-13/master/.smalltalk.ston').
	self assert: (filtered includes: 'https://raw.githubusercontent.com/HPI-SWA-Teaching/SWT17-Project-13/master/README.md').
	
