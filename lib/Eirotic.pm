package Eirotic;
# ABSTRACT: use perl *my* way
our $VERSION = '0.1';

=head1 SYNOPSIS

writting

    use Eirotic;

replaces this boilerplate

    use 5.20.0;
    use strict;
    use warnings qw( FATAL all );
    use experimental 'signatures'; 
    use Perlude;
    use Path::Tiny;
    require YAML;

=head1 CHANGES

=head1 v0.1 (2015)

=over 4

=item * 

C<Eirotic> moved to C<Eirotic::514>.

=item *  

C<IO::All> replaced by C<Path::Tiny>.

=item * 

L<https://metacpan.org/pod/Method::Signatures> replaced by CORE experimental ones.  

=back

=head1 Yet experimenting

=head2 Unicode everywhere

is utf8::all a good idea ? use C<use> instead of my own import? 

=head2 List::AllUtils ? 

temptation is strong but i don't want to conflict with perlude, even in the
user's brain.

what about the idea from C<Book> (used in Perlude): use a very short NS. like
C<A> for C<Array> and C<S> for stream? 

=head2 About autodie and fatal warnings

seems to be nice but maybe i should read
U<http://blogs.perl.org/users/peter_rabbitson/2014/01/fatal-warnings-are-a-ticking-time-bomb-via-chromatic.html>

=head1 CREDITS

    Author: Marc Chantreux <marcc@cpan.org>

=cut

use strict ();
use warnings ();
use feature ();
use autodie ();
require Perlude;
require YAML;
require Path::Tiny;
require Import::Into;

sub import {

    my ( $what ) = pop;
    my ( $caller ) = caller; 

    feature->import(':5.20');          # use 5.20.0;
    strict->import;                    # use strict;
    warnings->import;  # use warnings qw( FATAL all );
    # warnings->import(qw( FATAL all )); # use warnings qw( FATAL all );

    #use experimental 'signatures';

    feature->import('signatures');
    warnings->unimport("experimental::signatures"); 

    use Perlude;
    use Path::Tiny;
    
    #return unless $what eq "-full";
    Perlude->import::into($caller);
    Path::Tiny->import::into($caller); 

}

1;

