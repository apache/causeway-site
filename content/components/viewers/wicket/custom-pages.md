Title: Custom Pages

The Wicket viewer allows you to customize the GUI in several (progressively more sophisticated) ways:

* through CSS (see [here](./how-to-tweak-the-ui-using-css-classes.html))
* through Javascript snippets (eg JQuery) (see [here](./how-to-tweak-the-ui-using-javascript.html))
* by replacing elements of the page using the `ComponentFactory` interface (see [here](./customizing-the-viewer.html))
* by providing new pages (described below)

In the vast majority of cases customization should be sufficient by [replacing elements of a page](./customizing-the-viewer.html).  However, it is also possible to define an entirely new page for a given page type.

## Page Types

Isis defines eight page types (see the `org.apache.isis.viewer.wicket.model.models.PageType` enum):

<table class="table table-bordered table-hover">
  <tr>
      <th>
         Page type
      </th>
      <th>
         Renders
      </th>
  </tr>
  <tr>
      <th>
         SIGN_IN
      </th>
      <td>
         The initial sign-in page
      </td>
  </tr>
  <tr>
      <th>
         HOME
      </th>
      <td>
         The home page, displaying either the welcome message or dashboard
      </td>
  </tr>
  <tr>
      <th>
        ABOUT
      </th>
      <td>
        The about page, accessible from link top-right
      </td>
  </tr>
  <tr>
      <th>
        ENTITY
      </th>
      <td>
        Renders a single entity or view model
      </td>
  </tr>
  <tr>
      <th>
         STANDALONE_COLLECTION
      </th>
      <td>
        Page rendered after invoking an action that returns a collection of entites
      </td>
  </tr>
  <tr>
      <th>
        VALUE
      </th>
      <td>
        After invoking an action that returns a value type (though not URLs or Blob/Clobs, as these are handled appropriately automatically).
      </td>
  </tr>
  <tr>
      <th>
         VOID_RETURN
      </th>
      <td>
         After invoking an action that is `void`
      </td>
  </tr>
  <tr>
      <th>
        ACTION_PROMPT
      </th>
      <td>
         (No longer used).
      </td>
  </tr>
</table>





## `PageClassList` interface

The `PageClassList` interface declares which class (subclass of `org.apache.wicket.Page` is used to render for each of these types.  For example, Isis' `WicketSignInPage` renders the signin page.  To specify a different page class, create a custom subclass of `PageClassList`:

    @Singleton
    public class MyPageClassList extends PageClassListDefault {

        protected Class<? extends Page> getSignInPageClass() {
            return MySignInPage.class;
        }
    }

## Registering the Custom `PageClassList`

This updated `PageClassList` implementation is then registered by adjusting the Guice bindings (part of Isis' bootstrapping) in your custom subclass of `IsisWicketApplication`:

    public class MyAppApplication extends IsisWicketApplication {
        @Override
        protected Module newIsisWicketModule() {
            final Module isisDefaults = super.newIsisWicketModule();
            final Module myAppOverrides = new AbstractModule() {
                @Override
                protected void configure() {
                    ...
                    bind(PageClassList.class).to(MyPageClassList.class);
                    ...
                }
            };
    
            return Modules.override(isisDefaults).with(myAppOverrides);
        }
    }
