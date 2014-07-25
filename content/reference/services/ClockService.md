title: Clock Service

Most applications deal with dates and times in one way or another. For example, if an `Order` is placed, then the `Customer` may have 30 days to pay the Invoice, otherwise a penalty may be levied.  However, this can complicate automated testing: "today+30" will be a different date every time the test is run.

Even disregarding testing, there may be a requirement to ensure that date/times are obtained from an NNTP server (rather than the system PC).  While instantiating a `java.util.Date` to current the current time is painless enough, we would not want complex technical logic for querying an NNTP server spread around domain logic code.

Therefore it's common to provide a domain service whose responsibility is to provide the current time.  This service can be injected into any domain object (and can be mocked out for unit testing).  Isis provides such a facade through the `ClockService`.

## API & Implementation

The API defined by `ClockService` is:

    public class ClockService {
        public LocalDate now() { ... }
        public LocalDateTime nowAsLocalDateTime() { ... }
        public DateTime nowAsDateTime() { ... }
        public Timestamp nowAsJavaSqlTimestamp() { ... }
        public long nowAsMillis() { ... }
    }

In fact, this is a concrete class and therefore constitutes the default implementation:

* `org.apache.isis.applib.services.clock.ClockService`

The time provided by this default implementation is based on the system clock.


## Registering the Service

Register like any other service in `isis.properties`:

    isis.services=...,\
                  org.apache.isis.applib.services.clock.ClockService,\
                  ...

## Alternative Implementations

The default implementation delegates in fact to a singleton class that is also in the applib, namely `org.apache.isis.applib.clock.Clock`.  Because the framework itself uses this singleton, a little care must be exercised in configuring the framework to use an alternative implementation.

Specifically, the first call to the `ClockService` (or to `Clock.getTime()` directly) will lazily instantiate the singleton, specifically `SystemClock` (a subclass of `Clock`).  As its name suggests, this default implementation simply delegates to the system's internal clock.  Once instantiated, the object registers itself as the singleton for the class such that any other attempt to instantiate some other (subclass of) `Clock` is ignored.

Setting up a different implementation therefore requires eagerly instantiating a different subclass of `Clock`.  This is most easily accomplished by defining the `Clock` subclass as a nested inner class of a custom`ClockService` implementation.  For example:

    public class NntpClockService extends ClockService {
        private static class NntpClock extends Clock {
            protected long time() {
                ... NNTP stuff here ...
            }
        }
        public NntpClockService() {
            new NntpClock();
        }
    }
            
You can then register this service - instead of the default `ClockService` - in the usual way within `isis.properties`

