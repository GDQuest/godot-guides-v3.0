# Advanced UI nodes and themes


## How to build custom containers

The built-in containers will cover most of your needs. But if you need something more specific, 

You can create your own container nodes. Create a Container node in the scene tree, and attach a script that inherits the container class. The container class emits the `sort_children` signal when it needs to sort its children. When it does, it will call its `queue_sort` method automatically to sort the nodes.

This is useful if you want to sorts your controls in a way that's not available by default. This is useful if you want a container that sorts the UI nodes in a way that is not available by default. It comes with two methods, fit child in rectangle, which will then it's a control mode inside of a rectangle of your choice. Remember that the containers and controllers themselves have a wrecked property, we have a rectangle of their own. The queue sort method will be co-called automatically and will sorts the children every time it's required. We controls no for you when the UI should update, so you don't have to worry about this the container will emmets a small children signal when you had to sort its children.
