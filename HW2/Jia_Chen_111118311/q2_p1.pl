#!/usr/bin/perl
use strict;
use warnings;

#my $inFileName = $ARGV[0];	#not hardcoded
my $inFileName = "sample_input_q2.txt";	#hardcoded

sub sort1
{
	my ($inFileName) = @_;

	open(my $fh, "<", $inFileName) or die("Cannot open such a file!");

	my %stringToLengthHash;
	my @stringArray;

	#1. reading part
	while(my $line = <$fh>)
	{
		chomp($line);
		$stringToLengthHash{$line} = length $line;
		push(@stringArray, $line);
	}


	my @sortedStringArray = sort {$stringToLengthHash{$a} <=> $stringToLengthHash{$b}} @stringArray;

	print "SORTED TEXT:\n";
	foreach(@sortedStringArray)
	{
		print "$_\n";
	}

	close($fh);
}

sort1($inFileName);
