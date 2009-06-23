use Test::Base;

plan 'no_plan';

use_ok('MiniBBS::Service::BBS');

# create test db
my $db = "test_database";
END { unlink $db }

my $connect_info = "dbi:SQLite:$db";

{
    use DBI;
    my $dbh = DBI->connect($connect_info);
    $dbh->do(<<'...');
CREATE TABLE message (
    id INTEGER NOT NULL PRIMARY KEY,
    user TEXT NOT NULL,
    body TEXT NOT NULL,
    created_date INTEGER NOT NULL
);
...

}

my $bbs = MiniBBS::Service::BBS->new(
    connect_info => [$connect_info],
);
isa_ok($bbs, 'MiniBBS::Service::BBS');

{
    # no message
    my $messages = $bbs->messages;
    is( $messages->count, 0, 'no message ok');
}

{
    # insert message
    my $user = 'user ' . time;
    my $body = 'test ' . time;
    my $new_message = $bbs->add_message({ user => $user, body => $body });
    ok( $new_message, 'create message ok' );

    my $messages = $bbs->messages;
    is( $messages->count, 1, 'count 1 ok' );
    is( $messages->first->user, $user, 'user ok');
    is( $messages->first->body, $body, 'body ok');
}
