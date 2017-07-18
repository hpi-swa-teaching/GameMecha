as yet unclassified
parseJson: jsonString
"retruns a list of files"
| ret json |
ret := Set new.
json := (Json newWithConstructors: {Object.}) readFrom: jsonString readStream.
json do: [:o | (o at: 'download_url') ifNotNil: [ret add: (o at: 'download_url')]].
^ ret.