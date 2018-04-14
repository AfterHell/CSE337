#!/usr/bin/perl
use strict;
use warnings;


my $fileName = "passwd.txt";
open(my $fh, "<", $fileName) or die("Cannot open such a file!");
while(my $line = <$fh>)
{
	my @array = split(/:/, $line);
	my ($user_name, $password, $user_id, $group_id, $name, $home_directory, $shell) = @array[0,1,2,3,4,5,6];
	if($user_id % 2 == 0)
	{
		print ("$user_name, $user_id\n");
	}
}
close($fh);
