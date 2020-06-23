# Generate shell tool script.

**gen_sh_tool** is shell tool for generating shell tool.

Developed in [bash](https://en.wikipedia.org/wiki/Bash_(Unix_shell)) code: **100%**.

The README is used to introduce the modules and provide instructions on
how to install the modules, any machine dependencies it may have and any
other information that should be provided before the modules are installed.

[![GitHub issues open](https://img.shields.io/github/issues/vroncevic/gen_sh_tool.svg)](https://github.com/vroncevic/gen_sh_tool/issues)
 [![GitHub contributors](https://img.shields.io/github/contributors/vroncevic/gen_sh_tool.svg)](https://github.com/vroncevic/gen_sh_tool/graphs/contributors)

<!-- START doctoc -->
**Table of Contents**

- [Installation](#installation)
- [Usage](#usage)
- [Dependencies](#dependencies)
- [Shell tool structure](#shell-tool-structure)
- [Docs](#docs)
- [Copyright and Licence](#copyright-and-licence)
<!-- END doctoc -->

### INSTALLATION

Navigate to release [page](https://github.com/vroncevic/gen_sh_tool/releases) download and extract release archive.

To install **gen_sh_tool** type the following:

```
tar xvzf gen_sh_tool-x.y.z.tar.gz
cd gen_sh_tool-x.y.z
cp -R ~/sh_tool/bin/   /root/scripts/gen_sh_tool/ver.1.0/
cp -R ~/sh_tool/conf/  /root/scripts/gen_sh_tool/ver.1.0/
cp -R ~/sh_tool/log/   /root/scripts/gen_sh_tool/ver.1.0/
```

![alt tag](https://raw.githubusercontent.com/vroncevic/gen_sh_tool/dev/docs/setup_tree.png)

Or You can use docker to create image/container.

### USAGE

```
# Create symlink for shell tool
ln -s /root/scripts/gen_sh_tool/ver.1.0/bin/gen_sh_tool.sh /root/bin/gen_sh_tool

# Setting PATH
export PATH=${PATH}:/root/bin/

# Generating shell tool
gen_sh_tool avr_dragon
```

### DEPENDENCIES

**gen_sh_tool** requires these other modules and libraries:
* sh_util [https://github.com/vroncevic/sh_util](https://github.com/vroncevic/sh_util)

### SHELL TOOL STRUCTURE

**gen_sh_tool** is based on MOP.

Code structure:
```
.
├── bin/
│   └── gen_sh_tool.sh
├── conf/
│   ├── gen_sh_tool.cfg
│   ├── gen_sh_tool_util.cfg
│   └── template/
│       ├── basic_config.template
│       ├── cfg_editorconfig.template
│       ├── log_editorconfig.template
│       ├── sh_editorconfig.template
│       ├── tool.template
│       └── util_config.template
└── log/
    └── gen_sh_tool.log
```

### DOCS

[![Documentation Status](https://readthedocs.org/projects/gen_sh_tool/badge/?version=latest)](https://gen_sh_tool.readthedocs.io/projects/gen_sh_tool/en/latest/?badge=latest)

More documentation and info at:
* [https://gen_sh_tool.readthedocs.io/en/latest/](https://gen_sh_tool.readthedocs.io/en/latest/)
* [https://www.gnu.org/software/bash/manual/](https://www.gnu.org/software/bash/manual/)

### COPYRIGHT AND LICENCE

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0) [![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

Copyright (C) 2016 by [vroncevic.github.io/gen_sh_tool](https://vroncevic.github.io/gen_sh_tool)

This tool is free software; you can redistribute it and/or modify
it under the same terms as Bash itself, either Bash version 4.2.47 or,
at your option, any later version of Bash 4 you may have available.

