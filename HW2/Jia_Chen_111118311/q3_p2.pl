#!/usr/bin/perl
use strict;
use warnings;

my @currencyArray = ("usd", "eur", "cad", "inr", "jpy", "vnd", "krw", "btc");
my %currencyHash = ("usd" => 1, "eur" => 0.81, "cad" => 1.29, "inr" => 65.2, "jpy" => 105.75, "vnd" => 22750, "krw" => 1079.43, "btc" => 0.000088);

sub inCurrencyArray
{
	my $inputCurrency = $_[0];
	foreach(@currencyArray)
	{
		if(($_) eq ($inputCurrency))
		{
			return 1;
		}
	}
	return 0;
}


print "Exchangeable currency: usd, eur, cad, inr, jpy, vnd, krw, btc\n";

#1. get current currency
print "Enter the current currency: ";
my $currentCurrency = <STDIN>;
chomp($currentCurrency);

while(!inCurrencyArray($currentCurrency))
{
	print "We do not trade $currentCurrency!\nRe-enter the current currency:";
	$currentCurrency = <STDIN>;
	chomp($currentCurrency);
}


#2. get target currency
print "Enter the target currency: ";
my $targetCurrency = <STDIN>;
chomp($targetCurrency);

while(!inCurrencyArray($targetCurrency))
{
	print "We do not trade $targetCurrency!\nRe-enter the target currency:";
	$targetCurrency = <STDIN>;
	chomp($targetCurrency);
}

#3. get the amount of money
print "Enter the amount of money: ";
my $inMoney = <STDIN>;
chomp($inMoney);

#4. Calculate and output the result
my $outmoney = 0;
$outmoney = ($inMoney/$currencyHash{lc($currentCurrency)})*$currencyHash{lc($targetCurrency)};

print "$inMoney $currentCurrency is $outmoney $targetCurrency.";

