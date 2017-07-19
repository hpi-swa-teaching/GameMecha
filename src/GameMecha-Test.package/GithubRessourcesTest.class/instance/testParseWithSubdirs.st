as yet unclassified
testParseWithSubdirs
| urls |
urls := GithubRessources parseJson: (GithubRessources loadJson: (GithubRessources apiUrlForTeam: 'jakobbraun' andProject: 'swtRessources' andPath: '' andBranche: 'master')).
self assert: (urls includesKey: 'test1.md').
self assert: (urls includesKey: 'test2.txt').
self assert: (urls includesKey: 'folder/test3.md').