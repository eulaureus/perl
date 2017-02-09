#perl
use strict;
use warnings;
use HTML::Template;

=pod
=head1 Mondragon Mejia ALan
=head2
Este programa manda a un archivo html los datos que contiene el archivo passwd que en mi caso realize una copia y la guarde como
guarde como datos.tx muestra el usuario la contrasena gid uid gecos el home y el shell
=cut



my $filename = "datos.txt";
open SALIDA,">","prueba.html" or die "Error";
print SALIDA &showForm();
close SALIDA;


sub showForm
{

	my $output;
	my $template = HTML::Template->new(filename=>'./template.tmpl');
	my $info = &extra();
	my @loop_data = ();
        while(@{$info->[0]})
	{
        	my %row_data;
                $row_data{usuario}=shift @{$info->[0]};
                $row_data{password}=shift @{$info->[1]};
                $row_data{gid}=shift @{$info->[2]};
                $row_data{uid}=shift @{$info->[3]};
                $row_data{gecos}=shift @{$info->[4]};
                $row_data{home}=shift @{$info->[5]};
                $row_data{shell}=shift @{$info->[6]};
                push(@loop_data,\%row_data); 
					    
       }
       $template->param(passwd => \@loop_data);
       $output.=$template->output(); 
       return $output; 

}



sub extra
{
	my @usr; 
	my @pass;
	my @gid;
	my @uid;
	my @gecos;
	my @home;
	my @shell;
	my $list = &hash2();
	foreach my $usr(sort keys %$list)
	{
		push(@usr,$list->{$usr}->{user}); 
                push(@pass,$list->{$usr}->{pass}); 
                push(@gid,$list->{$usr}->{gid}); 
                push(@uid,$list->{$usr}->{uid});
                push(@gecos,$list->{$usr}->{desc});
                push(@home,$list->{$usr}->{home});
                push(@shell,$list->{$usr}->{shell});
	}
	my @info = (\@usr,\@pass,\@gid,\@uid,\@gecos,\@home,\@shell);
	return \@info; }

sub hash2
{

	my %hash2;
	open FILE,"<", $filename;
	my @file=(<FILE>);
	for (@file)
	{
		my %hash;
		if(m{(.*):(.*):(.*):(.*):(.*):(.*):(.*)})
		{
			$hash{"user"}=$1;
			$hash{"pass"}=$2;
			$hash{"uid"}=$3;
			$hash{"gid"}=$4;
			$hash{"desc"}=$5;
			$hash{"home"}=$6;		
			$hash{"shell"}= $7;;
		}
	$hash2{$hash{"user"}}=\%hash;
	}
close FILE;
return \%hash2;
}
