package DatabaseExample;
use strict;
use warnings FATAL => 'all';
no warnings 'experimental';
use 5.22.1;
use DBI;

my $nl = "\r\n";

use Worker ;

sub new {
    my $class = shift;
    my $self = {};
    bless $self, $class;
    return $self;
}


sub example1 {
  my ($driver, $dbname , $user, $password ) = ("mysql", "perldb", "root", 'root');
   my $dsn = "DBI:$driver:database=$dbname";
    # connect
    my $dbh = DBI->connect($dsn , $user, $password) or die DBI::errstr ;

    print "connection success! $nl";

    # create table
    my $tableName = "Worker";
    my $sql = "drop table if exists $tableName";
    my $pstmt = $dbh->prepare($sql);
    $pstmt-> execute() or die DBI::errstr;

    $sql = "create table if not exists $tableName (
id bigint primary key ,
name varchar(50) not null,
age int not null,
wage double not null ,
active boolean not null
)";

     $pstmt = $dbh->prepare($sql);
     $pstmt->execute() or die DBI::errstr ;

    # insert rows into table
    my @workers = (
       new Worker(1, "foo", 10, 100.0, 1),
        new Worker(2, "bar", 20, 200.0, 0),
        new Worker(3, "bim", 30, 300.0, 1)
    );

    $sql = "insert into $tableName VALUES(?,?,?,?,?)";
    $pstmt = $dbh->prepare($sql);

    for my $worker (@workers) {
      my ($id , $name, $age, $wage, $active) = ($worker->getId(), $worker->getName(), $worker->getAge(),
                                              $worker->getWage(), $worker->isActive());

      $pstmt->execute($id, $name, $age, $wage, $active);
    }



    # select all workers
    $sql = "select * from $tableName";
    $pstmt = $dbh->prepare($sql);
    $pstmt->execute() or die DBI::errstr ;

    print "<<all Workers>>$nl";
    while(my @row = $pstmt->fetchrow_array()) {
        my ($id , $name, $age, $wage, $active) = @row ;
        print "$id , $name, $age, $wage, $active $nl";
    }


    # update table
    $sql = "update $tableName set name = ? , age = ?, wage = ?, active = ? where id = ?";
    $pstmt = $dbh->prepare($sql);
    $pstmt->execute("new_foo", 66, 666.6, 0, 1) or die DBI::errstr ;

    # select one person
    $sql = "select * from $tableName where id = ?";
    $pstmt = $dbh->prepare($sql);
    $pstmt->execute(1) or die DBI::errstr ;
    print "<<worker by id = 1>> $nl";
    while(my @row = $pstmt->fetchrow_array()) {
        my ($id , $name, $age, $wage, $active) = @row ;
        print "$id , $name, $age, $wage, $active $nl";
    }


    # delete one person
    $sql = "delete from $tableName where id = ?";
    $pstmt = $dbh->prepare($sql);
    $pstmt->execute(1) or die DBI::errstr;

    $sql = "select * from $tableName";
    $pstmt = $dbh->prepare($sql);
    $pstmt->execute() or die DBI::errstr;
    print "<<all workers after delete by id = 1>> $nl";
    while(my @row = $pstmt->fetchrow_array()) {
        my ($id , $name, $age, $wage, $active) = @row ;
        print "$id , $name, $age, $wage, $active $nl";
    }



    # truncate table
    $sql = "truncate $tableName";
    $pstmt = $dbh->prepare($sql);
    $pstmt->execute();


    # disconnect
    $dbh->disconnect() or die DBI::errstr;
}

1;