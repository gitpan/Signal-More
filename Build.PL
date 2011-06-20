
use strict;
use warnings;

use Module::Build 0.28;


my %module_build_args = (
  'build_requires' => {
    'ExtUtils::CBuilder' => '0',
    'File::Find' => '0',
    'File::Temp' => '0',
    'Module::Build' => '0.28',
    'POSIX' => '0',
    'Test::Exception' => '0',
    'Test::More' => '0',
    'Time::HiRes' => '0'
  },
  'configure_requires' => {
    'Module::Build' => '0.28'
  },
  'dist_abstract' => 'Various signal handling functions',
  'dist_author' => [
    'Leon Timmermans <fawaka@gmail.com>'
  ],
  'dist_name' => 'Signal-More',
  'dist_version' => '0.002',
  'license' => 'perl',
  'module_name' => 'Signal::More',
  'recommends' => {},
  'recursive_test_files' => 1,
  'requires' => {
    'Sub::Exporter' => '0',
    'XSLoader' => '0',
    'perl' => '5.006'
  },
  'script_files' => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
