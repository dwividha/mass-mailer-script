#!/usr/local/bin/perl -w

# fill up <cover letter body> , <your gmail id> , <your gmail username> , <your gmail password> as per your needs.
  use strict;
  use warnings;
  use Email::Send;
  use Email::Send::Gmail;
  use Email::Simple::Creator; 
  use Getopt::Std;
  
  my $profemail = '';
  my $profname = '';
  
  my $mailsubject = 'Internship application for summer 2015';
  my $mailcontent = '';
  
  our ($opt_n, $opt_e);
  # Get the cmdline options
  getopt('ne');
  
  if (not defined $opt_n or $opt_n eq "") {
	print "option -n not defined!\n";
	$opt_n = "";
	}
  
  elsif (not defined $opt_e or $opt_e eq "") {
	die "CRITICAL: option -e not defined!.";
}

my $mailbody = <<_END_;
<cover letter body>
_END_

sendmail();

exit 0;

####################################################################3
sub sendmail(){
my $email = Email::Simple->create(
      header => [
          From    => '<your gmail id>',
          To      => $opt_e,
          Subject => $mailsubject,
      ],
      body => $mailbody,
  );

  my $sender = Email::Send->new(
      {   mailer      => 'Gmail',
          mailer_args => [
              username => '<your gmail username>',
              password => '<your gmail password>',
          ]
      }
  );
  eval { $sender->send($email) };
  die "Error sending email: $@" if $@;
}
  
