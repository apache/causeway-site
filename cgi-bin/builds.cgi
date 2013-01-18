#!/usr/bin/perl -T

use strict;
use warnings;
$ENV{"PATH"} = "";

print "Content-Type: text/html\n\n";

my $artifact = "/apache-tomee/1.0.1-SNAPSHOT/";
$artifact = $ENV{PATH_INFO} if $ENV{PATH_INFO};

$artifact =~ m,^/?(\w[\w-]*)/(\d[\w\d.-]*)/?$, or die "Detainting regexp failed!";
$artifact = "/$1/$2/";

my $content = `/usr/local/bin/wget -q -O - http://repository.apache.org/snapshots/org/apache/openejb$artifact`;

my $ua = "";

$content = join(" ", split("[ \r\n]+", $content));
$content =~ s/(<tr>)/\n$1/g;
$content =~ s,(</tr>),$1\n,g;

foreach my $line (split("\n", $content)) {
    next if $line =~ /\.(sha1|md5|jar|pom|xml)|Parent/;
    $line =~ s,</head>,$ua\n</head>,i;
    print $line . "\n";
}
