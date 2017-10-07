# Design the GUI

Now you nailed the basics, we're going to see how to build a Game User Interface (GUI) with reusable UI components: a life bar, an energy bar, a bomb and a rupee counter. By the end of this tutorial, you'll have a game GUI, ready to control with GDscript:

![The final result](./img/ui_gui_design_final_result.png)

You'll also learn to:

1. Create flexible UI components
1. Use scene inheritance
1. Build a complex UI

## Breaking down the UI

Let's break down the final UI and plan the containers we'll use. As in the [main menu tutorial](#), it starts with a MarginContainer. Then, we can either see up to three columns:

1. The life and energy counters on the left
2. The life and energy bars
3. The bomb and rupee counters on the right

But the bar's label and the gauge are 2 parts of the same UI element. If we think of them this way, we're left with 2 columns:

1. The life and energy bars on the left
1. The bomb and rupee counters on the right

This makes it easier to nest containers: we have some margins around the border of the screen, a MarginContainer, followed by an HBoxContainer to manage our two columns. The two bars stack on top of one another, inside a VBoxContainer. And we'll need a last HBoxContainer in the right column to place the bomb and rupee counters side-by-side.

![We get a clean UI layout with only 4 containers](./img/ui_gui_step_tutorial_containers_structure.png)

We will need extra containers inside the individual UI components, but this gives us the main GUI scene's structure. With this out of the way, we can jump into Godot and create our GUI.

## Create the base GUI

There 2 possible approaches to the GUI: we can design elements in separate scenes and put them together, or prototype everything in a single scene and break it down later. I recommend to work with a single scene as you can play with your UI's placement and proportions faster this way. Once it looks good, it's easy to save entire sections of the node tree as reusable sub-scenes. We'll do just that in a moment.

For now, let's start with a few containers.

Create a new scene and add a MarginContainer. Select the node and name it GUI. Then, save the scene and name it GUI.tscn. It will contain the entire GUI.

With the MarginContainer selected, head to the inspector and scroll down to the custom constants section. Unfold it and click the field next to each of the Margin properties. Set them all to 20 pixels. Next, add an HBoxContainer node. This one will contain our two bars on the left and separate them from the two counters on the right. 

We want to stack the bars vertically inside the HBoxContainer. To to this, let's add a VBoxContainer. Name it "Bars". Select the parent HBoxContainer again and this time, add another HBoxContainer. This one will hold the counters, so call it "Counters". With these four containers along, we have the base for our GUI scene.

![You should have 4 containers that look like this](./img/ui_gui_containers_structure_in_godot.png)

.. note:: We can work this way because we first broke down our UI design and took a few moments to think about the containers we'd use. When you follow a tutorial like this, it may seem weird. But once you're working on real games, you'll see it's an efficient workflow.

### Create the bars' base

Each bar is split into two sub-elements that align horizontally: the label with the health count on the left, and the gauge on the right. Once again, the HBoxContainer is the perfect tool for the job. Select the Bars node and add a new HBoxContainer inside of it. Name it "Bar".

The label itself is requires at least three nodes: a NinePatchRect for the background, on top of which we'll add a sprite on the left, either "HP" or "EP", and a `Label` on the right for the value. We can nest Control nodes however we want. We could use the NinePatchRect as a parent for the two other elements, as it encompasses them. In general, you want to use containers instead, as their role is to help organize UI components. We'll need a MarginContainer later anyway to add some space between the life count and the gauge. Select the Bar and add a MarginContainer. Name it "Count". Inside of it, add three nodes:

1. A NinePatchRect named "Background"
1. A TextureRect named Title
1. And a Label named Number

To add the nodes as siblings, always select the `Count` node first.

![Your scene tree should look like this. We're ready to throw in some textures](./img/ui_gui_step_tutorial_bar_template_1.png)

Our scene is still empty. It's time to throw in some textures. To load the textures, head to the FileSystem dock to the left of the viewport. Browse down to the res://assets/GUI folder.

![You should see a list of sprites that we'll use to skin our interface.](./img/textures_in_FileSystem_tab.png)

Select the `Background` in the Scene dock. In the Inspector, you should see a `Texture` property. In the FileSystem tab, click and drag `label_HP_bg.png` onto the `Texture` slot. It stays squashed. The parent MarginContainer will force its size down to 0 until we force elements inside the container to have a minimum size. Select the `Background` node. In the Inspector, scroll down to the Rect section. Set `Min Size` to (100, 40). You should see the `Background` resize along with its parent containers.

Next, select the `Title` and drag and drop `label_HP.png` into its `Texture` slot.

<!-- TODO: Setup HP and label on left and right sides -->

### Set up the Number Label

Do the same for the `Number` node: 

### Add the progress bar

Select the bar node and add a texture progress inside of it. Name the texture progress node gauge. In the inspector, under the texture progress class, in the expand
under the texture progress class, in the inspector
in the inspector, under the texture progress class, and for the textures section. Click the dots next to the under texture
With the gauge selected click and drag the lightbar BG sprite onto the under slot in the textures section. As you are dragging the texture, you should see and arrange outline around the Texas lot do the same with the lightbar_bill.PNG image and drop it onto the progress slot.

## Create reusable UI components

### Bar

We need a common bar that will modified to create the life bar on the one hand, and the energy bar on the other hand.

### Widget
### Turn branches into individual scenes

## Inherited Scenes

We need 2 bars that work the same way: they should feature a label on the left, with some value, and a horizontal gauge on the right. The only difference is that one has the HP label and is green, while the other is called EP and it's yellow. Godot gives us a powerful tool to create a common base to reuse for all bars in the game: **inherited scenes**.

![ Inherited scenes help us keep the GUI scene clean. In the end, we will only have containers and one node for each UI component. ](img/gui_step_tutorial_gui_scene_hierarchy.png)

On an inherited scene, you can change any property of every node in the inspector, aside from its name. If you modify and save the parent scene, all the inherited scenes update to reflect the changes. If you change a value in the inherited scene, it will always overrides the parent's property. It's useful UIs as they often require variations of the same elements. In general, in UI design, buttons, panels etc. share a common base style and interactions. We don't want to copy it over to all variations manually.

A reload icon will appear next to the properties you override. Click it to reset the value to the parent scene's default. 

.. note:: Think of scene inheritance like the node tree, or the `extends` keyword in GDScript. An inherited scene does everything like its parent, but you can override properties, resources and add extra nodes and scripts to extend its functionality.

### Inherit the Bar Scene to build the LifeBar

Go to Scene -> New Inherited Scene to create a new type of Bar. Select the Bar scene and open it. You should see a new [unsaved] tab, that's like your Bar, but with all nodes except the root in red. Press Ctrl S to save the new inherited scene and name it `LifeBar`.

![You can't rename red nodes. This tells you they have a parent scene](img/ui_gui_step_tutorial_inherited_scene_parent.png)

First, rename the root or top level node to `LifeBar`. We always want the root to describe exactly what this UI component is. The name differentiates this bar from the EnergyBar we'll create next. The other nodes inside the scene should describe the component's structure with broad terms, so it works with all inherited scenes. Like our Gauge and Label nodes.

.. note:: If you've ever done web design, it's the same spirit as working with CSS: you create a base class, and add variations with modifier classes. From a base button class, you'll have button-green and button-red variations for the user to accept and refuse prompts. The new class contains the name of the parent element and an extra keyword to explain how it modifies it. When we create an inherited scene and change the name of the top level node, we're doing the same thing

## Create final components

### Life and energy bars
### Bombs and rupee counters


## Build the final GUI with our inherited scenes
## Final note on responsive design

We don’t need the interface to be as flexible as a website. In the majority of games, you don’t want to support both landscape and portrait screen orientations. It’s one of the other. That’s why it’s enough for the GUI elements to only move horizontally when we change the window size. In landscape position, the most common ratios range from 4:3 16:10.
