#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';


#no warnings 'experimental';
#use 5.22.1;

# cd /opt/lampp/cgi-bin/perl
# cp /home/edutilos/WebstormProjects/PerlExamples/CgiExample1.pl .
# sudo chmod 777 *

# and after starting lamp ( sudo /opt/lampp/lampp start )
# go to following link: http://localhost/cgi-bin/perl/CgiExample1.pl

use Worker;


sub generateWorkerData {
    my @ret = (
       new Worker(1, "foo", 10, 100.0, 1),
        new Worker(2, "bar", 20, 200.0, 0),
        new Worker(3, "bim", 30 ,300.0, 1)
    );
}

sub createTable {
   my $ret = "<table><tr><th>Id</th><th>Name</th><th>Age</th><th>Wage</th><th>Active</th></tr>";
    my @workers = generateWorkerData();
    for my $worker(@workers) {
        my ($id, $name, $age, $wage, $active) = ($worker->getId(), $worker->getName(), $worker->getAge(),
            $worker->getWage(), $worker->isActive());

        my $temp = "<tr>
<td>$id</td>
<td>$name</td>
<td>$age</td>
<td>$wage</td>
<td>$active</td>
</tr>";

        $ret .= $temp;
    }

    $ret .= "</table>";
    return $ret ;
}



my $workerTable = createTable();
my $msg = "Content-type:text/html

<html>
 <head>
  <title>CgiExample1.pm</title>
 </head>
 <body>
  <h1>Heading1</h1>
  <h2>Heading2</h2>
  <h3>Heading3</h3>
  <h4>Heading4</h4>
  <h5>Heading5</h5>
  <h6>Heading6</h6>

  <h1>Workers</h1>
  $workerTable
 </body>
</html>
";

print $msg ;


