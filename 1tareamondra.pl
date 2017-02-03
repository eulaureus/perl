#!perl

use strict;
use warnings;

=pod
=head1 Tarea 1 Mondragon Dennis
=head1 Descripcion
=head2 
*Crear una carpeta en git  con el nombre de su usuario
en el repositorio perl.git
*Investigar que es pod
*Realizar un programa sencillo que contenga pod y subirlo
*investigar que es un pragma
=head2
Se crea un ciclo foreach que recorrera los numeros del 1 al 10 
en ese rango con el escalar $a

Se crea otro ciclo foreach que recorrera los numero del 1 al 10 
en ese rango con el escalar $a
Para despues multiplicar de forma ciclica los valores en el rango.
=cut


foreach my $a (1..10){
	print "tabla del $a \n";
	foreach my $b (1..10){
		print $a * $b,"\n"  ;
	}

}

print "Pragmas son los modulos que especifivan como el compilador  debe procesar la entrada como cualquier modulo de un lenguaje ";

