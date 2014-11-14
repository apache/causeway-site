title: How to specify the icon for a domain object

Apache Isis viewers identify objects through both an icon and a [title](./how-to-01-040-How-to-specify-a-title-for-a-domain-entity.html).

The icon can be either static and fixed - meaning it is based on the object's class - or dynamic and changing - meaning
it can change according to the object's state.  For example, an `Order` could indicate its status (pending, shipped), or a `ToDoItem` could indicate if it is complete or not.

In the [Wicket viewer](../components/viewers/wicket/about.html) there are two mechanisms for locating an icon/image, though one applies only to static icons.  The viewer searches for a viewer in the following way:

* if the icon is dynamically specified, then it attempts to load an image file (`.png`, `.gif` or `.jpg`) from a well-known location on the classpath; else

* (1.8.0-SNAPSHOT onwards) if the icon is statically specified, then it:

    * first attempts to load a [font awesome](http://fortawesome.github.io/Font-Awesome/) icon if defined; else
    * otherwise attempts to load an image file (`.png`, `.gif`, `.jpeg` or `.jpg`) from a well-known location on the classpath
    
* if all the above fail, then a default icon is provided

The sections below provide explain (a) what code to add to the domain object and (b) where to put any image files on the classpath.

## Dynamically-specified image file

To specify that an object should have a specific icon, implement  an `iconName()` method.  This should return the *suffix* for an icon name; this is appended to the class name

For example, to indicate that a `com.mycompany.todoapp.dom.TodoItem` object is either complete or incomplete, use:

    public String iconName() {
        return isComplete()? "complete": "notComplete";
    }

If the method returns "complete", then the viewer will look for an icon file on the classpath as follows:

* first, it will search in the same package as the domain class (1.8.0-SNAPSHOT):

    * com/mycompany/todoapp/dom/TodoItem-complete.png
    * com/mycompany/todoapp/dom/TodoItem-complete.gif
    * com/mycompany/todoapp/dom/TodoItem-complete.jpeg
    * com/mycompany/todoapp/dom/TodoItem-complete.jpg
    
* failing that, it will search in the `images` package:

    * images/TodoItem-complete.png
    * images/TodoItem-complete.gif
    * images/TodoItem-complete.jpeg
    * images/TodoItem-complete.jpg

The viewer stops searching as soon as a image file is found.

## Statically-specified font awesome icon (1.8.0-SNAPSHOT)

If a dynamic icon has not been specified, then the viewer will next attempt to load a [font awesome](http://fortawesome.github.io/Font-Awesome/) icon.

For this, the class needs to be annotated with the [`@CssClassFa`](../reference/recognized-annotations/CssClassFa.html) annotation:

    @CssClass("fa fa-check-square-o")
    public class TodoItem { 
        ...
    }

## Statically-specified image file
  
If neither an `iconName()` nor an `@CssClassFa` annotation has been found, then the viewer will search for an image file based on the class's name.

For example, a `com.mycompany.todoapp.dom.TodoItem` object will search:

* first, in the same package as the domain class (1.8.0-SNAPSHOT):

    * com/mycompany/todoapp/dom/TodoItem.png
    * com/mycompany/todoapp/dom/TodoItem.gif
    * com/mycompany/todoapp/dom/TodoItem.jpeg
    * com/mycompany/todoapp/dom/TodoItem.jpg
    
* and failing that, it will search in the `images` package:

    * images/TodoItem-complete.png
    * images/TodoItem-complete.gif
    * images/TodoItem-complete.jpeg
    * images/TodoItem-complete.jpg

So, this is basically the same algorithm as for dynamically specified icons, without the suffix specified in the `iconName()` method.