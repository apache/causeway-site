How to inline the results of a query-only repository action
-----------------------------------------------------------

[//]: # (content copied to _user-guide_xxx)

While derived properties <!--(?)--> and derived collections <!--(?)--> typically "walk
the graph" to associated objects, there is nothing to prevent the
returned value being the result of invoking a repository (domain
service) action.

For example:

    public class Customer {
        ...
        public List<Order> getMostRecentOrders() {
            return orderRepo.findMostRecentOrders(this, 5);
        }
    }
