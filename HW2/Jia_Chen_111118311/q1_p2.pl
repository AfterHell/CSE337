#!/usr/bin/perl
use strict;
use warnings;


my $fileName = "passwd.txt";
open(my $fh, "<", $fileName) or die("Cannot open such a file!");

my @userNameArray;
my @userIdArray;

my %userNameToIdHash;

while(my $line = <$fh>)
{
	my @array = split(/:/, $line);
	my ($user_name, $password, $user_id, $group_id, $name, $home_directory, $shell) = @array[0,1,2,3,4,5,6];
	push(@userNameArray, $user_name);
	push(@userIdArray, $user_id);
	$userNameToIdHash{$user_name} = $user_id;
}

my @sortedUserIdArray = sort{$b <=> $a} @userIdArray;
my @sortedUserNameArray = sort{$userNameToIdHash{$b} <=> $userNameToIdHash{$a}} @userNameArray;

print("sorted uids: @sortedUserIdArray\n");
print("usernames: @sortedUserNameArray");

close($fh);
