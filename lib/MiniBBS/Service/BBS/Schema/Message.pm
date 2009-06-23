package MiniBBS::Service::BBS::Schema::Message;
use strict;
use warnings;
no warnings 'redefine';

use DateTime;

__PACKAGE__->inflate_column(
    created_date => {
        inflate => sub { DateTime->from_epoch( epoch => shift, time_zone => 'local' ) },
        deflate => sub { shift->epoch },
    },
);

sub insert {
    my $self = shift;
    $self->created_date( DateTime->now ) unless $self->created_date;
    $self->next::method(@_);
}

1;

