package Worker;
use strict;
use warnings FATAL => 'all';


sub new {
    my $class = shift;
    my $self = {
        id => shift,
        name => shift,
        age => shift,
        wage => shift,
        active => shift,
    };

    bless $self, $class;
    return $self ;

}


sub getId {
    my $self = shift ;
    return $self->{id};
}

sub setId {
    my ($self, $id) = @_;
    $self->{id} = $id if defined($id);
    return $self->{id};
}


sub getName {
    my $self = shift;
    return $self->{name};
}

sub setName {
    my ($self, $name) = @_;
    $self->{name} = $name if defined($name);
    return $self->{name};
}

sub getAge {
    my $self = shift;
    return $self->{age};
}

sub setAge {
    my ($self , $age) = @_;
    $self->{age} = $age if defined($age);
    return $self->{age};
}

sub getWage {
    my $self = shift;
    return $self->{wage};
}

sub setWage {
    my ($self, $wage) = @_;
    $self->{wage} = $wage if defined($wage);
    return $self->{wage};
}

sub isActive {
    my $self = shift;
    return $self->{active};
}

sub setActive {
    my ($self, $active) = @_;
    $self->{active} = $active if defined($active);
    return $self->{active};
}



1;