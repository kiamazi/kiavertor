# kiavertor

kiavertor.pl -f FILENAME -e TARGETENCODING [OPTIONS...]

"-f [filename] or -d [dirname]  and -e [encode format] is not optional

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
                                                        
                                                        default file name is /path/file-encodetarget)
                                                        
 --dirtarget=/path/dirpath/ or -t /path/dirpath/      : dir path for new files
                                                        
