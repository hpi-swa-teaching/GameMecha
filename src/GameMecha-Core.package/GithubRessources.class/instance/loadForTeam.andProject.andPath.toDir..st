accessing
loadForTeam: team andProject: project andPath: path toDir: dir
	| url urls |
	url := GithubRessources  apiUrlForTeam: team andProject: project andPath: path andBranche: (self branch).
	urls := GithubRessources parseJson: (GithubRessources loadJson: url).
	urls := GithubRessources filter: urls byRegex: (self extensionFilter).
	urls keysAndValuesDo: [:name :qry | WebResources ensureFile: qry isAt: (dir,'/',name)].