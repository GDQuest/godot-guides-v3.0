Godot Docs Writing Guidelines
=============================

The Godot community is rich and international. Users come from all
around the world. Some of them are young, and many aren't native English
speakers. That's why we must all write using a clear and a common
language. For the class reference, the goal is to make it easy to read
for everyone and precise.

In summary, always try to:

1. Use the direct voice
2. Use precise action verbs
3. Avoid verbs that end in -ing
4. Remove unnecessary adverbs and adjectives.
5. Ban these 8 words
6. Use explicit references
7. Abuse 's to show posession

There are 3 rules on how to describe classes:

1. Give an overview of the node in the brief description
2. Mention what methods return if it's useful
3. Use "if true" to describe booleans

7 Rules for a Clear English
---------------------------

A technical writer's job is to pack as much information as possible into
the smallest and clearest sentences possible. These guidelines will help
you work towards that goal.

Use the direct voice
~~~~~~~~~~~~~~~~~~~~

Use the direct voice when possible. Take the classes, methods, and
constants you describe as the subject. It's natural to write using the
passive voice, but it's harder to read and produces longer sentences.

**Don't** use the passive voice:

.. code:: markdown

    void edit_set_pivot ( Vector2 pivot )
    [...] This method **is implemented** only in some nodes that inherit Node2D.

**Do** use the node's name as a noun:

::

    void edit_set_pivot ( Vector2 pivot )
    [...] Only some Node2Ds **implement** this method.

Use precise action verbs
~~~~~~~~~~~~~~~~~~~~~~~~

Favor precise yet common verbs over generic ones like ``make``, ``set``,
and any expression you can replace with a single word.

**Don't** repeat the method's name. It already states it sets the pivot
value to a new one:

::

    void edit_set_pivot ( Vector2 pivot )
    Set the pivot position of the 2D node to ‘pivot’ value. [...]

**Do** explain what's the consequence of this "set": use precise verbs
like ``place``, ``position``, ``rotate``, ``fade``, etc.

::

    void edit_set_pivot ( Vector2 pivot )
    Position the node's pivot to the 'pivot' value. [...]

Avoid verbs that end in -ing
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The progressive forms describe continuous actions. E.g. "is calling",
"is moving".

**Don't** use the progressive form for instant changes.

.. code:: markdown

    Vector2 move ( Vector2 rel_vec )
    Move the body in the given direction, **stopping** if there is an obstacle. [...]

**Do** use simple present, preterit or future.

.. code:: markdown

    Vector2 move ( Vector2 rel_vec )
    Moves the body in the vector's direction. The body **stops** if it collides with an obstacle. [...]

You may use the progressive tense to describe actions that are
continuous in time. Anything like animation or coroutines.

Verbs can turn into adjectival nouns with -ing. This is not a
conjugation, so you may use them: ``the remaining movement``,
``the missing file``, etc.

Remove unnecessary adverbs and adjectives
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Write as few adjectives and adverbs as possible. Only use them if they
add key information to the description.

**Don't** use redundant or meaningless adverbs. Words that lengthen the
documentation but don't add any information:

.. code:: markdown

    **Basically** a big texture [...]

**Do** write short sentences in a simple, descriptive language:

.. code:: markdown

    A big texture [...]

Ban these 8 words
~~~~~~~~~~~~~~~~~

**Don't** ever use these 8 banned words:

1. obvious
2. simple
3. basic
4. easy
5. actual
6. just
7. clear
8. however (some uses)

Game creation and programming aren't simple, and nothing's easy to
someone learning to use the API for the first time. Other words in the
list, like ``just`` or ``actual`` won't add any info to the sentence.
Don't use corresponding adverbs either: obviously, simply, basically,
easily, actually, clearly.

**Don't** example. The banned words lengthen the description and take
attention away from the most important info:

.. code:: markdown

    **TextureRect**
    Control frame that **simply** draws an assigned texture. It can stretch or not. It's a **simple** way to **just** show an image in a UI.

**Do** remove them:

.. code:: markdown

    **TextureRect**
    [Control] node that displays a texture. The texture can stretch to the node's bounding box or stay in the center. Useful to display sprites in your UIs.

"Simple" never helps. Remember, for other users, anything could be
complex or frustrate them. There's nothing like a good old *it's simple*
to make you cringe. Here's the old brief description, the first sentence
on the Timer node's page:

.. code:: markdown

    **Timer**
    A **simple** Timer node.

**Do** explain what the node does instead:

.. code:: markdown

    **Timer**
    Calls a function of your choice after a certain duration.

**Don't** use "basic", it is too vague:

.. code:: markdown

    **Vector3**
    Vector class, which performs **basic** 3D vector math operations.

**Do** use the brief description to offer an overview of the node:

.. code:: markdown

    **Vector3**
    Provides essential math functions to manipulate 3d vectors: cross product, normalize, rotate, etc.

Use explicit references
~~~~~~~~~~~~~~~~~~~~~~~

Favor explicit references over implicit ones.

**Don't** use words like "the former", "the latter", etc. They're not
the most common in English, and they require you to check the reference.

.. code:: markdown

    'w' and 'h' define right and bottom margins. The **latter** two resize the texture so it fits in the defined margin.

**Do** repeat words. They remove all ambiguity:

.. code:: markdown

    'w' and 'h' define right and bottom margins. **'w' and 'h'** resize the texture so it fits the margin.

If you need to repeat the same variable name 3 or 4 times, you probably
need to rephrase your description.

Abuse 's to show posession
~~~~~~~~~~~~~~~~~~~~~~~~~~

Avoid "The milk of the cat" feels unnatural in English. Write "The cat's
milk" instead.

**Don't** write "of the X":

.. code:: markdown

    The region **of the AtlasTexture that is** used.

**Do** use ``'s``. It lets you put the main subject at the start of the
sentence, and keep it short:

.. code:: markdown

    The **AtlasTexture's** used region.

How to Write Methods and Classes
--------------------------------

Give an overview of the node in the brief description
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The brief description is the reference's most important sentence. It's
the user's first contact with a node:

1. It's the only description in the "Create New Node" dialog.
2. It's at the top of every page in the reference

The brief description should explain the node's role and its
functionality, in up to 200 characters.

**Don't** write tiny and vague summaries:

.. code:: markdown

    **Node2D**
    Base node for 2D system.

**Do** give an overview of the node's functionality:

.. code:: markdown

    **Node2D**
    2d game object, parent of all 2D related nodes. Has a position, rotation, scale and z-index.

Use the node's full description to provide more information, and a code
example, if possible.

Mention what methods return if it's useful
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Some methods return important values. Describe them at the end of the
description, ideally on a new line. No need to mention the return values
for any method whose name starts with ``set`` or ``get``.

**Don't** use the passive voice:

::

    Vector2 move ( Vector2 rel_vec )
    [...] The returned vector is how much movement was remaining before being stopped.

**Do** always use "Returns".

::

    Vector2 move ( Vector2 rel_vec )
    [...] Returns the remaining movement before the body was stopped.

Notice the exception to the "direct voice" rule: with the move method,
an external collider can influence the method and the body that calls
``move``. In this case, you can use the passive voice.

Use "if true" to describe booleans
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For boolean member variables, always use ``if true`` and/or
``if false``, to stay explicit. ``Controls whether or not`` may be
ambiguous and won't work for every member variable:

**Do** start with "if true":

.. code:: markdown

    Timer.autostart
    If `true`, the timer will automatically start when it enters the scene tree. Default value: `false`.

Common Vocabulary to Use in Godot's Docs
----------------------------------------

The developers chose some specific words to refer to areas of the
interface. They're used in the sources, in the documentation, and you
should always use them instead of synonyms, so the users know what
you're talking about.

.. figure:: ./img/editor-vocabulary-overview.png
   :alt: Overview of the interface and common vocabulary

   Overview of the interface and common vocabulary

In the top left corner of the editor lie the ``main menus``. In the
center, the buttons change the ``workspace``. And together the buttons
in the top right are the ``playtest buttons``. The area in the center,
that displays the 2d or the 3d space, is the ``viewport``. At its top,
you find a list of ``tools`` inside the ``toolbar``.

The tabs or dockable panels on either side of the viewport are
``docks``. You have the ``FileSystem dock``, the ``Scene dock`` that
contains your scene tree, the ``Import dock``, the ``Node dock``, and
the ``Inspector`` or ``Inspector dock``. With the default layout you may
call the tabbed docks ``tabs``: the ``Scene tab``, the ``Node tab``...

The Animation, Debugger, etc. at the bottom of the viewport are
``panels``. Together they make up the ``bottom panels``.

Foldable areas of the Inspector are ``sections``. The node's parent
class names, which you can't fold, are ``Classes`` e.g. the
``KinematicBody2D class``. And individual lines with key-value pairs are
``properties``. E.g. ``position`` or ``modulate color`` are both
``properties``.
