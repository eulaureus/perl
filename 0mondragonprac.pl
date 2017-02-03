#!perl
use warnings;
use strict;
##arreglo del 1 al 10 
#operadores
#numerico	cadenas
#==		eq
#!=		ne

my @uno =(1..10);
my @dos =();

for (@uno){

	if($_ % 2 ==0)
	{
		push (@dos,$_);
	}
}

print @dos ;

