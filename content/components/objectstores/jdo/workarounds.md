Title: Workarounds (the `IsisJdoSupport` service) [1.1.0-SNAPSHOT]

There are a number of limitations in DataNucleus' implementation of JDO, specifically with regard to 1:m bidirectional relationships.  

* loading the children from the parent does not fire the `jdoPostLoad` callback (either on the entity via `javax.jdo.listener.LoadCallback` nor `javax.jdo.listener.LoadLifecycleListener`)

* persisting a child entity does not cause the parent's collection to be updated.

  Note that this is documented behaviour; see this [DataNucleus page](http://www.datanucleus.org/products/datanucleus/jdo/orm/relationships.html).

The `IsisJdoSupport` service provides a number of methods to enable workarounds for these cases.

*This page will be updated if we determine that such workarounds are not (or are no longer) required.*

## `IsisJdoSupport`

The `IsisJdoSupport` is defined in the JDO applib. It is defined as:

    package org.apache.isis.objectstore.jdo.applib.service.support;
public interface IsisJdoSupport {
        <T> T injected(T domainObject);
        <T> T refresh(T domainObject);
    }

The implementation is `IsisJdoSupportImpl`.  It is registered in `isis.properties` as per usual:

    isis.services = ...\
                org.apache.isis.objectstore.jdo.datanucleus.service.support.IsisJdoSupportImpl,\
                    ...

In the domain entity or service, add:

    // {{
    private IsisJdoSupport isisJdoSupport;
    public void setIsisJdoSupport(IsisJdoSupport isisJdoSupport) {
        this.isisJdoSupport = isisJdoSupport;
    }
    // }}

The service will then be automatically injected as normal.
                    
## Workaround for Lazy Loading

In a bidir 1:m, we have found that the post-load callback for the children is not fired.

The consequence of this is that any domain services used by the child object (including `DomainObjectContainer`) are not injected into the child.

The workaround is to have the parent inject the services when returning the children.

For example, suppose we have a Customer <->* Order bidir relationship.  In Customer, we would have:

    // {{ Orders (Collection)
    private SortedSet<Order> orders = new TreeSet<Order>();

    @Persistent(mappedBy = "customer")
    public SortedSet<Order> getOrders() {
        
        if (this.orders == null) {
            // this can happen, it would seem, by JDO/DN when it is 
            // setting up the object with its own set impl for lazy loading.
            return null;
        } else {
            // inject each element before returning it
            return Sets.newTreeSet(
                Iterables.transform(
                    this.orders, 
                    new Function<Order, Order>(){
                        public Order apply(Order order) {
                            return isisJdoSupport.injected(order);                        
                        }
                    }));
        }
    }

    public void setOrders(final SortedSet<Order> orders) {
        this.orders = orders;
    }

Alternatively, you can reload each child object.  Change:

                    new Function<Order, Order>(){
                        public Order apply(Order order) {
                            return isisJdoSupport.injected(order);                        
                        }
                    }));

to:

                    new Function<Order, Order>(){
                        public Order apply(Order order) {
                            return isisJdoSupport.refresh(order);
                        }
                    }));

Use [logging](enabling-logging.html) to determine if this makes more calls to the database than using the `injected()` method.

## Handling Unmanaged Parent Relationship

(Also in a bidir 1:m), we have found that the parent collection is not added to if a new child entity is persisted.

There are two choices here.  The first is to ensure that there is code that manually updates each side of the relationship.  The second is to flush the changes and then to manually reload the parent entity from the database.

For example, suppose we have a Customer <->* Order bidir relationship, with an action that persists an Order.  

To update both sides of the relationship, use:

    public Order newOrder(final Customer customer) {
        Order order = newTransientInstance(Order.class);
        order.setCustomer(customer);
        customer.getOrders().add(order); // update parent's collection
        persist(customer);
        return order;
    }


Alternatively, to reload the parent, use the `IsisJdoSupport` service:

    public Order newOrder(final Customer customer) {
        Order order = newTransientInstance(Order.class);
        order.setCustomer(customer);
        persist(customer);
        getContainer().flush(); // to database
        isisJdoSupport.refresh(customer); // reload parent from database
        return order;
    }


