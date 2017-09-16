package WxExample2;
use strict;
use warnings FATAL => 'all';


no warnings 'experimental';
use 5.22.1;

use Wx;

use base 'Wx::App';

sub OnInit {
    my ($self) = @_ ;


    my $framePos = Wx::Point->new(10, 10);
    my $frameSize = Wx::Size->new(500, 500);
    my $frameTitle = "Perl WX Example2";

    my $frame = Wx::Frame->new (
        undef, -1 , $frameTitle, $framePos , $frameSize);


    # add panelMain
    my $gs = Wx::GridSizer->new(7, 2, 3, 3);
    my $panelMain = Wx::Panel->new($frame);


    # title
    my $lblTitle = Wx::StaticText->new($panelMain, -1, "");
    $lblTitle->SetLabel("GridSizer Example");
    my $lblEmpty = Wx::StaticText->new($panelMain, -1, "");

    # id
    my $lblId = Wx::StaticText->new($panelMain, -1, "");
    $lblId->SetLabel("Id: ");
    my $fieldId = Wx::TextCtrl->new($panelMain, -1 , "");


    # name
    my $lblName = Wx::StaticText->new($panelMain , -1, "");
    $lblName->SetLabel("Name: ");
    my $fieldName = Wx::TextCtrl->new($panelMain , -1, "");


    # age
    my $lblAge = Wx::StaticText->new($panelMain , -1, "");
    $lblAge->SetLabel("Age: ");
    my $fieldAge = Wx::TextCtrl->new($panelMain , -1, "");


    # wage
    my $lblWage = Wx::StaticText->new($panelMain , -1, "");
    $lblWage->SetLabel("Wage: ");
    my $fieldWage = Wx::TextCtrl->new($panelMain , -1, "");

    # active
    my $lblActive = Wx::StaticText->new($panelMain , -1, "");
    $lblActive->SetLabel("Active: ");
    my $fieldActive = Wx::TextCtrl->new($panelMain , -1, "");


    # buttons
    my $btnOk = Wx::Button->new($panelMain , -1 , "Ok");
    my $btnClear = Wx::Button->new($panelMain , -1, "Clear");

    # adding components into gs
    $gs->Add($lblTitle);
    $gs->Add($lblEmpty);
    $gs->Add($lblId);
    $gs->Add($fieldId);
    $gs->Add($lblName);
    $gs->Add($fieldName);
    $gs->Add($lblAge);
    $gs->Add($fieldAge);
    $gs->Add($lblWage);
    $gs->Add($fieldWage);
    $gs->Add($lblActive);
    $gs->Add($fieldActive);
    $gs->Add($btnOk);
    $gs->Add($btnClear);

    $panelMain->SetSizer($gs);
#    $self->Centre();

    $frame->Show(1);
    return 1;
}


1 ; 