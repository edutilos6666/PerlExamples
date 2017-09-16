package DecisionMakingExample;
use strict;
use warnings FATAL => 'all';
no warnings 'experimental';
use 5.22.1;

# Switch does not work.
use PPIx::Regexp::Structure::Switch;


my $nl = "\r\n";

sub new {
    my $class = shift ;
    my  $self = {};
    bless $self, $class ;
    return $self;
}


# if ... elsif ... else
sub example1 {
    my $age  = 10 ;
    my $msg = "" ;
    if ($age > 0 && $age < 10) {
        $msg = "You are a kid."
    } elsif($age >= 10 && $age < 20) {
        $msg = "You are a teenager.";
    } elsif($age >= 20 && $age < 40) {
        $msg = "You are an adult.";
    } else {
        $msg = "You are an elderly.";
    }

    print "$msg $nl";
}


# given example
sub example2 {
   my $age = 10;
    my $msg = "d";

   given($age) {
       when($_ > 0 && $_ < 10) {
           $msg = "You are a kid.";
       }
       when($_ >= 10 && $_ < 20) {
           $msg =  "You are a teenager.";
       }
       when($_ >= 20 && $_ < 40)  {
           $msg = "You are an adult.";
       }
       when($_ >= 40 && $_ < 100){
           $msg = "You are an elderly.";
       }
       default {
           $msg = "You are too old.";
       }
   }

    print "$msg $nl";

}



1;