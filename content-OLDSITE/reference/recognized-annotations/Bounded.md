Title: @Bounded

[//]: # (content copied to _user-guide_xxx)

> Deprecated, use instead [@DomainObject#bounded()](./DomainObject.html).

For immutable objects where there is a bounded set of instances, the
`@Bounded` annotation can be used.

For example:

    @Bounded
    public class County {
        ...
    }

The number of instances is expected to be small enough that all instance
can be held in memory. The viewer will use this information to render
all the instances of this class in a drop-down list or equivalent.

> **Note**
>
> Although this is not enforced, `@Bounded` is intended for use on
> `final` classes. Its behaviour when used on interfaces, or classes
> with sub-classes is not specified
