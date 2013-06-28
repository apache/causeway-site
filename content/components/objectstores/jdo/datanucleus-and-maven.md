Title: Using JDO/DataNucleus with Maven

> See also [how to use JDO/DataNucleus with Maven](./datanucleus-and-eclipse.html).  

By leveraging the JDO/Datanucleus ORM, Isis' JDO objectstore is very powerful. However, with such power comes a little bit of complexity to the development environment: all domain objects must be enhanced through the [JDO enhancer](http://db.apache.org/jdo/enhancement.html).  So the enhancer must, in one way or another, be integrated into your development environment.

If working from the Maven command line, JDO enhancement is done using the `maven-datanucleus-plugin`.

However there are a couple of issues you may encounter:

* if running on Windows, then there's a good chance you'll hit the [maximum path length limit](http://msdn.microsoft.com/en-us/library/aa365247%28VS.85%29.aspx#maxpath). Fortunately, the workaround is straight-forward: configure a `persistence.xml` file.  (This workaround is also required if [developing in Eclipse](./datanucleus-and-eclipse.html)).

* New releases of DataNucleus plugins in the Maven central repo can cause versioning problems.

We have workarounds for both.

## Workaround for path limits: Configuring the `persistence.xml` file

Configuring a `persistence.xml` 
Details of how to configure the `persistence.xml` file can be found [here](./persistence_xml.html).

There is no additional configuration required in any Maven `pom.xml`; you are done.

## Workaround for DN versioning issues: using a Maven profile

Every so often there will be a new release of DataNucleus plugins to the [Maven central repo](http://search.maven.org).  For better or for worse, the Maven DataNucleus enhancer plugin defines a range dependency: it will always use the latest version of the DN modules available.

The DataNucleus plugin for Eclipse on the other hand is configured to use the project classpath, and so it will remain compatible with the version referenced by Isis' own JDO objectstore.

Unfortunately, if the enhancer is run referencing two different versions of the `org.datanucleus:dataducleus-core` jar, then it will fail:

<pre>
[INFO] Example Claims .................................... SUCCESS [0.017s]
[INFO] Example Claims App DOM ............................ FAILURE [1.532s]
[INFO] Example Claims App Repositories (for ObjectStore Default)  SKIPPED
[INFO] Example Claims App Fixtures ....................... SKIPPED
[INFO] Example Claims App Repositories (for JDO ObjectStore)  SKIPPED
...
...
[INFO] ------------------------------------------------------------------------
[INFO] BUILD FAILURE
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 5:49.374s
[INFO] Finished at: Thu Dec 06 15:54:44 GMT 2012
[INFO] Final Memory: 113M/883M
[INFO] ------------------------------------------------------------------------
[ERROR] Failed to execute goal org.datanucleus:maven-datanucleus-plugin:3.1.1:en
hance (default) on project claims-dom: Error executing DataNucleus tool org.data
nucleus.enhancer.DataNucleusEnhancer: InvocationTargetException: Plugin (Bundle)
 "org.datanucleus" is already registered. Ensure you dont have multiple JAR vers
ions of the same plugin in the classpath. The URL "file:/C:/MVN/.m2/repository/o
rg/datanucleus/datanucleus-core/3.1.3/datanucleus-core-3.1.3.jar" is already reg
istered, and you are trying to register an identical plugin located at URL "file
:/C:/MVN/.m2/repository/org/datanucleus/datanucleus-core/3.1.2/datanucleus-core-
3.1.2.jar." -&gt; [Help 1]
[ERROR]
[ERROR] To see the full stack trace of the errors, re-run Maven with the -e swit
ch.
</pre>




### Preferred solution

> This solution fixes is now version of DataNucleus to be the version referenced by the JDO ObjectStore.  
> 
> This is the solution used from the Isis Core 1.3.0-SNAPSHOT onwards.

In the root project's `pom.xml`, specify the property:

    <properties>
        <datanucleus-core.version>3.2.4</datanucleus-core.version>
        ...
    </properties>

where the version should be the same as the one referenced by the JDO Objectstore.

Then, in the `dom` project's `pom.xml`, update the DataNucleus enhancer plugin to force it to use a specific version of the DataNucleus core: 


    <plugins>
        <plugin>
            <groupId>org.datanucleus</groupId>
            <artifactId>datanucleus-maven-plugin</artifactId>
            <version>3.2.0-release</version>
            <dependencies>
                <dependency>
                        <!-- Force the enhancer to use the same version 
                        of core that's already on the classpath -->
                        <groupId>org.datanucleus</groupId>
                        <artifactId>datanucleus-core</artifactId>
                        <version>${datanucleus-core.version}</version>
                    </dependency>
                </dependencies>
                <configuration>
            	<fork>false</fork>
                <log4jConfiguration>${basedir}/log4j.properties</log4jConfiguration>
                <verbose>true</verbose>
                <props>${basedir}/datanucleus.properties</props>
            </configuration>
            <executions>
                <execution>
                    <phase>compile</phase>
                    <goals>
                        <goal>enhance</goal>
                    </goals>
                </execution>
            </executions>
        </plugin>
       ...
    </plugins>

 

### Original solution

> This solution attempts to use the latest-n-greatest version of DataNucleus, and was the approach used in Isis Core 1.2.0 and earlier.  However, it has been found to be flawed if a new version of the DataNucleus enhancer was released that had an incompatibility with the version of DN referenced by the JDO ObjectStore.  
> 
> Use the preferred solution, above, instead.


The fix is to use a Maven profile.  The following is correct as of the JDO ObjectStore v1.1.0:

<pre>
    &lt;profiles&gt;
        &lt;profile&gt;
            &lt;id&gt;not-m2e&lt;/id&gt;
            &lt;activation&gt;
                &lt;property&gt;
                    &lt;name&gt;!m2e.version&lt;/name&gt;
                &lt;/property&gt;
            &lt;/activation&gt;
            &lt;dependencies&gt;
                &lt;dependency&gt;
                    &lt;groupId&gt;org.datanucleus&lt;/groupId&gt;
                    &lt;artifactId&gt;datanucleus-core&lt;/artifactId&gt;
                    &lt;version&gt;(3.2.0-m1, 3.2.99)&lt;/version&gt;
                    &lt;scope&gt;runtime&lt;/scope&gt;
                &lt;/dependency&gt;
            &lt;/dependencies&gt;
        &lt;/profile&gt;
    &lt;/profiles&gt;
</pre>

This says that when *not* run within Eclipse (the ${m2e.version} property is *not* set), then to use the latest version of the DataNucleus dependency can be referenced.  You can maintain the &lt;version&gt; to keep track with the latest-n-greatest available in the Maven repo.

