How to specify the icon for a domain entity
-------------------------------------------

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

Alternatively, you can use the `iconName`() method instead:

    public String iconName() {
        return "Person";
    }

This makes it easy for more than one class to use the same icon, without
having to duplicate the image file.

