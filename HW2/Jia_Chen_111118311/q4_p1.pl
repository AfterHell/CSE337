#!/usr/bin/perl
use strict;
use warnings;

sub fileHasMoreThan10Lines
{
	my $outputDir = $_[0];
	open(my $fh, "<", $outputDir);
	my $numberOfLines = 0;

	while(<$fh>)
	{
		$numberOfLines += 1;
	}
	close($fh);

	if($numberOfLines > 10)
	{
		return 1;
	}
	else
	{
		return 0;
	}

}

print "Enter file name:\n";
my $outputFile = <STDIN>;
chomp($outputFile);


my $backupDir = "backup";
if(-e $outputFile)
{
	print "$outputFile already exists. ";
	#1. check if there is a subdirectory named "backup".
	if(-e $backupDir and -d $backupDir)
	{
		print "Checking backup directory... already exists\n";
	}
	else
	{
		mkdir($backupDir, 0755);
		print "Checking backup directory... backup directory created\n";
	}

	#2. If the input file exists and the file has more than 10 lines, give the user 2 choices:
	if(fileHasMoreThan10Lines($outputFile))
	{
		print "randomFile.txt has more than 10 lines. What to do next?\nEnter 'c' to backup the first 10 lines, 'o' to overwrite without creating a backup\n";
		my $input = <STDIN>;
		my @inputArray = split(//, $input);
		my $choice = lc($inputArray[0]);

		while($choice ne "c" and $choice  ne "o")
		{
			print "Invalid Choice, Please Type again: ";
			$input = <STDIN>;
			@inputArray = split(//, $input);
			$choice = lc($inputArray[0]);
		}

		#we reach here, which means either o or c
		#1. Type ’c’ to copy first 10 lines of the file under "backup" folder with the same name, and then overwrite the existing file
		if($choice eq "c")
		{
			open(my $inFh, "<", $outputFile) or die "Cannot open the file!";
			open(my $outFh, ">", "backup/".$outputFile) or die "Cannot open the file!";
			my $countOfLines = 1;
			while(my $line = <$inFh>)
			{
				if($countOfLines > 10)
				{
					last;
				}
				print $outFh $line;
				$countOfLines += 1;
			}

			open(my $fh, ">", $outputFile) or die "Cannot open the file";
			print $fh "Perl is cool!";
			close($fh);

			print "Ok, old file backed up under backup directory\nWrote to file randomFile.txt";

			close($inFh);
			close($outFh);
		}
		#2. Type ’o’ to proceed without creating a backup, and overwrite the existing file
		elsif($choice eq "o")
		{
			open(my $fh, ">", $outputFile) or die "Cannot open the file";
			print $fh "Perl is cool!";
			print"Wrote to file $outputFile";
			close($fh);
		}
		else
		{
		}
	}
	#3. If the input file exists and it has not more than 10 lines, backup everything under the "backup" folder with the same name, and overwrite the existing file.
	else
	{
		print "randomFile.txt has no more than 10 lines.\nOk, old file backed up under backup directory\n";
		open(my $inFh, "<", $outputFile) or die "Cannot open the file!";
		open(my $outFh, ">", "backup/".$outputFile) or die "Cannot open the file!";
		while(my $line = <$inFh>)
		{
			print $outFh $line;
		}


		close($inFh);
		close($outFh);

		open(my $fh, ">", $outputFile) or die "Cannot open the file";
		print $fh "Perl is cool!";
		print"Wrote to file $outputFile";
		close($fh);
	}
}
#Otherwise, write the string to the input file normally.
else
{
	open(my $fh, ">", $outputFile) or die "Cannot open the file";
	print $fh "Perl is cool!";
	print"Wrote to file $outputFile";
	close($fh);
}

