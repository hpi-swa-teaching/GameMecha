A GMDemoGame represents the level in which the demo game takes place. To play the game, open an instance of this class. The DemoGame is responsible for setting everything up and for holding the collisionHandler.
Every morph which wants to be considered during collision detection has to be registered at the collisionHandler. A morph registering at the collisionHandler needs to have a collisionDetectionShape.
Furthermore, the demo game is responsible for listening to keyboard inputs. Other entities may ask it whether certain keys are pressed. Only one morph at a time can have the keyboard focus and consequently receive keyboard events.

Some methods are exessively commented because the game's purpose is to explain implementation examples of the GM library, normally you wouldn't do this.

To play use W,A,S,D and the arrow keys.