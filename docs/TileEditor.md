# GM - TileEditor

## Starting the editor

You can start the editor by running `GMTEEditor new`.

> By running `GMTEEditor register` you can add the editor to the Apps menu.

## Menu functions

### Import

#### Importing a tile set

After providing a tile height in pixels you can select a tile set file that is automatically cut into tiles and loaded into the tile store.

#### Importing a tilemap

Import a previously exported tile map to keep working on it.

### Export

#### Export as tilemap

Export your current progress on the tilemap to a file.

> Can be reimported to continue working on it.

#### Export as PNG

Save the tilemap as a picture.

### Open in world

Opens the current tilemap morph to experiment with its current state.

### Toggle grid

Toggles the visibility of the map grid.

### Toggle Background

Toggles the dynamic filling of the tile maps background with the background tile.

> The background tile can be selected by right clicking a tile in the tile store.

### Reset View

Reset your view after zooming in/out or moving your view.

## Tile Store
Select a tile by left clicking it.

Select a background tile by right clicking it.

## Tilemap

Place tiles on the current layer by left clicking.
Remove tiles on the current layer by right clicking.

> You can place / remove multiple tiles by holding left / right click and dragging your mouse over the desired tiles.
> You can rotate your currently selected tile by pressing <kbd>ctrl</kbd>/<kbd>alt</kbd> + <kbd>r</kbd> Zoom in/out by scrolling.

Hold shift, left click and drag your mouse to move your view.

## Toolbar

### Undo/Redo

Un-/Redo your last action, whether that is a layer action, a drawing/erasing action or resizing the tilemap.

### Brushes

You can choose from a selection from brushes.
Additionally you can choose a radius which applies to the (default) brush and the line tool.

#### (default) Brush

Places tiles where you click and, depending on the radius, around it.

#### Line Tool

Click and drag to draw a line between start and end point.
A larger radius leads to a thicker line.

#### Fill tool

Click on a tile to replace all alike connected tiles with a new tile.

#### Rectangle Tool

Place a rectangle of tiles by clicking in the upper left corner and dragging to the lower right corner of the desired rectangle. When you release the mouse button the area is filled with your selected tile.

## Inspector Tab

Allows you to adjust the tilemaps attributes.

### Grid height / width

Adjusts the height / width of the tilemap.

### Padding

The distance between the grid and the edge of the tilemap.

## Layer Tab

### Selecting layers

Select and deselect layers to manipulate them.

> You can select multiple layers by shift + clicking.
> Some layer actions only work if just one layer is selected.

### Layer Actions

#### Add Layer

Adds a new layer in front of the other layers.

#### Move up / down

Moves the currently selected layer up / down by one.

#### Renaming

Allows you to choose a custom name for the currently selected layer.

#### Clearing

Clears all currently selected layers.

#### Blending

Blends all currently selected layers into one.

#### Deleting

Deletes all currently selected layers.

#### Toggling visibility

Shows / hides all currently selected layers.

## Keyboard Shortcuts

There are keyboard shortcuts for quick access to the editor functions.

### Menu Functions

| Function          | Shortcut     |
| ----------------- | ------------ |
| Import Tilemap    | <kbd>ctrl</kbd>/<kbd>alt</kbd> + <kbd>i</kbd> |
| Import Tileset    | <kbd>ctrl</kbd>/<kbd>alt</kbd> + <kbd>o</kbd> |
| Export Tilemap    | <kbd>ctrl</kbd>/<kbd>alt</kbd> + <kbd>s</kbd> |
| Toggle Grid       | <kbd>ctrl</kbd>/<kbd>alt</kbd> + <kbd>g</kbd> |
| Toggle Background | <kbd>ctrl</kbd>/<kbd>alt</kbd> + <kbd>h</kbd> |

### Layer Functions

| Function                             | Shortcut     |
| ------------------------------------ | ------------ |
| Add Layer                            | <kbd>ctrl</kbd>/<kbd>alt</kbd> + <kbd>a</kbd> |
| Rename Layer                         | <kbd>ctrl</kbd>/<kbd>alt</kbd> + <kbd>n</kbd> |
| Clear selected Layers                | <kbd>ctrl</kbd>/<kbd>alt</kbd> + <kbd>c</kbd> |
| Blend selected Layers                | <kbd>ctrl</kbd>/<kbd>alt</kbd> + <kbd>b</kbd> |
| Delete selected Layers               | <kbd>ctrl</kbd>/<kbd>alt</kbd> + <kbd>x</kbd> |
| Toggle visibility of selected Layers | <kbd>ctrl</kbd>/<kbd>alt</kbd> + <kbd>v</kbd> |

### Tools

| Function               | Shortcut     |
| ---------------------- | ------------ |
| Undo                   | <kbd>ctrl</kbd>/<kbd>alt</kbd> + <kbd>z</kbd> |
| Redo                   | <kbd>ctrl</kbd>/<kbd>alt</kbd> + <kbd>y</kbd> |
| Rotate selected Tile   | <kbd>ctrl</kbd>/<kbd>alt</kbd> + <kbd>r</kbd> |
| Select (default) brush | <kbd>alt</kbd> + <kbd>1</kbd>      |
| Select Line Tool       | <kbd>alt</kbd> + <kbd>2</kbd>      |
| Select Fill Tool       | <kbd>alt</kbd> + <kbd>3</kbd>      |
| Select Rectangle Tool  | <kbd>alt</kbd> + <kbd>4</kbd>      |

## Dev API

The tilemap offers an API for developement.

### `toFullcreen`

Automatically rescales your tilemap to fill out the screen.

### `mapGridOnly`

Reduces the tileMap to the grid and removes the dynamic background frame.

### `toggleVisualLayer`

Toggles the visibility of the grid.

### `showVisualLayer` / `hideVisualLayer`

Shows / hides the grid.

### `toForeground`

Ensures that the tilemap morph is drawn in front oft the squeak UI.

### `toFullScreenMode`

Enables fullscreen mode.

### `toggleBackgroundLayer`

Toggles the dynamic filling of the maps background with the background tile.

### `deleteTiles: anIndexSet inLayer: aLayer`

Delete the tiles specified by the indices in anIndexSet in the specified layer.

### `placeTiles: anIndexSet inLayer: aLayer ofClass: aTileClass withImage: anImage`

Place tiles specified by the indices in anIndexSet in the specified layer with a provided image. The argument aTileClass allows to add custom tiles, which inherit from GMTETile.

### `placeTiles: anIndexSet inLayer: aLayer withImage: anImage`

Place GMTETiles specified by the indices in anIndexSet in the specified layer with a provided image.

## Using your tilemap for your game

The TileEditor offers class-side methods (GMTEEditor) which load your tilemap from a local file path / the Git Asset Browser without starting the TileEditor so you can use it in your game.

### `GMTEEditor getTileMapFromFilePath:` your local filepath

Used to import a tilemap directly from a file. Returns a tilemap from a given local filepath, which should point to a .morph file previously exported from the TileEditor.

### `GMTEEditor getTileMapFromProjectName:` name of your project in Git Browser `withPath:` your filepath in Git Asset Browser

Used to import a tilemap from the Git Asset Browser in Squeak. Returns a tilemap from the projectname and a relative filepath in the Asset Browser, which should point to a .morph file previously exported from the TileEditor.
