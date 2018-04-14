#!/usr/bin/perl
use strict;
use warnings;


my $inFileName = $ARGV[0];
open(my $fh, "<", $inFileName) or die("Cannot open such a file!");

my $lines = 0;
my $words = 0;
my $characters = 0;
my @charArray;
my @stack;

#1. reading part
while(my $line = <$fh>)
{
	my @thisLine = split("", $line);
	
	push(@charArray, @thisLine);

	my @wordsOfThisLineArray = split(" ", $line);
	$words += @wordsOfThisLineArray;

	$lines += 1;
}
#my $count = 0;
while(@charArray)
{
	#$count ++;
	my $thisChar = pop(@charArray);
	#print "$count : $thisChar \n";
	push @stack, $thisChar;
	if(!($thisChar eq "\n"))
	{
		$characters += 1;
	}
}
#print "@stack";
print "lines: $lines, words: $words, characters: $characters\nreversed:\n";
foreach my $char(@stack)
{
	print "$char";
}



close($fh);

