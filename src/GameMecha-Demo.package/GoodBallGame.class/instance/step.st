accessing
step
  super step.
  submorphs do: [:sub | sub step.].
  
  (self keyboard isKeyDown: 'w') ifTrue:[
    ball position: ball position + (0@(-40)).].
  
  (self keyboard isKeyDown: 'a') ifTrue:[
    ball position: ball position + (-40@0).].
  
  (self keyboard isKeyDown: 's') ifTrue:[
    ball position: ball position + (0@40).].
  
  (self keyboard isKeyDown: 'd') ifTrue:[
    ball position: ball position + (40@0).].