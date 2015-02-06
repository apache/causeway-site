Title: @DomainServiceLayout (1.8.0-SNAPSHOT)

The `@DomainServiceLayout` annotation applies to domain services, collecting together all view layout semantics
within a single annotation.

* `named` - name of this class (overriding the name derived from its name in code)

* `menuBar` - the menubar in which the menu that holds this service's actions should reside.

* `menuOrder` - the order of the service's menu with respect to other service's (equivalent to deprecated `@DomainService#menuBar()`).

The `menuBar` can be set to PRIMARY, SECONDARY or TERTIARY.  In the Wicket viewer the PRIMARY menu bar is left-aligned,
the SECONDARY menu bar is right aligned, and the TERTIARY menu bar is associated with the user's name (far top-right).

## See also

Other domain semantics:

* [@Property](./Property.html)
* [@Collection](./Collection.html)
* [@Action](./Action.html)
* [@Parameter](./Parameter.html)
* [@DomainObject](./DomainObject.html)
* [@DomainService](./DomainService.html)
* [@ViewModel](./ViewModel.html)

Corresponding view layer ("Layout") annotation:

* [@DomainServiceLayout](./DomainServiceLayout.html)

