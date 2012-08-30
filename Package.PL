use Module::Package;
my $pack = Module::Package->new(
    name => 'Gapp::SourceView',
    version_from => 'lib/Gapp/SourceView.pm',
    prereq_pm => {
	'Gapp' => 0.40,
    },
    abstract_from => 'lib/Gapp/SourceView.pm',
    author => 'Jeffrey Ray Hallock <jeffrey dot hallock at gmail dot com>',
    exclude => [ '*.komodoproject', '.komodotools', '.git' ],
);
$pack->package;


