package MiniBBS::Controller::Root;
use Ark 'Controller';

has '+namespace' => default => '';

# default 404 handler
sub default :Path :Args {
    my ($self, $c) = @_;

    $c->res->status(404);
    $c->res->body('404 Not Found');
}

sub index :Path :Args(0) {
    my ($self, $c) = @_;

    if ($c->req->method eq 'POST') {
        $c->detach('post');
    }

    $c->stash->{messages} = $c->model('BBS')->messages;
}

sub post :Private {
    my ($self, $c) = @_;

    if ($c->user and my $msg = $c->req->param('message')) {
        $c->model('BBS')->add_message({
            user => $c->user->obj->{display},
            body => $msg,
        });
    }

    $c->redirect( $c->uri_for('/') )
}

sub end :Private {
    my ($self, $c) = @_;

    $c->res->header('Cache-Control' => 'private');

    unless ($c->res->body or $c->res->status =~ /^3\d\d/) {
        $c->forward( $c->view('MT') );
    }
}

1;
