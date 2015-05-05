Title: Query Results Cache

[//]: # (content copied to _user-guide_xxx)

The purpose of the `QueryResultsCache` is to improve response times to the user, by providing a short-term ([request-scoped](../../more-advanced-topics/how-to-09-020-How-to-write-a-typical-domain-service.html)) cache of the value of some (safe or idempotent) method call.  This will typically be as the result of running a query, but could be any expensive operation.

Caching such values is useful for code that loops "naively" through a bunch of stuff, performing an expensive operation each time.  If the data is such that the same expensive operation is made many times, then the query cache is a perfect fit.

> Note: this service was inspired by similar functionality that exists in relational databases, for example Sybase's [subquery results cache](http://infocenter.sybase.com/help/index.jsp?topic=/com.sybase.dc20023_1251/html/optimizer/X43480.htm) and Oracle's [result_cache](http://www.dba-oracle.com/oracle11g/oracle_11g_result_cache_sql_hint.htm) hint.


## API & Implementation

The API defined by `QueryResultsCache` is:

    @RequestScoped
    public class QueryResultsCache {
    
        public static class Key {
            public Key(Class<?> callingClass, String methodName, Object... keys) {...}
            
            public Class<?> getCallingClass() { ... }
            public String getMethodName() { ... }
            public Object[] getKeys() { ... }
        }
        
        public static class Value<T> {
            public Value(T result) { ... }
                this.result = result;
            }
            private T result;
            public T getResult() {
                return result;
            }
        }
        
        // //////////////////////////////////////
    
        
        public <T> T execute(
            final Callable<T> callable, 
            final Class<?> callingClass, final String methodName, final Object... keys) { ... }
    
        public <T> T execute(final Callable<T> callable, final Key cacheKey) { ... }
    
        public <T> Value<T> get(
            final Class<?> callingClass, final String methodName, final Object... keys) { ... }
        
        public <T> Value<T> get(final Key cacheKey) { ... }
    
        public <T> void put(final Key cacheKey, final T result) { ... }
    }


In fact, this is a concrete class:

* `org.apache.isis.applib.services.queryresultscache.QueryResultsCache`


## Usage

Suppose that there's a `TaxService` that calculates tax on `Taxable` items, with respect to some `TaxType`, and for a given `LocalDate`.  To calculate tax it must run a database query and then perform some additional calculations.  The original implementation is:

    public class TaxService {

        public BigDecimal calculateTax(
                final Taxable t, final TaxType tt, final LocalDate d) {
            // query against DB using t, tt, d
            // further expensive calculatoins
        }
    }

We can imagine that this service might be called in a loop, eg iterating over a bunch of orders, where several of those orders are for the same taxable products, say.  In this case the result of the calculation would always be the same for any given product.  We can therefore refactor the method to use the query cache as follows:
 
    public class TaxService {

        public BigDecimal calculateTax(
                final Taxable t, final TaxType tt, final LocalDate d) {
            return queryResultsCache.execute(
                new Callable<BigDecimal>(){ 
                    public BigDecimal call() throws Exception {
                         // query against DB using t, tt, d
                         // further expensive calculatoins
                    }
                },
                TaxService.class, 
                "calculateTax", 
                t, tt, d);
            }
    }

where the callable is the original code, and the other parameters are in essence uniquely identify the method call.

This refactoring will be worthwhile provided that enough of the orders being processed reference the same taxable products.  If however every order is for a different product, then no benefit will be gained from the refactoring.

### Register the Service

The `QueryResultsCache` class is automatically registered (it is annotated with `@DomainService`) so no further configuration is required.



### Related Services

The [ScratchPad](./scratchpad.html) service is also intended for actions that are called many times, allowing arbitrary information to be shared between them.  Those methods could be called from some outer loop in domain code, or by the framework itself if the action invoked has the [@Bulk](../recognized-annotations/Bulk.html) annotation. 