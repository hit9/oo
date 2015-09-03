OO - Go Version Manager
------------------------

Latest version: 0.0.4

![](screen.gif)

Install
-------

1. Clone this repo.
2. Add this to your bashrc or zshrc:

   ```bash
   source "/path/to/oo/env"
   ```

Note that you need to set `GOPATH` manually in your bashrc or zshrc:

```bash
export GOPATH=/path/to/your/gopath
export PATH=$PATH:$GOPATH/bin
```

Examples
---------

Get go1.4 installed:

```bash
$ oo get 1.4
```

Use go1.4 as current `go` (or just `oo 1.4`):

```bash
$ oo use 1.4
=> go1.4
```

Run go from 1.3 temporary:

```bash
$ oo as 1.3 version
go version go1.3 darwin/amd64
$ oo as 1.3 run helloworld.go
Hello world!
```

List all installed go versions

```bash
$ oo ls
```

Build (or rebuild) go by version:

```bash
$ oo build 1.4
build go1.4..
build successfully
```

Get current go binary path:

```bash
$ oo bin
/Users/hit9/github/oo/go/bin/go
```

Remove a version:

```bash
$ oo rm 1.5rc1                                                                                                                                                                          1 ↵ (go1.4 node@v2.0.0) ~/github/oo/versions/1.5/src
go@1.5rc1 removed
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
  oo env                     Output current go env
  oo upgrade                 Upgrade oo to latest version

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
