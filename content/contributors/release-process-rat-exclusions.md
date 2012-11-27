Title: Release Audit Tool Exclusions

The Apache Release Audit Tool `RAT` (from the [Apache Creadur](http://creadur.apache.org) project) is designed to perform a number of basic checks, most significant being missing license header files.

The Isis parent `pom.xml` specifies the RAT Maven plugin, with the following custom exclusions:

<table>
<tr><th>Subtype</th><th>File path(s)</th><th>Description</th></tr>
<tr><td>IDE-specific</td><td>**/.project, **/.classpath, **/.settings</td><td>Eclipse project files</td></tr>
<tr><td>&nbsp;</td><td>**/*.launch</td><td>Eclipse launch configuration files</td></tr>
<tr><td>&nbsp;</td><td>**/*.java.jsp</td><td>Structure101 project file</td></tr>
<tr><td>&nbsp;</td><td>**/*.ucd, **/*.ucls</td><td>Soyatec UML plugin project files</td></tr>
<tr><td>Image formats</td><td>**/*.svg</td><td>Scalable Vector Graphics</td></tr>
<tr><td>&nbsp;</td><td>**/*.pdn</td><td>Paint.NET format</td></tr>
<tr><td>Data files</td><td>**/*.json</td><td>JSON (test) data</td></tr>
<tr><td>&nbsp;</td><td>**/isis.log</td><td>Isis' log file (byproduct of tests)</td></tr>
<tr><td>&nbsp;</td><td>**/rat.txt</td><td>RAT's own audit file</td></tr>
<tr><td>&nbsp;</td><td>**/fixture-data</td><td>SQL Object Store fixture data</td></tr>
<tr><td>&nbsp;</td><td>**/test.data</td><td>SQL Object Store fixture data</td></tr>
<tr><td>&nbsp;</td><td>**/xml/**/*.xml</td><td>XML Object Store fixture data</td></tr>
<tr><td>&nbsp;</td><td>tmp/tests/*.xml</td><td>XML Object Store fixture data</td></tr>
<tr><td>&nbsp;</td><td>tmp/ldap-conf/**</td><td>LDAP Security fixture data</td></tr>
<tr><td>&nbsp;</td><td>**/src/main/resources/resources.txt</td><td>Resource file</td></tr>
<tr><td>Archetype support</td><td>**/src/main/appended-resources/, supplemental-models.xml</td><td>(Empty) supplemental models</td></tr>
<tr><td>Program formats</td><td>**/*.min.js</td><td>Minified Javascript (note that the non-Minified Javascript equivalents is checked for its license)</td></tr>
</table>

In addition, a number of additional licenses are configured:

<table>
<tr><th>License</th><th>Description</th></tr>
<tr><td>Apache 2.0</td><td>The RAT tool searches for an older version of the Apache license header. This additional license reconfigures RAT to use the current form of words</td></tr>
<tr><td>MIT</td><td>JQuery (bundled with Isis) is dual licensed under MIT</td></tr>
<tr><td>DocBook</td><td>Like many other Apache projects, Isis generates its documentation in DocBook form. In order to speed up generation, Isis has a local copy of the DocBook DTDs, Entities etc. Key phrases from these files are configured so that RAT identifies these files as valid to use.</td></tr>
<tr><td>XHTML</td><td>Isis also has a dependency on the XHTML-strict DTD</td></tr>
</table>

