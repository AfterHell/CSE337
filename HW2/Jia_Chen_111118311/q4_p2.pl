#!/usr/bin/perl
use strict;
use warnings;

sub fileContainsString
{
	my $file = $_[0];
	my $string = $_[1];
	open(my $fh, "<", $file) or die "Cannot open the file!";

	my $file_content = do { local $/; <$fh> };
	if(index($file_content, $string) != -1)
	{
		return 1;
	}
	else
	{
		#print "$file doesn't contain $string";
		return 0;
	}
}

print "What string do you want to search for?\n";
my $string = <STDIN>;
chomp($string);

opendir(my $dh, ".") or die "Cannot open the dir!";
while(my $file = readdir($dh))
{
	if(!(-d $file))
	{
		if(fileContainsString($file, $string))
		{
			#Found "use warnings" in file q1_p1.pl............erwT
			print "Found \"$string\" in file $file............";
			if(-e $file)
			{
				print "e";
			}
			if(-r $file)
			{
				print "r";
			}
			if(-w $file)
			{
				print "w";
			}
			if(-x $file)
			{
				print "x";
			}
			if(-T $file)
			{
				print "T";
			}
			print "\n";
		}
	}
}

