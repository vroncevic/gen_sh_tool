<img align="right" src="https://raw.githubusercontent.com/vroncevic/gen_sh_tool/dev/docs/gen_sh_tool_logo.png" width="25%">

# Generate shell tool script

**gen_sh_tool** is shell tool for generating shell tool.

Developed in **[bash](https://en.wikipedia.org/wiki/Bash_(Unix_shell))** code: **100%**.

[![gen_sh_tool shell checker](https://github.com/vroncevic/gen_sh_tool/workflows/gen_sh_tool%20shell%20checker/badge.svg)](https://github.com/vroncevic/gen_sh_tool/actions?query=workflow%3A%22gen_sh_tool+shell+checker%22)

The README is used to introduce the modules and provide instructions on
how to install the modules, any machine dependencies it may have and any
other information that should be provided before the modules are installed.

[![GitHub issues open](https://img.shields.io/github/issues/vroncevic/gen_sh_tool.svg)](https://github.com/vroncevic/gen_sh_tool/issues) [![GitHub contributors](https://img.shields.io/github/contributors/vroncevic/gen_sh_tool.svg)](https://github.com/vroncevic/gen_sh_tool/graphs/contributors)

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [Installation](#installation)
- [Usage](#usage)
- [Dependencies](#dependencies)
- [Shell tool structure](#shell-tool-structure)
- [Docs](#docs)
- [Copyright and licence](#copyright-and-licence)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

### Installation

Navigate to release **[page](https://github.com/vroncevic/gen_sh_tool/releases)** download and extract release archive.

To install **gen_sh_tool** type the following:

```
tar xvzf gen_sh_tool-x.y.tar.gz
cd gen_sh_tool-x.y
cp -R ~/sh_tool/bin/   /root/scripts/gen_sh_tool/ver.x.y/
cp -R ~/sh_tool/conf/  /root/scripts/gen_sh_tool/ver.x.y/
cp -R ~/sh_tool/log/   /root/scripts/gen_sh_tool/ver.x.y/
```

![alt tag](https://raw.githubusercontent.com/vroncevic/gen_sh_tool/dev/docs/setup_tree.png)

Or You can use docker to create image/container.

[![gen_sh_tool docker checker](https://github.com/vroncevic/gen_sh_tool/workflows/gen_sh_tool%20docker%20checker/badge.svg)](https://github.com/vroncevic/gen_sh_tool/actions?query=workflow%3A%22gen_sh_tool+docker+checker%22)

### Usage

```
# Create symlink for shell tool
ln -s /root/scripts/gen_sh_tool/ver.x.y/bin/gen_sh_tool.sh /root/bin/gen_sh_tool

# Setting PATH
export PATH=${PATH}:/root/bin/

# Generating shell tool
gen_sh_tool avr_dragon
```

### Dependencies

**gen_sh_tool** requires these other modules and libraries:
* sh_util [https://github.com/vroncevic/sh_util](https://github.com/vroncevic/sh_util)

### Shell tool structure

**gen_sh_tool** is based on MOP.

Code structure:
```
sh_tool/
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

### Docs

[![Documentation Status](https://readthedocs.org/projects/gen_sh_tool/badge/?version=latest)](https://gen_sh_tool.readthedocs.io/projects/gen_sh_tool/en/latest/?badge=latest)

More documentation and info at:
* [https://gen_sh_tool.readthedocs.io/en/latest/](https://gen_sh_tool.readthedocs.io/en/latest/)
* [https://www.gnu.org/software/bash/manual/](https://www.gnu.org/software/bash/manual/)

### Copyright and licence

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0) [![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

Copyright (C) 2017 by [vroncevic.github.io/gen_sh_tool](https://vroncevic.github.io/gen_sh_tool)

**gen_sh_tool** is free software; you can redistribute it and/or modify
it under the same terms as Bash itself, either Bash version 4.2.47 or,
at your option, any later version of Bash 4 you may have available.

Lets help and support FSF.

[![Free Software Foundation](https://raw.githubusercontent.com/vroncevic/gen_sh_tool/dev/docs/fsf-logo_1.png)](https://my.fsf.org/)

[![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://my.fsf.org/donate/)
