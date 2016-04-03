# kiavertor

simple file decode-encode tool like iconv but with different opts

```sh
kiavertor.pl -f FILENAME -d DIRNAME -e TARGETENCODING [OPTIONS...]
```

"-f [filename] or -d [dirname]  and -e [file encoding types] is not optional

target file name is **/ChoosedPath/FileName-EncodeType**

### Options:

* **--help** or **-h**
* **--filesource=**/path/filename or **-f** /path/filename
* **--encodesource=**DecodingType or **-s** DecodingType
  * if dont use -s opt, decoding determine automaticly if possible
* **--encodetarget=**EncodingType or **-e** EncodingType
* **--directory=**/path/ or **-d** /path/
 * choose all files in a directory
 * if use [--directory=here] or [-d here] use current path that you run kiavertor
* **--fileextension**=fileExtension or **-x** FileExtesnsion
* **--dirtarget=**/path/dirpath/ or **-t** /path/dirpath/
                                                        

