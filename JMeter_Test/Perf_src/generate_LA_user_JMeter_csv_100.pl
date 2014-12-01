#-----------------------
#Project: Live Assist
#company: Nuance Communication Inc.
#Usage: QA script to generate large number of Live Assist user name & password to csv files for JMeter load test (each user has one dedicated csv file name and user info)
#note: run this script to create all the user csv files needed for JMeter. 
#-----------------------
#!/usr/local/bin/perl
##!/usr/bin/env perl
use FileHandle;
#use strict;

my $generate_csv_file = "LA_User";
my $user_name = "LT00";
my $user_password = "changeit";

my $generate_user_num = 100; # assign the max user # for csv file generation

print "\n\nGenerate user login csv data file for Live Assist JMeter load test\n";

#generate csv files for user number <= 10
if ($generate_user_num < 11) {
	for (my $i = 1; $i < $generate_user_num + 1; $i++) {
		my $csv_filename = $generate_csv_file.$i.".csv";
		my $csv_content = "\"".$user_name."0".($i-1)."\",\"".$user_password."\"";

		#write user, password to new generated csv file
		open(FILE, ">", $csv_filename) || die "Cann't create $csv_filename: $! \n";
		print FILE $csv_content;
		close(File);

	}

} else {
	#generate csv files for user number > 10...
	for (my $i = 1; $i < 11; $i++) {
		my $csv_filename = $generate_csv_file.$i.".csv";
		my $csv_content = "\"".$user_name."0".($i-1)."\",\"".$user_password."\"";

		#write user, password to new generated csv file
		open(FILE, ">", $csv_filename) || die "Cann't create $csv_filename: $! \n";
		print FILE $csv_content;
		close(File);
	}

	for (my $i = 11; $i < $generate_user_num + 1; $i++) {
		my $csv_filename = $generate_csv_file.$i.".csv";
		my $csv_content = "\"".$user_name.($i-1)."\",\"".$user_password."\"";

		#write user, password to new generated csv file
		open(FILE, ">", $csv_filename) || die "Cann't create $csv_filename: $! \n";
		print FILE $csv_content;
		close(File);
	}
}


