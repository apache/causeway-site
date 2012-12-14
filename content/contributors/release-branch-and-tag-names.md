Title: Release Branch and Tag Names

As described in the [release process](release-process.html) documentation, each release of core or a component is prepared in a separate branch, and ultimately results in a tag in the central repo.

In Isis the version numbers of core and each component can vary independently 
(they are not synchronized); therefore the branches and the tag names must 
distinguish the releasable module that they refer to.

Usefully, git allows the same name to be used for both branches and for tags; within git they are namespaced to be unique.  The table below shows the branch name to use when readying the release locally, and the tag name to use when running the `release:prepare` command itself; as you can see they are identical.  As we've chosen to base the branch/tag name on the `artifactId` of the pom of the parent module being released, they also happen to be the defaults provided by the `maven-release-plugin`:

<table>
<tr>
<th>Releasable module</th>
<th>Branch name to use while readying the release locally</th>
<th>Tag name pushed during <tt>release:prepare</tt></th>
</tr>
<tr><td>core</td><td>isis-x.y.z</td><td>isis-x.y.z</td></tr>
<tr><td>objectstore/xxx</td><td>isis-objectstore-xxx-x.y.z</td><td>isis-objectstore-xxx-x.y.z</td></tr>
<tr><td>profilestore/xxx</td><td>isis-profilestore-xxx-x.y.z</td><td>isis-profilestore-xxx-x.y.z</td></tr>
<tr><td>progmodel/xxx</td><td>isis-progmodel-xxx-x.y.z</td><td>isis-progmodel-xxx-x.y.z</td></tr>
<tr><td>security/xxx</td><td>isis-security-xxx-x.y.z</td><td>isis-security-xxx-x.y.z</td></tr>
<tr><td>viewer/xxx</td><td>isis-viewer-xxx-x.y.z</td><td>isis-viewer-xxx-x.y.z</td></tr>
</table>

where `xxx` represents a specific component or archetype being released.

