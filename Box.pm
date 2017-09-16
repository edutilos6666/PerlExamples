package Box;
use strict;
use warnings FATAL => 'all';


# simple box (3-d shape) example

sub new {
   my $class = shift ;
   my $self = {
       width => shift ,
        height => shift ,
        depth => shift
    };

    bless $self, $class ;
    return $self;
}


sub getWidth {
    my $self = shift;
    return $self->{width};
}

sub setWidth {
    my ($self, $width) = @_ ;
    $self->{width} = $width if defined($width);
    return $self->{width};
}

sub getHeight {
    my $self = shift ;
    return $self->{height};
}

sub setHeight {
    my ($self, $height) =  @_;
    $self->{height} = $height if defined($height);
    return $self->{height};
}

sub getDepth {
    my $self = shift;
    return $self->{depth};
}

sub setDepth {
    my ($self, $depth) = @_;
    $self->{depth} = $depth if defined($depth);
    return $self->{depth};
}


sub volume {
    my $self = shift;
    return $self->{width}*$self->{height}*$self->{depth};
}


sub add {
    my ($self, $other) = @_;
    my $ret = new Box(0, 0,0);
    my $retWidth = $self->{width} + $other->{width};
    my $retHeight = $self->{height} + $other->{height};
    my $retDepth = $self->{depth} + $other->{depth};
    $ret->{width} = $retWidth ;
    $ret->{height} = $retHeight;
    $ret->{depth} = $retDepth;
    return $ret ;
}


sub subtract {
    my ($self, $other) = @_;
    my $ret = new Box(0, 0, 0);
    $ret->{width} = $self->{width} - $other->{width};
    $ret->{height} = $self->{height} - $other->{height};
    $ret->{depth} = $self->{depth} - $other->{depth};
    return $ret;
}


sub multiply {
    my ($self, $other) = @_;
    my $ret = new Box(0, 0, 0);
    $ret->{width} = $self->{width} * $other->{width};
    $ret->{height} = $self->{height}* $other->{height};
    $ret->{depth} = $self->{depth}* $other->{depth};
    return $ret;
}


sub divide {
    my ($self, $other) = @_;
    my $ret = new Box(0, 0,0);
    $ret->{width} = $self->{width} / $other->{width};
    $ret->{height} = $self->{height} / $other->{height};
    $ret->{depth} = $self->{depth} / $other->{depth};
    return $ret;
}



sub eq {
    my ($self, $other) = @_;
    my ($vol1, $vol2) = ($self->volume(), $other->volume());
    my $ret = 0;
    $ret = 1 if ($vol1 == $vol2);
    return $ret ;
}

sub ne {
    my ($self, $other) = @_;
    my ($vol1 , $vol2) = ($self->volume(), $other->volume());
    my $ret = 0 ;
    $ret = 1 if ($vol1 != $vol2);
    return $ret ;
}


sub lt {
    my ($self, $other) = @_;
    my ($vol1, $vol2) = ($self->volume(), $other->volume());
    my $ret = 0;
    $ret = 1 if ($vol1 < $vol2);
    return $ret ;
}

sub le {
    my ($self, $other) = @_;
    my ($vol1, $vol2) = ($self->volume(), $other->volume());
    my $ret = 0 ;
    $ret = 1 if ($vol1 <= $vol2);
    return $ret ;
}

sub gt {
    my ($self, $other) = @_;
    my ($vol1, $vol2) = ($self->volume(), $other->volume());
    my  $ret = 0;
    $ret = 1 if($vol1 > $vol2);
    return $ret ;
}

sub ge {
    my ($self, $other) = @_;
    my ($vol1, $vol2) = ($self->volume(), $other->volume());
    my $ret = 0;
    $ret = 1 if ($vol1 >= $vol2);
    return $ret ;
}



1;