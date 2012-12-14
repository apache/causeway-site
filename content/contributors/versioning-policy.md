Title: Versioning Policy

## Semantic Versioning

Starting from v1.0.0, Isis has adopted [semantic versioning](http://semver.org)
for its versioning policy.

Version numbers are in the form `x.y.z`:

- x is bumped up whenever there a breaking API change
- y is bumped up whenever there is a new feature that does not break API
- z is bumped up for minor bug fixes.

This scheme would be adopted for both core and components.  

## Version numbers are not synchronized between Core and Components

Version numbers are NOT kept in sync between core and components.  Therefore components should clearly indicate the version of core that they depend upon.

For example, here is a possible flow of how versioning might evolve over a number of releases:

* `core 1.0.0` is released
* `isis-objectstore-jdo 1.0.0 is released, dependent on `core 1.0.0`
* `isis-viewer-wicket 1.0.0` is released, dependent on `core 1.0.0`
* `core 1.0.1` is released.  This is NOT picked up by either of the above components.
* `isis-objectstore-jdo 1.0.1` is released, dependent on `core 1.0.1`.  This also incorporates a number of its own bug fixes
* `core 1.1.0` is released, providing a new feature
* `isis-viewer-wicket 1.1.0` is released, using the new feature provided by `core 1.1.0`.
* `isis-viewer-wicket 1.2.0` is released, offering its own new feature.  It still depends on core `1.1.0`.
* `isis-objectstore-jdo 1.0.2` is released.  This has some bug fixes and depends on `core 1.1.0` (even though it does not require the new feature introduced in `core 1.1.0`, it tracks the latest available version of `core`)
* `core 2.0.0` is released, making breaking changes to the objectstore API
* `isis-objectstore-jdo 2.0.0` is released, dependent on `core 2.0.0`.
* `isis-objectstore-jdo 2.1.0` is released, providing a new feature.  It depends on `core 2.0.0`.
* `isis-viewer-wicket 1.2.1` is released.  This has some bug fixes, and also updates to run against `core 2.0.0`.

At the end of this sequence we have:
- `core 2.0.0`
- `isis-objectstore-jdo 2.1.0`, dependent upon `core 2.0.0`
- `isis-wicket-viewer 1.2.1`, dependent upon `core 2.0.0`



## Version numbers may not be used

Version ranges may not be used.  If necessary, end-users can use `<dependencyManagement` elements to have combine components built against different versions of core.

That said, this can introduce instability and so generally we recommend that end-users configure the `maven-enforcer-plugin` and its [DependencyConvergence](http://maven.apache.org/enforcer/enforcer-rules/dependencyConvergence.html) rule.  This will avoid "jar hell" (components having conflicting dependencies of core).

If there is a conflict, we would ask that end-users engage with Isis committers to have an updated version of the component(s) pushed out.
