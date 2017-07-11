as yet unclassified
testApiUrl
	| url |
	url := GithubRessources apiUrlForTeam: 'HPI-SWA-Teaching' andProject: 'SWT17-Project-13' andPath: '/' andBranche: 'master'.
	self assert:	'https://api.github.com/repos/HPI-SWA-Teaching/SWT17-Project-13/contents/?ref=master' equals: url.
		
	url := GithubRessources apiUrlForTeam: 'HPI-SWA-Teaching' andProject: 'SWT17-Project-13' andPath: '/'.
	self assert:	'https://api.github.com/repos/HPI-SWA-Teaching/SWT17-Project-13/contents/?ref=master' equals: url.
		
	url := GithubRessources apiUrlForTeam: 'HPI-SWA-Teaching' andProject: 'SWT17-Project-13' andPath: 'images/'.
	self assert:	'https://api.github.com/repos/HPI-SWA-Teaching/SWT17-Project-13/contents/images/?ref=master' equals: url.
		
	url := GithubRessources apiUrlForTeam: 'HPI-SWA-Teaching' andProject: 'SWT17-Project-13' andPath: '/' andBranche: 'experimental'.
	self assert:	'https://api.github.com/repos/HPI-SWA-Teaching/SWT17-Project-13/contents/?ref=experimental' equals: url.