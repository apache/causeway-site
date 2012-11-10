package view;
use base 'ASF::View'; # see https://svn.apache.org/repos/infra/websites/cms/build/lib/ASF/View.pm


# A "basic" view, which takes 'template' and 'path' parameters.

sub basic {
    my %args = @_;
    my $filepath = "content$args{path}";

    print "basic $filepath";

    read_text_file($filepath, \%args);

    $args{path} =~ s/\.mdtext$/\.html/;
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

    print " - rendering";

    my $rendered = Dotiac::DTL->new($template_path)->render(\%args);

    print " - complete\n";

    return ($rendered, 'html', \%args);
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
