Title: Coding Conventions

Code should be formatted using the following Eclipse templates:

- `Windows > Preferences > Java > Code Style > Code Templates` 
 - Import [Apache-code-style-template.xml](resources/Apache-code-style-template.xml)
- `Windows > Preferences > Java > Code Style > Formatter` 
  - Import [Apache-code-style-formatting.xml](resources/Apache-code-style-formatting.xml)
- `Windows > Preferences > Java > Code Style > Organize Imports` 
  - Import [isis.importorder](resources/isis.importorder)
- `Windows > Preferences > Java > Code Style > Clean Up` 
  - Import [Apache-Isis-code-style-cleanup.xml](resources/Apache-Isis-code-style-cleanup.xml)
  - (this performs both code formatting and organizing imports)

In addition, you will probably want to import the Java editor templates, as described in the [getting started](../getting-started/editor-templates.html) section.
<!--
TODO: to add from the original incubator website [here](http://incubator.apache.org/isis "Apache Isis (incubator website)").

In addition:

- checkstyle, as per sec.Checkstyle
- PMD, as per sec.PMD
- findbugs, as per sec.FindBugs
-->

