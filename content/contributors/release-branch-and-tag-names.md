Title: Release Branch and Tag Names

As described in the [release process](release-process.html) documentation, each release of core or a component is prepared in a separate branch, and ultimately results in a tag in the central repo.

In Isis the version numbers of core and each component can vary independently 
(they are not synchronized); therefore the branches and the tag names must 
distinguish the releasable module that they refer to.

The following table suggests the branch name to use when readying the release locally, and the tag name to use when running the `release:prepare` command itself.  If the release is voted through, this tag will be the permanent identifier of the release within the git source code repository.

<table>
<tr>
<th>Releasable module</th>
<th>Branch name to use while readying the release locally</th>
<th>Tag name pushed during <tt>release:prepare</tt></th>
</tr>
<tr><td>core</td><td>prepare/core/x.y.z</td><td>release/core/x.y.z</td></tr>
<tr><td>objectstore/xxx</td><td>prepare/objectstore/xxx/x.y.z</td><td>release/objectstore/xxx/x.y.z</td></tr>
<tr><td>profilestore/xxx</td><td>prepare/profilestore/xxx/x.y.z</td><td>release/profilestore/xxx/x.y.z</td></tr>
<tr><td>progmodel/xxx</td><td>prepare/progmodel/xxx/x.y.z</td><td>release/progmodel/xxx/x.y.z</td></tr>
<tr><td>security/xxx</td><td>prepare/security/xxx/x.y.z</td><td>release/security/xxx/x.y.z</td></tr>
<tr><td>viewer/xxx</td><td>prepare/viewer/xxx/x.y.z</td><td>release/viewer/xxx/x.y.z</td></tr>
<tr><td>example/archetype/xxx</td><td>prepare/archetype/xxx/x.y.z</td><td>release/archetype/xxx/x.y.z</td></tr>
</table>

where `xxx` represents a specific component or archetype being released.

