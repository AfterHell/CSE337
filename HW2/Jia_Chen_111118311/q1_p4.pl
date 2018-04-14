#!/usr/bin/perl
use strict;
use warnings;



sub addToFile
{
	my $inFileName = "passwd.txt";
	open(my $fh, "<", $inFileName) or die("Cannot open such a file!");

	my $maxUserId = 0;
	my $count = 0;

	my @groupIdArray;

	#1. reading part
	while(my $line = <$fh>)
	{
		my @array = split(/:/, $line);
		my ($user_name, $password, $user_id, $group_id, $name, $home_directory, $shell) = @array[0,1,2,3,4,5,6];
		if($count == 0)
		{
			$maxUserId = $user_id;
			$count += 1;
		}
		elsif($user_id > $maxUserId)
		{
			$maxUserId = $user_id;
		}	

		push(@groupIdArray, $group_id);
	}
	close($fh);

	#2. writing part
	my $newUserId = $maxUserId + 1;
	my $randomGroupId = $groupIdArray[int rand($#groupIdArray)];

	open(my $fh2, ">>", $inFileName) or die("Cannot open this file!");
	print $fh2 "\nJia Chen:*:$newUserId:$randomGroupId:New User:/home/:/bin/bash";

	print "Add the following entry to file:\nJia Chen:*:$newUserId:$randomGroupId:New User:/home/:/bin/bash\n";

	close($fh2);
}

addToFile();

