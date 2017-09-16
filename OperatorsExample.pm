package OperatorsExample;
use strict;
use warnings FATAL => 'all';

my $nl = "\r\n";


sub new {
    my $class = shift ;
    my $self = {};
    bless $self, $class ;
    return $self ;
}


sub arithmeticOps {
    my ($self, $x, $y)=  @_ ;
    my $resAdd = $x + $y ;
    my $resSubtract = $x - $y ;
    my $resMultiply = $x * $y ;
    my $resDivide = $x / $y ;
    my $resModulus = $x % $y ;
    my $resExponent = $x ** $y ;

    print "<<arithmetic Ops>>$nl";
    print "$x + $y = $resAdd $nl";
    print "$x - $y = $resSubtract $nl";
    print "$x * $y = $resMultiply $nl";
    print "$x / $y = $resDivide $nl";
    print "$x % $y = $resModulus $nl";
    print "$x ** $y = $resExponent $nl";
}



sub relationalOps {
    my ($self, $x, $y) = @_;

    my $resEq = $x == $y ;
    my $resNe = $x != $y ;
    my $resCmp = $x <=> $y ;
    my $resLt = $x < $y ;
    my $resLe = $x <= $y ;
    my $resGt = $x > $y ;
    my $resGe = $x >= $y ;

    print "<<relational Ops>>$nl";
    print "$x == $y = $resEq $nl";
    print "$x != $y = $resNe $nl";
    print "$x <=> $y = $resCmp $nl";
    print "$x < $y = $resLt $nl";
    print "$x <= $y = $resLe $nl";
    print "$x > $y = $resGt $nl";
    print "$x >= $y = $resGe $nl";

    $resEq = ($x eq $y);
    $resNe = ($x ne $y) ;
    $resCmp = ($x cmp $y) ;
    $resLt = ($x lt $y) ;
    $resLe = ($x le $y) ;
    $resGt = ($x gt $y) ;
    $resGe = ($x ge $y) ;
    print "$nl";
    print "$x eq $y = $resEq $nl";
    print "$x ne $y = $resNe $nl";
    print "$x cmp $y = $resCmp $nl";
    print "$x lt $y = $resLt $nl";
    print "$x le $y = $resLe $nl";
    print "$x gt $y = $resGt $nl";
    print "$x ge $y = $resGe $nl";
}



sub logicalOps {
    my ($self, $x, $y) = @_;
    my $resAnd1 = ($x && $y);
    my $resAnd2 = ($x and $y);
    my $resOr1 = ($x || $y);
    my $resOr2 = ($x or $y);
    my $resNotX = not($x);
    my $resNotY = not($y);

    print "<<logical Ops>>$nl";
    print "$x && $y = $resAnd1 $nl";
    print "$x and $y = $resAnd2 $nl";
    print "$x || $y = $resOr1 $nl";
    print "$x or $y = $resOr2 $nl";
    print "not($x) = $resNotX $nl";
    print "not($y) = $resNotY $nl";
}



1;