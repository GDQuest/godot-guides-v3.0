# Design interfaces with the Control nodes

Computer displays, mobile phones, and TV screen come in all shapes and sizes. To ship a game, you'll need to support different screen ratios and resolutions. I can be hard to build responsive interfaces, that adapt to all platforms. Thankfully, Godot comes with robust tools to design and manage responsive User Interface. To design your UI, you'll use the Control nodes. The ones with green icons in the editor. There are dozens of them, to create anything from life bars to complex applications. Godot's entire editor and plugins use these nodes.

![Godot's editor is made with the engine's UI framework](img/godot-editor-ui.png)

This guide will get you started with UI design. You will learn:

- The 5 most useful control nodes to build your games’ interface
- How to work with the anchor of UI elements
- How to efficiently place and arrange your user interface using containers.
- What the 5 most common containers are.

To learn how to control the interface and connect it to other scripts, read [Build your first game UI in Godot](#).

Only use Control nodes when you design your interfaces. They have unique properties that allow them to work with one another. All the regular Node2D, Sprites, etc. will not work. But you can still use some nodes that work with others like the AnimationPlayer, Tween or the StreamPlayer. Control nodes are CanvasItems like Node2D, so you can apply shaders to them.

All control nodes share The  the same main properties: the anchor, the bounding rectangle, focus and focus neighbour, 2 properties related to mouse and keyboard input, the size flags, the margin and the optional UI theme. Once you understand them, all the nodes you will use add just a handful of special properties. Once you understand the basics of the you UI control nodes, it will take you far less time to learn all the special notes.


## The 5 most common UI elements

Godot ships with dozens of Control nodes. A lot of them are here to help you build editor plugins and applications. To learn more about them, check the guide about [Advanced UI nodes and Themes](#).

For most games, you'll only need up to 5 types of UI elements, and a few Containers. These 5 control nodes are:

1. TextureFrame, mostly for backgrounds, or everything that should be a static sprite
1. TextureButton, to create buttons
1. TextureProgress, for lifebars, loading bars, horizontal, vertical or radial
1. Patch9Frame, for scalable panels
1. And Label, for text

![The 5 most common Control nodes for UI design](5-most-common-nodes.png)


**TextureFrame** displays a texture, or a sprite. The main differences are the fact it is a Control node, and it can position itself and scale in different ways. Set the Stretch Mode property to change its behaviour:

- Tile makes the texture repeat, but it won't scale
- The default, Scale and Expand (compat), lets you scale the texture up, but it forces a minimal size
- Keep and Keep Centred force the texture to remain at its  original size, respectively in the top left corner and the centre of the frame 

As with Sprite nodes, you can modulate the TextureFrame's colour. Click the modulate property and use the color picker.

![Picture of a TextureFrame](5-common-nodes-TextureFrame.png)


**TextureButton** is like TextureFrame, except it has 5 texture slots: one for each of the button's states. Most of the time, you'll use the Normal, Pressed and Hover textures. Focused is interesting if your interface listens to the keyboard's input. TextureButton comes with sixth image slot, the Click Mask. This lets you define the clickable area using a 2bit, pure black and white image.

In the Base Button section, you'll find a few checkboxes that change how the button behaves. When Toggle Mode is on, the button will toggle between active and normal states when you press it. Disabled makes it disabled by default, in which case it'll use the Disabled texture. TextureButton shares a few properties with the texture frame: it has a modulate property, to change its color, and Resize and Stretch modes, to change its scale behavior.

![Picture of a TextureButton](5-common-nodes-TextureButton.png)


**TextureProgress** layers up to 3 sprites to create a progress bar. The Under and Over textures sandwich the Progress one, your progress bar.

The mode property controls the direction in which the bar grows: horizontally, vertically, or radially. If you set it to radial, the Initial Angle and Fill Degrees properties let you limit the range of the gauge. 

To animate the bar, you'll want to look at the Range section. Set the Min and Max properties to define the range of the gauge. For instance, to represent a character's life, you'll want to set Min to 0, and Max to the character's maximum life. Change the Value property to update the bar. If you leave the Min and Max values to the default of 1 and 100, and set the Value property to 40, 40% of the Progress texture will show up, and 60% of it will stay hidden. 

![Picture of a TextureProgress](5-common-nodes-TextureProgress.png)


**Label** prints text to the screen. You'll find all its properties in the Label section, in the inspector. Write the text inside of Text, and check Autowrap if you wanted to respect the textbox's size. If Autowrap is off, you won't be able to scale the node. You can align the text horizontally and vertically with Aline and Valign respectively. 

![Picture of a Label](5-common-nodes-Label.png)


**Patch9Frame** takes a texture, split in 3 rows and 3 columns. The centre and the sides tile when you scale the texture, but it never scales the corners. It is very useful to build panels, dialogue boxes and scalable backgrounds for your UI.

![Picture of a Label](5-common-nodes-Label.png)


## Place UI elements precisely with anchors

Control nodes have a position and size, but they also have an anchors and margins. Anchors define the origin, or the reference point for the Left, Top, Right and Bottom edges of the node. Change any of the 4 anchors, and the margins will update automatically.

![The anchor property](anchor-property.png)


### How to change the anchor

<!-- TODO: Show what the anchor is for with a pic, as on http://docs.godotengine.org/en/stable/learning/features/gui/size_and_anchors.html -->

Like any properties, you can edit the 4 anchor points in the inspector. But it's not convenient. When you select a control node, the anchor menu appears above the viewport, in the toolbar. It gives you a list of icons to set all 4 anchors with a single click, instead of the inspector’s 4 properties. The anchor menu will only show up when you selected a control node.

![The anchor menu in the viewport](anchor-menu.png)


### Margins change with the anchor

Margins update automatically when you move or resize a control node. They represent the distance from the control node's edges to its anchor, which is relative to the parent control node or container. That's why your control nodes should always be inside a container, as we'll see in a moment. If there's no parent, the margins will be relative to the node's own bounding Rectangle, set in the Rect section, in the inspector.

![The margin values, left, right, top and bottom](control-node-margin.png)

Try to change the anchors, or nest your Control nodes inside Containers: margins will update. Although you can, you shouldn't edit margins manually. The properties are mostly here to manipulate when you create your own UI nodes. Godot comes with nodes to solve all the common cases for you. Need to add space between a lifebar and the border of the screen? The MarginContainer does it for you. Want to build a vertical menu? Use the VBoxContainer. More on these below.


### Use size tags to change how UI elements fill the available space

Every control node has Size Flags. They tell containers how the UI elements should scale. If you add the "Fill" flag to the Horizontal or Vertical property, the node's bounding box will take all the space it can, but it'll respect its siblings and retain its size. If there are 3 TextureFrame nodes in an HBoxContainer, with the "Fill" flags on both axes, they'll each take up to a third of the available space, but no more. The container will take over the node and resize it automatically. 

![3 UI elements in an HBoxContainer, each takes 1/3rd of the space](textureframe-in-box-container-fill.png)

The "Expand" flag lets the UI element take all the space it can, and push against its siblings. Its bounding rectangle will grow against the edges of its parent, or until it's blocked by another UI node.

![The same example as above, but the node on the left has the "Expand" size flag](textureframe-in-box-container-expand.png)

You'll need some practice to understand the size tags, as their effect can change quite a bit depending on how you set up your interface.


## Arrange control nodes automatically with containers

Containers automatically arrange all their children control notes, including other containers in rows, columns, and more pureed some ad space around your user interface, or centre it in their bounding rectangles. All containers that ship would be to update in the editors you can see the results instantly.
Don't move the UI elements by handing the editor. Instead, change the anchor and use containers.

Containers have a few special properties to control how they arrange UI elements. To change them, navigate down to the Custom Constants section in the inspector.


### The 5 most useful containers

If you build tools, you might need all of the containers. But for most games, a handful will be enough:

- MarginContainer, to add margins around part of the UI
- CenterContainer, to center its children in its bounding box
- VboxContainer and HboxContainer, to arrange UI elements in rows or columns
- GridContainer, to arrange Controls nodes in a grid-like pattern

CenterContainer centres all its children inside of its bounding rectangle. It's one you typically use for title screens, if you want the options to stay in the centre of the viewport. As it centers everything, you'll often want a single container nested inside it. If you use textures and buttons instead, they'll stack up.

![CenterContainer in action](5-containers/MarginContainer.png)

The MarginContainer adds a margin on any side of the children node. Add a MarginContainer that encompasses the entire viewport to add a separation between the edge of the window and the UI. You can set a margin on the top, left, right, or bottom side of the container. No need to tick the checkbox: click the corresponding value box and type any number. It will activate automatically.

![MarginContainer in action](5-containers/MarginContainer.png)

There are two BoxContainers: VBoxContainer and HBoxContainer.
You cannot add the BoxContainer node itself, as it is a helper class. But can use vertical and horizontal box containers. They arrange nodes either in rows or columns. Use them to line up items in a shop, or to build complex grids with rows and columns of different sizes, as you can nest them to your heart's content.

![BoxContainers in action](5-containers/MarginContainer.png)

VBoxContainer automatically arranges its children into a column. It puts them one after the other. If you use the separation parameter, it will leave a gap between its children. HBoxContainer arranges UI elements in a row. It's similar to the VBoxContainer, with an extra `add_spacer` method to add a spacer control node before its first child or after its last child, from a script.


The GridContainer lets you arrange UI elements in a gridlike pattern. You can only control the number of colums it has, and it will set the number of rows by itself, based on its children's count. If you have 9 children and 3 columns, you will have 9÷3 = 3 rows. Add 3 more children and you'll have 4 rows. In other words, it will create new rows as you add more textures and buttons. Like the box containers, it has 2 properties to set the vertical and horizontal separation between the rows and columns respectively.

![GridContainer in action](5-containers/MarginContainer.png)

Godot's UI system is complex, and has a lot more to offer. To learn how to design more advanced interface, read [Design advanced UI with other Control nodes](#).
