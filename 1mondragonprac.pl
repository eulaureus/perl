#!perl

use warnings;
use strict;

my $var1;
my $var2;
my $opcion;


sub menu 
{
print "elige una opcion \n 1)suma 2)resta 3)multiplicacion 4)division)";
chomp ($opcion=<STDIN>);
print "dame el primer numero ";
chomp ($var1=<STDIN>);
print "dame el segundo numero ";
chomp ($var2=<STDIN>);

}


sub suma 
{
	print $_[0]+$_[0],"\n"; 


}


sub resta
{
        print $_[0]-$_[0],"\n";

}


sub multi
{
        print $_[0]*$_[0],"\n";

}


sub divi
{
        print $_[0]/$_[0],"\n";

}

&menu();
if ($opcion==1)
{
	&suma($var1,$var2);
}

if ($opcion==2)
{
        &resta($var1,$var2);
}

if ($opcion==3)
{
        &multi($var1,$var2);
}

if ($opcion==4)
{
        &divi($var1,$var2);
}













