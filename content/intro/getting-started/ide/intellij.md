Title: Setting up the IntelliJ IDE

> See also:
> 
> * setting up [Eclipse IDE](./eclipse.html).  
> * setting up [IntelliJ and JRebel](../../../other/jrebel.html).  
> 

We highly recommend that you develop your Isis application using an IDE.  Isis is built with Maven, and all modern IDEs can import Maven projects.

If using the [JDO Objectstore](../../../components/objectstores/jdo/about.html) (the default if using the [simple](../simple-archetype.html) or [quickstart](../quickstart-archetype.html) archetypes), then the development environment must be configured such that the Java bytecode can be enhanced by a [JDO enhancer](http://db.apache.org/jdo/enhancement.html).

If working in IntelliJ, then JDO enhancement is most easily done by leveraging the Maven configuration.

The steps are therefore:

* import the project into Eclipse
* setting up a run/debug configuration to run the app

## <a name="screencast"></a>Screencasts

TODO

## Importing the Code into IntelliJ

<img src="images/intellij-010-import.png"  width="600px"/>

<img src="images/intellij-020-maven.png"  width="600px"/>


## Setting up a Run/Debug Configuration


<img src="images/intellij-030-run-configuration.png"  width="600px"/>

