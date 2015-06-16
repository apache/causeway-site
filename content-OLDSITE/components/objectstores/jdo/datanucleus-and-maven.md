Title: Using JDO/DataNucleus with Maven

[//]: # (content copied to user-guide_getting-started_datanucleus-enhancer)

> See also [how to use JDO/DataNucleus with Eclipse](./datanucleus-and-eclipse.html).  

By leveraging the JDO/Datanucleus ORM, Isis' JDO objectstore is very powerful. However, with such power comes a little bit of complexity to the development environment: all domain objects must be enhanced through the [JDO enhancer](http://db.apache.org/jdo/enhancement.html).  So the enhancer must, in one way or another, be integrated into your development environment.


However, if running on Windows, then there's a good chance you'll hit the [maximum path length limit](http://msdn.microsoft.com/en-us/library/aa365247%28VS.85%29.aspx#maxpath). Fortunately, the workaround is straight-forward: configure a `persistence.xml` file, as described [here](./persistence_xml.html).

> Note: this workaround is also required if [developing in Eclipse](./datanucleus-and-eclipse.html)).




## Upgrading to DataNucleus 4.0.0 (1.9.0-SNAPSHOT)

[//]: # (content copied to user-guide_appendices_migration-notes)

Isis 1.9.0 updates to DataNucleus 4.0.0, which requires some changes (simplifications) to the Maven configuration.  

If you starting a new app then you can start from the simpleapp archetype; its Maven configuration has been updated.

If you have an existing Isis app that you want to upgrade, then you'll need to make some changes.

### In the parent `pom.xml`

under the `<project>/<properties>`, remove:

<pre>
&lt;!-- must be consistent with the versions defined by the JDO Objectstore --&gt;
&lt;datanucleus-accessplatform-jdo-rdbms.version&gt;3.3.6&lt;/datanucleus-accessplatform-jdo-rdbms.version&gt;
&lt;datanucleus-maven-plugin.version&gt;3.3.2&lt;/datanucleus-maven-plugin.version&gt;
</pre>


## In `dom/pom.xml`, 

under `<build>/<plugins>`, remove:

<pre>
&lt;plugin&gt;
    &lt;groupId&gt;org.datanucleus&lt;/groupId&gt;
    &lt;artifactId&gt;datanucleus-maven-plugin&lt;/artifactId&gt;
    &lt;version&gt;${datanucleus-maven-plugin.version}&lt;/version&gt;
    &lt;configuration&gt;
        &lt;fork&gt;false&lt;/fork&gt;
        &lt;log4jConfiguration&gt;${basedir}/log4j.properties&lt;/log4jConfiguration&gt;
        &lt;verbose&gt;true&lt;/verbose&gt;
        &lt;props&gt;${basedir}/datanucleus.properties&lt;/props&gt;
    &lt;/configuration&gt;
    &lt;executions&gt;
        &lt;execution&gt;
            &lt;phase&gt;compile&lt;/phase&gt;
            &lt;goals&gt;
                &lt;goal&gt;enhance&lt;/goal&gt;
            &lt;/goals&gt;
        &lt;/execution&gt;
    &lt;/executions&gt;
&lt;/plugin&gt;
</pre>

and (if you have it) under `<build>/<pluginManagement>/<plugins>`, remove:

<pre>
&lt;!--This plugin's configuration is used to store Eclipse m2e settings only. It has no influence on the Maven build itself.--&gt;
&lt;plugin&gt;
    &lt;groupId&gt;org.eclipse.m2e&lt;/groupId&gt;
    &lt;artifactId&gt;lifecycle-mapping&lt;/artifactId&gt;
    &lt;version&gt;1.0.0&lt;/version&gt;
    &lt;configuration&gt;
        &lt;lifecycleMappingMetadata&gt;
            &lt;pluginExecutions&gt;
                &lt;pluginExecution&gt;
                    &lt;pluginExecutionFilter&gt;
                        &lt;groupId&gt;
                            org.datanucleus
                        &lt;/groupId&gt;
                        &lt;artifactId&gt;
                            datanucleus-maven-plugin
                        &lt;/artifactId&gt;
                        &lt;versionRange&gt;
                            [3.2.0-release,)
                        &lt;/versionRange&gt;
                        &lt;goals&gt;
                            &lt;goal&gt;enhance&lt;/goal&gt;
                        &lt;/goals&gt;
                    &lt;/pluginExecutionFilter&gt;
                    &lt;action&gt;
                        &lt;ignore&gt;&lt;/ignore&gt;
                    &lt;/action&gt;
                &lt;/pluginExecution&gt;
            &lt;/pluginExecutions&gt;
        &lt;/lifecycleMappingMetadata&gt;
    &lt;/configuration&gt;
&lt;/plugin&gt;
</pre>

and instead in `<profiles>` add:

<pre>
&lt;profile&gt;
    &lt;id&gt;enhance&lt;/id&gt;
    &lt;activation&gt;
        &lt;activeByDefault&gt;true&lt;/activeByDefault&gt;
    &lt;/activation&gt;
    &lt;properties&gt;
        &lt;datanucleus-maven-plugin.version&gt;4.0.0-release&lt;/datanucleus-maven-plugin.version&gt;
    &lt;/properties&gt;
    &lt;build&gt;
        &lt;pluginManagement&gt;
            &lt;plugins&gt;
                &lt;plugin&gt;
                    &lt;!--This plugin's configuration is used to store Eclipse m2e settings only. It has no influence on the Maven build itself.--&gt;
                    &lt;groupId&gt;org.eclipse.m2e&lt;/groupId&gt;
                    &lt;artifactId&gt;lifecycle-mapping&lt;/artifactId&gt;
                    &lt;version&gt;1.0.0&lt;/version&gt;
                    &lt;configuration&gt;
                        &lt;lifecycleMappingMetadata&gt;
                            &lt;pluginExecutions&gt;
                                &lt;pluginExecution&gt;
                                    &lt;pluginExecutionFilter&gt;
                                        &lt;groupId&gt;org.datanucleus&lt;/groupId&gt;
                                        &lt;artifactId&gt;datanucleus-maven-plugin&lt;/artifactId&gt;
                                        &lt;versionRange&gt;[${datanucleus-maven-plugin.version},)&lt;/versionRange&gt;
                                        &lt;goals&gt;
                                            &lt;goal&gt;enhance&lt;/goal&gt;
                                        &lt;/goals&gt;
                                    &lt;/pluginExecutionFilter&gt;
                                    &lt;action&gt;
                                        &lt;ignore&gt;&lt;/ignore&gt;
                                    &lt;/action&gt;
                                &lt;/pluginExecution&gt;
                            &lt;/pluginExecutions&gt;
                        &lt;/lifecycleMappingMetadata&gt;
                    &lt;/configuration&gt;
                &lt;/plugin&gt;
            &lt;/plugins&gt;
        &lt;/pluginManagement&gt;
        &lt;plugins&gt;
            &lt;plugin&gt;
                &lt;groupId&gt;org.datanucleus&lt;/groupId&gt;
                &lt;artifactId&gt;datanucleus-maven-plugin&lt;/artifactId&gt;
                &lt;version&gt;${datanucleus-maven-plugin.version}&lt;/version&gt;
                &lt;configuration&gt;
                    &lt;fork&gt;false&lt;/fork&gt;
                    &lt;log4jConfiguration&gt;${basedir}/log4j.properties&lt;/log4jConfiguration&gt;
                    &lt;verbose&gt;true&lt;/verbose&gt;
                    &lt;props&gt;${basedir}/datanucleus.properties&lt;/props&gt;
                &lt;/configuration&gt;
                &lt;executions&gt;
                    &lt;execution&gt;
                        &lt;phase&gt;process-classes&lt;/phase&gt;
                        &lt;goals&gt;
                            &lt;goal&gt;enhance&lt;/goal&gt;
                        &lt;/goals&gt;
                    &lt;/execution&gt;
                &lt;/executions&gt;
            &lt;/plugin&gt;
        &lt;/plugins&gt;
    &lt;/build&gt;
    &lt;dependencies&gt;
        &lt;dependency&gt;
            &lt;groupId&gt;org.datanucleus&lt;/groupId&gt;
            &lt;artifactId&gt;datanucleus-core&lt;/artifactId&gt;
        &lt;/dependency&gt;
        &lt;dependency&gt;
            &lt;groupId&gt;org.datanucleus&lt;/groupId&gt;
            &lt;artifactId&gt;datanucleus-jodatime&lt;/artifactId&gt;
        &lt;/dependency&gt;
        &lt;dependency&gt;
            &lt;groupId&gt;org.datanucleus&lt;/groupId&gt;
            &lt;artifactId&gt;datanucleus-api-jdo&lt;/artifactId&gt;
        &lt;/dependency&gt;
    &lt;/dependencies&gt;
&lt;/profile&gt;
</pre>
    
If you don't use Eclipse then you can omit the `org.eclipse.m2e` plugin in `<pluginManagement>`.


## In the webapp's `persistor_datanucleus.properties`

in `src/main/webapp/WEB-INF/`, 

change:

    isis.persistor.datanucleus.impl.datanucleus.autoCreateSchema=true
    isis.persistor.datanucleus.impl.datanucleus.validateTables=true
    isis.persistor.datanucleus.impl.datanucleus.validateConstraints=true

to:

    isis.persistor.datanucleus.impl.datanucleus.schema.autoCreateAll=true
    isis.persistor.datanucleus.impl.datanucleus.schema.validateTables=true
    isis.persistor.datanucleus.impl.datanucleus.schema.validateConstraints=true

and change:

    isis.persistor.datanucleus.impl.datanucleus.identifier.case=PreserveCase

to:

    isis.persistor.datanucleus.impl.datanucleus.identifier.case=MixedCase

