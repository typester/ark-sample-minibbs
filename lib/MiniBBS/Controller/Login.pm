package MiniBBS::Controller::Login;
use Ark 'Controller';

sub login :Path :Args(0) {
    my ($self, $c) = @_;

    if (my $user = $c->authenticate) {
        # login 成功
        $c->detach('redirect_home');
    }
}

sub logout :Global {
    my ($self, $c) = @_;
    $c->logout;
    $c->detach('redirect_home');
}

sub redirect_home :Private {
    my ($self, $c) = @_;
    $c->redirect( $c->uri_for('/') );
}

1;
