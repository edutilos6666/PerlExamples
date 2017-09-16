package MiscellaneousExample;
use strict;
use warnings FATAL => 'all';
no warnings 'experimental';
use 5.22.1;

my $nl = "\r\n";


sub new {
   my $class = shift ;
    my $self = {};
    bless $self, $class;
    return $self;
}






# reference example
sub example1 {
  my $number = 10 ;
    my @names = ("foo", "bar", "bim");
    my %props = ("foo", 10, "bar", 20 , "bim", 30);

    sub temp_fn {
        my (%props2)  = @_;
        my ($key, $value);
        while (($key, $value) = each(%props2)) {
            print "$key => $value $nl";
        }
    }



   my $scalar_ref = \$number ;
    my $array_ref = \@names ;
    my $hash_ref = \%props;
    my $fn_ref = \&temp_fn ;   # function reference


    my $descalar_ref = $$scalar_ref;
    print "declarar_ref = $descalar_ref $nl";
    my @dearray_ref = @$array_ref ;
    print "dearray_ref = @dearray_ref $nl";
    my %dehash_ref = %$hash_ref;
    print "dehash_ref = ", %dehash_ref ,"$nl";
    &$fn_ref(%dehash_ref);


    # anonymous references to array and hash
    my $anon_names = ["foo", "bar", "bim"];
    my @deref_anon_names = @$anon_names;
    print "anon_names = @deref_anon_names $nl" ;

    my $anon_props = {"foo"=> 10 , "bar"=> 20 , "bim"=> 30};
    my %deref_anon_props = %$anon_props;
    print "anon_props = " , %deref_anon_props , $nl;

}


# inner function example
sub example2 {
#    that is actually global nested function , i want local nested function
#    sub add {
#        my ($x, $y) = @_ ;
#        return $x + $y ;
#    }

    local *add  = sub {
        my ($x, $y) = @_ ;
        return $x + $y ;
    };

    local *subtract = sub {
        my ($x, $y) = @_;
        return $x - $y ;
    };

    local *multiply = sub {
        my ($x, $y) = @_;
            return $x * $y;
    };

    local *divide = sub {
        my ($x, $y) = @_;
        return $x / $y;
    };



    my ($x, $y) = (10 , 3);
    my $resAdd = add($x, $y);
    my $resSubtract = subtract($x, $y);
    my $resMultiply = multiply($x, $y);
    my $resDivide = divide($x, $y);

    my $msg = "$x + $y = $resAdd
$x - $y = $resSubtract
$x * $y = $resMultiply
$y / $y = $resDivide
";

    print $msg ;



    local *printProps = sub {
        my ($id, $name, $age, $wage , $active) = @_;
        my $msg = "id = $id
name = $name
age = $age
wage = $wage
active = $active";

        print "<<printProps>>$nl";
        print $msg . $nl;
    };


    printProps(1, "foo", 10 , 100.0, 1);


     local *summaryStatistics = sub {
         my @numbers = @_;
         my $size = @numbers ;
         my ($min , $max, $sum);
         my $number ;
         $min = $numbers[0];
         $max = $numbers[0];
         foreach $number (@numbers) {
             $sum += $number ;
             if($min > $number) {
                 $min = $number ;
             }

             if($max < $number) {
                 $max = $number;
             }
         }


         my $avg = $sum/ $size;

         my $msg = "numbers = @numbers
sum = $sum
size = $size
avg = $avg
min = $min
max = $max";

         print "<<summaryStatistics>>$nl";
         print $msg . $nl;

     };


     summaryStatistics(10, 20, 30, 40,50);
}



# format example
sub example3 {
    my ($lblId, $lblName, $lblAge, $lblWage, $lblActive, $id, $name, $age, $wage, $active);
    format STDOUT =
    ==============================================
    @<<<<<<< @<<<<<<< @<<<<<<< @<<<<<<< @<<<<<<<
    $lblId,$lblName,$lblAge,$lblWage,$lblActive
    @#       @<<<<<<< @##     @###.##   @######
    $id,$name,$age,$wage,$active
    ==============================================
.

#    select(STDOUT);
    #$~ = PERSON;
#    open(PERSON);

    my @ids = (1, 2, 3);
    my @names = ("foo", "bar", "bim");
    my @ages = (10, 20, 30);
    my @wages = (100.0, 200.0, 300.0);
    my @actives = (1, 1, 0);

    my $i = 0 ;
    ($lblId , $lblName, $lblAge , $lblWage, $lblActive) = ("ID", "NAME", "AGE", "WAGE", "ACTIVE");
    foreach(@ids) {
      $id = $_;
      $name = $names[$i];
      $age = $ages[$i];
      $wage = $wages[$i];
      $active = $actives[$i++];
      write ;
    }

}



# format example2
sub example4 {
    my ($lblId, $lblName, $lblAge, $lblWage, $lblActive, $id, $name, $age, $wage, $active);
    format PERSON =
==============================================
@<<<<<<< @<<<<<<< @<<<<<<< @<<<<<<< @<<<<<<<
$lblId,$lblName,$lblAge,$lblWage,$lblActive
@#       @<<<<<<< @##     @###.##   @######
$id,$name,$age,$wage,$active
==============================================
.

    select(PERSON);
#    $~ = "PERSON";
    open(PERSON, ">person.txt") or die("could not open person.txt file.");

    my @ids = (1, 2, 3);
    my @names = ("foo", "bar", "bim");
    my @ages = (10, 20, 30);
    my @wages = (100.0, 200.0, 300.0);
    my @actives = (1, 1, 0);

    my $i = 0 ;
    ($lblId , $lblName, $lblAge , $lblWage, $lblActive) = ("ID", "NAME", "AGE", "WAGE", "ACTIVE");
    foreach(@ids) {
        $id = $_;
        $name = $names[$i];
        $age = $ages[$i];
        $wage = $wages[$i];
        $active = $actives[$i++];
        write(PERSON);
    }

}



1;