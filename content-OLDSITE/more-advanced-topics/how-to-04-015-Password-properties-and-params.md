How to use a Password field
--------------------

[//]: # (content copied to _user-guide_xxx)

Isis provides the `org.apache.isis.applib.value.Password` value type which the Wicket viewer will automatically render
using an appropriate `input type=password` field.

However, (unlike Isis' `Blob` and `Clob` value) the JDO Objectstore does not "know" how to persist a `Password`.  This
is deliberate: `Password` has no built-in encryption mechanism, its use merely ensures that the value of the password
is not rendered in the UI.

Therefore, the recommended approach for implementing passwords is to use a simple string to store the value, with the
Password property derived from that.  An injected encryption service can be used to convert between the two.

For example:

    @javax.jdo.annotations.Column(allowsNull = "true", name = "password")
    private String passwordStr;

    @Optional
    @MemberOrder(sequence = "99")
    public Password getPassword() {
        return passwordStr !=null? new Password(encryptionService.decrypt(passwordStr)): null;
    }

    public void setPassword(final Password password) {
        this.passwordStr = password != null? encryptionService.encrypt(password.getPassword()): null;
    }

    @javax.inject.Inject
    private com.mycompany.services.EncryptionService encryptionService;

In this case the password is a property, and the encryption service provides both decryption and encryption.

As a variant on the above, you could arrange for the password to be changed using an action.

    @javax.jdo.annotations.Column(allowsNull = "true", name = "password")
    private String passwordStr;
    
    @MemberOrder(sequence = "1")
    public ToDoItem changePassword(@Optional Password password) {
        this.passwordStr = password != null? encryptionService.encrypt(password.getPassword()): null;
        return this;
    }
    
    @javax.inject.Inject
    private org.isisaddons.module.security.dom.password PasswordEncryptionService encryptionService;
    

This is more secure because the encryption is one-way: encrypt but not decrypt.  Moreover (as the above code snippet 
hits at) you could reuse the the [Security Module Addon](https://github.com/isisaddons/isis-module-security)'s own
[PasswordEncryptionService](https://github.com/isisaddons/isis-module-security/tree/917f1933f978643cd319a35d1be0dd7333e88f76/dom/src/main/java/org/isisaddons/module/security/dom/password), which
includes a reasonably secure implementation of this service.


#### UI Cosmetic fix (1.6.0 and earlier)

In Isis 1.6.0 and earlier there is a cosmetic bug that the password field is not rendered correctly.  Add the following
CSS into your app's `application.css` file:
    
    .isisPasswordPanel input[type=password] {
        border-radius:4px;
        -moz-border-radius:4px;
        -webkit-border-radius:4px;
        padding:6px;
        border:1px solid #F0EFEA;
        border-top:1px solid #CCCBC7;
    }

This has been fixed in `1.7.0`.