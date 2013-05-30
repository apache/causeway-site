Title: Using JDO in Maven and Eclipse

{note
See also the screencast describing how to [import an application into Eclipse](../../../getting-started/screencasts.html)
}

By leveraging the JDO/Datanucleus ORM, Isis' JDO objectstore is very powerful. However, with such power comes a little bit of complexity to the development environment: all domain objects must be enhanced through the [JDO enhancer](http://db.apache.org/jdo/enhancement.html).  So the enhancer must, in one way or another, be integrated into your development environment.

If working from the Maven command line, JDO enhancement is done using the `maven-datanucleus-plugin`.

If working in Eclipse, then JDO enhancement is done by installing [DataNucleus' plugin](http://www.datanucleus.org/plugins/ide.eclipse.html).  This hooks the bytecode enhancement of your domain objects into Eclipse's normal incremental compilation.

There are two distinct sets of problems you may encounter:

* if you are running on Windows (either in Maven or Eclipse), then there's a good chance you'll hit the [maximum path length limit](http://msdn.microsoft.com/en-us/library/aa365247%28VS.85%29.aspx#maxpath). Fortunately, there is a workaround.

* if you are developing in Eclipse and a new version of DataNucleus is released to Maven central repo, then this can cause classpath issues.  Again, there is a workaround.

In other words:

<table>
<tr><th>&nbsp;</th><th>Maven</th><th>Eclipse</th></tr>
<tr><td><b>Unix</b></td><td>use workaround when new DN version</td><td>no known issues</td></tr>
<tr><td><b>Windows</b></td><td>use workaround for path limit<br/>use workaround when new DN versions</td> </td><td>use workaround for path limits</tr>
</table>

In addition, Eclipse's enhancer needs some special care over the classpath.

## For Eclipse: configuring the enhancer

for the domain object model project, first add DataNucleus support:

<img src="resources/eclipse-100-project-support.png"  width="600px"/>

Then turn on Auto-Enhancement:

<img src="resources/eclipse-110-project-support.png"  width="600px"/>


### For Eclipse: classpath considerations

Update domain object model's classpath to reference DataNucleus JARs:

<pre>
&lt;dependencies&gt;
    &lt;dependency&gt;
        &lt;groupId&gt;org.apache.isis.core&lt;/groupId&gt;
        &lt;artifactId&gt;isis-core-applib&lt;/artifactId&gt;
    &lt;/dependency&gt;

    &lt;dependency&gt;
        &lt;groupId&gt;org.apache.isis.objectstore&lt;/groupId&gt;
        &lt;artifactId&gt;isis-objectstore-jdo-applib&lt;/artifactId&gt;
    &lt;/dependency&gt;

    &lt;!-- DataNucleus (horrid, but needed to run the enhancer)--&gt;
    &lt;dependency&gt;
        &lt;groupId&gt;javax.jdo&lt;/groupId&gt;
        &lt;artifactId&gt;jdo-api&lt;/artifactId&gt;
    &lt;/dependency&gt;
    &lt;dependency&gt;
        &lt;groupId&gt;org.datanucleus&lt;/groupId&gt;
        &lt;artifactId&gt;datanucleus-core&lt;/artifactId&gt;
    &lt;/dependency&gt;
    &lt;dependency&gt;
        &lt;groupId&gt;org.datanucleus&lt;/groupId&gt;
        &lt;artifactId&gt;datanucleus-enhancer&lt;/artifactId&gt;
        &lt;exclusions&gt;
            &lt;exclusion&gt;
                &lt;groupId&gt;org.ow2.asm&lt;/groupId&gt;
                &lt;artifactId&gt;asm&lt;/artifactId&gt;
            &lt;/exclusion&gt;
        &lt;/exclusions&gt;
    &lt;/dependency&gt;
    &lt;dependency&gt;
        &lt;groupId&gt;org.datanucleus&lt;/groupId&gt;
        &lt;artifactId&gt;datanucleus-api-jdo&lt;/artifactId&gt;
        &lt;/dependency&gt;
&lt;/dependencies&gt;
</pre>

And tell DataNucleus to use the project classpath:

<img src="resources/eclipse-010-windows-preferences.png" width="600px"/>

When the enhancer runs, it will print out to the console:

<img src="resources/eclipse-120-console.png" width="500px"/>



## Workaround for path limits: using `persistence.xml`

### Create `persistence.xml`

in `src/main/java/META-INF` of the domain project:

<img src="resources/eclipse-028-persistence-unit-xml.png" width="250px"/>

Ensure the `persistence-unit` is as specified in the project properties:

<pre>
&lt;?xml version=&quot;1.0&quot; encoding=&quot;UTF-8&quot; ?&gt;
&lt;persistence xmlns=&quot;http://java.sun.com/xml/ns/persistence&quot;
    xmlns:xsi=&quot;http://www.w3.org/2001/XMLSchema-instance&quot;
    xsi:schemaLocation=&quot;http://java.sun.com/xml/ns/persistence http://java.sun.com/xml/ns/persistence/persistence_1_0.xsd&quot; version=&quot;1.0&quot;&gt;

    &lt;persistence-unit name=&quot;quickstart&quot;&gt;
    &lt;/persistence-unit&gt;
&lt;/persistence&gt;
</pre>


Then specify the `persistence-unit` in the project properties:

<img src="resources/eclipse-025-project-properties.png"  width="600px"/>


## Workaround for DN versions: using a profile

Every so often there will be a new release of DataNucleus plugins to the Maven central repo.  For better or for worse, the Maven DataNucleus plugin defines a range dependency: it will always use the latest version of the DN modules available.

The Eclipse DataNucleus plugin on the other hand is configured to use the project classpath, and so it will remain compatible with the version referenced by Isis' own JDO objectstore.

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

The fix is to use a Maven profile:

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
                    &lt;version&gt;(3.0.99, 3.1.99)&lt;/version&gt;
                    &lt;scope&gt;runtime&lt;/scope&gt;
                &lt;/dependency&gt;
                &lt;dependency&gt;
                    &lt;groupId&gt;org.datanucleus&lt;/groupId&gt;
                    &lt;artifactId&gt;datanucleus-enhancer&lt;/artifactId&gt;
                    &lt;version&gt;(3.0.99, 3.1.99)&lt;/version&gt;
                    &lt;scope&gt;runtime&lt;/scope&gt;
                &lt;/dependency&gt;
            &lt;/dependencies&gt;
        &lt;/profile&gt;
    &lt;/profiles&gt;
</pre>

This says that when *not* run within Eclipse (the ${m2e.version} property is *not* set), then to use the latest version of the DataNucleus dependency can be referenced.  You can maintain the &lt;version&gt; to keep track with the latest-n-greatest available in the Maven repo.



## For Eclipse: If the enhancer fails

On occasion it appears that Eclipse can attempt to run two instances of the DataNucleus enhancer.  This is probably due to multiple Eclipse builders being defined; we've noticed multiple entries in the Eclipse's `Debug` view:

<img src="resources/eclipse-210-enhancer-fails-duplicates.png"/>

At any rate, you'll know you've encountered this error if you see the following in the console:
<img src="resources/eclipse-200-enhancer-fails-duplicates.png"/>

The best solution is to remove DataNucleus support and then to re-add it:

<img src="resources/eclipse-220-enhancer-fails-duplicates.png"  width="600px"/>
