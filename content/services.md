Title: Applib Services and Implementations

{domain-services




<table  class="table table-striped table-bordered table-condensed">
<tr class="heading">
    <th class="heading">&nbsp;</th>
    <th class="heading" span="2">Implementation</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
</tr>
<tr class="heading">
    <th class="heading">API</th>
    <th class="heading">Maven Module</th>
    <th class="heading">Class</th>
    <th class="heading">@DomainService ?</th>
    <th class="heading">@RequestScoped ?</th>
    <th class="heading">Depends on</th>
    <th class="heading">Notes</th>
</tr>
<tr class="heading">
    <th class="heading" span="7">Core Implementations of Applib Services</th>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.classdiscovery.ClassDiscoveryService</th>
    <td>isis-core-applib</td>
    <td>ClassDiscoveryServiceUsingReflections</td>
    <td>No; register in isis.properties</td>
    <td>No</td>
    <td></td>
    <td>requires org.reflections as dependency</td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.command.CommandContext</th>
    <td>isis-core-applib</td>
    <td>CommandContext</td>
    <td>Yes; auto-registered</td>
    <td>Yes</td>
    <td></td>
    <td>API is also a concrete class</td>
</tr>
<tr>
    <th class="heading">org.apache.isis.applib.annotation.Bulk.InteractionContext</th>
    <td>isis-core-applib</td>
    <td>Bulk.InteractionContext</td>
    <td>Yes; auto-registered</td>
    <td>Yes</td>
    <td></td>
    <td>API is also a concrete class</td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.queryresultscache.QueryResultsCache</th>
    <td>isis-core-applib</td>
    <td>QueryResultsCache</td>
    <td>Yes; auto-registered</td>
    <td>Yes</td>
    <td></td>
    <td>API is also a concrete class</td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.scratchpad.Scratchpad</th>
    <td>isis-core-applib</td>
    <td>Scratchpad</td>
    <td>Yes; auto-registered</td>
    <td>Yes</td>
    <td></td>
    <td>API is also a concrete class</td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.exceprecog.ExceptionRecognizer</th>
    <td>isis-core-applib</td>
    <td>ExceptionRecognizerCompositeForJdoObjectStore</td>
    <td>No; register in isis.properties</td>
    <td></td>
    <td></td>
    <td>Extensible using composite pattern if required</td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.DomainObjectContainer</th>
    <td>isis-core-metamodel</td>
    <td>DomainObjectContainerDefault</td>
    <td>No, but automatically registered as a 'special case'</td>
    <td></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.bookmark.BookmarkService</th>
    <td>isis-core-metamodel</td>
    <td>BookmarkServiceDefault</td>
    <td>Yes; auto-registered</td>
    <td></td>
    <td></td>
    <td>related service: BookmarkHolderActionContributions, BookmarkHolderAssociationContributions</td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.background.BackgroundService</th>
    <td>isis-core-runtime</td>
    <td>BackgroundServiceDefault</td>
    <td>No; register in isis.properties</td>
    <td></td>
    <td></td>
    <td>Not automatically registered because of its dependencies</td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.memento.MementoService</th>
    <td>isis-core-runtime</td>
    <td>MementoServiceDefault</td>
    <td>Yes; auto-registered</td>
    <td></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.xmlsnapshot.XmlSnapshotService</th>
    <td>isis-core-runtime</td>
    <td>XmlSnapshotServiceDefault</td>
    <td>Yes; auto-registered</td>
    <td></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.eventbus.EventBusService</th>
    <td>isis-core-objectstore-jdo-datanucleus</td>
    <td>EventBusServiceJdo</td>
    <td>Yes; auto-registered</td>
    <td></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.jdosupport.IsisJdoSupport</th>
    <td>isis-core-objectstore-jdo-datanucleus</td>
    <td>IsisJdoSupportImpl</td>
    <td>Yes; auto-registered</td>
    <td></td>
    <td></td>
    <td></td>
</tr>
<tr class="heading">
    <th class="heading" span="7">Module Implementations of Applib services</th>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.audit.AuditingService3</th>
    <td>isis-module-audit-jdo</td>
    <td>AuditingServiceJdo</td>
    <td>No, but see notes</td>
    <td></td>
    <td></td>
    <td>AuditingServiceJdoContributions, AuditingServiceJdoRepository (@DomainService)</td>
</tr>


<tr>
    <th class="heading">o.a.i.applib.services.command.spi.CommandService</th>
    <td>isis-module-command-jdo</td>
    <td>CommandServiceJdo</td>
    <td>Yes; auto-registered</td>
    <td></td>
    <td></td>
    <td>related services: CommandServiceJdoContributions, CommandServiceJdoRepository (@DomainService)
</td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.background.BackgroundCommandService</th>
    <td>isis-module-command-jdo</td>
    <td>BackgroundCommandServiceJdo</td>
    <td>Yes; auto-registered</td>
    <td></td>
    <td></td>
    <td>related services: BackgroundCommandServiceJdoContributions, BackgroundCommandServiceJdoRepository (@DomainService)</td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.wrapper.WrapperFactory</th>
    <td>isis-module-wrapper</td>
    <td>WrapperFactoryDefault</td>
    <td>Yes; auto-registered</td>
    <td></td>
    <td></td>
    <td></td>
</tr>

<tr>
    <th class="heading">o.a.i.applib.services.publish.PublishingService</th>
    <td>isis-module-publishing-jdo</td>
    <td>PublishingServiceJdo</td>
    <td></td>
    <td></td>
    <td></td>
    <td>related services: PublishingServiceJdoContributions, PublishingServiceJdoRepository (@DomainService)</td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.publish.EventSerializer</th>
    <td>isis-module-publishingeventserializer-ro</td>
    <td>RestfulObjectsSpecEventSerializer</td>
    <td>Yes; auto-registered</td>
    <td></td>
    <td></td>
    <td></td>
</tr>
<tr class="heading">
    <th class="heading" span="7">Other Module (self-contained with own applib)</th>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.devutils.DeveloperUtilitiesService</th>
    <td>isis-module-devutils</td>
    <td>DeveloperUtilitiesServiceDefault</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.settings.ApplicationSettingsServiceRW</th>
    <td>isis-module-settings</td>
    <td>ApplicationSettingsServiceJdo</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <th class="heading">o.a.i.applib.services.settings.UserSettingsServiceRW</th>
    <td>isis-module-settings</td>
    <td>UserSettingsServiceJdo</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
</tr>
</table>
    

isis-core-applib

* (abstract)o.a.i.applib.fixturescripts.FixtureScripts ... requires ClassDiscoveryService


    
isis-module-background

* (empty, placeholder) 




}
