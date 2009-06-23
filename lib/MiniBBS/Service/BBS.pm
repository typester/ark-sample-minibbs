package MiniBBS::Service::BBS;
use Any::Moose;

use MiniBBS::Service::BBS::Schema;

has connect_info => (
    is       => 'rw',
    isa      => 'ArrayRef',
    required => 1,
);

has schema => (
    is => 'rw',
    isa => 'MiniBBS::Service::BBS::Schema',
    lazy => 1,
    default => sub {
        my $self = shift;
        MiniBBS::Service::BBS::Schema->connect( @{ $self->connect_info } );
    },
);

no Any::Moose;

sub add_message {
    my ($self, $message) = @_;
    my $new_msg = $self->schema->resultset('Message')->create($message);
}

sub messages {
    my ($self,) = @_;
    my $messages = $self->schema->resultset('Message')
                        ->search({}, { order_by => 'created_date desc' });
}

1;

