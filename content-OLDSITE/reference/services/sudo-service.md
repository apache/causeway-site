SudoService (1.9.0-SNAPSHOT)
===========

[//]: # (content copied to _user-guide_xxx)

The `SudoService` allows the current user reported by the `DomainObjectContainer` to be temporarily changed to some 
other user.  This is valuable during both integration testing (eg if testing a workflow system whereby objects are
moved from one user to another) and during fixture scripts (eg setting up objects that would normally require several
users to have acted upon the objects).

The API provided by the service is:

    public interface SudoService {
    
        void sudo(String username, final Runnable runnable);
        <T> T sudo(String username, final Callable<T> callable);
        void sudo(String username, List<String> roles, final Runnable runnable);
        <T> T sudo(String username, List<String> roles, final Callable<T> callable);
    }

which will run the provided block of code (a `Runnable` or a `Callable`) as if the specified username and optionally
roles being returned by `DomainObjectContainer#getUser()`.

For example, in the [todoapp](https://github.com/isisaddons/isis-app-todoapp) (non ASF) the `SudoService` is used to 
set up todo item objects:

    protected void execute(final ExecutionContext ec) {
        ...
        sudoService.sudo(getUsername(),
                new Runnable() {
                    @Override
                    public void run() {
                        wrap(toDoItem).completed();
                    }
                });
        ...
    }

