use strict;
use List::Util qw(first max maxstr min minstr reduce shuffle sum);
use List::Util qw(first max maxstr min minstr reduce shuffle sum);
use List::Uniq ':all';
use strict;
use Getopt::Long;
use vars qw($inputfile $incutoff $excutoff $ttcutoff);
Getopt::Long::GetOptions(
	'inputfile=s' =>\$inputfile,
	'totalcutoff=s' => \$ttcutoff,
);
open(IN, $inputfile);
my $tt = <IN>;
print $tt;
while(<IN>)
{
    chomp;
	s/\s+$//;
	my @arr = split(/\t/, $_);
	my $aseid = shift(@arr);
	#my $int=0;
	#my $ext=0;
	my @one0;
	for(my $i = 0; $i <= $#arr; $i++)
	{
	     my @arr3 = split(/\,/, $arr[$i]);
		if($arr3[0] > 0 and $arr3[1] > 0 and ($arr3[0]+$arr3[1])>=$ttcutoff)
        {
		     push(@one0, 1);
		}
        else
        {
		     push(@one0, 0);		
		
		}		
	}
		print $aseid."\t".join("\t", @one0)."\n";
}
close(IN);
