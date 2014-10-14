Title: Applib Services and Implementations

{domain-services

The services listed here are those whose API is defined in Isis applib.  In addition the [Isis addons](http://www.isisaddons.org) website lists a number of services (such as [security](http://github.com/isisaddons/isis-module-security) service or the [settings](http://github.com/isisaddons/isis-module-settings) service that are standalone)

<table  class="table table-striped table-bordered table-condensed">
<tr class="heading">
    <th class="heading">API</th>
    <th class="heading">Impl'n<br/>Maven Module</th>
    <th class="heading">Impl'n<br/>Class(es)</th>
    <th class="heading">@DomainService?</th>
    <th class="heading">Notes</th>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.audit<br/>AuditingService3</th>
    <td>g:org.isisaddons.module.audit<br/>a:isis-module-audit</td>
    <td>AuditingService</td>
    <td>Yes; auto-registered</td>
    <td>related services: AuditingServiceContributions, AuditingServiceRepository (@DomainService)</td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.background<br/>BackgroundCommandService</th>
    <td>g:org.isisaddons.module.command<br/>a:isis-module-command</td>
    <td>BackgroundCommandServiceJdo</td>
    <td>Yes; auto-registered</td>
    <td>related services: BackgroundCommandServiceJdoContributions, BackgroundCommandServiceJdoRepository (@DomainService)</td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.background<br/>BackgroundService</th>
    <td>g:org.apache.isis.core<br/>a:isis-core-runtime</td>
    <td>BackgroundServiceDefault</td>
    <td>Yes; auto-registered</td>
    <td>Depends on: BackgroundCommandService</td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.bookmark<br/>BookmarkService</th>
    <td>g:org.apache.isis.core<br/>a:isis-core-metamodel</td>
    <td>BookmarkServiceDefault</td>
    <td>Yes; auto-registered</td>
    <td>related services: BookmarkHolderActionContributions, BookmarkHolderAssociationContributions</td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.annotation<br/>Bulk.InteractionContext</th>
    <td>g:org.apache.isis.core<br/>a:isis-core-applib</td>
    <td>Bulk.InteractionContext</td>
    <td>Yes; auto-registered</td>
    <td>API is also a concrete class</td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.classdiscovery<br/>ClassDiscoveryService</th>
    <td>g:org.apache.isis.core<br/>a:isis-core-applib</td>
    <td>ClassDiscoveryService<br/>UsingReflections</td>
    <td>Yes; auto-registered</td>
    <td>requires org.reflections:reflections as Maven dependency</td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.clock<br/>ClockService</th>
    <td>g:org.apache.isis.core<br/>a:isis-core-applib</td>
    <td>ClockService</td>
    <td>Yes; auto-registered</td>
    <td>API is also a concrete class.</td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.command<br/>CommandContext</th>
    <td>g:org.apache.isis.core<br/>a:isis-core-applib</td>
    <td>CommandContext</td>
    <td>Yes; auto-registered</td>
    <td>API is also a concrete class.  <br/>Depends on: CommandService for persistent <tt>Command</tt>, else in-memory impl. used</td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.command.spi<br/>CommandService</th>
    <td>g:org.isisaddons.module.command<br/>a:isis-module-command</td>
    <td>CommandServiceJdo</td>
    <td>Yes; auto-registered</td>
    <td>related services: CommandServiceJdoContributions, CommandServiceJdoRepository (@DomainService)</td>
</tr>
<tr>
    <th class="heading">o.a.i.applib<br/>DomainObjectContainer</th>
    <td>g:org.apache.isis.core<br/>a:isis-core-metamodel</td>
    <td>DomainObjectContainerDefault</td>
    <td>Yes; auto-registered</td>
    <td></td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.eventbus<br/>EventBusService</th>
    <td>g:org.apache.isis.core<br/>a:isis-core-objectstore-jdo-datanucleus</td>
    <td>EventBusServiceJdo</td>
    <td>Yes; auto-registered</td>
    <td></td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.exceprecog<br/>ExceptionRecognizer</th>
    <td>g:org.apache.isis.core<br/>a:isis-core-applib</td>
    <td>ExceptionRecognizerComposite<br/>ForJdoObjectStore</td>
    <td>No; register in isis.properties</td>
    <td>Extensible using composite pattern if required</td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.fixturescripts<br/>FixtureScripts</th>
    <td>g:org.apache.isis.core<br/>a:isis-core-applib</td>
    <td>(abstract class)</td>
    <td>No; subclass and either annotate with @DomainService or register in isis.properties</td>
    <td>depends on:<br/>ClassDiscoveryService</td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.jdosupport<br/>IsisJdoSupport</th>
    <td>g:org.apache.isis.core<br/>a:isis-core-objectstore-jdo-datanucleus</td>
    <td>IsisJdoSupportImpl</td>
    <td>Yes; auto-registered</td>
    <td></td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.memento<br/>MementoService</th>
    <td>g:org.apache.isis.core<br/>a:isis-core-runtime</td>
    <td>MementoServiceDefault</td>
    <td>Yes; auto-registered</td>
    <td>can replace by explicitly registering different implementation in isis.properties</td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.publish<br/>EventSerializer</th>
    <td>g:org.isisaddons.module.publishing<br/>a:isis-module-publishing</td>
    <td>RestfulObjectsSpecEventSerializer</td>
    <td>Yes; auto-registered</td>
    <td>can replace by explicitly registering different implementation in isis.properties</td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.publish<br/>PublishingService</th>
    <td>g:org.isisaddons.module.publishing<br/>a:isis-module-publishing</td>
    <td>PublishingService</td>
    <td>Yes; auto-registered</td>
    <td>related services: PublishingServiceContributions, PublishingServiceRepository (@DomainService); <br/>depends on: EventSerializer</td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.queryresultscache<br/>QueryResultsCache</th>
    <td>g:org.apache.isis.core<br/>a:isis-core-applib</td>
    <td>QueryResultsCache</td>
    <td>Yes; auto-registered</td>
    <td>API is also a concrete class</td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.scratchpad<br/>Scratchpad</th>
    <td>g:org.apache.isis.core<br/>a:isis-core-applib</td>
    <td>Scratchpad</td>
    <td>Yes; auto-registered</td>
    <td>API is also a concrete class</td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.wrapper<br/>WrapperFactory</th>
    <td>g:org.apache.isis.core<br/>a:isis-core-wrapper</td>
    <td>WrapperFactoryDefault</td>
    <td>Yes; auto-registered</td>
    <td></td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.xmlsnapshot<br/>XmlSnapshotService</th>
    <td>g:org.apache.isis.core<br/>a:isis-core-runtime</td>
    <td>XmlSnapshotServiceDefault</td>
    <td>Yes; auto-registered</td>
    <td></td>
</tr>
</table>
    
  
}
