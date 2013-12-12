Title: upd.sh scripts

These scripts simplify the task of updating the dist directories.  NB: these must not be checked in to Subversion.

## ./isis-core/upd.sh

<pre>
if [ "$#" -ne 2 ]; then
    echo "usage: upd.sh new_ver old_ver" >&2
    exit 1
fi

curl -O https://repository.apache.org/content/repositories/releases/org/apache/isis/core/isis/$1/isis-$1-source-release.zip.asc
svn add isis-$1-source-release.zip.asc

curl -O https://repository.apache.org/content/repositories/releases/org/apache/isis/core/isis/$1/isis-$1-source-release.zip
svn add isis-$1-source-release.zip

svn delete isis-$2-source-release.zip.asc
svn delete isis-$2-source-release.zip
</pre>


## ./component/viewer/wicket/upd.sh

<pre>
if [ "$#" -ne 2 ]; then
    echo "usage: upd.sh new_ver old_ver" >&2
    exit 1
fi

curl -O https://repository.apache.org/content/repositories/releases/org/apache/isis/viewer/isis-viewer-wicket/$1/isis-viewer-wicket-$1-source-release.zip.asc
svn add isis-viewer-wicket-$1-source-release.zip.asc

curl -O https://repository.apache.org/content/repositories/releases/org/apache/isis/viewer/isis-viewer-wicket/$1/isis-viewer-wicket-$1-source-release.zip
svn add isis-viewer-wicket-$1-source-release.zip

svn delete isis-viewer-wicket-$2-source-release.zip.asc
svn delete isis-viewer-wicket-$2-source-release.zip
</pre>



## ./component/viewer/restfulobjects/upd.sh

<pre>
if [ "$#" -ne 2 ]; then
    echo "usage: upd.sh new_ver old_ver" >&2
    exit 1
fi

curl -O https://repository.apache.org/content/repositories/releases/org/apache/isis/viewer/isis-viewer-restfulobjects/$1/isis-viewer-restfulobjects-$1-source-release.zip.asc
svn add isis-viewer-restfulobjects-$1-source-release.zip.asc

curl -O https://repository.apache.org/content/repositories/releases/org/apache/isis/viewer/isis-viewer-restfulobjects/$1/isis-viewer-restfulobjects-$1-source-release.zip
svn add isis-viewer-restfulobjects-$1-source-release.zip

svn delete isis-viewer-restfulobjects-$2-source-release.zip.asc
svn delete isis-viewer-restfulobjects-$2-source-release.zip
</pre>



## ./archetype/quickstart\_wicket\_restful_jdo-archetype/upd.sh

<pre>
if [ "$#" -ne 2 ]; then
    echo "usage: upd.sh new_ver old_ver" >&2
    exit 1
fi

curl -O https://repository.apache.org/content/repositories/releases/org/apache/isis/archetype/quickstart_wicket_restful_jdo-archetype/$1/quickstart_wicket_restful_jdo-archetype-$1-source-release.zip.asc
svn add quickstart_wicket_restful_jdo-archetype-$1-source-release.zip.asc

curl -O https://repository.apache.org/content/repositories/releases/org/apache/isis/archetype/quickstart_wicket_restful_jdo-archetype/$1/quickstart_wicket_restful_jdo-archetype-$1-source-release.zip
svn add quickstart_wicket_restful_jdo-archetype-$1-source-release.zip

svn delete quickstart_wicket_restful_jdo-archetype-$2-source-release.zip.asc
svn delete quickstart_wicket_restful_jdo-archetype-$2-source-release.zip
</pre>


## ./component/objectstore/jdo/upd.sh

<pre>
if [ "$#" -ne 2 ]; then
    echo "usage: upd.sh new_ver old_ver" >&2
    exit 1
fi

curl -O https://repository.apache.org/content/repositories/releases/org/apache/isis/objectstore/isis-objectstore-jdo/$1/isis-objectstore-jdo-$1-source-release.zip.asc
svn add isis-objectstore-jdo-$1-source-release.zip.asc

curl -O https://repository.apache.org/content/repositories/releases/org/apache/isis/objectstore/isis-objectstore-jdo/$1/isis-objectstore-jdo-$1-source-release.zip
svn add isis-objectstore-jdo-$1-source-release.zip

svn delete isis-objectstore-jdo-$2-source-release.zip.asc
svn delete isis-objectstore-jdo-$2-source-release.zip
</pre>


## ./component/security/file/upd.sh

<pre>
if [ "$#" -ne 2 ]; then
    echo "usage: upd.sh new_ver old_ver" >&2
    exit 1
fi

curl -O https://repository.apache.org/content/repositories/releases/org/apache/isis/security/isis-security-file/$1/isis-security-file-$1-source-release.zip.asc
svn add isis-security-file-$1-source-release.zip.asc

curl -O https://repository.apache.org/content/repositories/releases/org/apache/isis/security/isis-security-file/$1/isis-security-file-$1-source-release.zip
svn add isis-security-file-$1-source-release.zip

svn delete isis-security-file-$2-source-release.zip.asc
svn delete isis-security-file-$2-source-release.zip
</pre>


## ./component/security/shiro/upd.sh

<pre>
if [ "$#" -ne 2 ]; then
    echo "usage: upd.sh new_ver old_ver" >&2
    exit 1
fi

curl -O https://repository.apache.org/content/repositories/releases/org/apache/isis/security/isis-security-shiro/$1/isis-security-shiro-$1-source-release.zip.asc
svn add isis-security-shiro-$1-source-release.zip.asc

curl -O https://repository.apache.org/content/repositories/releases/org/apache/isis/security/isis-security-shiro/$1/isis-security-shiro-$1-source-release.zip
svn add isis-security-shiro-$1-source-release.zip

svn delete isis-security-shiro-$2-source-release.zip.asc
svn delete isis-security-shiro-$2-source-release.zip
</pre>


## ./archetype/simple\_wicket\_restful_jdo-archetype/upd.sh

<pre>
if [ "$#" -ne 2 ]; then
    echo "usage: upd.sh new_ver old_ver" >&2
    exit 1
fi

curl -O https://repository.apache.org/content/repositories/releases/org/apache/isis/archetype/simple_wicket_restful_jdo-archetype/$1/simple_wicket_restful_jdo-archetype-$1-source-release.zip.asc
svn add simple_wicket_restful_jdo-archetype-$1-source-release.zip.asc

curl -O https://repository.apache.org/content/repositories/releases/org/apache/isis/archetype/simple_wicket_restful_jdo-archetype/$1/simple_wicket_restful_jdo-archetype-$1-source-release.zip
svn add simple_wicket_restful_jdo-archetype-$1-source-release.zip

svn delete simple_wicket_restful_jdo-archetype-$2-source-release.zip.asc
svn delete simple_wicket_restful_jdo-archetype-$2-source-release.zip
</pre>



## ./archetype/quickstart_wicket_restful_jdo-archetype/upd.sh

<pre>
if [ "$#" -ne 2 ]; then
    echo "usage: upd.sh new_ver old_ver" >&2
    exit 1
fi

curl -O https://repository.apache.org/content/repositories/releases/org/apache/isis/archetype/quickstart_wicket_restful_jdo-archetype/$1/quickstart_wicket_restful_jdo-archetype-$1-source-release.zip.asc
svn add quickstart_wicket_restful_jdo-archetype-$1-source-release.zip.asc

curl -O https://repository.apache.org/content/repositories/releases/org/apache/isis/archetype/quickstart_wicket_restful_jdo-archetype/$1/quickstart_wicket_restful_jdo-archetype-$1-source-release.zip
svn add quickstart_wicket_restful_jdo-archetype-$1-source-release.zip

svn delete quickstart_wicket_restful_jdo-archetype-$2-source-release.zip.asc
svn delete quickstart_wicket_restful_jdo-archetype-$2-source-release.zip
</pre>


