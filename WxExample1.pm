package WxExample1;
use strict;
use warnings FATAL => 'all';
use strict;
use warnings FATAL => 'all';

no warnings 'experimental';
use 5.22.1;

use Wx;

use base 'Wx::App';

sub OnInit {
    my ($self) = @_ ;

    my $frame = Wx::Frame->new (
        undef,
        -1 ,
        'Hello World',
        [-1,-1],
        [500, 500],
    );

    $frame->Show(1);
    return 1;
}


1 ; 