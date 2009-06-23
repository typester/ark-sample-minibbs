package MiniBBS;
use Ark;

our $VERSION = '0.01';

use_plugins qw{
    Session
    Session::State::Cookie
    Session::Store::Memory

    Authentication
    Authentication::Credential::OpenID
    Authentication::Store::Null
};

1;
