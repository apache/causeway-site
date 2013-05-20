Title: Integration testing Support

{stub
This page is a stub.
}

This module provides the ability to bootstrap Isis within a JUnit testing framework, using any object store.  This is done using a JUnit rule.

The module also contains the original (now legacy) testrunner that bootstrapped Isis using an implementation of the JUnit `TestRunner` API; annotations are used to define services and fixtures.