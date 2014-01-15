package Eirotic;
use base 'Exporter';
use feature  ':5.14';
use strict   ();
use warnings ();
require Method::Signatures;
require Perlude;
use YAML;
use Import::Into;
our $VERSION = '0.0';

# ABSTRACT: use perl *my* way

=head1 SYNOPSIS

just 

    use Eirotic;

to have

    use strict;
    use warnings qw< FATAL all >;
    use 5.14.0; # because given is fixed there
    use Perlude;
    use Method::Signatures;

=head1 MORE to come

is utf8::all a good idea ? use C<use> instead of my own import?

=cut

sub import {
    strict->import;
    warnings->import(FATAL => 'all');
    feature->import( ':5.14' );
    my $caller = caller;
    Perlude->import::into($caller);
    Method::Signatures->import( {into => $caller} );
}

1;

