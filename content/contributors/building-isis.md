Title: Building Isis

[//]: # (content copied to _user-guide_xxx)

Isis is build using Maven; details of setting up your development environment can be found [here](development-environment.html).

In particular, note that you'll need to set up `MAVEN_OPTS`:

<pre>
MAVEN_OPTS=-Xms512m -Xmx1024m -XX:MaxPermSize=256m
</pre>

###Building all of Isis
To build the source code from the command line, simply go to the root directory and type:

<pre>
mvn clean install
</pre>

The first time you do this, you'll find it takes a while since Maven needs to download all of the Isis prerequisites.

Thereafter you can speed up the build by adding the `-o` (offline flag):

<pre>
mvn clean install -o
</pre>

For the most part, though, you may want to rely on an IDE such as Eclipse to build the codebase for you.  Both Eclipse and Idea (12.0+) support incremental background compilation.

When using Eclipse, a Maven profile is configured such that Eclipse compiles to `target-ide` directory rather than the usual `target` directory.  You can therefore switch between Eclipse and Maven command line without one interfering with the other.

###Building an Individual Component of Isis

Alternatively, you can go to the root of any of the components and build each individually.

For example:

* to build just core, use:

<pre>
  cd core
  mvn clean install
</pre>

* to build the JDO objectstore, use:

<pre>
  cd component/objectstore/jdo
  mvn clean install
</pre>

* to build the Wicket viewer, use:

<pre>
  cd component/viewer/wicket
  mvn clean install
</pre>

A list of all of the Isis components can be found in our [release process](release-process.html) documentation.