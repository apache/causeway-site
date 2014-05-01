Title: Editor Templates

The following table lists various IDE templates (for IntelliJ and Eclipse) when writing Isis domain objects and unit tests:

<table  class="table table-striped table-bordered table-condensed">
    <tr class="heading">
        <th>Template</th>
        <th>Prefix</th>
        <th>IntelliJ</th>
        <th>Eclipse</th>
    </tr>
    <tr>
        <td>Isis Domain Objects</td>
        <td><tt>is</tt></td>
        <td><a href="resources/isis-templates-idea.xml">Download</a></td>
        <td><a href="resources/isis-templates.xml">Download</a></td>
    </tr>
    <tr>
        <td>JUnit tests</td>
        <td><tt>ju</tt></td>
        <td><a href="resources/junit4-templates-idea.xml">Download</a></td>
        <td><a href="resources/junit4-templates.xml">Download</a></td>
    </tr>
    <tr>
        <td>JMock tests</td>
        <td><tt>jm</tt></td>
        <td><a href="resources/jmock-templates-idea.xml">Download</a></td>
        <td><a href="resources/jmock-templates.xml">Download</a></td>
    </tr>
</table>

Enter the prefix (`is`, `ju`, `jm`) and the IDE will list all available templates in that category.  

The most commonly used Isis domain objects templates are also listed on the [Isis cheat sheet](resources/IsisCheatSheet.pdf).

### Installation

To install in IntelliJ, copy to the relevant `config/templates` directory, eg:

* Windows `<User home>\.IntelliJIdea13\config\templates`
* Linux `~/.IntelliJIdea13/config/templates`
* Mac OS `~/Library/Preferences/IntelliJIdea13/templates`

To install in Eclipse, go to `Windows > Preferences > Java > Editor > Templates` and choose `Import`.

