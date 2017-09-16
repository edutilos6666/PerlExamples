#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
no warnings 'experimental';
use 5.22.1;
#use Wx qw(:everything);
#use Wx::MDI;
my $nl = "\r\n";



use Box ;
use ComplexNumber;
use OperatorsExample ;
use DecisionMakingExample;
use LoopExample;
use DataTypeExample;
use DateTimeExample;
use MiscellaneousExample;
use FileIOExample;
use SendingEmailExample;
use DatabaseExample ;
use WxExample1;
use WxExample2;
#use wx::SimpleApp;

sub test_Box {
   my $b1 = new Box(3, 3, 3);
    my $b2 = new Box(2, 2, 2);

    my $volume_b1 = $b1->volume();
    my $volume_b2 = $b2->volume();

    print "volume_b1 = $volume_b1 $nl";
    print "volume_b2 = $volume_b2 $nl";


    my $bAdd = $b1->add($b2);
    my $vol = $bAdd->volume();
    print "vol bAdd = $vol $nl";

    my $bSubtract = $b1->subtract($b2);
    $vol = $bSubtract->volume();
    print "vol Subtract = $vol $nl";


    my $bMultiply = $b1->multiply($b2);
    $vol = $bMultiply->volume();
    print "vol Multiply = $vol $nl";

    my $bDivide = $b1->divide($b2);
    $vol = $bDivide->volume();
    print "vol Divide = $vol $nl";

    my $ret = $b1->eq($b2);
    print "b1 == b2 = $ret $nl";
    $ret = $b1->ne($b2);
    print "b1 != b2 = $ret $nl";

    $ret = $b1->lt($b2);
    print "b1 < b2 = $ret $nl";
    $ret = $b1->le($b2);
    print "b1 <= b2 = $ret $nl";
    $ret = $b1->gt($b2);
    print "b1 > b2 = $ret $nl";
    $ret = $b1->ge($b2);
    print "b1 >= b2 = $ret $nl";
}




sub test_ComplexNumber {
    my ($cn1, $cn2) = (new ComplexNumber(3,3), new ComplexNumber(2, 2));
    my $ret = $cn1->toString();
    print "cn1 = $ret";
    $ret = $cn2->toString();
    print "cn2 = $ret";

    my ($cnAdd, $cnSubtract , $cnMultiply , $cnDivide) = ($cn1->add($cn2),$cn1->subtract($cn2),
                                                          $cn1->multiply($cn2), $cn1->divide($cn2));

    $ret = $cnAdd->toString();
    print "cn1 + cn2 = $ret";
    $ret = $cnSubtract->toString();
    print "cn1 - cn2 = $ret";
    $ret = $cnMultiply->toString();
    print "cn1 * cn2 = $ret";
    $ret = $cnDivide->toString();
    print "cn1 / cn2 = $ret";

    my ($cnMultiplyBy2, $cnDivideBy2) = ($cn1->multiply_by_factor(2), $cn1->divide_by_factor(2));
    $ret = $cnMultiplyBy2->toString();
    print "cn1 * 2 = $ret";
    $ret = $cnDivideBy2->toString();
    print "cn1 / 2 = $ret";
}



sub test_OperatorsExample {
    my $opRunner = new OperatorsExample();
    my ($x, $y) = (10, 3);
    $opRunner->arithmeticOps($x , $y);
    $opRunner->relationalOps($x, $y);
    my ($a, $b) = (1 , 0);  # true and false
    $opRunner->logicalOps($a, $b);
}



sub test_DecisionMakingExample {
    my $runner = new DecisionMakingExample();
    $runner->example1();
    $runner->example2();
}

sub test_LoopExample {
    my $runner = new LoopExample();
#    $runner->example1();
#    $runner->example2();
#    $runner->example3();
#    $runner->example4();
#    $runner->example5();
#    $runner->example6();
#    $runner->example7();
#    $runner->example8();
    $runner->example9();
}



sub test_DataTypeExample {
    my $runner = new DataTypeExample();
#    $runner->arrayExample();
    $runner->hashExample();
}


sub test_DateTimeExample {
    my $runner = new DateTimeExample();
    $runner->example1();
}


sub test_MiscellaneousExample {
    my $runner = new MiscellaneousExample();
#    $runner->example1();
#    $runner->example2();
#    $runner->example3();
    $runner->example4();
}

sub test_FileIOExample {
    my $runner = new FileIOExample();
#    $runner->example1();
#    $runner->example2();
#    $runner->example3();
#    $runner->example4();
#    $runner->example5();
#    $runner->example6();
#    $runner->example7();
    $runner->example8();
}


sub test_SendingEmailExample {
    my $runner  = new SendingEmailExample();
#    $runner->example1();
    $runner->example2();
}


sub test_DatabaseExample {
    my $runner = new DatabaseExample();
    $runner->example1();
}

sub test_WxExample1 {
    my  $app = WxExample1->new ;
    $app->MainLoop;
}

sub test_WxExample2 {
    my  $app = WxExample2->new ;
    $app->MainLoop;
}



#test_Box();
#test_ComplexNumber();
#test_OperatorsExample();
#test_DecisionMakingExample();
#test_LoopExample();
#test_DataTypeExample();
#test_DateTimeExample();
#test_MiscellaneousExample();
#test_FileIOExample();
#test_SendingEmailExample();
#test_DatabaseExample();
#test_WxExample1();
test_WxExample2 ;