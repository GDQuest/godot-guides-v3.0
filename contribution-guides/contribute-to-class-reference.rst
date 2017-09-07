.. _doc_updating_the_class_reference:

Contribute to the Class Reference
=================================

Godot ships with many nodes and singletons to help you develop your games in GDscript. Each is a class, documented in the :ref:`class reference <toc-class-ref>`. This reference is essential for anyone learning the engine: it is available both online and in the engine. 

But it's incomplete. Many methods, variables and signals lack descriptions. Others changed with recent releases and need updates. The developers can't write the entire reference on their own. Godot needs you, all of us, to contribute.

**Important:** we use `a collaborative document <https://etherpad.net/p/godot-classref-status>`_ to track who's working on what class. Always notify other writers about what you are working on. You'll find the instructions in the doc.


How to contribute
-----------------

The class reference lies in the following XML file, in Godot's GitHub repository: `doc/base/classes.xml <https://github.com/godotengine/godot/blob/master/doc/base/classes.xml>`_. As it's over 1MB, you can't edit it online. To update the class reference:

There are 5 steps to update the class reference (full guide below):

1. Fork `Godot's repository <https://github.com/godotengine/godot>`_ 
2. Clone your fork on your computer
3. Edit the ``doc/base/classes.xml`` file to write documentation
4. Commit your changes and push them to your fork
5. Make a pull request on the Godot repository

**Important:** always use this XML file to edit the API reference. Do not edit the generated .rST files :ref:`in the online documentation <toc-class-ref>`, hosted in the `godot-docs <https://github.com/godotengine/godot-docs>`_ repository.

Get started with GitHub
-----------------------

If you're new to git and GitHub, this guide will help you get started. You'll learn to:

- Fork and clone Godot's repository
- Keep your fork up to date with other contributors
- Create a pull request so your improvements end in the official docs

If you're brand new to git, the version-control system Godot uses, go through GitHub's interactive guide. You'll learn some essential vocabulary and get a sense for the tool.
https://try.github.io/levels/1/challenges/1

Fork Godot
~~~~~~~~~~

Fork the Godot Engine into a GitHub repository of your own.

Clone the repository on your computer:

::

    git clone https://github.com/your_name/godot.git

Create a new branch to make your changes. It makes it a lot easier to sync your improvements with other docs writers, and it's easier to cleanup your repository clean if you have any issues with git.

::

    git checkout -b your-new-branch-name

The new branch is the same as your master branch, until you start to write API docs. In the ``doc/`` folder, you'll find the class reference.

How to keep your local clone up-to-date
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Other writers contribute to Godot's documentation. Your local repository will fall behind it, and you'll have to synchronize it. Especially if other contributors update the class reference while you work on it.

First add an ``upstream`` git *remote* to work with. Remotes are links to online repositories you can download new files from.

::

    git remote add upstream https://github.com/godotengine/godot

You can check the list of all remote servers with:

::

    git remote -v

You should have 2: ``origin``, your fork on github, that git adds by default, and ``upstream``, that you just added:


::

    origin  https://github.com/your_name/godot.git (fetch)
    origin  https://github.com/your_name/godot.git (push)
    upstream        https://github.com/godotengine/godot.git (fetch)
    upstream        https://github.com/godotengine/godot.git (push)

Each time you want to sync your branch to the state of the upstream repository, enter:

::

    git pull --rebase upstream/master

This command will first ``fetch``, or download the latest version of the Godot repository. Then, it will reapply your local changes on top.

If you made changes you don't want to keep in your local branch, use the following commands instead:

::

    git fetch upstream
    git reset --hard upstream/master

**Warning:** The above command will reset your branch to the state of the ``upstream/master`` branch. It will discard all local changes. Make sure to only run this *before* you make important changes.

Another option is to delete the branch you're working on, synchronize the master branch with the Godot repository, and create a brand new branch:

::

    git checkout master
    git branch -d your-new-branch-name
    git pull --rebase upstream/master
    git checkout -b your-new-branch-name

If you're feeling lost by now, come to our `IRC channels <http://webchat.freenode.net/?channels=#godotengine>`_ and ask for help. Experienced git users will give you a hand.

Updating the documentation template
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

When classes are modified in the source code, the documentation template might become outdated. To make sure that you are editing an up-to-date version, you first need to compile Godot (you can follow the :ref:`doc_introduction_to_the_buildsystem` page), and then run the following command (assuming 64-bit Linux):

::

    ./bin/godot.x11.tools.64 -doctool doc/base/classes.xml

The doc/base/classes.xml should then be up-to-date with current Godot Engine features. You can then check what changed using the ``git diff`` command. If there are changes to other classes than the one you are planning to document, please commit those changes first before starting to edit the template:

::

    git add doc/base/classes.xml
    git commit -m "Sync classes reference template with current code base"

You are now ready to edit this file to add stuff.

**Note:** If this has been done recently by another contributor, you don't forcefully need to go through these steps (unless you know that the class you plan to edit *has* been modified recently).

Push and request a pull of your changes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Once your modifications are finished, push your changes on your GitHub
repository:

::

    git add doc/base/classes.xml
    git commit -m "Explain your modifications."
    git push

When it's done, you can ask for a Pull Request via the GitHub UI of your Godot fork.

Editing the doc/base/classes.xml file
-------------------------------------

This file is generated and updated by Godot Engine. It is used by the editor as base for the Help section.

You can edit this file using your favourite text editor. If you use a code editor, make sure that it won't needlessly change the indentation behaviour (e.g. change all tabs to spaces).

Formatting of the XML file
~~~~~~~~~~~~~~~~~~~~~~~~~~

Here is an example with the Node2D class:

.. code:: xml

    <class name="Node2D" inherits="CanvasItem" category="Core">
        <brief_description>
        Base node for 2D system.
        </brief_description>
        <description>
        Base node for 2D system. Node2D contains a position, rotation and scale, which is used to position and animate. It can alternatively be used with a custom 2D transform ([Matrix32]). A tree of Node2Ds allows complex hierarchies for animation and positioning.
        </description>
        <methods>
            <method name="set_pos">
                <argument index="0" name="pos" type="Vector2">
                </argument>
                <description>
                Set the position of the 2d node.
                </description>
            </method>
            <method name="set_rot">
                <argument index="0" name="rot" type="float">
                </argument>
                <description>
                Set the rotation of the 2d node.
                </description>
            </method>
            <method name="set_scale">
                <argument index="0" name="scale" type="Vector2">
                </argument>
                <description>
                Set the scale of the 2d node.
                </description>
            </method>
            <method name="get_pos" qualifiers="const">
                <return type="Vector2">
                </return>
                <description>
                Return the position of the 2D node.
                </description>
            </method>
            <method name="get_rot" qualifiers="const">
                <return type="float">
                </return>
                <description>
                Return the rotation of the 2D node.
                </description>
            </method>
            <method name="get_scale" qualifiers="const">
                <return type="Vector2">
                </return>
                <description>
                Return the scale of the 2D node.
                </description>
            </method>
            <method name="rotate">
                <argument index="0" name="degrees" type="float">
                </argument>
                <description>
            </description>
            </method>
            <method name="move_local_x">
                <argument index="0" name="delta" type="float">
                </argument>
                <argument index="1" name="scaled" type="bool" default="false">
                </argument>
                <description>
                </description>
            </method>
            <method name="move_local_y">
                <argument index="0" name="delta" type="float">
                </argument>
                <argument index="1" name="scaled" type="bool" default="false">
                </argument>
                <description>
                </description>
            </method>
            <method name="get_global_pos" qualifiers="const">
                <return type="Vector2">
                </return>
                <description>
                Return the global position of the 2D node.
                </description>
            </method>
            <method name="set_global_pos">
                <argument index="0" name="arg0" type="Vector2">
                </argument>
                <description>
                </description>
            </method>
            <method name="set_transform">
                <argument index="0" name="xform" type="Matrix32">
                </argument>
                <description>
                </description>
            </method>
            <method name="set_global_transform">
                <argument index="0" name="xform" type="Matrix32">
                </argument>
                <description>
                </description>
            </method>
            <method name="edit_set_pivot">
                <argument index="0" name="arg0" type="Vector2">
                </argument>
                <description>
                </description>
            </method>
        </methods>
        <constants>
        </constants>
    </class>

As you can see, some methods in this class have no description (i.e. there is no text between their marks). This can also happen for the ``description`` and ``brief_description`` of the class, but in our example they are already filled. Let's edit the description of the ``rotate()`` method:

.. code:: xml

    <method name="rotate">
        <argument index="0" name="degrees" type="float">
        </argument>
        <description>
        Rotates the node of a given number of degrees.
        </description>
    </method>

That's all!

You simply have to write any missing text between these marks:

-  <description></description>
-  <brief_description></brief_description>
-  <constant></constant>
-  <member></member>
-  <signal></signal>

Describe clearly and shortly what the method does, or what the constant, member variable or signal mean. You can include an example of use if needed. Try to use grammatically correct English, and check the other descriptions to get an impression of the writing style.

For setters/getters, the convention is to describe in depth what the method does in the setter, and to say only the minimal in the getter to avoid duplication of the contents.

Tags available for improved formatting
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For more control over the formatting of the help, Godot's XML documentation supports various BBcode-like tags which are interpreted by both the offline in-editor Help, as well as the online documentation (via the reST converter).

Those tags are listed below. See existing documentation entries for more examples of how to use them properly.

+---------------------------+--------------------------------+-----------------------------------+--------------------------------------------+
| Tag                       | Effect                         | Usage                             | Result                                     |
+===========================+================================+===================================+============================================+
| [Class]                   | Link a class                   | Move the [Sprite].                | Move the :ref:`class_sprite`.              |
+---------------------------+--------------------------------+-----------------------------------+--------------------------------------------+
| [method methodname]       | Link a method of this class    | See [method set_pos].             | See :ref:`set_pos <class_node2d_set_pos>`. |
+---------------------------+--------------------------------+-----------------------------------+--------------------------------------------+
| [method Class.methodname] | Link a method of another class | See [method Node2D.set_pos].      | See :ref:`set_pos <class_node2d_set_pos>`. |
+---------------------------+--------------------------------+-----------------------------------+--------------------------------------------+
| [b] [/b]                  | Bold                           | Some [b]bold[/b] text.            | Some **bold** text.                        |
+---------------------------+--------------------------------+-----------------------------------+--------------------------------------------+
| [i] [/i]                  | Italic                         | Some [i]italic[/i] text.          | Some *italic* text.                        |
+---------------------------+--------------------------------+-----------------------------------+--------------------------------------------+
| [code] [/code]            | Monospace                      | Some [code]monospace[/code] text. | Some ``monospace`` text.                   |
+---------------------------+--------------------------------+-----------------------------------+--------------------------------------------+
| [codeblock] [/codeblock]  | Multiline preformatted block   | *See below.*                      | *See below.*                               |
+---------------------------+--------------------------------+-----------------------------------+--------------------------------------------+

The ``[codeblock]`` is meant to be used for pre-formatted code block, using spaces as indentation (tabs will be removed by the reST converter). For example:

.. code:: xml

    [codeblock]
    func _ready():
        var sprite = get_node("Sprite")
        print(sprite.get_pos())
    [/codeblock]

Which would be rendered as:

::

    func _ready():
        var sprite = get_node("Sprite")
        print(sprite.get_pos())

I don't know what this method does!
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Not a problem. Leave it behind for now, and don't forget to notify the missing methods when you request a pull of your changes. Another editor will take care of it.

If you wonder what a method does, you can still have a look at its implementation in Godot Engine's source code on GitHub. Also, if you have a doubt, feel free to ask on the `Q&A website <https://godotengine.org/qa/>`__ and on IRC (freenode, #godotengine).


Localization
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Before we translate the documentation, we need to complete and proof-read it in English. We'll work on localization when we get past 90% completion.
