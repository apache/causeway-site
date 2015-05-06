Title: Transaction Management

[//]: # (content copied to _user-guide_more-advanced_transactions-and-errors)

In Isis, every action invocation (in fact, every interaction) is automatically wrapped in a transaction, and any repository query automatically does a flush.

What that means is that there's no need to explicitly start or commit transactions in Isis; this will be done for you.  Indeed, if you do try to manage transactions (eg by reaching into the JDO PersistenceManager exposed by the [IsisJdoSupport service](services/isisjdosupport-service.html), then you are likely to confuse Isis and get a stack trace for your trouble.

On a related note, if you want to abort Isis' transaction, this can be done by throwing `RecoverableException` (or any subclass, eg `ApplicationException`).  The transaction will be aborted, and the exception message will be displayed to the user.

If you throw any other exception (ie not a subclass of `RecoverableException`), then the users will see an error page (if Wicket viewer) or a 500 (if Restful Objects viewer).
