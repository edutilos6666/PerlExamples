#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

#no warnings 'experimental';
#use 5.22.1;

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
 </body>
</html>
";

print $msg ;


