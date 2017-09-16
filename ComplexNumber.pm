package ComplexNumber;
use strict;
use warnings FATAL => 'all';


# custom complex number example

sub new {
   my $class = shift;
    my $self = {
       re => shift ,
        im => shift
    };

    bless $self, $class ;
    return $self ;
}


# getters and setters
sub getRe {
    my $self = shift ;
    return $self->{re};
}

sub setRe {
    my ($self, $re) = @_;
    $self->{re} = $re if defined($re);
    return $self->{re};
}

sub getIm {
    my $self = shift ;
    return $self->{im};
}

sub setIm {
    my ($self, $im) = @_;
    $self->{im} = $im if defined($im);
    return $self->{im};
}


# add
sub add {
    my ($self, $other) = @_;
    my $ret = new ComplexNumber(0, 0);
    $ret->{re} = $self->{re} + $other->{re};
    $ret->{im} = $self->{im} + $other->{im};
    return $ret ;
}

# subtract
sub subtract {
    my ($self, $other) = @_;
    my $ret = new ComplexNumber(0, 0);
    $ret->{re} = $self->{re} - $other->{re};
    $ret->{im} = $self->{im}- $other->{im};
    return $ret ;
}


# multiply
sub multiply_by_factor {
    my ($self, $factor) = @_;
    my $ret = new ComplexNumber(0, 0);
    $ret->{re} = $self->{re} * $factor;
    $ret->{im} = $self->{im} * $factor;
    return $ret ;
}

sub multiply {
    my ($self, $other) = @_;
    my $ret = new ComplexNumber(0, 0);
    $ret->{re} = $self->{re}* $other->{re} - $self->{im}*$other->{im};
    $ret->{im} = $self->{re} * $other->{im} + $self->{im} * $other->{re};
    return $ret ;
}

sub divide_by_factor {
    my ($self, $factor) = @_;
    my $ret = new ComplexNumber(0, 0);
    $ret->{re} = $self->{re} / $factor;
    $ret->{im} = $self->{im} / $factor;
    return $ret ;
}

sub divide {
    my ($self, $other) = @_;
    my $ret = new ComplexNumber(0, 0);
    my $f = $other->{re}* $other->{re} + $other->{im}* $other->{im};
    my $temp = new ComplexNumber($other->{re}, -$other->{im});
    $temp = $self->multiply($temp);
    return $temp->divide_by_factor($f);
}


sub toString() {
    my $self = shift ;
    my ($re, $im) = ($self->{re}, $self->{im});
    return "$re + i*($im)\n";
}

1;