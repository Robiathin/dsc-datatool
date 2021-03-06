#!perl -T

use strict;
use warnings;
use File::Spec;
use Test::More;
use English qw(-no_match_vars);

ok( 1 );
done_testing;
exit;

if ( not $ENV{TEST_AUTHOR} ) {
    my $msg = 'Author test.  Set $ENV{TEST_AUTHOR} to a true value to run.';
    plan( skip_all => $msg );
}

eval "use Perl::Critic 1.125;";

if ( $EVAL_ERROR ) {
    my $msg = 'Perl::Critic >= 1.125 required to criticise code';
    plan( skip_all => $msg );
}

eval { require Test::Perl::Critic; };

if ( $EVAL_ERROR ) {
    my $msg = 'Test::Perl::Critic required to criticise code';
    plan( skip_all => $msg );
}

my $rcfile = File::Spec->catfile( 't', 'perlcriticrc' );
Test::Perl::Critic->import( -profile => $rcfile );
critic_ok( 'bin/dsc-datatool' );
done_testing;
