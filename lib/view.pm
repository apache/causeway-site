package view;
use base 'ASF::View'; # see https://svn.apache.org/repos/infra/websites/cms/build/lib/ASF/View.pm

=head1 INTERFACE

Each function within view.pm which will be used for page generation must
implement a standard interface.

    sub my_view {
        my %args = @_;
        ...
        return ($content, $extension, @optional);
    }

First, each function must accept labeled parameters.  The only parameter which
will always be present is "path"; see the documentation in path.pm for the
"@patterns" array with regards to invocation with additional parameters.

Second, each function must return a list with at least two elements: the first
element must be the page content, and the second must be a file extention.
Returning additional elements in the list (as some of the functions below do)
is optional.

    return ($content, 'html', \%args);

The constraints imposed by this interface may cause difficulties, for example
when you want to generate both "foo.html" and "foo.pdf".  However, it is
usually possible to work around such issues with symlinks and dependency
management in path.pm.

=cut

use strict;
use warnings;
use Carp;
use Dotiac::DTL;
use ASF::Util qw( read_text_file );
use OpenEJBSiteDotiacFilter;
use Data::Dumper;

BEGIN { push @Dotiac::DTL::TEMPLATE_DIRS, "templates"; }

# This is most widely used view.  It takes a
# 'template' argument and a 'path' argument.
# Assuming the path ends in foo.mdtext, any files
# like foo.page/bar.mdtext will be parsed and
# passed to the template in the "bar" (hash)
# variable.
# Has the same behavior as the above for foo.page/bar.txt
# files, parsing them into a bar variable for the template.
# Otherwise presumes the template is the path.


# A "basic" view, which takes 'template' and 'path' parameters.
# borrowed from openejb

sub basic {
    my %args = @_;
    my $filepath = "content$args{path}";

    print "basic $filepath";

    read_text_file($filepath, \%args);

    if ($args{indexpage}) 
      $args{path} += $args{indexpage};
    }
    
    $args{path} =~ s/\.md(text)?$/\.html/;
    $args{base} = _base($args{path});
    $args{breadcrumbs} = _breadcrumbs($args{path}, $args{base});

    my $template_path = "templates/$args{template}";

    my @includes = ($args{content} =~ m/{include:([^ ]+?)}/g);

    foreach my $include (@includes) {
        next unless ( -e "content/$include");

        my %a = ();
        read_text_file("content/$include", \%a);
        my $text = $a{content};
        $args{headers}{title} = $a{headers}{title} unless $args{headers}{title};

        # If the file to be included is in a child directory, resolve all the links
        # in the included content to be relative to this document
        if ($include =~ m,/,) {
            my $ipath = $include;
            $ipath =~ s,/[^/]*$,,;
            $text =~ s,(\[[^[]+])\(([^/][^)]+)\),$1($ipath/$2),g;
        }

        $args{content} =~ s/{include:$include}/$text/g;
    }

    print " - rendering using Dotiac::DTL";

    my $rendered = Dotiac::DTL->new($template_path)->render(\%args);

    print " - complete\n";

    return ($rendered, 'html', \%args);
}


sub _breadcrumbs {
    my $path        = shift;
    my $base        = shift;

    my $index = "$base/index.html";
    $index =~ s,/+,/,g;

    my @breadcrumbs = (
        qq|<a href="$index">Home</a>|,
    );
    my @path_components = split( m!/!, $path );
    pop @path_components;

    my $relpath = $base;


    for (@path_components) {
        $relpath .= "$_/";
        $relpath =~ s,/+,/,g;
        next unless $_;

        my @names = split("-", $_);
        my $name = "";
        for my $n (@names) {
            $name .= ucfirst($n) . " ";
        }
        $name =~ s/ *$//;
        push @breadcrumbs, qq(<a href="$relpath">\u$name</a>);
    }
    return join "&nbsp;&raquo&nbsp;", @breadcrumbs;
}
sub _base {
    my $path        = shift;

    my @path_components = split( m!/!, $path );
    pop @path_components;
    pop @path_components;

    my $rel = "./";

    for (@path_components) {
        $rel .= "../";
    }

    return $rel;
}
1;

=head1 LICENSE

           Licensed to the Apache Software Foundation (ASF) under one
           or more contributor license agreements.  See the NOTICE file
           distributed with this work for additional information
           regarding copyright ownership.  The ASF licenses this file
           to you under the Apache License, Version 2.0 (the
           "License"); you may not use this file except in compliance
           with the License.  You may obtain a copy of the License at

             http://www.apache.org/licenses/LICENSE-2.0

           Unless required by applicable law or agreed to in writing,
           software distributed under the License is distributed on an
           "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
           KIND, either express or implied.  See the License for the
           specific language governing permissions and limitations
           under the License.
