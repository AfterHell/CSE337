#!/usr/bin/perl
use strict;
use warnings;


my $fileName = "passwd.txt";
open(my $fh, "<", $fileName) or die("Cannot open such a file!");

my %groupIdToNumberOfUsersHash;

while(my $line = <$fh>)
{
	my @array = split(/:/, $line);
	my ($user_name, $password, $user_id, $group_id, $name, $home_directory, $shell) = @array[0,1,2,3,4,5,6];
	if(exists($groupIdToNumberOfUsersHash{$group_id}))
	{
		$groupIdToNumberOfUsersHash{$group_id} = $groupIdToNumberOfUsersHash{$group_id} + 1;
	}	
	else
	{
		$groupIdToNumberOfUsersHash{$group_id} = 1;
	}
}

foreach(keys %groupIdToNumberOfUsersHash)
{
	print("group $_ has $groupIdToNumberOfUsersHash{$_} users\n");
}

close($fh);
