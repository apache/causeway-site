Title: Release Matrix

{release-matrix

As of 1.8.0, all components are incorporated into Isis core.  The only dependency is that the [simpleapp archetype](intro/getting-started/simpleapp-archetype.html) depends on core.

Prior to 1.8.0, one or more of the components were released separately to core.  The table below details those dependencies, but in summary:
* in 1.7.0, the Wicket viewer depended on Core 1.7.0 (and all other components were bundled into Core)
* in 1.6.0, the Wicket viewer depended on Core 1.6.0 (and all other components were bundled into Core)
* in 1.5.0 and earlier, the Wicket viewer, Restful Objects viewer, Shiro security and JDO ObjectStore all depended on Core 1.5.0.

In more detail:

<table  class="table table-striped table-bordered table-condensed">
<tr class="heading">
    <th>&nbsp;</th>
    <th>&nbsp;</th>
    <th><br/>ver.</th>
    <td><br/>rel. date</td>
    <th><br/>Core</th>
    <th>Shiro<br/>Security</th>
    <th>File<br/>Security</th>
    <th>JDO<br/>Objectstore</th>
    <th>Restful<br/>Viewer</th>
    <th>Wicket<br/>Viewer</th>
</tr>
<tr>
    <th class="heading"><a href="core/about.html">Core</a></th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.7.0</th>
    <td class="heading">2014-10-18</td>
    <td>-</td>
    <td>(incorporates)</td>
    <td>(mothballed)</td>
    <td>(incorporates)</td>
    <td>(incorporates)</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.6.0</th>
    <td class="heading">2014-07-25</td>
    <td>-</td>
    <td>(incorporates)</td>
    <td>(mothballed)</td>
    <td>(incorporates)</td>
    <td>(incorporates)</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.5.0</th>
    <td class="heading">2014-06-08</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.4.0</th>
    <td class="heading">2014-03-11</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.3.0</th>
    <td class="heading">2013-10-25</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.2.0</th>
    <td class="heading">2013-05-31</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.1.0</th>
    <td class="heading">2013-01-31</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.0.0</th>
    <td class="heading">2013-01-10</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">Security</th>
    <th class="heading"><a href="components/security/file/about.html">File</a></th>
    <th class="heading">1.4.0</th>
    <td class="heading">2014-03-11</td>
    <td>1.4.0</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.0.1</th>
    <td class="heading">2013-05-31</td>
    <td>1.2.0</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.0.0</th>
    <td class="heading">2012-12-24</td>
    <td>1.0.0</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading"><a href="components/security/shiro/about.html">Shiro</a></th>
    <th class="heading">1.5.0</th>
    <td class="heading">2014-06-08</td>
    <td>1.5.0</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.4.0</th>
    <td class="heading">2014-03-11</td>
    <td>1.4.0</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.3.0</th>
    <td class="heading">2013-10-25</td>
    <td>1.3.0</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.1.1</th>
    <td class="heading">2013-05-31</td>
    <td>1.2.0</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.1.0</th>
    <td class="heading">2013-01-31</td>
    <td>1.1.0</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.0.0</th>
    <td class="heading">2012-12-24</td>
    <td>1.0.0</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">Objectstore</th>
    <th class="heading"><a href="components/objectstores/jdo/about.html">JDO</a></th>
    <th class="heading">1.5.0</th>
    <td class="heading">2014-06-08</td>
    <td>1.5.0</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.4.1</th>
    <td class="heading">2014-03-14</td>
    <td>1.4.0</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.4.0</th>
    <td class="heading">2014-03-11</td>
    <td>1.3.0</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.3.0</th>
    <td class="heading">2013-10-25</td>
    <td>1.3.0</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.1.0</th>
    <td class="heading">2013-01-31</td>
    <td>1.2.0</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.0.0</th>
    <td class="heading">2012-12-24</td>
    <td>1.0.0</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">Viewer</th>
    <th class="heading"><a href="components/viewers/wicket/about.html">Wicket</a></th>
    <th class="heading">1.7.0</th>
    <td class="heading">2014-10-18</td>
    <td>1.7.0</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.6.0</th>
    <td class="heading">2014-07-25</td>
    <td>1.6.0</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.5.0</th>
    <td class="heading">2014-06-08</td>
    <td>1.5.0</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.4.1</th>
    <td class="heading">2014-03-14</td>
    <td>1.4.0</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.4.0</th>
    <td class="heading">2014-03-11</td>
    <td>1.4.0</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.3.1</th>
    <td class="heading">2013-11-07</td>
    <td>1.3.0</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.3.0</th>
    <td class="heading">2013-10-25</td>
    <td>1.3.0</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.2.0</th>
    <td class="heading">2013-05-31</td>
    <td>1.2.0</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.1.0</th>
    <td class="heading">2013-01-31</td>
    <td>1.1.0</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.0.0</th>
    <td class="heading">2012-12-24</td>
    <td>1.0.0</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading"><a href="components/viewers/restfulobjects/about.html">Restful</a></th>
    <th class="heading">2.3.0</th>
    <td class="heading">2014-06-08</td>
    <td>1.5.0</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">2.2.0</th>
    <td class="heading">2014-03-11</td>
    <td>1.4.0</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">2.1.0</th>
    <td class="heading">2013-10-25</td>
    <td>1.3.0</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">2.0.0</th>
    <td class="heading">2013-05-31</td>
    <td>1.2.0</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.0.0</th>
    <td class="heading">2012-12-24</td>
    <td>1.0.0</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
</tr>
<tr>
    <th class="heading">Archetype</th>
    <th class="heading"><a href="intro/getting-started/simpleapp-archetype.html">SimpleApp</a></th>
    <th class="heading">1.7.0</th>
    <td class="heading">2014-10-18</td>
    <td>1.7.0</td>
    <td>(incorporates)</td>
    <td>-</td>
    <td>(incorporates)</td>
    <td>(incorporates)</td>
    <td>1.7.0</b></td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.6.0</th>
    <td class="heading">2014-07-25</td>
    <td>1.6.0</td>
    <td>(incorporates)</td>
    <td>-</td>
    <td>(incorporates)</td>
    <td>(incorporates)</td>
    <td>1.6.0</b></td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.5.0</th>
    <td class="heading">2014-06-08</td>
    <td>1.5.0</td>
    <td>1.5.0</td>
    <td>-</td>
    <td>1.5.0</td>
    <td>2.3.0</td>
    <td>1.5.0</b></td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.4.1</th>
    <td class="heading">2014-03-14</td>
    <td>1.4.0</td>
    <td>1.4.0</td>
    <td>-</td>
    <td>1.4.1</td>
    <td>2.2.0</td>
    <td>1.4.1</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.4.0</th>
    <td class="heading">2014-03-11</td>
    <td>1.4.0</td>
    <td>1.4.0</td>
    <td>-</td>
    <td>1.4.0</td>
    <td>2.2.0</td>
    <td>1.4.0</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.3.1</th>
    <td class="heading">2013-11-07</td>
    <td>1.3.0</td>
    <td>1.3.0</td>
    <td>-</td>
    <td>1.3.0</td>
    <td>2.1.0</td>
    <td>1.3.1</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.3.0</th>
    <td class="heading">2013-10-25</td>
    <td>1.3.0</td>
    <td>1.3.0</td>
    <td>-</td>
    <td>1.3.0</td>
    <td>2.1.0</td>
    <td>1.3.0</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading"><a href="intro/getting-started/todoapp-archetype.html">TodoApp</a></th>
    <th class="heading">1.7.0</th>
    <td class="heading">2014-10-18</td>
    <td>1.7.0</td>
    <td>(incorporates)</td>
    <td>-</td>
    <td>(incorporates)</td>
    <td>(incorporates)</td>
    <td>1.7.0</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.6.0</th>
    <td class="heading">2014-07-25</td>
    <td>1.6.0</td>
    <td>(incorporates)</td>
    <td>-</td>
    <td>(incorporates)</td>
    <td>(incorporates)</td>
    <td>1.6.0</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.5.0</th>
    <td class="heading">2014-06-08</td>
    <td>1.5.0</td>
    <td>1.5.0</td>
    <td>-</td>
    <td>1.5.0</td>
    <td>2.3.0</td>
    <td>1.5.0</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.4.1</th>
    <td class="heading">2014-03-14</td>
    <td>1.4.0</td>
    <td>1.4.0</td>
    <td>-</td>
    <td>1.4.1</td>
    <td>2.2.0</td>
    <td>1.4.1</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.4.0</th>
    <td class="heading">2014-03-11</td>
    <td>1.4.0</td>
    <td>1.4.0</td>
    <td>-</td>
    <td>1.4.0</td>
    <td>2.2.0</td>
    <td>1.4.0</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.3.1</th>
    <td class="heading">2013-11-07</td>
    <td>1.3.0</td>
    <td>1.3.0</td>
    <td>-</td>
    <td>1.3.0</td>
    <td>2.1.0</td>
    <td>1.3.1</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.3.0</th>
    <td class="heading">2013-10-25</td>
    <td>1.3.0</td>
    <td>1.3.0</td>
    <td>-</td>
    <td>1.3.0</td>
    <td>2.1.0</td>
    <td>1.3.0</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.0.3</th>
    <td class="heading">2013-05-31</td>
    <td>1.2.0</td>
    <td>1.1.1</td>
    <td>-</td>
    <td>1.1.0</td>
    <td>2.0.0</td>
    <td>1.2.0</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.0.2</th>
    <td class="heading">2013-01-31</td>
    <td>1.1.0</td>
    <td>1.1.0</td>
    <td>-</td>
    <td>1.0.0</td>
    <td>1.0.0</td>
    <td>1.1.0</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.0.1</th>
    <td class="heading">2013-01-10</td>
    <td>1.0.0</td>
    <td>1.0.0</td>
    <td>-</td>
    <td>1.0.0</td>
    <td>1.0.0</td>
    <td>1.0.0</td>
</tr>
<tr>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">1.0.0</th>
    <td class="heading">2012-12-24</td>
    <td>1.0.0</td>
    <td>-</td>
    <td>1.0.0</td>
    <td>1.0.0</td>
    <td>1.0.0</td>
    <td>1.0.0</td>
</tr>
</table>

}
