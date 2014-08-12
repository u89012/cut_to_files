# cut_to_files

Cuts a (large) string into files at the markers provided; usually comes handy when generating massive amounts of code and need a way to split the output into separate files during the post-process.


## Requirements

- fileutils

## Installation

```
$ sudo apt-get install cut_to_files
```


## Example

Using the gem couldn't be simpler. Assuming you are generating code that will end up in separate files, add markers as below (a path where the following content shall be saved to; path starting with two dashes starting on column 0). Once you have such a string, simply call cut_to_files on that string after including this gem like so:

```

require 'cut_to_files'


some_long_auto_generated_string = %Q{
--conf/main.conf
;some config data here
...

--view/admin/index.erb
<!--some html here-->
<p>the admin index page here</p>
...
...
}

some_long_auto_generated_string.cut_to_files #you should now find, ./conf/main.conf and ./view/admin/index.erb files respectively

```



## Licence

- MIT

