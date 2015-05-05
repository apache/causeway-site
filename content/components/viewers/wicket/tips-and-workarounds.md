Title: Rendering of abstract properties in tables

[//]: # (content copied to _user-guide_xxx)

> For more info, see [ISIS-582](https://issues.apache.org/jira/browse/ISIS-582).

Suppose you have a hierarchy of classes where a property is derived and abstract in the superclass, concrete implementations in the subclasses.  For example:

    public abstract class LeaseTerm {
        ...
        public abstract BigDecimal getEffectiveValue(); 
        ...
    }
    
    public class LeaseTermForIndexableTerm extends LeaseTerm {
        ...
        public BigDecimal getEffectveValue() { ... }
        ...
    }

Currently the Wicket viewer will not render the property in tables (though the property is correctly rendered in views):

The work-around is simple enough; make the method concrete in the superclass and return a dummy implementation, eg:

    public abstract class LeaseTerm {
        ...
        public BigDecimal getEffectiveValue() {
            // workaround for ISIS-582
            return null;
        }
        ...
    }

Alternatively the implementation could throw a `RuntimeException`, eg 

    throw new RuntimeException("never called; workaround for ISIS-582");
    

