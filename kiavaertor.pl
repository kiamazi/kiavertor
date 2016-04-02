#!/usr/bin/perl

use warnings;
use strict;
use Encode::Guess;
use Getopt::Long;
use Cwd;

my @files;
my %opts = (
	    encodesource   => 'auto'
	   );

GetOptions(
	   \%opts,
	   "filesource|f=s",
	   "encodesource|s=s",
	   "dirtarget|t=s",
	   "encodetarget|e=s",
	   "directory|d=s",
     "fileextension|x=s",
	   "help|h",
	  );


    # require opts
    if (!defined $opts{filesource} && !defined $opts{directory} || !defined $opts{encodetarget}) {
      die usage();
    }
    # handle -h
    print usage() && exit(0) if exists $opts{help};

$opts{dirtarget} =~ s:/$:: if (defined $opts{dirtarget});

  if (defined $opts{filesource} and !-e $opts{filesource}) {
    print "no valid filename in -f params\n";
		exit(0);
  } elsif (defined $opts{filesource} and -e $opts{filesource}) {
    push @files, ($opts{filesource});
  }


  $opts{directory} = cwd if (defined $opts{directory} and $opts{directory} eq "here");

  if (defined $opts{directory} and -d $opts{directory}) {
    $opts{directory} =~ s:/$::;
    my @fd;
    if (defined $opts{fileextension}) {
      @fd=glob("$opts{directory}/*.$opts{fileextension}");
    } else {
      @fd=glob("$opts{directory}/*");
    }

    foreach (@fd) {
      push @files, ($_) if (!-d $_);
    }
  }

  foreach my $filesource (@files) {
    if ($opts{encodesource} eq "auto") {
      open(FILE, $filesource) || die "cannot open input file: $!\n";
      binmode(FILE);
      if(read(FILE,my $filestart, 500)) {
		      my $enc = guess_encoding($filestart);
		      if(ref($enc)) {
            kiavert ($filesource, $enc->name);
		      } else {
			         print "Encoding of file $filesource can't be guessed \ndo you want usse windows-1256(arabic)? [Y/N]\n";
			         while (my $cpans = <stdin>) {
				          chomp $cpans;
				          my $cpans = lc($cpans);
				          if ($cpans eq "y") {
                    kiavert ($filesource, "cp1256");
                    last;
				          } elsif ($cpans eq "n") {
					          print "you dont want open $filesource\n";
                    last;
				          } else {
					          print "Y or N \n";
				          }
			         }
		      }
      } else {
		      print "Cannot read from file $filesource\n";
      }
	    close(FILE);
    } else {
          kiavert ($filesource, $opts{encodesource});
    }
  }


sub kiavert {
  my ($inputfile, $inputbin) = @_;
my $outputfile;
  if (defined $opts{dirtarget} and -d defined $opts{dirtarget}) {
    my $infn = $inputfile;
    $infn =~ s:.*/(.*)$:$1:;
    $outputfile = "$opts{dirtarget}/$infn-$opts{encodetarget}";
  } else {
    $outputfile = "$inputfile-$opts{encodetarget}";
  }

  open(my $INPFI, "<:encoding($inputbin)", $inputfile) || die "cannot open input file: $!\n";
  my @input = <$INPFI>;
  close($INPFI);

  open(my $OUPFI, ">:encoding($opts{encodetarget})", $outputfile) || die "cannot creat output file: $!\n";
  foreach (@input) {
	   print $OUPFI $_;
   }
   close($OUPFI);

  print "-----\n\"$inputfile\" from \"$inputbin\" kiaverted to \"$outputfile\" in \"$opts{encodetarget}\"\n";
}



sub usage {
 return <<EOHIPPUS

 $0 -f FILENAME -e TARGETENCODING [OPTIONS...]
-f or -d  and -e is not optional

Options:
 --help or -h                                         : this help
 --filesource=/path/file or -f /path/file             : input file name
 --encodesource=cp1256 or -s cp1256                   : input file source encoding,
                                                        if dont use it encoding determined automaticly
                                                        if possible
 --encodetarget=utf8 or -e utf8                       : input file target encoding
 --directory=/path or -d /path                        : choose all file in directory,
                                                        use with -e switche,
                                                        if no -s switch source encoding
                                                        determined automaticly if possible
 if use [--directory=here] or [-d here] use current path that you run $0 from
 --fileextension = txt or -x txt                      : if use -d then you can determine
                                                        file extensions you want
 --dirtarget=/path/dirpath/ or -t /path/dirpath/      : dir path for new files
                                                                                                               default file name is /path/file-encodetarget)

EOHIPPUS
}
