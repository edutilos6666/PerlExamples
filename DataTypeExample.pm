package DataTypeExample;
use strict;
use warnings FATAL => 'all';
no warnings 'experimental';
use 5.22.1;

my $nl = "\r\n";

sub new {
    my $class = shift;
    my $self = {};
    bless $self, $class ;
    return $self;
}


sub printArray {
    my ($label , @arr) = @_;
    print "<<$label>> $nl";
    foreach my $number (@arr) {
        print "$number ; ";
    }
    print $nl ;
}
sub arrayExample {
   my @numbers = (1, 2, 3);
    push(@numbers, 4);
    unshift(@numbers , 10);
    printArray("Numbers", @numbers);
    print $nl;

    my @names = ("foo", "bar", "bim");
    push(@names , "edu");
    push(@names , "tilos");
    unshift(@names, "pako");
    unshift(@names, "deko");
    printArray("Names", @names);
    print $nl;

    @numbers = (1..10);
    printArray("Sequential Numbers", @numbers);
    print $nl;

    my @letters = ("a".."z");
    printArray("Letters", @letters);
    print $nl;

    @letters = ("A".."Z");
    printArray("Letters Uppercase", @letters);
    print $nl;


    # array slicing
    my @weekdays = qw/Sun Mon Tue Wed Thu Fri Sat/;
    my @ret = @weekdays[1, 3, 5];
    printArray("Ret", @ret);  # Mon ; Wed ; Fri ;
    print $nl;
    @ret = @weekdays[1..5];
    printArray("Ret", @ret);  # Mon ; Tue ; Wed ; Thu ; Fri ;
    print $nl;


    # splice
    @numbers = (10 , 20 , 30, 40, 50);
    @names = ("foo", "bar", "bim");
    splice(@numbers , 2, 2, @names);
    printArray("Spliced numbers", @numbers);
    print $nl;


    # split
    my $names_str = "foo,bar,bim,pako";
    @names = split(",", $names_str);
    printArray("splitted names", @names);
    print $nl;


    $names_str = "foo#bar#bim#pako";
    @names = split("#", $names_str);
    printArray("splitted names", @names);
    print $nl;

    # join
    $names_str = join("+", @names);
    print "names_str = $names_str $nl";

    # sort
    @numbers = (100, 90, 80, 70, 60);
    @numbers = sort(@numbers);
    printArray("sorted numbers", @numbers);
    print $nl;

    # merging
    @numbers = (1, 2, (3, 4, 5));
    printArray("merged numbers", @numbers);
    print $nl ;
    my @odds = (1, 3, 5, 7, 9);
    my @evens = (0, 2, 4, 6, 8);
    @numbers = (@odds, @evens);
    printArray("merged numbers 2", @numbers);
    print $nl;
}



sub hashExample {
    # using "" for keys
    my %people  = ("foo", 10 , "bar", 20 , "bim", 30);
    # using - for keys
    my %people2 = (-foo, 10, -bar,20, -bim,30);

    # getting keys
    my @keys = keys %people ;
    printArray("Keys", @keys);
    print $nl;
    # getting values
    my @values = values %people;
    printArray("Values", @values);
    print $nl;

    # getting size
    my $size = @keys ;
    print "size = $size $nl";

    # adding values
    $people{"pako"} = 40 ;
    $people{"deko"} = 50 ;

    # printing hash
    my ($key, $value) = ("", "");
    while (($key, $value) = each(%people)) {
        print "$key => $value $nl";
    }

    print $nl;
    # or
    @keys = keys %people;
    foreach $key (@keys) {
        $value = $people{$key};
        print "$key => $value $nl";
    }
    print $nl;

    # checking if value exists
    my $res = exists $people{"foo"};
    print "foo key exists = $res $nl";
    $res = exists $people{"edutilos"};
    print "edutilos key exists = $res $nl";


    # deleting entry
    delete $people{"foo"};
    $res = exists $people{"foo"};
    print "foo key exists(after deletion) = $res $nl";


}


1;