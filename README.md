# Game Mechanics ![build status](https://github.com/hpi-swa-teaching/GameMecha/actions/workflows/main.yml/badge.svg?branch=master)
We are creating a game library.

## How to install
1. Get [Squeak 6.0 or later](http://www.squeak.org)
2. Load [Metacello](https://github.com/metacello/metacello)
3. Finally, load the library with the following command:

```Smalltalk
Metacello new
  baseline: 'GameMecha';
  repository: 'github://hpi-swa-teaching/GameMecha/src';
  load.
```

## How to use
The library comes with an extensive documentation in tests and class comments. You can load these by executing:

```Smalltalk
Metacello new
  baseline: 'GameMecha';
  repository: 'github://hpi-swa-teaching/GameMecha/src';
  load: 'test'.
```

You can find the examples in the ```GameMecha-Examples``` class category.

## GameMecha – Collision System
This package contains the current collision system of GameMecha. It consists of three parts that work together:
- **Colliders** (`GMCollider` and its subclasses): belong to a morph and are used to check whether the morph collides with another collider
- **CollisionManager** (`GMCollisionManager`): manages a set of morphs, checks for collisions on every update, and notifies the affected morphs
- **ColliderEditor** (`GMColliderEditor`): graphical tool that allows collider shapes to be placed visually on a reference morph instead of converting coordinates manually

> **Note:** `GMCollisionHandler` is the old, deprecated collision system and is intentionally not described here. It is only included as a class to support old games that rely on the `GMCollisionHandler` symbol in the global context. For new morphs, only `GMCollider`s  should be used in combination with the `GMCollisionManager`.

### Colliders
A collider is a spatial object used for collision detection. Colliders may either be primitive colliders or composite colliders.

> A note on documentation: The listed examples are written as GMC (GameMechaCollider) assets. GMC assets are a STON format serialization of the `GMCollider` classes. All named fields have a setter on the collider instance to allow setting them in code. Refer to [[#Loading a Collider from an Asset]] for more information.

#### Collider Hierarchy
The collider hierarchy looks as follows:
- `GMCollider` (abstract): common properties such as center, rotation, scale, layer/mask
    - `GMCompositeCollider`: container that groups any number of child colliders
    - `GMPrimitiveCollider` (abstract): standard collider that implements the geometrical collision logic
        - `GMPrimitiveRectangleCollider`: rectangle shaped collider
        - `GMPrimitiveCircleCollider`: circle shaped collider
    - `GMNullCollider`: empty collider placeholder, usually seen as the default parent when no parent is set

In most cases, a single primitive collider is completely sufficient as a standard collider.
A `GMCompositeCollider` is only worthwhile in special situations, such as detecting body parts separately.

#### Base Collider Structure
All colliders share the following common fields.

| Field      | Type                  | Required | Description                                                                                                                                                                            |
| ---------- | --------------------- | -------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `enabled`  | Boolean               | NO       | A boolean, describing whether a collider participates in collision. It is enabled by default.                                                                                          |
| `title`    | String                | NO       | A string, describing the collider.                                                                                                                                                     |
| `symbol`   | Symbol                | NO       | A symbol to identify the collider in programmatic contexts.                                                                                                                            |
| `center` | Point                 | NO       | A point, encoding the center position of the collider relative to its parent.                                                                                                                 |
| `rotation` | Number                | NO       | A number, encoding the colliders rotation in degrees relative to its parent.                                                                                                           |
| `scale`    | Point                 | NO       | A point, encoding the scale of the collider relative to its parent.                                                                                                                    |
| `layers`   | Collection of Numbers | NO       | A collection with all layers the collider should be on. It is inherited by its parents and defaults to `#(1)`. Parents also need to include the layer a child wants to be included in. |
| `mask`     | Collection of Numbers | NO       | A collection with all layers the collider should collide with. It is inherited by its parents and defaults to `#(1)`.                                                                  |

#### Primitive Colliders
A primitive collider is the most primitive form of a collider. It functions as the base building block for more complex colliders. Primitive colliders are responsible for defining actual collision geometry and implementing geometric collision operations. Primitive colliders **MAY NOT** contain child colliders. All primitive colliders inherit the fields defined in [[#Base Collider Structure]].

Examples of primitive colliders include:
- `GMPrimitiveRectangleCollider`
- `GMPrimitiveCircleCollider`

##### GMPrimitiveRectangleCollider
A `GMPrimitiveRectangleCollider` is a rectangular collider defined by width and height.

###### Fields

| Field    | Type   | Required | Description                     |
| -------- | ------ | -------- | ------------------------------- |
| `width`  | Number | YES      | The width of the rectangle.     |
| `height` | Number | YES      | The height of the rectangle.    |

###### Example
```gmc
GMPrimitiveRectangleCollider {
   #width : 64,
   #height : 32
}
```

##### GMPrimitiveCircleCollider
A circular collider defined by a radius.

###### Fields

| Field    | Type   | Required | Description               |
| -------- | ------ | -------- | ------------------------- |
| `radius` | Number | YES      | The radius of the circle. |

###### Example
```gmc
GMPrimitiveCircleCollider {
   #radius : 24
}
```

#### Composite Colliders
A composite collider is a collider composed of one or more child colliders. Composite colliders do not define collision geometry directly. Instead, they organize and transform child colliders. Composite colliders **MAY** contain both primitive and composite colliders. All child collider transforms are relative to their parent collider. All composite colliders inherit the fields defined in [[#Base Collider Structure]].

###### Fields

| Field      | Type            | Required | Description                          |
| ---------- | --------------- | -------- | ------------------------------------ |
| `children` | Array<Collider> | YES      | The child colliders of the collider. |

###### Example
```gmc
GMCompositeCollider {
   #children : [
      GMPrimitiveRectangleCollider {
         #width : 32,
         #height : 16
      },
      GMPrimitiveCircleCollider {
         #radius : 8,
         #center : Point {
            #x : 20,
            #y : 5
         }
      }
   ]
}
```

#### Transform Semantics
Collider transforms are always local to their parent collider. Child colliders inherit transforms recursively. The highest collider in the collision tree is relative to the morph it is attached to.

#### Example
```gmc
GMCompositeCollider {
   #center : Point {
      #x : 100,
      #y : 50
   },
   #children : [
      GMPrimitiveCircleCollider {
         #radius : 8,
         #center : Point {
            #x : 10,
            #y : 0
         }
      }
   ]
}
```

The effective world center position (which in itself is relative to the morph owning the collider) of the circle collider becomes:

```smalltalk
(110, 50)
```

assuming no rotation or scaling is applied.

#### Validation Rules
Implementations **SHOULD** validate the following:
- Primitive collider dimensions are positive
- Composite collider children are valid colliders
- Recursive collider hierarchies do not contain cycles

#### Extensibility
Unknown collider types **SHOULD** be ignored gracefully if unsupported. Implementations **SHOULD** preserve unknown fields during serialization and deserialization whenever possible.


### Making a Morph Collidable
Every morph that should work with the `GMCollisionManager` needs a `collider` method that returns a `GMCollider` instance:

```smalltalk
collider

	^ "Some kind of collider"
```

> Note: The collider that should be returned here, most likely will stem from an asset. Refer to [[#Loading a Collider from an Asset]]. The following examples show, that colliders can also be attached without an asset.

##### Examples
**A circular enemy**
```smalltalk
initialize
	super initialize.
	self
		radius: 50px;
		color: Color blue.
	self collider: (GMPrimitiveCircleCollider new
		parent: self;
		radius: self radius;
		yourself
		)
```

**A rectangular player**
```smalltalk
initialize
	super initialize.
	self
		width: 50px;
		height: 50px.
	self collider: (GMPrimitiveRectangleCollider new
		parent: self;
		width: self width;
		height: self height;
		yourself
		)
```

A `GMCompositeCollider` should be used when multiple shapes need to be combined. Individual colliders are then added using `addChild:`, for example, to detect hits to the head separately from the rest of the body.
```smalltalk
initialize
	"[Your morph initialization code here]"

	self collider: (GMCompositeCollider new
		parent: self;
		layers: #(4);
		mask: #(5);
		yourself
	).
	self collider addChild: (GMPrimitiveRectangleCollider new
		symbol: #body;
		width: self width;
		height: self height).
	self collider addChild: (GMPrimitiveCircleCollider new
		symbol: #head;
		center: 0 @ -50px;
		radius: 15px)
```

In `onCollision: aCollisionEvent`, the symbol can then be used to determine which part was hit.

### Layers & Mask (Collision Filtering)
> Note: This has been inspired by and partly taken from [Godot Collision Layers and Masks Explained Without the Headache \| Godot Learning](https://godotlearning.com/blog/godot-collision-layers-and-masks).

#### Layers
Every collider can belong to one or more collision layers. Think of layers as labels that the `GMCollisionManager` can check quickly. A player might be on the Player layer. Enemies might be on the Enemy layer. Walls might be on the World layer.

An example setup could be:
- **Layer 1 - World:** floors, walls, one-way platforms, and tile collisions.
- **Layer 2 - Player:** the player character and sometimes player sensors.
- **Layer 3 - Enemy:** enemies, enemy hurtboxes, and enemy bodies.
- **Layer 4 - Pickup:** coins, health, keys, and level triggers.
- **Layer 5 - Projectile:** bullets, arrows, thrown objects, and temporary hits.

##### Masks
The collision mask is the other half. It tells an object which layers it cares about. A player body, for example, usually detects the World layer and the Enemy layer. A pickup usually detects the Player layer. A player bullet might detect the Enemy and World layers, but not the Player or Pickup layers, and so on.

##### How to Use?
Both layers and masks can be assigned through collider setters or configured directly in a collider asset.
```smalltalk
"Player is on layers 1 and 2 and is interested in layers 4 (enemies) and 8 (zones):"
collider
		layers: #(1 2);
		mask: #(4 8).

"Enemy is on layer 4 and is interested in layers 1 and 2 (player):"
enemyCollider
		layers: #(4);
		mask: #(1 2).
```

> Note: Both `layers` and `mask` are inherited from parent colliders unless explicitly set. For a nested collider to collide on a specific layer, its parent also needs to have the same layer set. The same applies for the mask.

### Collision Manager
`GMCollisionManager` maintains a list of morphs and checks all pairs efficiently for collisions whenever `update` is called.

In your game class you can add the collision manager (assuming that you have both a `self collisionManager` setter and a getter set up) as follows:
```smalltalk
initialize
	"[Your initialization code]"
	self collisionManager: GMCollisionManager new

addMorph: aMorph
	"[Your code to add a morph to the world]"
	self collisionManager addMorph: aMorph

step
	"[Your code to run per step]"
	self collisionManager update
```

#### Important methods
- `addMorph:` / `addMorphs:`: register one or more morphs. The morph **MUST** implement `collider` and the method **MUST NOT** return `nil`.
- `removeMorph:` / `removeAllMorphs`: remove morph(s) again
- `includes:` checks whether a morph is registered
- `update`: should be called regularly (typically in the game's `step` method). Compares all registered morphs pairwise and calls `onCollision:` on affected morphs when a collision occurs.
- `collisionEventOf: aMorph with: anotherMorph`: specifically checks two morphs against each other, regardless of whether they are registered with the `GMCollisionManager` and returns a `GMCollisionEvent`. It is adviced to only use the `update` method and rely on the `onCollision:` API that exposes the same information as `collisionEventOf: aMorph with: anotherMorph`.
- `is:collidingWith:` and `morphsCollidingWith:` are the simpler APIs for the most common use cases. They only answer whether a collision exists or which morphs are colliding. These methods should be considered deprecated. Generally `collisionEventOf: aMorph with: anotherMorph` should be prefered in cases where you need direct access to underlying functions.

#### Responding to Collisions
To be notified, a registered morph must implement `onCollision: aCollisionEvent`.

The event passed in is a `GMMorphCollisionEvent` containing:
- `own`: the morph itself
- `other`: the morph it collided with
- `reason`: the chain of specific collision events that lead to the overall morph collision

```smalltalk
onCollision: aCollisionEvent
	"Notify the other morph by double dispatching that you are the player for example"
	aCollisionEvent other collidedWithPlayer: self
```

##### Implemented utility messages of `GMMorphCollisionEvent`
- `hasCollidedWithSymbol: aSymbol`: Check if the collision happened because a collider with a specific symbol was involved. Note that this collider symbol must be part of the **own** collider tree. We intentionally do not provide utility functions for checking collisions against collider symbols belonging to the collision partner (other). Such functions would encourage code that depends on knowledge of the collision partner's internal collider structure, which is considered an anti-pattern. If you really need this access, you can implement it yourself by traversing the collision event tree.
- `collidedSymbols`: Returns an ordered list containing all collider symbols of the own collision tree that were involved in the collision.

### Loading a Collider from an Asset
Colliders can be saved as assets (GMC files) to declutter the code. They can be loaded via the `GMCollider newFromAsset: aColliderAsset` API.

Since creation on every call would be unnecessarily expensive, the created instance should be cached in the morph rather than recreated each time `collider` is called:
```smalltalk
collider
	"For example this can be done via lazy initialization or in an initialization function"
	^ collider ifNil: [
		collider := GMCollider newFromAsset: "aGMCAsset"
	]
```

The asset required by `newFromAsset:` can most easily be created using the [[#Collider Editor]].

### Collider Editor
A single rectangle or circle is often not sufficient to accurately represent the shape of a sprite. `GMColliderEditor` allows any number of rectangles and circles to be placed visually on top of a reference graphic. Exporting then automatically generates a collider asset.

The editor can be opened with:
```smalltalk
GMColliderEditor new
```

The editor consists of three areas:
**Toolbar (top):**
  - **Select** opens a dialog for selecting a morph class.
    - The name of the selected class is displayed to the left of the button.
    - An instance of the selected class is placed on the canvas as a visual reference.
      
 - **Import** and **Export** allow you to import and export colliders from and to the GitAssetBrowser.
   - The project name and file path are stored until the editor is closed.
   - The project name is the name of your GitHub project. In this case it would be: `GameMecha`.
   - The file path may contain subdirectories, for example: `assets/collider`
   - The file name should not include a file extension; `.ston` is added automatically.
   - The corresponding morph has to be selected before importing the collider.
   - On export if multiple colliders were created the top collider will be a composite collider with the cumulative mask/layers of its children's mask/layers.
   - Be cautious when importing a collider that consists of more then one composite collider. Even tho they have no visual representation yet, they still exist, will be exported again and can only be removed by using the clear-Button.
   - Scale factor, center and rotation inheritance will be used to calculate the representing morphs on import, but on export scale factor is always set to one, while center and rotation will always be directly set in the primitive colliders.
   - Other collider variables that can not currently be changed in the editor (mask, layers, symbol etc.) will be same when exporting, if they were set on import.

  - **Scale** specifies the desired canvas scale.
    - The new scale is applied when **Set Scale** is pressed.
    - Useful when working with very small sprites.
  - **Rectangle** and **Circle** add the corresponding collider to the canvas.

**Canvas (center):**
  - Displays a grid containing the reference morph and all added colliders, scaled according to the current canvas scale.
  - A collider can be selected by clicking it. The selected collider:
    - can be moved freely by dragging it with the mouse.
    - is highlighted in the **Collider List** in the sidebar.
    - can be resized using the handles at its four corners.
    - can be moved, resized, and rotated using the input fields in the sidebar.

**Sidebar (right):**
  - The **Collider List** displays all colliders on the canvas.
    - Clicking a collider selects it.
    - The selected collider is highlighted.
  - **Remove** removes the selected collider.
  - **Clear** removes all colliders from the canvas.
  - The input fields allow the selected collider to be moved, resized, and rotated precisely.

**Typical workflow:**
1. Click **Select** and choose the desired morph class. An instance of the selected class is placed on the canvas as a visual reference.
2. Add the required rectangle and circle colliders using the corresponding buttons.
3. Position, resize, and rotate the colliders until they accurately cover the collision area of the reference morph.
4. Export the collider as an asset and load it at runtime as described in [[#Loading a Collider from an Asset]].

> [!WARNING]
> Don't forget to commit and push your changes afterward so the collider becomes available to your collaborators.

> **Current limitation:** Nested groups (`GMCompositeCollider`s) are not yet implemented in the editor. They are technically supported by the collision system itself, but the editor does not yet provide support for creating them. Layers, masks and collider symbols are also not yet supported for the editor.
