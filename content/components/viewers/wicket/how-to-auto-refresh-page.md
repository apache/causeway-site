title: How to auto-refresh an (entity) page (1.8.0)

[//]: # (content copied to _user-guide_xxx)

This requirement from the users mailing list:

_Suppose you want to build a monitoring application, eg for an electricity grid.  Data is updated in the background (eg via the
Restful Objects REST API)... what is needed is the ability to show an entity that includes a [map](http://github.com/isisaddons/isis-wicket-gmap3), and have it auto-refresh every 5 seconds or so._

First, update the domain object to return custom CSS:

    public class MyDomainObject {
        ...
        public String cssClass() {return "my-special-auto-updating-entity"; }
        ...
    }

Then, use javascript in `webapp/src/main/webapp/scripts/application.js` to reload:

    $(function() {
        if ($(".my-special-auto-updating-entity").length) {
            setTimeout(function() {document.location.reload();}, 5000); // 1000 is 5 sec
        }
    });

