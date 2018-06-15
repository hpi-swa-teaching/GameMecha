*GM-Core
isKeyPressed: aCharacter
    self flag: #todo. "assert extension eventhandelr is our and not nil"
    ^ self extension eventHandler isKeyPressed: aCharacter.