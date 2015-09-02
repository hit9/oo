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

```bash
Usage: oo [COMMAND]

Commands:
  oo                         Output current go version
  oo ls                      Output versions installed
  oo <version>               Use go <version>
  oo use <version>           Use go <version>
  oo get <version>           Get go <version>
  oo rm <version>            Remove the given version
  oo as <version>            Run go from oo on a specific version
  oo dir [<version>]         Show go directory by version
  oo bin [<version>]         Show go binary path by version
  oo build [<version>]       Build go by version

Options:
  -v, --version              Output oo's version
  -h, --help                 Output this help message

Environment Variables:
  OO_MIRROR_PATTERN          Mirror url pattern to download go source tarball
                             default: https://codeload.github.com/golang/go/tar.gz/go%s
  OO_BUILD_CMD               Command to build go from source, default: ./make.bash
  OO_BOOTSTRAP_VERSION       Bootstrap go version to compile the target version,
                             default: the latest installed version

Version: 0.0.4
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
