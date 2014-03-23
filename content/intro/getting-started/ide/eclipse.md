Title: Setting up Eclipse (with JDO/DataNucleus)

> See also:
> 
> * setting up [IntelliJ IDE](./intellij.html).  
> * setting up [Eclipse and JRebel](../../../other/jrebel.html).  
> 

We highly recommend that you develop your Isis application using an IDE.  Isis is built with Maven, and all modern IDEs can import Maven projects.

If using the [JDO Objectstore](../../../components/objectstores/jdo/about.html) (the default if using the [simple](../simple-archetype.html) or [quickstart](../quickstart-archetype.html) archetypes), then the development environment must be configured such that the Java bytecode can be enhanced by a [JDO enhancer](http://db.apache.org/jdo/enhancement.html).

If working in Eclipse, then JDO enhancement is most easily done by installing [DataNucleus' plugin](http://www.datanucleus.org/plugins/ide.eclipse.html).  This hooks the bytecode enhancement of your domain objects into Eclipse's normal incremental compilation.  This plugin needs to be configured for each of your domain modules (usually just one in any given app).

The steps are therefore:

* import the project into Eclipse
* configure the DataNucleus enhancer
* running the app from the `.launch` file

## <a name="screencast"></a>Screencast

The following screencast shows how import an Apache Isis maven-based application into Eclipse and configure to use with the JDO Objectstore

<iframe width="420" height="315" src="http://www.youtube.com/embed/RgcYfjQ8yJA" frameborder="0" allowfullscreen></iframe>


## Importing the Project

Use File > Import, then Maven > Existing Maven Projects.

> see the screencast for further details.

## Add DataNucleus support

> note:
> Make sure you are in the 'Java' Perspective, not the 'Java EE' Perspective.  

In Eclipse, for the *domain object model* project, first add DataNucleus support:

<img src="images/eclipse-100-project-support.png"  width="600px"/>

Then turn on Auto-Enhancement:

<img src="images/eclipse-110-project-support.png"  width="600px"/>


#### Update the classpath

DataNucleus' enhancer uses the domain object model's own classpath to reference DataNucleus JARs.  So, even though your domain objects are unlikely to depend on DataNucleus, these references must still be present.

Add the following to your `pom.xml`:

    <dependencies>
        <dependency>
            <groupId>org.apache.isis.core</groupId>
            <artifactId>isis-core-applib</artifactId>
        </dependency>

        <dependency>
            <groupId>org.apache.isis.objectstore</groupId>
            <artifactId>isis-objectstore-jdo-applib</artifactId>
        </dependency>

        <!-- DataNucleus (horrid, but needed to run the enhancer)-->
        <dependency>
            <groupId>javax.jdo</groupId>
            <artifactId>jdo-api</artifactId>
        </dependency>
        <dependency>
            <groupId>org.datanucleus</groupId>
            <artifactId>datanucleus-core</artifactId>
        </dependency>
        <dependency>
            <groupId>org.datanucleus</groupId>
            <artifactId>datanucleus-enhancer</artifactId>
            <exclusions>
                <exclusion>
                    <groupId>org.ow2.asm</groupId>
                    <artifactId>asm</artifactId>
                </exclusion>
            </exclusions>
        </dependency>
        <dependency>
            <groupId>org.datanucleus</groupId>
            <artifactId>datanucleus-api-jdo</artifactId>
            </dependency>
    </dependencies>

Then, tell DataNucleus to use the project classpath:

<img src="images/eclipse-010-windows-preferences.png" width="600px"/>

When the enhancer runs, it will print out to the console:

<img src="images/eclipse-120-console.png" width="500px"/>



#### Workaround for path limits (the DN plugin to use the persistence.xml)

If running on Windows then the DataNucleus plugin is very likely to hit the Windows path limit.

To fix this, we configure the enhancer to read from the `persistence.xml` file.  (This fix is also required if [working with Maven](./datanucleus-and-maven.html)).

As a prerequisite, first make sure that your domain object has a `persistence.xml` file.  The details of how to do this can be found [here](./persistence_xml.html).


Then specify the `persistence-unit` in the project properties:

<img src="images/eclipse-025-project-properties.png"  width="600px"/>


#### Workaround: If the enhancer fails

On occasion it appears that Eclipse can attempt to run two instances of the DataNucleus enhancer.  This is probably due to multiple Eclipse builders being defined; we've noticed multiple entries in the Eclipse's `Debug` view:
<img src="images/eclipse-210-enhancer-fails-duplicates.png"/>

At any rate, you'll know you've encountered this error if you see the following in the console:
<img src="images/eclipse-200-enhancer-fails-duplicates.png" width="600px"/>

The best solution is to remove DataNucleus support and then to re-add it:
<img src="images/eclipse-220-enhancer-fails-duplicates.png"  width="600px"/>

If you consistently hit problems, then the final recourse is to disable the automatic enhancement and to remember to manually enhance your domain object model before each run.  

Not ideal, we know.  Please feel free to contribute a better solution :-)


## Running the App

The simple and quickstart archetypes automatically generate `.launch` configurations in the `webapp` module.  You can therefore very simply run the application by right-clicking on one of these files, and choosing "Run As..." or "Debug As...".

> please see the screencast to see this in action.

<hr/>
## Other domain projects.

There is nothing to prevent you having multiple domain projects.  You might want to do such that each domain project corresponds to a [DDD module](http://www.methodsandtools.com/archive/archive.php?id=97p2), thus guaranteeing that there are no cyclic dependencies between your modules.

If you do this, make sure that each project has its own `persistence.xml` file.

And, remember also to configure Eclipse's DataNucleus plugin for these other domain projects.

#### JDO Applib domain projects.

The JDO objectstore also defines some of its own persistable domain entities, these being used in its implementation of the [Publishing Service](./publishing-service-jdo.html) and the [Settings Services](./settings-services-jdo.html).   These persistable domain entities are defined in the JDO applib, and must be enhanced.

If just using released versions of Isis, then there is nothing to be done.

However, if building Isis from source code and in Eclipse, and if you plan to use either of these services, then you must also configure Eclipse's DataNucleus plugin.

As noted in the [page describing persistence.xml](./persistence_xml.html), the `persistence-unit` name is: `jdo-applib`.  You should therefore configure the enhance the DataNucleus enhancer for the `isis-objectstore-jdo-applib` project, and configure the plugin as shown below:

<img src="images/jdo-applib-dn-project-configuration.png"  width="600px"/>


