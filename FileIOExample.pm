package FileIOExample;
use strict;
use warnings FATAL => 'all';
no warnings 'experimental';
use 5.22.1;

use Worker;

my $nl = "\r\n";


sub new {
    my $class = shift ;
    my $self = {};

    bless $self, $class;
    return $self;
}

# writing into file
sub example1 {
    local *generateWorkerData = sub {
       my @ret = ();
       push(@ret , new Worker(1, "foo", 10, 100.0, 1));
       push(@ret , new Worker(2, "bar", 20, 200.0, 0));
       push(@ret , new Worker(3, "bim", 30, 300.0, 1));
       return @ret;
   };


    my @ret = generateWorkerData();

    my $filename = "workers.txt";
    my $msg ;
    # another way: open (my $fh , ">" , $filename) or die "";
    open(my $fh , ">$filename") or die "could not open file: $filename $nl";

    for my $worker (@ret) {
        my ($id, $name, $age, $wage, $active) = ($worker->getId(), $worker->getName(), $worker->getAge(),
                                         $worker->getWage(), $worker->isActive());

        $msg = "$id, $name, $age, $wage, $active$nl";
        print $fh $msg;
    }

    close $fh;
}

sub ltrim { my $s = shift; $s =~ s/^\s+//;       return $s };
sub rtrim { my $s = shift; $s =~ s/\s+$//;       return $s };
sub  trim { my $s = shift; $s =~ s/^\s+|\s+$//g; return $s };

# reading from file
sub example2 {



    my $filename = "workers.txt";
    my $line  ;
    open (my $fh , "<$filename") or die "could not open file: $filename $nl";
    while(<$fh>) {
        $_ = rtrim $_ ;
#        $line = $_;
#        print $_ . $nl;
        my @splitted = split ", ", $_ ;
        my ($id, $name, $age, $wage, $active) = @splitted ;
        print "$id , $name, $age, $wage, $active $nl";
    }


    close $fh ;
}



# file writing , appending and reading
sub example3 {
   local *generateWorkerData = sub {
       my @ret = (
           new Worker(1, "foo", 10, 100.0, 1),
           new Worker(2, "bar", 20, 200.0, 0),
           new Worker(3, "bim", 30, 300.0, 1)
       );

       return @ret ;
   };

    my @ret = generateWorkerData();

    my $filename = "workers2.txt";
    # open file for writing
    open (my $fh, ">$filename") or die "could not open $filename for writing.$nl";
    for my $worker(@ret) {
        my ($id , $name, $age, $wage, $active) = ($worker->getId(), $worker->getName(), $worker->getAge(),
                                            $worker->getWage(), $worker->isActive());
        my $msg = "$id,$name,$age,$wage,$active$nl";
        print $fh $msg;
    }

    close $fh ;


    # open file for appending
    open ($fh , ">>$filename") or die "could not open $filename for appending.$nl";

    my $w = new Worker(4, "pako", 40, 400.0, 1);
    my ($id, $name, $age, $wage, $active) = ($w->getId(), $w->getName(), $w->getAge(), $w->getWage(), $w->isActive());
    my $msg = "$id,$name,$age,$wage,$active$nl";
    print $fh $msg;

    close $fh ;


    # open file for reading
    open ($fh , "<$filename") or die "could not open $filename for reading.$nl";
    while(<$fh>) {
       my $line = $_;
        $line  = rtrim $line ;

        my @splitted = split ",", $line;
        my ($id, $name, $age, $wage, $active) = @splitted ;
        print "$id , $name, $age, $wage, $active $nl";
    }

    close $fh;

}


# writing form one file into another file
sub example4 {
    my ($in , $out) = ("workers2.txt", "workers3.txt");

    my ($fh_in , $fh_out);

    open ($fh_in , "<$in") or die "could not open $in $nl";
    open ($fh_out , ">$out") or die "could not open $out $nl";

    while(<$fh_in>) {
        print $fh_out $_;
    }

    close $fh_in ;
    close $fh_out ;
}

1;