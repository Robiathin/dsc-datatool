package App::DSC::DataTool::Input;

use common::sense;
use Carp;

use base qw(App::DSC::DataTool::Errors);

use Scalar::Util qw( blessed );

=encoding utf8

=head1 NAME

App::DSC::DataTool::Input - Base class for input formats

=head1 VERSION

See L<App::DSC::DataTool> for version.

=head1 SYNOPSIS

  ...

=head1 DESCRIPTION

Base class for input formats...

=head1 METHODS

=over 4

=item $input = App::DSC::DataTool::Input->new (...)

Create a new input object, arguments are passed to the specific format module
via C<Init>.

=cut

sub new {
    my ( $this, %args ) = @_;
    my $class = ref( $this ) ? ref( $this ) : $this;
    my $self = {
        errors => [],
    };
    bless $self, $class;

    $self->Init( %args );

    return $self;
}

sub DESTROY {
    $_[0]->Destroy;
    return;
}

=item $input->Init (...)

Called upon creation of the object, arguments should be handled in the specific
format module.

=cut

sub Init {
}

=item $input->Destroy

Called upon destruction of the object.

=cut

sub Destroy {
}

=item $name = $input->Name

Return the name of the module, must be overloaded.

=cut

sub Name {
    confess 'Name is not overloaded';
}

=item $dataset = $input->Dataset

Read input and return a L<App::DSC::DataTool::Dataset> object or undef if there
is no more input, must be overloaded.

=cut

sub Dataset {
    confess 'Dataset is not overloaded';
}

=back

=head1 AUTHOR

Jerry Lundström, C<< <lundstrom.jerry@gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to L<https://github.com/DNS-OARC/dsc-datatool/issues>.

=head1 LICENSE AND COPYRIGHT

Copyright 2016 OARC, Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:

1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in
   the documentation and/or other materials provided with the
   distribution.

3. Neither the name of the copyright holder nor the names of its
   contributors may be used to endorse or promote products derived
   from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.

=cut

1;    # End of App::DSC::DataTool::Input
