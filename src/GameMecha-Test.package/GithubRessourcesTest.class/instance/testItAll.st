as yet unclassified
testItAll
	| res |
	res := GithubRessources new. 
	res extensionFilter: '.*.md'.
	res loadForTeam: 'HPI-SWA-Teaching' andProject: 'SWT17-Project-13' andPath:'/' toDir:'github2'.
	self assert: ((FileDirectory default / 'github2') fileExists: 'README.md').