title: How to specify the icon for a domain object

Apache Isis viewers identify objects through both an icon and a [title](./how-to-01-040-How-to-specify-a-title-for-a-domain-entity.html).

The icon can be either static and fixed - meaning it is based on the object's class - or dynamic and changing - meaning
it can change according to the object's state.  For example, an `Order` could indicate its status (pending, shipped), or a `ToDoItem` could indicate if it is complete or not.

The mechanism to locate up the icon is viewer-specific.  In the [Wicket viewer](../components/viewers/wicket/about.html) there are two mechanisms for locating an icon/image, though one applies only to static icons.

If the icon is static then it is located either:

* (1.8.0-SNAPSHOT onwards) by specifying a [font awesome](http://fortawesome.github.io/Font-Awesome/) icon 
  for the class using either the [`@CssClassFa`](../reference/recognized-annotations/CssClassFa.html) annotation, or
  an equivalent entry in the [.layout.json](../components/viewers/wicket/dynamic-layouts.html) file.

* else, provide an image file for the class, eg `ToDoItem.png`, picked up from a well-known location on the
  classpath.
  
If the icon is dynamic then it is located by the second mechanism only, that is:

* provide an image file for the object, eg `ToDoItem-completed.png`, again picked up from a well-known location on 
  the classpath.

The sections below explain this in more detail.

## Statically specified 'font awesome' icon

The framework has a number of mechanisms to locate the image.
By default, the framework will look for an image in the `images`
directory (either from the classpath or from the filesystem) that has
the same name as the object class. Multiple file extensions are searched
for, including `.png`, `.gif` and `.jpg` (in order of preference). For
example, fan object of type Customer it will look for `Customer.png`,
`Customer.gif`, `Customer.jpg` etc.

If the framework finds no such file, then it will work up the
inheritance hierarchy to see if there is an icon matching the name of
any of the super-classes, and use that instead. If no matching icon is
found then the framework will look for an image called `default.png`,
`default.gif` or `default.jpg` in the images directory, and if this has
not been specified, then the framework will use its own default image
for an icon.

We strongly recommend that you adopt 'pascal case' as the convention for
icon file names: if you have a class called OrderLine, then call the
icon `OrderLine.png`. Actually, the framework will also recognise
`orderline.png`, but some operating systems and deployment environments
are case sensitive, so it is good practice to adopt an unambiguous
convention.

## Statically-specified image file



## Dynamically-specified image file




Alternatively, you can use the `iconName`() method instead:

    public String iconName() {
        return "Person";
    }

This makes it easy for more than one class to use the same icon, without
having to duplicate the image file.

