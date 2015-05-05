Title: Application menu layout (1.8.0)

[//]: # (content copied to _user-guide_xxx)

The actions of domain services are made available as an application menu bar.  By default each domain service
corresponds to a single menu on this menu bar, with its actions as the drop-down menu items.  This is rarely exactly
what is required, however.  The `@MemberOrder` and `@DomainServiceLayout` annotations can be used to rearrange the
placement of menu items.

The screenshots below are taken from [Estatio](http://github.com/estatio/estatio), and open source estate management
application built using Apache Isis.

## @DomainServiceLayout

Menus for domain services can be placed either on a primary, secondary or tertiary menu bar.

<img src="images/application-menu-layout-menus.png" width="800"></img>

Within a single top-level menu (eg "Fixed Assets") there can be actions from multiple services.  The Wicket viewer
automatically adds a divider between each:

<img src="images/application-menu-dividers.png" width="300"></img>

In the example above the top-level menu combines the actions from the `Properties`, `Units` and `FixedAssetRegistrations`
services.  The `Properties` service is annotated:

    @DomainServiceLayout(
            named="Fixed Assets",
            menuBar = DomainServiceLayout.MenuBar.PRIMARY,
            menuOrder = "10.1"
    )
    public class Properties ... { ... }

while the `Units` service is annotated:

    @DomainServiceLayout(
            named="Fixed Assets",
            menuBar = DomainServiceLayout.MenuBar.PRIMARY,
            menuOrder = "10.2"
    )
    public class Units ... { ... }

and similarly `FixedAssetRegistrations` is annotated:

    @DomainServiceLayout(
            named="Fixed Assets",
            menuBar = DomainServiceLayout.MenuBar.PRIMARY,
            menuOrder = "10.3"
    )
    public class FixedAssetRegistrations ... { ... }

Note that in all three cases the value of the `named` attribute and the `menuBar` attribute is the same: "Fixed Assets"
and PRIMARY.  This means that all will appear on a "Fixed Assets" menu in the primary menu bar.

Meanwhile the value of `menuOrder` attribute is significant for two reasons:

* first, for these three services on the same ("Fixed Assets") top-level menu, it determines the relative order of their
  sections (`Properties` first, then `Units`, then `FixedAssetRegistrations`)
* second, it determines the placement of the top-level menu itself ("Fixed Assets") with respect to other top-level
  menus on the menu bar.

To illustrate this latter point, the next top-level menu on the menu bar, "Parties", is placed after "Fixed Assets"
 because the `menuOrder` of the first of its domain services, namely the `Parties` service, is higher than that for
 "Fixed Assets":

    @DomainServiceLayout(
            named="Parties",
            menuBar = DomainServiceLayout.MenuBar.PRIMARY,
            menuOrder = "20.1"
    )
    public class Parties ... { ... }

Note that only the `menuOrder` of the *first* domain service is significant in placing the menus along the menu bar;
thereafter the purpose of the `menuOrder` is to order the menu services sections on the menu itself.

## Ordering of a service's actions within a menu

For a given service, the actions within a section on a menu is determined by the `@MemberOrder` annotation.  Thus, for
the `Units` domain service, its actions are annotated:

    public class Units extends EstatioDomainService<Unit> {

        @MemberOrder(sequence = "1")
        public Unit newUnit( ... ) { ... }

        @MemberOrder(sequence = "2")
        public List<Unit> findUnits( ... ) { ... }

        @ActionLayout( prototype = true )
        @MemberOrder(sequence = "99")
        public List<Unit> allUnits() { ... }
        ...
    }

Note that the last is also a prototype action (meaning it is only displayed in SERVER_PROTOTYPE (=Wicket Development) mode).
In the UI it is rendered in italics.

(It is possible to override this place of a given action by specifying `@MemberOrder(name="...")` where the name is
that of a top-level menu.  Prior to 1.8.0 this was the only way of doing things, as of 1.8.0 its use
is not recommended).

## Tertiary menubar

The tertiary menu bar consists of a single unnamed menu, rendered underneath the user's login, top right.  This is
intended primarily for actions pertaining to the user themselves, eg their account, profile or settings:

<img src="images/application-menu-tertiary.png" width="200"></img>

Domain services' actions can be associated with the tertiary menu using the same `@DomainServiceLayout` annotation.  For
example, the `updateEpochDate(...)` and `listAllSettings(...)` actions come from the following service:

    @DomainServiceLayout(
            menuBar = DomainServiceLayout.MenuBar.TERTIARY,
            menuOrder = "10.1"
    )
    public class EstatioAdministrationService ... {

        @MemberOrder(sequence = "1")
        public void updateEpochDate( ... ) { ... }

        @MemberOrder(sequence = "2")
        public List<ApplicationSetting> listAllSettings() { ... }
        ...
    }

Because the number of items on the tertiary menu is expected to be small and most will pertain to the current user, the
viewer does *not* place dividers between actions from different services on the tertiary menu.

## Isis Add-on modules

Some of the Isis add-ons modules also provide services whose actions appear in top-level menus.

The [security](http://github.com/isisaddons/isis-module-security)'s module places its domain service menus in three
top-level menus:

* its `ApplicationUsers`, `ApplicationRoles`, `ApplicationPermission`, `ApplicationFeatureViewModels` and
  `ApplicationTenancies` domain services are all grouped together in a single "Security" top-level menu, on the
  SECONDARY menu bar

* its `SecurityModuleAppFixturesService` domain service, which allows the security modules' fixture scripts to be run,
  is placed on a "Prototyping" top-level menu, also on the SECONDARY menu bar

* its `MeService` domain service, which provides the `me()` action, is placed on the TERTIARY menu bar.

Meanwhile the [devutils](http://github.com/isisaddons/isis-module-devutils) module places its actions - to download layouts and
so forth - on a "Prototyping" top-level menu, on the SECONDARY menu bar.


Currently there is no facility to alter the placement of these services.  However, their UI can be suppressed <!--either-->
using security<!-- or (more sophisticatedly) a [vetoing subscriber](../../../more-advanced-topics/vetoing-subscriber.html)-->.


