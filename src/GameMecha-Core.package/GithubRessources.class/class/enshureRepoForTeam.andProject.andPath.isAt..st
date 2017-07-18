as yet unclassified
"example: GithubRessources enshureRepoForTeam:  'HPI-SWA-Teaching' andProject: 'SWT17-Project-13' andPath: '/' isAt: 'github'  "
enshureRepoForTeam: team andProject: project andPath: path isAt: dir
	| url urls |
	url := self apiUrlForTeam: team  andProject: project andPath: path andBranche: 'master'.
	urls := self parseJson: (self loadJson: url).
	urls do:[:u| WebResources ensureFile: u isAt: (dir,'/',u).].