package Gapp::Moose::Meta::Attribute::Trait::GappSourceView;
use Moose::Role;

before '_process_options' => sub {
    my ( $class, $name, $opts ) = @_;
    $opts->{gclass} = 'Gapp::SourceView' if ! exists $opts->{class};
};

package Moose::Meta::Attribute::Custom::Trait::GappSourceView;
sub register_implementation { 'Gapp::Moose::Meta::Attribute::Trait::GappSourceView' };
1;
