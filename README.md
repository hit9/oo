OO - Go Version Manager
------------------------

Latest version: 0.0.2

![](screen.gif)

Install
-------

1. Clone this repo.
2. Add this to your bashrc or zshrc:

   ```bash
   source "/path/to/oo/env"
   ```

Usage
-----

```
Usage: oo [COMMAND]

Commands:
  oo                         Output current go version
  oo ls                      Output versions installed
  oo <version>               Use go <version>
  oo use <version>           Use go <version>
  oo get <version>           Get go <version>
  oo rm <version>            Remove the given version

Options:
  -v, --version               Output oo's version
  -h, --help                  Output this help message
```

Custom Mirror
-------------

```bash
$ export OO_MIRROR_PATTERN='https://storage.googleapis.com/golang/go%s.src.tar.gz'
$ oo get 1.4
get https://storage.googleapis.com/golang/go1.4.src.tar.gz..
##########                                                                14.4%
```

License
--------

BSD.
