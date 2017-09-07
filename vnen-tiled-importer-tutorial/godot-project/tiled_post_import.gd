extends Node

# Traverse the node tree and replace Tiled objects
func post_import(scene):
	# Load scenes to instantiate and add to the level
	var Door = load("res://Door.tscn")
	var Lamp = load("res://Lamp.tscn")
	
	# The scene variable contains the nodes as you see them in the editor.
	# scene itself points to the top node. Its children are the tile and object layers.
	for node in scene.get_children():
		# To know the type of a node, check if it is an instance of a base class
		# The addon imports tile layers as TileMap nodes and object layers as Node2D
		if node extends TileMap:
			# Process tile layers. E.g. read the ID of the individual tiles and
			# replace them with random variations, or instantiate scenes on top of them
			pass
		elif node extends Node2D:
			for object in node.get_children():
				# Assume all objects have a custom property named "type" and get its value
				var type = object.get_meta("type")

				var node_to_clone = null
				if type == "lamp":
					node_to_clone = Lamp
				elif type == "door":
					node_to_clone = Door

				if node_to_clone:
					var new_instance = node_to_clone.instance()
					# Place the node on the object (top-left corner), and offset it by half a cell
					# so it is centered on the object
					new_instance.set_pos(object.get_pos() + Vector2(32, 32))
					
					# Add the node (Door or Lamp) as a child of the scene and sets
					# the scene as its owner. Otherwise, the scene doesn't get modified
					scene.add_child(new_instance)
					new_instance.set_owner(scene)
			# After you processed all the objects, remove the object layer
			node.free()
	# You must return the modified scene
	return scene
