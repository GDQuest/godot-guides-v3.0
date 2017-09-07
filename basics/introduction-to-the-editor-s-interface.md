# Introduction to the Editor's Interface

Overview of all the main parts of the UI, including

Where to find project and editor properties
modal lower part (animation, debug, profile, etc.)
Where to customize layout
Customize kbd shortcuts


This guide will show you how the interface works in Godot, it will introduce you to the main areas in the interface comes, and help you get can portable with the editor.
This guide will give you a comprehensive overview of the editors interface, you can get started working as fast as possible.
This guide will give you a broad overview of Godot news editor, its interface, some of its vocabulary, to help you get started as fast as possible.

At a glance, you can find the main menus and buttons to test your game at the very top, the assets and your folder tree on the left side, the objects or nodes that make up the current scene on the right side, would be inspector in the bottom right,. On the right side, you have the Nutri on the top, this is the tree of objects that make up the current scene. On the bottom right, you have be inspector, but both go up as soon as you select a game object, or nodes, as Godot calls them. In the centre, you happy viewports, with a toolbar at the top. In the centre, you have the viewport. It features a toolbar at the top. As you may know, Godot or has both a 2-D and a 3-D rendering engine. To switch between the two, use the F1 and F2 keys. You can also use the icons at the top of the editor.
To access the script editor, press F3 or the script icon and the at the top of the editor.
To access the script editor, press the F3 key or use the icon at the top of the window. If you press F4, the help menu opens up. Can search the entire help,
you can search the entire API reference here, and learn what each of the nodes does.
Note that you can design to the scenes and use them inside of a 3-D world. This is why you always have access to both the two DND media viewports.
The toolbar will show different tools and menus based on what you have currently selected. All talk again about that in the introduction to the user interface tools in Godot. UI creation nodes
you I tools in Godot.
Files imported automatically in your project. So you can drag and drop files in your Godot project folder directly from the native file Explorer on your system. When you jump back to the editor, good will import the new files automatically, and you will find them in the file tab on the left side of the screen.

Godot works with scenes, which are made
a Godot game is made of many scenes, which themselves are a tree of nodes. Nodes each do a specific thing, whether it's
sure his pride, animate other nodes, show a UI elements like a life bar, the deck collisions, cast raise, et cetera.

# The Scene Tree, Nodes and Execution Order

Lars:

the execution order was always top to bottom, even with children involved. So it's parent before children, top sibling before bottom sibling.
Changing the node type also didn't affect the results. It would have been somewhat surprising if it did, but then in Unity the only way to declare the order is by giving the script types a priority, so it wasn't unreasonable to check.
