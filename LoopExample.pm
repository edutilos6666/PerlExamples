package LoopExample;
use strict;
use warnings FATAL => 'all';
no warnings 'experimental';
use 5.22.1;


my $nl = "\r\n";

sub new {
    my $class = shift ;
    my $self = {};
    bless $self, $class;
    return $self ;
}


# while example
sub example1 {
    my $n = 0 ;
    while ($n < 10) {
        print "n = $n $nl";
        $n++;
    }
}


# until example
sub example2 {
    my $n = 0 ;
    until($n >= 10)  {
        print "n = $n $nl";
        ++$n;
    }
}

# for example
sub example3  {
    for(my $n = 0 ; $n <10 ; ++$n) {
        print "n = $n $nl";
    }
}

# foreach example
sub example4 {
    my @names = ("foo", "bar", "bim", "pako");
    foreach my $name (@names) {
        print "name = $name $nl";
    }

    print $nl;

    my %props = ();
    $props{"foo" } =  10;
    $props{"bar"} =  20;
    $props{"bim"} =  30;
    my $key = "" ;
    foreach $key (keys %props) {
        my $value = $props{$key};
        print "$key => $value $nl";
    }

    print $nl;

    my $value = "" ;
    while (($key, $value) = each (%props)) {
      print "$key => $value $nl";
    }

}


# do ... while example
sub example5 {
    my $number = 0 ;

    do {
        print "number = $number $nl";
        ++$number;
    } while($number < 10);
}



# next keyword example
sub example6 {
    my $number = 0 ;
    while ($number < 10) {
        $number++;
        if($number == 5) {
            next;
        }
        print "number = $number $nl";
    }
}


# last keyword example
sub example7 {
    my $number = 0 ;
    while($number < 10) {
        $number++;
        if($number == 5) {
            last ;
        }

        print "number = $number $nl";
    }
}


# continue keyword example
sub example8 {
    my $number = 0 ;
    while($number < 10) {
        print "number = $number $nl";
    } continue {
        $number++;
        last if $number == 5 ;
    }
}

# redo keyword example
sub example9 {
    my $number = 0 ;
    while($number < 10) {
        $number++;
        if($number == 5) {
            redo;
        }
        print "number = $number $nl";

    }
}

# infinite loop example
sub example10 {
    # with while
    while(1) {

    }

    # with for loop
    for(; ; ) {

    }
}

1;