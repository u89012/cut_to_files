# cut_to_files

Cuts a (large) string into files at the markers provided; usually comes handy when generating massive amounts of code and need a way to split the output into separate files during the post-process.

Two line markers (place on any line on column 0) are available:

* creates new files
+ appends to existing files

## Requirements

- fileutils

## Installation

```
$ sudo gem install cut_to_files
```


## Example

```

require 'cut_to_files'


s = %Q{
*conf/main.conf
foo
bar

*view/admin/index.erb
<!--some html here-->
<p>the admin index page here</p>
...
...

+conf/main.conf
baz
}

s.cut_to_files #you should now find, ./conf/main.conf and ./view/admin/index.erb files respectively. notice that conf/main.conf has baz in the body since we used a + line marker to append rather than overwrite

```



## Licence

- MIT

