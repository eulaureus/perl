#!perl

use warnings;
use strict;
use 5.014;


=pod
=head1 Mondragon Mejia Alan Dennis
=head2Practica Fin semana

=head2 
 Declaro mis hashes my %ips , %urls %correos, % dominios.
 Asi como los totales y diferentes de mis funciones
 para despues evaluarlas dentro de mis if con mis expresiones regulares
 si temp es igual a mi expresion entonces pasa y si existe una considencia 
 le sumo 1 si no es que es verdadero 
 mis variables de diferentes y totales las traro como un escalar ya que
 guardan un valor en si . 
=cut



my @FCG;
my $temp = $_;

my %ips = ();
my $ipdiferentes = (0) ;
my $iptotales = (0) ;

my %urls = ();
my $urldiferentes = (0) ;
my $urltotales = (0) ;

my %correos = ();
my $correosdiferentes = (0) ;
my $correostotales = (0) ;


my %dominios = ();
my $dominiosdiferentes = (0) ;
my $dominiostotales = (0) ;



open (FCG, "<" , "/home/ureus/Descargas/perl/datos/datos.txt")or die "No se encontro el arhivo \n";
while (<FCG>){ # lee el manejador de archivo <> se usan para poder leeerlo
	chomp; #quita el salto de linea

####ips
	if($temp=/[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/)
	{
		if(exists $ips {$&})
		{
			$ips{$&} += 1;	
		}else
		{	
			$ips{$&} = 1;
			$ipdiferentes += 1;
		}
		$iptotales += 1;
	}
###urls
	if($temp=/https?:[^\s<>"\[\]\.]+(\.[^\s<>"\[\]]+){1,}/)
        {
                if(exists $urls {$&})
                {
                        $urls{$&} += 1;
                }else
                {
                        $urls{$&} = 1;
                        $urldiferentes += 1;
                }
                $urltotales += 1;
        }
	
#### correo
	if($temp=/[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})/)
        {
                if(exists $correos {$&})
                {
                        $correos{$&} += 1;
                }else
                {
                        $correos{$&} = 1;
                        $correosdiferentes += 1;
                }
                $correostotales += 1;
        }


	#### dominios
        if($temp=/[a-zA-Z0-9._-]+[a-zA-Z0-9.-]+\.([a-zA-Z]{2,4})/)
        {
                if(exists $dominios {$&})
                {
                        $dominios{$&} += 1;
                }else
                {
                        $dominios{$&} = 1;
                        $dominiosdiferentes += 1;
                }
                $dominiostotales += 1;
        }

		
}


 
#for(sort keys %ips ){say $ips {$_}, "->",$_ ; }
print "Ip totales son --> $iptotales \n";
print "Ip diferentes son --> $ipdiferentes \n";



#for(sort keys %urls ){say $urls {$_}, "->",$_ ; }
print "urls totales son --> $urltotales \n";
print "urls diferentes son --> $urldiferentes \n";

#for(sort keys %correos ){say $correos {$_}, "->",$_ ; }
print "correos totales son --> $correostotales \n";
print "correos diferentes son --> $correosdiferentes \n";

#for(sort keys %dominios ){say $dominios {$_}, "->",$_ ; }
print "dominios totales son --> $dominiostotales \n";
print "dominios diferentes son --> $dominiosdiferentes \n";



close(FCG);

my $file = 'salidadatos.txt';
open(FCG, '>', $file) or die "EROR '$file' $!";

for(sort keys %ips ){print FCG $ips {$_}, "->",$_ ,"\n" };
print FCG "Ip totales son --> $iptotales \n";
print FCG "Ip diferentes son --> $ipdiferentes \n";

for(sort keys %urls ){print FCG $urls {$_}, "->",$_ ,"\n"};
print FCG "urls totales son --> $urltotales \n";
print FCG "urls diferentes son --> $urldiferentes \n";

for(sort keys %correos ){print FCG $correos {$_}, "->",$_ ,"\n" };
print FCG "correos totales son --> $correostotales \n";
print FCG "correos diferentes son --> $correosdiferentes \n";

for(sort keys %dominios ){print FCG $dominios {$_}, "->",$_ ,"\n" }
print FCG "dominios totales son --> $dominiostotales \n";
print FCG "dominios diferentes son --> $dominiosdiferentes \n";


close FCG;

