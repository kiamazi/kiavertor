# kiavertor

simple file decode-encode tool like iconv but with different opts

```
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
 * if use [**--directory=here**] or [**-d here**] use your current path
* **--fileextension**=fileExtension or **-x** FileExtesnsion
 * use -x with -d to choose file-extensions you need
* **--regex=**"REGEX" or **-r** "REGEX"
 * must use ""
 * use -r with -d to choose files you need
* **--dirtarget=**/path/dirpath/ or **-t** /path/dirpath/

### exapmle

#### 1
```
~$ kiavertor.pl -f ~/dir/first.txt -f /home/user/anotherdir/second.srt -d here -r "^\d+\-.*" -e utf8

/home/user/dir/first.txt from windows-1256 kiaverted to first.txt-utf8 in utf8
Encoding of file /home/user/anotherdir/second.srt can't be guessed
/home/user/heredir/1-file.srt from utf-16 kiaverted to ~/1-file.srt-utf8 in utf8
/home/user/heredir/12-name.srt from ISO-8859-5 kiaverted to ~/12-blahblah.srt-utf8 in utf8
/home/user/heredir/15-fifteen.ext from ISO-8859-5 kiaverted to ~/12-blahblah.srt-utf8 in utf8
Encoding of file /home/user/heredir/56-kpax.srt can't be guessed
...
```


#### 2
```
$ kiavertor.pl -f ~/dir/first.txt -f /home/user/anotherdir/second.srt -d here -r "^\d+\-.*" -x srt -e utf8 -s cp1256 -t /home/user/targetdir/

/home/user/dir/first.txt from cp1256 kiaverted to /home/user/targetdir/first.txt-utf8 in utf8
/home/user/anotherdir/second.srt from cp1256 kiaverted to /home/user/targetdir/second.srt-utf in utf8
/home/user/heredir/1-file.srt from utf-16 kiaverted to /home/user/targetdir/1-file.srt-utf8 in utf8
/home/user/heredir/12-blahblah.srt from ISO-8859-5 kiaverted to /home/user/targetdir/12-name.srt-utf8 in utf8
/home/user/heredir/56-kpax.srt from cp1256 kiaverted to /home/user/targetdir/56-kpax.srt-utf8 in utf-8
...
```
