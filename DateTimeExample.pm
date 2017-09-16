package DateTimeExample;
use strict;
use warnings FATAL => 'all';
no warnings 'experimental';
use 5.22.1;
use POSIX qw(strftime);
use Time::Piece;


my $nl = "\r\n";

sub new {
    my $class = shift ;
    my $self = {};
    bless $self, $class ;
    return $self;
}


sub example1 {
    my $t = localtime($^T);
    my $year = $t->year ;
    my $month = $t->month;
    my $day = $t -> mday;
    my ($hour , $minute , $second) = ($t->hour , $t->minute , $t->second);
    print "year = $year $nl";
    print "month = $month $nl";
    print "day = $day $nl";
    print "hour = $hour $nl";
    print "minute = $minute $nl";
    print "second = $second $nl";
    print $nl;

    my ($wday , $yday, $isdst); # = ("", "", "");

    ($second , $minute , $hour , $day , $month , $year, $wday, $yday, $isdst) = localtime(time);

    $year += 1900;
    $month += 1 ;
    print "year-month-day  = $year-$month-$day $nl";
    print "hour:minute:second = $hour:$minute:$second $nl";
    print "wday = $wday $nl";
    print "yday = $yday $nl";
    print "isdst = $isdst $nl";

    print $nl;

    my $datestring = localtime();
    print $datestring . $nl;


    $datestring = gmtime();
    print $datestring . $nl;

    my $epoch = time();
    print "epoch in ms = $epoch $nl";


    my $pattern = "%Y/%m/%d Time: %H:%M:%S";
    $datestring = strftime $pattern, localtime();
    print $datestring . $nl;
    $datestring = strftime $pattern , gmtime;
    print "gmtime = $datestring $nl";
}

1;