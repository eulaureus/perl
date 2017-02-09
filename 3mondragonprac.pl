#!perl

use warnings;
use strict;

my $var1;
my $var2;
my $opcion;
my @arreglo=();
my $resultado;

my %HoF = (
   #llaves      # Compose a hash of functions
    salir   =>  sub { print @arreglo; exit; },
    mod	    =>  sub {return $_ [0] % $_ [1];},
    suma    =>  \&suma,
    resta   =>  \&resta,
    multi   =>  \&multi,
    divi    =>  \&divi,
    help    =>  \&help,
);


while(1){
print "escribe una opcion","\n";
chomp ($opcion=<STDIN>);
print "escribe el primer numero";
chomp ($var1=<STDIN>);
print "escribe el segundo numero";
chomp ($var2=<STDIN>);

   if($HoF{lc $opcion})
   { #lc cambia una cadena a minusculas 
   		$HoF{lc $opcion}->($var1,$var2);
		push(@arreglo,$resultado);
   	}
   else {
    	warn "Unknown command: `$opcion'; Try `help' next time\n";
   	}
    }


sub suma 
{
	$resultado = $_[0]+$_[1];
	print "La suma es  :",$resultado,"\n";
	

}


sub resta
{
	$resultado = $_[0]-$_[1];
        print "La resta es  :",$resultado,"\n";

}


sub multi
{

       	$resultado = $_[0]*$_[1];
        print "La multiplicacion es :",$resultado,"\n";

}


sub divi
{
	$resultado = $_[0]/$_[1];
        print "La divicion es  :",$resultado,"\n";

}

sub help
{

	print "Debes escribir : suma resta multi  divi help para ayuda mod o salir";
	
}
