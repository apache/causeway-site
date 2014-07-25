Title: Docx domain service (for mail-merge/reporting) 

The [docx domain service](https://github.com/danhaywood/isis-domainservice-docx) generates Word .docx from an initial .docx template, thereby providing a mail merge/reporting capability. A simplified HTML is used as the input to the service.

## Screenshots

The following screenshots are taken from the project's `zzzdemo` app (adapted from Isis' quickstart archetype).

#### Object

The screenshot below shows the object acting as the source of the data.  The "download as doc" action calls the service.

<img src="https://raw.github.com/danhaywood/isis-domainservice-docx/master/images/contributed-action.png" style="width: 900px;"/>

#### Template

The template docx uses MS Word smart tags feature to identify the fields:

<img src="https://raw.github.com/danhaywood/isis-domainservice-docx/master/images/template.png" style="width: 720px;"/>

Any styling in the template document is preserved on generation.

#### Generated

The generated docx merges in the data from the object into the template.  

<img src="https://raw.github.com/danhaywood/isis-domainservice-docx/master/images/generated-docx.png" style="width: 720px;"/>

Note how the bulleted list is repeated for each dependency of the `ToDoItem`.  Tables work similarly.
   
## Download

The service is hosted on [github](https://github.com/danhaywood/isis-domainservice-docx).  
