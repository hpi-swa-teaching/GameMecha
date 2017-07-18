as yet unclassified
loadJson: url
| wc resp |
wc := WebClient new .
resp := wc httpGet: url.
^ resp getContent.