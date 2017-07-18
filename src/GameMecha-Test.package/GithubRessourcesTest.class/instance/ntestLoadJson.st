as yet unclassified
ntestLoadJson
	| json |
	json := GithubRessources loadJson: 'https://api.github.com/repos/HPI-SWA-Teaching/SWT17-Project-13/contents/?ref=master'.
	self assert: json notEmpty.