Title: Building Isis

## Introduction

Check out the Isis source code as documented [here](using-git.html).

Install Maven 3.0.x, downloadable [here](http://maven.apache.org/download.html).

Set `MAVEN_OPTS` environment variable:

<pre>
MAVEN_OPTS=-Xms512m -Xmx1024m -XX:MaxPermSize=128m
</pre>


Build using:

<pre>
mvn clean install
</pre>
