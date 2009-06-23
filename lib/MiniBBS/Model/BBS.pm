package MiniBBS::Model::BBS;
use Ark 'Model::Adaptor';

__PACKAGE__->config(
    class => 'MiniBBS::Service::BBS',
    args  => { connect_info => ['dbi:SQLite:' . MiniBBS->path_to('minibbs.db') ] },
    deref => 1,
);

1;
