Title: Deployment Types and Component Defaults

The `deploymentType` configuration setting is used to specify whether Isis is running in development mode or production mode (similar to Apache Wicket's concept of the application's [configuration type](http://ci.apache.org/projects/wicket/apidocs/6.0.x/org/apache/wicket/Application.html#getConfigurationType()).

The most thing aspect of configuration that varies by `deploymentType` is whether actions annotated with [@Exploration](./recognized-annotations/Exploration.html) and [@Prototype](./recognized-annotations/Prototype.html) are visible.  It is also used to determine the default component to use (for security and objectstore) if not explicitly specified.

> The `deploymentType` design is perhaps overly complex; we hope to simplify in the future.

## Deployment Types and Deployment Categories

There is a standard list of `deploymentType`s, though components can extend this list if required (and note, the [Wicket viewer](../components/viewers/wicket/about.html) is one such component that does so).

Each `deploymentType` list has a corresponding `deploymentCategory`, and it is this that determines whether `@Exploration` and `@Prototype` actions are visible.

The standard list of deploymentTypes and their categories are:

<table class="table table-striped table-bordered table-condensed">
<tr>
<th>Deployment types</th>
<th>Deployment category</th>
<th>@Exploration actions</th>
<th>@Prototype actions</th>
</tr>
<tr>
    <td>EXPLORATION</td>
    <td>EXPLORING</td>
    <td>Visible</td>
    <td>Not visible</td>
</tr>
<tr>
    <td>SERVER_EXPLORATION</td>
    <td>EXPLORING</td>
    <td>Visible</td>
    <td>Not visible</td>
</tr>
<tr>
    <td>UTILITY</td>
    <td>EXPLORING</td>
    <td>Visible</td>
    <td>Not visible</td>
</tr>
<tr>
    <td>PROTOTYPE</td>
    <td>PROTOTYPING</td>
    <td>Not visible</td>
    <td>Visible</td>
</tr>
<tr>
    <td>SERVER_PROTOTYPE</td>
    <td>PROTOTYPING</td>
    <td>Not visible</td>
    <td>Visible</td>
</tr>
<tr>
    <td>SERVER<br/>
UNIT_TESTING<br/>
SINGLE_USER</td>
    <td>PRODUCTION</td>
    <td>Not visible</td>
    <td>Not visible</td>
</tr>
<tr>
    <td>SERVER<br/>
UNIT_TESTING<br/>
SINGLE_USER</td>
    <td>PRODUCTION</td>
    <td>Not visible</td>
    <td>Not visible</td>
</tr>
<tr>
    <td>SERVER<br/>
UNIT_TESTING<br/>
SINGLE_USER</td>
    <td>PRODUCTION</td>
    <td>Not visible</td>
    <td>Not visible</td>
</tr>
</table>


## Specifying the Deployment Type in the `web.xml` file

> If running these viewers using the [WebServer](https://raw.github.com/apache/isis/master/core/webserver/src/main/java/org/apache/isis/core/webserver/WebServer.java), then the `deploymentType` is forced to SERVER_PROTOTYPE; the value in the `web.xml` file is ignored.  Thus these settings only take force when deploying into a regular webapp server, eg Tomcat.

#### Wicket

For the [wicket](../components/viewers/wicket/about.html) viewer, the Isis `deploymentType` is inferred from [Apache Wicket](http://wicket.apache.org)'s own [deployment mode](http://ci.apache.org/projects/wicket/apidocs/6.x/org/apache/wicket/Application.html#getConfigurationType()):

* Wicket's `DEVELOPMENT` mode corresponds to Isis' `PROTOTYPING` mode
* Wicket's `DEPLOYMENT` mode corresponds to Isis' `PRODUCTION` mode

The Wicket configuration type is set in the usual way for a Wicket application, for example:

    <context-param>
        <param-name>configuration</param-name>
        <param-value>deployment</param-name>
    </context-param>

(Alternative ways of specifying the Wicket configuration type can be found [in this blog post](http://www.mysticcoders.com/blog/development-and-deployment-mode-how-to-configure-it/)).

Note that if the Wicket configuration type is set to deployment, then any Wicket tags will automatically be stripped.  The presence of Wicket tags can occasionally trip up some browsers (we have noticed that Internet Explorer is particularly susceptible) and some Javascript components.  The Wicket viewer therefore also allows the stripping of Wicket tags to be forced (even in prototype mode) using a configuration setting described [here](../components/viewers/wicket/stripped-wicket-tags.html).

#### Restful Objects viewer

First thing to note is that, if [Restful Objects](../components/viewers/restfulobjects/about.html) viewer is deployed alongside the [Wicket](../components/viewers/wicket/about.html) viewer, then the Wicket viewer's configuration takes precedence.  See the section above for details.

However, if the Restful Objects viewer is deployed by itself, then the `deploymentType` is specified in the `<web.xml>` file:

    <context-param>
        <param-name>deploymentType</param-name>
        <param-value>SERVER</param-name>
    </context-param>


#### Scimpi viewer (not released)

The [Scimpi](../components/viewers/scimpi/about.html) is configured the same way as the [Restful Objects](../components/viewers/restfulobjects/about.html) viewer, see above.

## Running a web viewer using `WebServer`

If running these viewers using the [WebServer](https://raw.github.com/apache/isis/master/core/webserver/src/main/java/org/apache/isis/core/webserver/WebServer.java), then the `deploymentType` defaults to prototype; see below for more details.

It is possible to explicitly specify the deployment mode at the command line:

    -t server_prototype

or using the long form:

    --type server_exploration

Only `server_*`-style `deploymentType`s should be specified (it has a bearing on the way that Isis does its session management).


## Component Defaults

If a component implementation is not specified explicitly, then the default is based on the deployment category (see the [InstallerLookupDefault](https://raw.github.com/apache/isis/master/core/runtime/src/main/java/org/apache/isis/core/runtime/installers/InstallerLookupDefault.java) class).

<table class="table table-striped table-bordered table-condensed">
<tr>
<th>Deployment category</th>
<th>Deployment types</th>
<th>Authentication<br/>(if not specified)</th>
<th>Authorization<br/>(if not specified)</th>
<th>Object store<br/>(if not specified)</th>
<th>Profile store<br/>(if not specified)</th>
</tr>
<tr>
    <td>EXPLORING</td>
    <td>SERVER_EXPLORATION<br/>
EXPLORATION<br/>
UTILITY</td>
    <td><a href="../core/bypass-security.html">Bypass</a></td>
    <td><a href="../core/bypass-security.html">Bypass</a></td>
    <td><a href="../core/inmemory-objectstore.html">In-memory</a></td>
    <td><a href="../core/inmemory-profilestore.html">In-memory</a></td>
    </tr>
<tr>
    <td>PROTOTYPING</td>
    <td>SERVER_PROTOTYPE<br/>
PROTOTYPE</td>
    <td><a href="../components/security/file/about.html">File-based</a></td>
    <td><a href="../core/bypass-security.html">Bypass</a></td>
    <td><a href="../core/inmemory-objectstore.html">In-memory</a></td>
    <td><a href="../core/inmemory-profilestore.html">In-memory</a></td>
</tr>
<tr>
    <td>PRODUCTION</td>
    <td>SERVER<br/>
UNIT_TESTING<br/>
SINGLE_USER</td>
    <td><a href="../components/security/file/about.html">File-based</a></td>
    <td><a href="../components/security/file/about.html">File-based</a></td>
    <td><a href="../components/objectstores/xml/about.html">XML</a></td>
    <td><a href="../components/profilestores/xml/about.html">XML</a></td>
</tr>
</table>

