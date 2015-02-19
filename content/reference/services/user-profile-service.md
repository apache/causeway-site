Title: User Profile Service (1.8.0-SNAPSHOT)

The user profile service API provides the ability for the domain application to return supplementary metadata about
the current user.  This information is used (by the Wicket viewer) to customize the appearance of the tertiary
"Me" menu bar (top right).  For example, rather than display the username, instead the user's first and last name
could be displayed.

Another use case is to allow the user to switch context in some fashion or other.  This might be to emulate a
sort of "sudo"-like function, or perhaps to focus on some particular set of data.

> Currently this feature is not integrated with Isis' authentication mechanisms; the information provided is purely metadata provided for presentation purposes only.

## API

The API for the service is:

    public interface UserProfileService {

        @Programmatic
        String userProfileName();
    }

where:

* `userProfileName()` is used (in the Wicket viewer) as the menu name of the tertiary "Me" menu bar.

If the method returns <tt>null</tt> or throws an exception then the framework will default to using the current user name.

> In the future this API may be expanded; one obvious possibility is to return a profile photo or avatar URL.

## Screenshot

The [todoapp](https://github.com/isisaddons/isis-app-todoapp) (not ASF) provides a custom implementation that
demonstrates the use of this service:

<a href="images/user-profile-service.png"><img width="600px" src="images/user-profile-service.png"/></a>

The implementation is very straight-forward:

    @DomainService
    public class CustomUserProfileService implements UserProfileService {

        @Override
        @Programmatic
        public String userProfileName() {
            return "Hi " + getAuthenticationSession().getUserName() + "!";
        }

        protected AuthenticationSession getAuthenticationSession() {
            return IsisContext.getAuthenticationSession();
        }
    }
