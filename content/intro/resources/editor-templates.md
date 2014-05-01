Title: Editor Templates

The following Java editor templates (for Eclipse and IntelliJ) provide snippets to speed up writing domain objects and unit testing

- Isis domain objects (prefix `is`): [Eclipse](resources/isis-templates.xml) [IntelliJ](resources/isis-templates-idea.xml)
- JUnit (prefix `ju`): [Eclipse](resources/junit4-templates.xml) [IntelliJ](resources/junit4-templates-idea.xml)
- JMock (prefix `jm`): [Eclipse](resources/jmock2-templates.xml) [IntelliJ](resources/jmock2-templates-idea.xml)

Enter the prefix (`is`, `ju`, `jm`) for a drop-down list of all available templates in that category.

The most commonly used Isis domain objects templates are also listed on the [Isis cheat sheet](resources/IsisCheatSheet.pdf).

### Installation

To install in Eclipse, go to `Windows > Preferences > Java > Editor > Templates` and choose `Import`.

To install in IntelliJ, copy to the relevant `config/templates` directory, eg:

* Windows `<User home>\.IntelliJIdea13\config\templates`
* Linux `~/.IntelliJIdea13/config/templates`
* Mac OS `~/Library/Preferences/IntelliJIdea13/templates`

