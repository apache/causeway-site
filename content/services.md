Title: Applib Services and Implementations

{domain-services




<table  class="table table-striped table-bordered table-condensed">
<tr class="heading">
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading span2">Implementation</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
    <th class="heading">&nbsp;</th>
</tr>
<tr class="heading">
    <th class="heading">&nbsp;</th>
    <th class="heading">API</th>
    <th class="heading">Maven Module</th>
    <th class="heading">Class</th>
    <th class="heading">@DomainService?</th>
    <th class="heading">@RequestScoped?</th>
    <th class="heading">Depends on</th>
    <th class="heading">Notes</th>
</tr>
<tr>
    <th class="heading">isis-core-xxx</th>
    <th class="heading">o.a.i.applib.services.classdiscovery<br/>ClassDiscoveryService</th>
    <td>isis-core-applib</td>
    <td>ClassDiscoveryServiceUsingReflections</td>
    <td>No; register in isis.properties</td>
    <td>No</td>
    <td></td>
    <td>requires org.reflections as dependency</td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.command<br/>CommandContext</th>
    <td>isis-core-applib</td>
    <td>CommandContext</td>
    <td>Yes; auto-registered</td>
    <td>Yes</td>
    <td></td>
    <td>API is also a concrete class</td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.annotation<br/>Bulk.InteractionContext</th>
    <td>isis-core-applib</td>
    <td>Bulk.InteractionContext</td>
    <td>Yes; auto-registered</td>
    <td>Yes</td>
    <td></td>
    <td>API is also a concrete class</td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.queryresultscache<br/>QueryResultsCache</th>
    <td>isis-core-applib</td>
    <td>QueryResultsCache</td>
    <td>Yes; auto-registered</td>
    <td>Yes</td>
    <td></td>
    <td>API is also a concrete class</td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.scratchpad<br/>Scratchpad</th>
    <td>isis-core-applib</td>
    <td>Scratchpad</td>
    <td>Yes; auto-registered</td>
    <td>Yes</td>
    <td></td>
    <td>API is also a concrete class</td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.exceprecog<br/>ExceptionRecognizer</th>
    <td>isis-core-applib</td>
    <td>ExceptionRecognizerCompositeForJdoObjectStore</td>
    <td>No; register in isis.properties</td>
    <td></td>
    <td></td>
    <td>Extensible using composite pattern if required</td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib<br/>DomainObjectContainer</th>
    <td>isis-core-metamodel</td>
    <td>DomainObjectContainerDefault</td>
    <td>No, but automatically registered as a 'special case'</td>
    <td></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.bookmark<br/>BookmarkService</th>
    <td>isis-core-metamodel</td>
    <td>BookmarkServiceDefault</td>
    <td>Yes; auto-registered</td>
    <td></td>
    <td></td>
    <td>related service: BookmarkHolderActionContributions, BookmarkHolderAssociationContributions</td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.background<br/>BackgroundService</th>
    <td>isis-core-runtime</td>
    <td>BackgroundServiceDefault</td>
    <td>No; register in isis.properties</td>
    <td></td>
    <td></td>
    <td>Not automatically registered because of its dependencies</td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.memento<br/>MementoService</th>
    <td>isis-core-runtime</td>
    <td>MementoServiceDefault</td>
    <td>Yes; auto-registered</td>
    <td></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.xmlsnapshot<br/>XmlSnapshotService</th>
    <td>isis-core-runtime</td>
    <td>XmlSnapshotServiceDefault</td>
    <td>Yes; auto-registered</td>
    <td></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.eventbus<br/>EventBusService</th>
    <td>isis-core-objectstore-jdo-datanucleus</td>
    <td>EventBusServiceJdo</td>
    <td>Yes; auto-registered</td>
    <td></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.jdosupport<br/>IsisJdoSupport</th>
    <td>isis-core-objectstore-jdo-datanucleus</td>
    <td>IsisJdoSupportImpl</td>
    <td>Yes; auto-registered</td>
    <td></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <th class="heading">isis-module-xxx</th>
    <th class="heading">o.a.i.applib.services.audit<br/>AuditingService3</th>
    <td>isis-module-audit-jdo</td>
    <td>AuditingServiceJdo</td>
    <td>No, but see notes</td>
    <td></td>
    <td></td>
    <td>AuditingServiceJdoContributions, AuditingServiceJdoRepository (@DomainService)</td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.command.spi<br/>CommandService</th>
    <td>isis-module-command-jdo</td>
    <td>CommandServiceJdo</td>
    <td>Yes; auto-registered</td>
    <td></td>
    <td></td>
    <td>related services: CommandServiceJdoContributions, CommandServiceJdoRepository (@DomainService)
</td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.background<br/>BackgroundCommandService</th>
    <td>isis-module-command-jdo</td>
    <td>BackgroundCommandServiceJdo</td>
    <td>Yes; auto-registered</td>
    <td></td>
    <td></td>
    <td>related services: BackgroundCommandServiceJdoContributions, BackgroundCommandServiceJdoRepository (@DomainService)</td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.wrapper<br/>WrapperFactory</th>
    <td>isis-module-wrapper</td>
    <td>WrapperFactoryDefault</td>
    <td>Yes; auto-registered</td>
    <td></td>
    <td></td>
    <td></td>
</tr>

<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.publish<br/>PublishingService</th>
    <td>isis-module-publishing-jdo</td>
    <td>PublishingServiceJdo</td>
    <td></td>
    <td></td>
    <td></td>
    <td>related services: PublishingServiceJdoContributions, PublishingServiceJdoRepository (@DomainService)</td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.publish<br/>EventSerializer</th>
    <td>isis-module-publishingeventserializer-ro</td>
    <td>RestfulObjectsSpecEventSerializer</td>
    <td>Yes; auto-registered</td>
    <td></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <th class="heading">Other</th>
    <th class="heading">o.a.i.applib.services.devutils<br/>DeveloperUtilitiesService</th>
    <td>isis-module-devutils</td>
    <td>DeveloperUtilitiesServiceDefault</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.settings<br/>ApplicationSettingsServiceRW</th>
    <td>isis-module-settings</td>
    <td>ApplicationSettingsServiceJdo</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <th>&nbsp;</th>
    <th class="heading">o.a.i.applib.services.settings<br/>UserSettingsServiceRW</th>
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
