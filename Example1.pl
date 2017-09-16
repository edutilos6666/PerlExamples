#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

print "hello world\n";

my $newline = "\r\n";
my $id = 1;
my $name = "foo";
my $age = 10 ;
my $wage = 100.0;
my $active = 1 ;

print "id = $id$newline";
print "name = $name$newline";
print "age = $age$newline";
print "wage = $wage$newline";
print "active = $active$newline";



my @numbers = (10, 20 , 30, 40);
print "<<numbers>>$newline";
print "numbers[0] = $numbers[0]$newline";
print "numbers[1] = $numbers[1]$newline";
print "numbers[2] = $numbers[2]$newline";
print "numbers[3] = $numbers[3]$newline";


my @names = ("foo", "bar", "bim");
print "<<names>>$newline";
print "names[0] = $names[0]$newline";
print "names[1] = $names[1]$newline";
print "names[2] = $names[2]$newline";



my %people = ("foo", 10 , "bar", 20, "bim", 30);
print "<<people>>$newline";
print "people{'foo'} = $people{'foo'}$newline";
print "people{'bar'} = $people{'bar'}$newline";
print "people{'bim'} = $people{'bim'}$newline";




# variable context
print "$newline";
@names = ("foo", "bar", "bim");
my @copy = @names;
my $size = @names ;

print "copy = @copy$newline";
print "size of names = $size$newline";



# subroutines
sub hello {
   print "hello world\n";
}


hello();



sub printProps {
    my ($id, $name, $age, $wage, $active) = @_;
    print "<<printProps>>$newline";
    print "id = $id$newline";
    print "name = $name$newline";
    print "age = $age$newline";
    print "wage = $wage$newline";
    print "active = $active$newline";
}



printProps(1, "foo", 10, 100.0, 1);



sub printProps2 {
    my $id = shift ;
    my $name = shift;
    my $age = shift;
    my $wage = shift;
    my $active = shift ;
    print "<<printProps2>>$newline";
    print "id = $id$newline";
    print "name = $name$newline";
    print "age = $age$newline";
    print "wage = $wage$newline";
    print "active = $active$newline";
}


printProps2(1, "foo", 10, 100.0, 1);




sub printProps3 {
    my $id = $_[0];
    my $name = $_[1];
    my $age = $_[2];
    my $wage = $_[3];
    my $active = $_[4];
    print "<<printProps3>>$newline";
    print "id = $id$newline";
    print "name = $name$newline";
    print "age = $age$newline";
    print "wage = $wage$newline";
    print "active = $active$newline";
}


printProps3(1, "foo", 10, 100.0, 1);







# return value from sub routine
sub volume {
    my ($width , $height , $depth ) = @_ ;

    my $res;
    $res = $width * $height * $depth ;
    return $res ;
}


my $volume_res = volume(10, 20, 30);
print "volume = $volume_res$newline";




# oop
use Person;
my $p1 = new Person("foo", "bar", 10);
my $firstName = $p1->{_firstName};
my ($lastName , $ssn) = ($p1->{_lastName}, $p1->{_ssn});
print "firstName = $firstName$newline";
print "lastName = $lastName$newline";
print "ssn = $ssn$newline";

$p1->setFirstName("new_foo");
$firstName = $p1->getFirstName();
print "new firstName = $firstName$newline";


$p1->setLastName("new_bar");
$lastName = $p1->getLastName();
print "new lastName = $lastName$newline";


$p1->setSsn(123);
$ssn = $p1->getSsn();
print "new ssn = $ssn$newline";


use Worker;
my $w1 = new Worker(1, "foo", 10, 100.0, 1);
my $workerId = $w1->getId();
my $workerName = $w1->getName();
my ($workerAge, $workerWage, $workerActive) = ($w1->getAge(), $w1->getWage(), $w1->isActive());
print "<<worker properties>>$newline";
print "workerId = $workerId $newline";
print "workerName = $workerName $newline";
print "workerAge = $workerAge $newline";
print "workerWage = $workerWage $newline";
print "workerActive = $workerActive $newline";


$w1->setId(2);
$w1->setName("bar");
$w1->setAge(20);
$w1->setWage(200.0);
$w1->setActive(0);


($workerId , $workerName, $workerAge, $workerWage, $workerActive) = ($w1->getId(), $w1->getName(), $w1->getAge(), $w1->getWage(), $w1->isActive());
print "<<worker new properties>>$newline";
print "workerId = $workerId $newline";
print "workerName = $workerName $newline";
print "workerAge = $workerAge $newline";
print "workerWage = $workerWage $newline";
print "workerActive = $workerActive $newline";



# inheritance exampel
use Employee ;
my $emp =  new Employee(1, "foo", 10, 100.0, 1);
my ($empId , $empName, $empAge, $empWage, $empActive) = ($emp->getId(), $emp->getName(), $emp->getAge(), $emp->getWage(), $emp->isActive());
print "<<employee infos>>$newline";
print "empId = $empId $newline";
print "empName = $empName $newline";
print "empAge = $empAge $newline";
print "empWage = $empWage $newline";
print "empActive = $empActive $newline";

