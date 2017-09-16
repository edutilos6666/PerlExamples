package SendingEmailExample;
use strict;
use warnings FATAL => 'all';

no warnings 'experimental';
use 5.22.1;

# Email::Send is deprecated
use Email::Sender::Simple qw(sendmail);
use Email::Simple;
use Email::Simple::Creator;

use Email::Sender::Transport::SMTP qw();
use Try::Tiny;
use Net::SMTP::TLS ;
use Net::SMTP::SSL ;


my $nl = "\r\n";

sub new {
    my $class = shift ;
    my $self = {};
    bless $self, $class;
    return $self;
}


# does not work properly!
sub example1 {
    my $message = "Hello Perl";
    my $FROM = 'edutilosaghayev@gmail.com';
    my $SMTP_HOSTNAME = "smtp.gmail.com";
    my $SMTP_PORT = 587;
    my $TO = 'Nijat.Aghayev@ruhr-uni-bochum.de';
#    my $TO = 'edutilosaghayev@yahoo.com';

    my ($USER, $PASSWORD) = ("", "");

    try {
#        sendmail(
#            $message,
#            {
#                from => $SMTP_ENVELOPE_FROM_ADDRESS,
#                to => $TO ,
#                transport => Email::Sender::Transport::SMTP->new({
#                    host => $SMTP_HOSTNAME,
#                    port => $SMTP_PORT,
#                })
#            }
#        );

# gmail tls port 587
        my $sender = new Net::SMTP::SSL(
                'smtp.gmail.com',
#                Hello => 'edutilosaghayev@gmail.com',
#                Hello => 'localhost',
                Port => 465,
                User => $USER,
                Password => $PASSWORD,
            );

        $sender->send($message,
            $message,
                    {
                        from => $FROM,
                        to => $TO ,});



    } catch {
        warn "sending failed: $_";
    };
}




1;