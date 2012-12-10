Title: Default Runtime

{stub
This page is a stub.
}

Isis graduated from the Apache incubator in October 2012; we are currently setting ourselves up as a top-level project.

In the meantime you can access our original incubator website [here](http://incubator.apache.org/isis "Apache Isis (incubator website)").

<!--
Runtimes

  The <runtimes> module is a parent for the various implementations of
  a runtime for the framework.

  A 'runtime' in this context means providing some or all of:

  * object persistence

  * object identity management

  * bootstrapping the framework

  * service location / dependency injection

  []

  The only implementation currently available is:

  * {{{./dflt/index.html}Default runtime}}

  The <dflt> (default) runtime implementation (as inherited originally
  from Naked Objects Framework) provides all of these services.  Other
  implementations may provide a subset of these (eg the 'embedded' runtime),
  or provide all of these features but using different technologies.



Default Runtime

  The default runtime module comprises a set of modules that provide
  for persistence and entity lifecycle management.  They also provide support
  for remoting (by an abstraction over the persistence mechanism) and
  incorporate a bytecode enhancement API to enable transparent lazy
  loading/unit of work tracking.

  The modules that make up the default runtime are:

  * {{{./runtime/index.html}runtime}} module, providing the core functionality

  * {{{./objectstores/index.html}objectstores}} module, under which there are
    various objectstore implementations (for persisting domain objects)

  * {{{./profilestores/index.html}profilestores}} module, under which there are
    various profilestore implementations (for persisting user preferences)

  * {{{./bytecode/index.html}bytecode}} module, under which there are
    various bytecode enhancement implementations (used for transparent lazy
    loading/unit of work support)

  * {{{./webapp/index.html}webapp}} module, providing the ability to bootstrap t
he
    default runtime within a web application

  * {{{./webserver/index.html}webserver}} module, providing the ability to run
    Isis webapps under a webserver instance (Jetty)

  * {{{./remoting/index.html}remoting}} module, acting as a parent to the
    modules that provide support for client/server deployments


-->