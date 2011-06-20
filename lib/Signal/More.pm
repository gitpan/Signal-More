#
# This file is part of Signal-More
#
# This software is copyright (c) 2011 by Leon Timmermans.
#
# This is free software; you can redistribute it and/or modify it under
# the same terms as the Perl 5 programming language system itself.
#
package Signal::More;
BEGIN {
  $Signal::More::VERSION = '0.002';
}

use strict;
use warnings FATAL => 'all';

our $VERSION;

use XSLoader;
use Sub::Exporter -setup => { exports => [qw/sigwait sigqueue/] };

XSLoader::load(__PACKAGE__, $VERSION);

1;    # End of Signal::More

#ABSTRACT: Various signal handling functions



=pod

=head1 NAME

Signal::More - Various signal handling functions

=head1 VERSION

version 0.002

=head1 SYNOPSIS

 use Signal::More qw/sigqueue sigwait/;
 use Signal::Mask;
 
 $Signal::Mask{USR1}++;
 sigqueue($$, 'USR1');
 sigwait('USR1');

=head1 FUNCTIONS

=head2 sigqueue($pid, $sig, $value = 0)

Queue a signal $sig to process $pid, optionally with the additional argument $value. On error an exception is thrown. $sig must be either a signal number(C<14>) or a signal name (C<'ALRM'>).

=head2 sigwait($signals, $timeout = undef)

Wait for a signal in $signals to arrive and return it. The signal handler (if any) will not be called. Unlike signal handlers it is not affected by signal masks, in fact you are expected to mask signals you're waiting for. C<$signals> must either be a POSIX::SigSet object, a signal number or a signal name. If C<$timeout> is specified, it indicates the maximal time the thread is suspended in fractional seconds; if no signal is received it returns an empty list, or in void context an exception. If $timeout is not defined it may wait indefinitely until a signal arrives. On success it returns a hash with the following entries:

=over 4

=item * signo

The signal number

=item * code

The signal code, a signal-specific code that gives the reason why the signal was generated

=item * errno

If non-zero, an errno value associated with this signal

=item * pid

Sending process ID

=item * uid

Real user ID of sending process

=item * addr

The address of faulting instruction

=item * status

Exit value or signal

=item * band

Band event for SIGPOLL

=item * value

Signal value as passed to sigqueue

=back

Note that not all of these will have meaningful values for all or even most signals

=head1 SEE ALSO

=over 4

=item * L<Signal::Mask>

=item * L<POSIX>

=back

=head1 AUTHOR

Leon Timmermans <fawaka@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Leon Timmermans.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut


__END__

