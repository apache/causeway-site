Title: Applib Services and Implementations

{domain-services


<table  class="table table-striped table-bordered table-condensed">
<tr class="heading">
    <th class="heading">&nbsp;</th>
    <th class="heading">API</th>
    <th class="heading">Impl'n<br/>Maven Module</th>
    <th class="heading">Impl'n<br/>Class</th>
    <th class="heading">@DomainService?</th>
    <th class="heading">Notes</th>
</tr>
<tr>
    <th class="heading">isis-core-xxx</th>
    <th class="heading">o.a.i.applib<br/>DomainObjectContainer</th>
    <td>isis-core-metamodel</td>
    <td>DomainObjectContainerDefault</td>
    <td>No, but automatically registered as a 'special case'</td>
    <td></td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.clock<br/>ClockService</th>
    <td>isis-core-applib</td>
    <td>ClockService</td>
    <td>Yes; auto-registered</td>
    <td>API is also a concrete class.</td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.command<br/>CommandContext</th>
    <td>isis-core-applib</td>
    <td>CommandContext</td>
    <td>Yes; auto-registered</td>
    <td>API is also a concrete class.  Command impl depends on configured CommandService</td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.annotation<br/>Bulk.InteractionContext</th>
    <td>isis-core-applib</td>
    <td>Bulk.InteractionContext</td>
    <td>Yes; auto-registered</td>
    <td>API is also a concrete class</td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.queryresultscache<br/>QueryResultsCache</th>
    <td>isis-core-applib</td>
    <td>QueryResultsCache</td>
    <td>Yes; auto-registered</td>
    <td>API is also a concrete class</td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.scratchpad<br/>Scratchpad</th>
    <td>isis-core-applib</td>
    <td>Scratchpad</td>
    <td>Yes; auto-registered</td>
    <td>API is also a concrete class</td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.exceprecog<br/>ExceptionRecognizer</th>
    <td>isis-core-applib</td>
    <td>ExceptionRecognizerComposite<br/>ForJdoObjectStore</td>
    <td>No; register in isis.properties</td>
    <td>Extensible using composite pattern if required</td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.fixturescripts<br/>FixtureScripts</th>
    <td>isis-core-applib</td>
    <td>(abstract class)</td>
    <td>No; register own subclass in isis.properties</td>
    <td>depends on:<br/>ClassDiscoveryService</td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.classdiscovery<br/>ClassDiscoveryService</th>
    <td>isis-core-applib</td>
    <td>ClassDiscoveryService<br/>UsingReflections</td>
    <td>No; register in isis.properties</td>
    <td>requires org.reflections:reflections as Maven dependency</td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.bookmark<br/>BookmarkService</th>
    <td>isis-core-metamodel</td>
    <td>BookmarkServiceDefault</td>
    <td>Yes; auto-registered</td>
    <td>related services: BookmarkHolderActionContributions, BookmarkHolderAssociationContributions</td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.memento<br/>MementoService</th>
    <td>isis-core-runtime</td>
    <td>MementoServiceDefault</td>
    <td>Yes; auto-registered</td>
    <td></td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.xmlsnapshot<br/>XmlSnapshotService</th>
    <td>isis-core-runtime</td>
    <td>XmlSnapshotServiceDefault</td>
    <td>Yes; auto-registered</td>
    <td></td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.eventbus<br/>EventBusService</th>
    <td>isis-core-objectstore-jdo-datanucleus</td>
    <td>EventBusServiceJdo</td>
    <td>Yes; auto-registered</td>
    <td></td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.jdosupport<br/>IsisJdoSupport</th>
    <td>isis-core-objectstore-jdo-datanucleus</td>
    <td>IsisJdoSupportImpl</td>
    <td>Yes; auto-registered</td>
    <td></td>
</tr>
<tr>
    <th class="heading">isis-module-xxx</th>
    <th class="heading">o.a.i.applib.services.audit<br/>AuditingService3</th>
    <td>isis-module-audit-jdo</td>
    <td>AuditingServiceJdo</td>
    <td>Yes; auto-registered</td>
    <td>related services: AuditingServiceJdoContributions (UI so register if req'd), AuditingServiceJdoRepository (auto-registered)</td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.command.spi<br/>CommandService</th>
    <td>isis-module-command-jdo</td>
    <td>CommandServiceJdo</td>
    <td>Yes; auto-registered</td>
    <td>related services: CommandServiceJdoContributions (UI so register if req'd), CommandServiceJdoRepository (auto-registered)</td>
</td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.background<br/>BackgroundCommandService</th>
    <td>isis-module-command-jdo</td>
    <td>BackgroundCommandServiceJdo</td>
    <td>Yes; auto-registered</td>
    <td>related services: BackgroundCommandServiceJdoContributions (UI so register if req'd), BackgroundCommandServiceJdoRepository (auto-registered)</td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.background<br/>BackgroundService</th>
    <td>isis-module-background</td>
    <td>BackgroundServiceDefault</td>
    <td>Yes; auto-registered</td>
    <td>Depends on: BackgroundCommandService</td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.wrapper<br/>WrapperFactory</th>
    <td>isis-module-wrapper</td>
    <td>WrapperFactoryDefault</td>
    <td>Yes; auto-registered</td>
    <td></td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.publish<br/>PublishingService</th>
    <td>isis-module-publishing-jdo</td>
    <td>PublishingServiceJdo</td>
    <td>Yes; auto-registered</td>
    <td>related services: PublishingServiceJdoContributions (UI so register if req'd), PublishingServiceJdoRepository (auto-registered); <br/>depends on: EventSerializer</td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.publish<br/>EventSerializer</th>
    <td>isis-module-publishingeventserializer-ro</td>
    <td>RestfulObjectsSpecEventSerializer</td>
    <td>Yes; auto-registered</td>
    <td></td>
</tr>
<tr>
    <th class="heading">Other</th>
    <th class="heading">o.a.i.applib.services.devutils<br/>DeveloperUtilitiesService</th>
    <td>isis-module-devutils</td>
    <td>DeveloperUtilitiesServiceDefault</td>
    <td>No; register in isis.properties</td>
    <td>Not auto-registered since provides UI and may wish to subclass</td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.settings<br/>ApplicationSettingsServiceRW</th>
    <td>isis-module-settings</td>
    <td>ApplicationSettingsServiceJdo</td>
    <td>No; register in isis.properties</td>
    <td>Not auto-registered since provides UI and may wish to subclass</td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.settings<br/>UserSettingsServiceRW</th>
    <td>isis-module-settings</td>
    <td>UserSettingsServiceJdo</td>
    <td>No; register in isis.properties</td>
    <td>Not auto-registered since provides UI and may wish to subclass</td>
</tr>
</table>
    
  
}
