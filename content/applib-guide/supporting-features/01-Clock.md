Clock
=====

> The default Clock and alternative implementations.

Many if not all enterprise applications deal with dates and times in one way or another. For example, if an `Order` is placed, then the `Customer` may have 30 days to pay the Invoice, otherwise a penalty may be levied.
However, this can complicate automated testing: "today+30" will be a different date every time the test is run.

A common solution is to require that domain objects do not go directly to the system for the current date (ie don't simply instantiate a new `java.util.Date` in order to get the current time); instead they should call some sort of facade.

The *Apache Isis* framework provides such a facade through the
`org.apache.isis.applib.clock.Clock` class. The defaults for all values refer back to the `Clock`, and - because the `Clock` is a singleton - it is easy for any application code to obtain the current time also.

For example:

    public class Customer {
         public Order placeOrder(Product p) {
             Date now = Clock.getTimeAsDate();
             ...
         }
         ...
    }

Lazily Instantiated
-------------------

The first call to `Clock.getTime()` will lazily instantiate the singleton, with the default implementation being one that simply delegates to the system's internal clock. To use a different `Clock` implementation, eg one
that delegates to an NNTP server, all that is required is to instantiate it any time prior to bootstrapping *Isis* itself.

One notable implementation that notably takes advantage of this is `FixtureClock`, used for testing. <!--See ? for more information.-->

Possibly Replaceable
--------------------

`Clock` implementations can indicate whether they are replaceable as the singleton, or not.

Most (all?) production implementations (eg the default system clock) are *not* replaceable; once instantiated, any attempt to instantiate another subclass will be rejected with an exception.

However implementations to work with tests (such as `FixtureClock`, already mentioned) are more likely to be replaceable, so that they can be setup multiple times as required.

