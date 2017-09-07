<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
**Table of Contents**

- [Godot 3.0 initial docs meeting – 07/31/2017](#godot-30-initial-docs-meeting--07312017)
    - [Current issues](#current-issues)
    - [Priority docs](#priority-docs)
        - [Missing pages or need a rewrite](#missing-pages-or-need-a-rewrite)
    - [Next steps - how we'll proceed](#next-steps---how-well-proceed)
- [Getting Started guide proposal - GDquest](#getting-started-guide-proposal---gdquest)
    - [Tutorials and demos](#tutorials-and-demos)
        - [Getting started section](#getting-started-section)
        - [Writing style](#writing-style)
        - [Extras](#extras)
    - [Review of the current articles](#review-of-the-current-articles)
        - [-](#-)
        - [Scripting](#scripting)
        - [Simple 2D-Game](#simple-2d-game)
        - [GUI tutorial](#gui-tutorial)
        - [Splash screen](#splash-screen)
        - [Animation](#animation)
        - [Resources, File System, Scene tree and Autoload](#resources-file-system-scene-tree-and-autoload)
    - [User feedback](#user-feedback)
    - [Draft proposal](#draft-proposal)
        - [-](#--1)
        - [Getting started](#getting-started)
- [Demos](#demos)
    - [General philosophy](#general-philosophy)
    - [Plan](#plan)

<!-- markdown-toc end -->

# Godot 3.0 initial docs meeting – 07/31/2017

## Current issues

- The Class reference is only 38% complete: http://lstu.fr/classref-status
  - Many descriptions need review. Things changed in the Godot API, we made some obsolete. The bulk of it should still be accurate though.
- We have no documentation for the new features: the 3D workflow, audio engine, asset import, etc.

All text tutorials of godot-docs need: 
- Proofreading 
- Adjustments for Godot 3.0. From simple changes like engine.cfg -> project.godot, to more involved ones. 
- Screenshots taken with the 3.0 UI


## Priority docs

The current UI is documentation-ready. It might still change a bit, but nothing should break.
The top priority is the auto-import of assets and the new 3D assets pipeline, that are undocumented.

### Missing pages or need a rewrite

- Assets pipeline: how the auto-import works, supported asset types, how to tweak the import settings, define presets, explaining the import settings. This includes how to import from Blender, Substance, etc.
- PBR: everything one needs to know about Environment, Materials, etc.
- VisualScript: write an introduction to the language
- New shader language: rework existing tuts
- Input management: needs review. Since InputEvent became Objects, many examples are outdated
- New audio server, bus effects, etc.
- New particle system
- How to port from 2.1 to 3.0: cover the converter, its limitations, and the manual changes to make for the game to work
- EditorPlugins: could use some docs, but it's lower priority

New priority items will pop up as we move forward. Every new feature could use docs, be it the editor customization, settings, porting guide, VR, the new networking api... We won't have perfect documentation in 1 iteration, but we'll improve it little by little
It would be great to have at least some polished demos, and the step by step revamped for 3.0


## Next steps - how we'll proceed

1. (Akien) I'll write a call to documenters on the blog for the classref, like we had last year. https://etherpad.net/p/godot-classref-status will serve as reference pad to keep track of who's working on what
2. We should list all the new doc pages we want to write, and distribute them among volunteers.
3. For the step by step tutorial and the demos, that's up to gdquest to see how he would like to start.

Let's also try to organize documentation sprints, with Julian (Straton) ?



# Getting Started guide proposal - GDquest

## Tutorials and demos

### Getting started section

Target audience: developers getting started with Godot, hobbyists with some gamedev or programming experience.

General ideas:

- Could use a better separation between the core concepts and step-by-step tutorials.
- Link the demos with the documentation. Use code snippets from the demos to illustrate tutorials
- Make the writing style and the format more consistent
- Add a section about Godot's core principles, and how it relates to general programming principles. Link to a good OOP guide

### Writing style

The focus should be on the educational value of the guide.

Remove humoristic paragraphs or shorten them greatly
Avoid the passive voice. "To create a new project, the “New Project” option must be used" -> "Click on 'New Project' to create a new game"
Take more time to describe important concepts.

The current tutorial focuses a lot on the editor, skimming through the engine's core concepts and programming:
- Explain how the engine is meant to work
- Curate and link to useful complementary game development resources
- Use more code samples to illustrate how the engine works (from the official demos when possible)
Build the guide with beginners in mind, but provide resources to go further whenenver possible.

### Extras

- Add a section with curated tutorial series - and/or content creators who produce Godot tutorials
- Add links to other useful pages in the docs, online resources and specific video and other tutorials that complement the current article

## Review of the current articles

The guide starts with an article dedicated to the nodes and scenes. A broader introduction to the engine and the editor, what does what and how to use the docs efficiently might help newcomers learn faster. E.g. the current guide doesn't mention the class reference. A beginner developer will likely not even understand the concept of a method, the inheritance between nodes, or how to build a coherent scene.

#### Nodes and Instancing

Introduces nodes and scenes with an incomplete analogy targeted at newcomers, followed by a brief technical overview:

The page explains that nodes are like ingredients, but never touches on the "instructions" part. And I teach the exact opposite, as this vision leads beginners to believe that programming is a matter of following recipes:

```
Recipes are divided into two sections: the first is the ingredients and the second is the instructions to prepare it.
```

A beginner probably won't understand what a callback is:

```
Can receive a callback to process every frame.
Can be extended (to have more functions).
Can be added to other nodes as children.
```

Creating a new project and the overview of the interface should come first. It's not relevant to a tutorial about nodes.

The second tutorial, "Instancing", needs clarification: its purpose is to teach how to "Create reusable objects with Scenes". 
Instancing (continued) introduces an essential aspect of Godot too briefly:

```
the recommended approach is to leave aside other design patterns such as MVC or Entity-Relationship diagrams and start thinking about games in a more natural way. Start by imagining the visible elements in a game, the ones that can be named not just by a programmer but by anyone.
```

This is Object-Oriented design, which Godot embraces at its core.


#### Scripting

Pretty good already. Needs some review, and maybe to inline some of the basics of GDscript. The scripting (continued) part is too short considering how important the features it covers are. Groups are introduced too early for beginners: they're only meant to be used in specific cases, to act upon multiple classes. Same for notifications.

#### Simple 2D-Game

We should either remove or redo it altogether. It shows exactly how you're not meant to code in Godot.

#### GUI tutorial

Needs a complete overhaul. Controls, containers and anchors should all be covered here, in 2 or 3 separate tutorials. A good opportunity to improve the Engine Features/GUI section.

#### Splash screen

Remove

#### Animation

Needs to be redone, and could use extra links to resources dedicated to animation as an art-form.
The tutorial starts with:

```
Godot’s animation system is extremely powerful and flexible.
```

But never explains why or how. The rewrite will try to address that in a beginner-friendly fashion.

#### Resources, File System, Scene tree and Autoload

The guide suddenly jumps from concrete topics to more technical and abstract ones:
- I would cover the scene tree, and some other abstract concepts in a dedicated section. E.g. `How Godot works`.
- File system -> it's currently about how to access resources, so I'd merge it in the Resources tutorial, and add a tutorial about Project organization, with a set of broad guidelines and an example of how to keep your project tidy and version-control friendly. This would be linked to the upcoming asset management guide
- Singletons being a more advanced design pattern, it's dangerous to introduce it this early on to beginners. It should be moved next to the signals (the observer pattern) and link to a good article about this design pattern (e.g. from game programming patterns).


## User feedback

- non-human: [cover] THE DEBUGGER AND OPTIONS
- Omicron666: there should be a better separation between the API reference/the docs and what is more like tutorials (including the getting started guide)
- LightBWK: The current doc is being too fancy with words. It feels like a ranty old coder wrote the whole thing.
- razvanc-r: I saw a tweet from reduz that he improved the pong demo to actually be more correct in terms of how to do sutff, don't just slap some if statements in the _process function but instead actually have some controller, I'm not sure though, I only saw the tweet, didn't dig into the demo. In any case that "simple 2d game" should either go or improve it so that it doesn't teach you how "not to do" things
- razvanc-r: the GUI guide was also confuing, but can't remember exactly why and I think it was to do witht the fact that the controls were behaving a bit different then what was said there
- Cheeseness: The tilemap stuff is full of outdated information
- Imunar: The scripting part is really useful
- LightBWK: This page might be the most confusing page in the entire doc if you do not have any context of how input works. http://docs.godotengine.org/en/stable/learning/features/inputs/inputevent.html

## Draft proposal

#### Godot's design

Dedicate a section to Godot's design. Although the editor can seem intuitive, we're dealing with a complex program, and it's worth taking the time to explain how it was designed. This section will be useful for both beginners and anyone coming from another engine.

Cover the way the nodes and scenes work, the available languages. Not as in C#, visualscript, etc. Instead, explain the fact that part of the code is handled via the editor, in a declarative manner.

I'll do a series about OOP and Godot as part of the Kickstarter project. If so, it'll be available for free, and as part of this section.

#### Getting started

Transform the "step-by-step" section into a "getting started" guide. It won't force the learning order on people, but rather provide a selection of interesting self-contained tutorials to answer the main questions they should have. One should be able to skip some parts, or read them in a different order.

The current tutorials are less than 1,000 words for the majority. We can easily go up to 2,000 or 3,000, standard numbers on magazines and specialized blogs. This will not only lead us to better structure each page itself, but it'll also free up some space for more pages moving forward.

For beginners, we can only do so much here. After going through the guide, a complete neophyte won't be able to build a game of his own. The goal is to give a gentle introduction to the engine and to provide extra learning resources after that to help them improve. It should ideally be both beginner-friendly and insightful for more experienced developers looking to try Godot.

1. **Introduction**: provide an overview of the getting started guide, who it's for, how it was designed, how to use it.
1. **Overview of the interface**: Lead the user through the project manager and the editor, so they understand how it's structure, and where to look for specific features.
1. **Create your first object and control it**: show how nodes and scripts work together to let you build interactive elements. The script will only be a bit of code to copy and paste at this stage
1. **Scripting** : introduce GDscript, its features, and show the reader how to add behavior to nodes. 
1. **Create your first game**. This is where we should show how to build reusable scenes and how to instantiate them all in a single one. The concepts themselves should be covered in the Godot's design section.
1. GUI
1. Animation

I'm still not sure where to put the file system and resources article. It could be part of the Godot design section.

_Tilemap/building game levels: would it be ok to integrate a tutorial about vnen's Tiled integration, as part of the manual or tutorials section? I promised I'd write one, and it's a lot better to use it until the tilemap system sees some improvement in the engine. I also believe it's an important feature for game developers._


# Demos

The demos are an important learning resource. They should be more prominent in the docs. When we introduce a new concept, we could link to relevant demos, and reuse code samples as examples.

For the purpose of teaching good practices to the users, the demos need massive changes. They should be reorganized, and we must define the purpose of each and every one of them. They currently have very different purposes, being showcasing one aspect of a specific feature (e.g. the 2d light masks), to a finished small game. The code is mostly procedural; you can see it was often written in a few minutes.

## General philosophy

The current demos show project structures that aren't flexible and scalable, for a fair part. Instead, they should be consistent with the concepts outlined in the docs and teach best practices.
The focus is solely on teaching value. Technical or visual demos should be showcased elsewhere.

The docs' demos should:
Be self-documented: commented code, streamlined project structure, simple but clean blueprint assets with a consistent visual style
Focus on one concept or feature at a time: I'd separate complete game examples from demos covering individual engine features, for clarity's sake. We can still have complete games, but to teach something about the engine, project organization, to show why the other demos and the docs invite the user to embrace object-oriented design, etc.
Be closer to the requirements of real games: to show good practices, Godot's flexibility, with a reasonable amount of code.

As a byproduct, they should provide some reusable code snippets or templates and a simple set of prototyping sprites.

## Plan

I'd start from the docs, so we can build demos around specific pages and illustrate the corresponding tutorials.

Regarding feature showcase, I'd recommend one demo per broad feature to avoid fragmentation. E.g. if you want to show what you can achieve with the lighting system, have a single demo that shows it all. These demos should also be separate from the ones that focus on teaching.

We can:
1. Start working on the docs first, and collect ideas for demos as we go.
1. Discuss those ideas with the rest of the contributors to set priorities.
