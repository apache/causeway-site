Title: Configuring the About page

[//]: # (content copied to _user-guide_wicket-viewer)

Isis' Wicket viewer has an About page that, by default, will provide a dump of the JARs that make up the webapp.  This page will also show the manifest attributes of the WAR archive itself, if there are any.  One of these attributes may also be used as the application version number.

## Screenshot

Here's what the About page looks like with this configuration added:

<img src="images/about-page.png" width="800"></img>

Note that the `Build-Time` attribute has been used as the version number.  The Wicket viewer is hard-coded to search for specific attributes and use as the application version.  In order, it searches for:

* `Implementation-Version`
* `Build-Time`

If none of these are found, then no version is displayed.

## Configuration

_This configuration is included within the [simpleapp archetype](../../../intro/getting-started/simpleapp-archetype.html)._

#### Adding attributes to the WAR's manifest

Add the following to the webapp's `pom.xml` (under `<build><plugins>`):

    <plugin>
        <groupId>org.codehaus.mojo</groupId>
        <artifactId>build-helper-maven-plugin</artifactId>
        <version>1.5</version>
          <executions>
            <execution>
              <phase>validate</phase>
              <goals>
                <goal>maven-version</goal>
              </goals>
            </execution>
          </executions>
    </plugin>

    <plugin>
        <artifactId>maven-war-plugin</artifactId>
        <configuration>
            <archive>
                <manifest>
                    <addDefaultImplementationEntries>true</addDefaultImplementationEntries>
                </manifest>
                <manifestEntries>
                    <Build-Time>${maven.build.timestamp}</Build-Time>
                    <Build-Number>${buildNumber}</Build-Number>
                    <Build-Host>${agent.name}</Build-Host>
                    <Build-User>${user.name}</Build-User>
                    <Build-Maven>Maven ${maven.version}</Build-Maven>
                    <Build-Java>${java.version}</Build-Java>
                    <Build-OS>${os.name}</Build-OS>
                    <Build-Label>${project.version}</Build-Label>
                </manifestEntries>
            </archive>
        </configuration>
        <executions>
            <execution>
                <phase>package</phase>
                <goals>
                    <goal>war</goal>
                </goals>
                <configuration>
                    <classifier>${env}</classifier>
                </configuration>
            </execution>
        </executions>
    </plugin>

If you then build the webapp from the Maven command line (`mvn clean package`), then the WAR should contain a `META-INF/MANIFEST.MF` with those various attribute entries.

#### Exporting the attributes into the app

The manifest attributes are provided to the rest of the application by way of the Wicket viewer's integration with Google Guice.

In your subclass of `IsisWicketApplication`, there is a method `newIsisWicketModule()`.  In this method you need to bind an `InputStream` that will read the manifest attributes.  This is all boilerplate so you can just copy-n-paste:

    @Override
    protected Module newIsisWicketModule() {

        ...

        final Module simpleappOverrides = new AbstractModule() {
            @Override
            protected void configure() {
                ...
                bind(InputStream.class)
                    .annotatedWith(Names.named("metaInfManifest"))
                    .toProvider(Providers.of(
                        getServletContext().getResourceAsStream("/META-INF/MANIFEST.MF")));
            }
        };

        ...

    }

And with that you should be good to go!
