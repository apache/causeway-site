How to use Isis' authorization manager
--------------------------------------

An alternative to hard-coding role names within the domain entities is
instead to configure an authorization manager. This is a component that
can either hide or disable access to class members (properties,
collections, actions).

The core "bypass" authorization manager simply provides access to all class members.

To enable a different authorization manager, update the
`isis.properties` file, for example:

    isis.authorization=file

Also update the `pom.xml` to reference this component, for example:

    <properties>
        ...
        <isis-security-file.version>1.0.1</isis-security-file.version>
    </properties>

    <dependencyManagement>
        <dependencies>
            ...
            <dependency>
                <groupId>org.apache.isis.security</groupId>
                <artifactId>isis-security-file</artifactId>
                <version>${isis-security-file.version}</version>
                <type>pom</type>
                <scope>import</scope>
            </dependency>
        </dependencies>
    </dependencyManagement>

    <dependencies>
        <dependency>
            <groupId>org.apache.isis.security</groupId>
            <artifactId>isis-security-file</artifactId>
        </dependency>
    </dependencies>

See the documentation for the chosen authorization manager as to how security information should be configured. For example, the file-based authorization manager reads from some configuration files alongside `isis.properties`.

