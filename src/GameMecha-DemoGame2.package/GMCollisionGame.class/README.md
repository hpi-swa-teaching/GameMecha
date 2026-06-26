A GMCollisionGame represents the level in which the demo game takes place. To play the game, create an instance of it with new. The DemoGame is responsible for setting everything up and for holding the collisionManager.
Every morph which wants to be considered during collision detection has to be registered at the collisionManager. A morph registering at the collisionHandler needs to have a Collider and needs to implement onCollision: .
Furthermore, the demo game is responsible for listening to keyboard inputs. Other entities may ask it whether certain keys are pressed. Only one morph at a time can have the keyboard focus and consequently receive keyboard events.

Some methods are exessively commented because the game's purpose is to explain implementation examples of the GM Collider library, normally you wouldn't do this.

To play use W,A,S,D and the arrow keys. Player 1 shoots with c and Player 2 with m (only while moving).

DISCLAIMER: We use the double dispatch pattern for collision handling in the game, basically inverting the mask/layer logic. Be aware of that when trying to understand why mask/layers look the way they do.
