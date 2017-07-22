accessing
loadForTeam: team andProject: project andPath: path toDir: dir
	| url urls |
	url := self class apiUrlForTeam: team andProject: project andPath: path andBranche: (self branch).
	urls := self class parseJson: (self class loadJson: url).
	urls := self class filter: urls byRegex: (self extensionFilter).
	urls keysAndValuesDo: [:name :qry | WebResources ensureFile: qry isAt: (dir,'/',name)].