Title: AngularJS Tips

The hypermedia API exposed by Isis' Restful Objects viewer is intended be support both bespoke custom-written viewers as well as generic viewers.  Indeed, we expect most clients consuming the API will be bespoke, not generic.

This page captures one or two tips on using AngularJS to write such a bespoke client.

### Invoking a GET link (eg invoking a query action)

Suppose you have a `CustomerService` providing a `findCustomer` action:

    public class CustomerService {

      public String id() { return "customers"; }
    
      @ActionSemantics(Of.SAFE)
      public Customer findCustomer(@Named("customerName") String customerName) { ... }
  
    }
  
Restful Objects will expose this as action with the following link that looks something like:

    {
      "rel" : "urn:org.restfulobjects:rels/invoke",
      "href" : "http://localhost:8080/restful/services/customers/actions/findCustomer/invoke",
      "method" : "GET",
      "type" : "application/json;profile=\"urn:org.restfulobjects:repr-types/action-result\"",
      "arguments" : {
        "customerName" : {
          "value" : null
        }
      }
    }  
  
You can then invoke this using AngularJs' `$resource` service as follows.  

    var findCustomer = $resource("http://localhost:8080/restful/services/customers/actions/findCustomer/invoke?:queryString");
    var findCustomerArgs = { 
      "customerName": { 
          "value": "Fred" 
        }
    };

    findCustomer.get({queryString: JSON.stringify(findCustomerArgs)}, function(data) { ... } )

Here the `:queryString` placeholder in the initial `$resource` constructor is expanded with a stringified version of the JSON object representing the args.  Note how the `findCustomerArgs` is the same as the `"arguments"` attribute in the original link (with a value provided instead of `null`).

### Invoking a PUT or POSt link

> The following notes need expanding.  Contributions welcome

If the method is a PUT or a POST, then no `:queryString` placeholder is required in the URL, and the args are instead part of the body.  Use `$resource.put(...)` or `$resource.post(...)` instead.

