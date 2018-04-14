#!/usr/bin/perl
use strict;
use warnings;


my $inFileName = "sample_input_q2.txt";
#my $limit = $ARGV[1];	#not hardcoded
my $limit = 15;	#hardcoded

sub sort2
{
	my ($inFileName, $limit) = @_;
	open(my $fh, "<", $inFileName) or die("Cannot open such a file!");

	my @stringsArray;
	my @linesArray;

	#1. reading part
	while(my $line = <$fh>)
	{
		chomp($line);
		my @stringArray = split(/ /, $line);
		#for(my $i = 0; $i <= $#stringArray; $i++)
		#{
		#	$stringArray[$i] =  $stringArray[$i]." ";
		#}
		push(@stringsArray, @stringArray);
	}

	my $lengthOfThisLine = 0;
	my $firstWord = 0;

	print "FITTED TEXT:\n";
	foreach(@stringsArray)
	{
		$lengthOfThisLine += length($_);
		
		#we still need to add a space, so that the length of current line will be incremented by 1
		#e.g. 5(1)4(1)5 = 16
		if($lengthOfThisLine > $limit)
		{
			print "\n";
			$lengthOfThisLine = length($_) + 1;
		}
		else
		{
			if($firstWord == 0)
			{
				$firstWord = 1;
			}
			else
			{
				print " ";
				$lengthOfThisLine += 1;
			}
			
		}
		print "$_";
	}

	close($fh);
}

sort2($inFileName, $limit);
