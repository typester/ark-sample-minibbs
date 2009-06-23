use inc::Module::Install;
name 'MiniBBS';
all_from 'lib/MiniBBS.pm';

requires 'Ark';

tests 't/*.t';

build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
