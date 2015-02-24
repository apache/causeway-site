Title: File upload/download

The Isis application library provides the [Blob](../../../reference/value-types.html) type (binary large objects) and 
[Clob](../../../reference/value-types.html) type (character large object), each of which also includes metadata about the data (specifically the filename and mime type).

A class can define a property using either of these types, for example:

    private Blob attachment;

    @javax.jdo.annotations.Persistent(defaultFetchGroup="false")
    @javax.jdo.annotations.Column(allowsNull="true")
    public Blob getAttachment() {
        return attachment;
    }

    public void setAttachment(final Blob attachment) {
        this.attachment = attachment;
    }

The `Blob` and `Clob` types can also be used as parameters to actions.
    
##Screenshots

The following screenshots are taken from the Isis addons example [todoapp](https://github.com/isisaddons/isis-app-todoapp) (not ASF):

#### View mode, empty

`Blob` field rendered as attachment (with no data):

<a href="images/file-upload-download/010-attachment-field.png"><img src="images/file-upload-download/010-attachment-field-940.png"/></a>

(screenshot of v1.4.0)

#### Edit mode

Hit edit; 'choose file' button appears:

<a href="images/file-upload-download/020-edit-choose-file.png"><img src="images/file-upload-download/020-edit-choose-file-940.png"/></a>

(screenshot of v1.4.0)

#### Choose file

Choose file using the regular browser window:

<a href="images/file-upload-download/030-choose-file-using-browser.png"><img src="images/file-upload-download/030-choose-file-using-browser-520.png"/></a>

#### Blob metadata

Chosen file is indicated:

<a href="images/file-upload-download/040-edit-chosen-file-indicated.png"><img src="images/file-upload-download/040-edit-chosen-file-indicated-940.png"/></a>

#### Image rendered

Back in view mode (ie once hit OK) if the `Blob` is an image, then it is shown:

<a href="images/file-upload-download/050-ok-if-image-then-rendered.png"><img src="images/file-upload-download/050-ok-if-image-then-rendered-940.png"/></a>

#### Download

`Blob` can be downloaded:

<a href="images/file-upload-download/060-download.png"><img src="images/file-upload-download/060-download-940.png"/></a>

#### Clear

Back in edit mode, can choose a different file or clear (assuming property is not mandatory):

<a href="images/file-upload-download/070-edit-clear.png"><img src="images/file-upload-download/070-edit-clear-940.png"/></a>

