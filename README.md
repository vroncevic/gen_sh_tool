<img align="right" src="https://raw.githubusercontent.com/vroncevic/gen_sh_tool/dev/docs/gen_sh_tool_logo.png" width="25%">

# Generate shell tool script

**gen_sh_tool** is shell tool for generating shell tool.

Developed in **[bash](https://en.wikipedia.org/wiki/Bash_(Unix_shell))** code: **100%**.

[![gen_sh_tool_shell_checker](https://github.com/vroncevic/gen_sh_tool/actions/workflows/gen_sh_tool_shell_checker.yml/badge.svg)](https://github.com/vroncevic/gen_sh_tool/actions/workflows/gen_sh_tool_shell_checker.yml)

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

![Debian Linux OS](https://raw.githubusercontent.com/vroncevic/gen_sh_tool/dev/docs/debtux.png)

Navigate to release **[page](https://github.com/vroncevic/gen_sh_tool/releases)** download and extract release archive.

To install **gen_sh_tool** type the following

```
tar xvzf gen_sh_tool-x.y.tar.gz
cd gen_sh_tool-x.y
cp -R ~/sh_tool/bin/   /root/scripts/gen_sh_tool/ver.x.y/
cp -R ~/sh_tool/conf/  /root/scripts/gen_sh_tool/ver.x.y/
cp -R ~/sh_tool/log/   /root/scripts/gen_sh_tool/ver.x.y/
```

Self generated setup script and execution
```
./gen_sh_tool_setup.sh

[setup] installing App/Tool/Script gen_sh_tool
	Wed 01 Dec 2021 09:11:57 AM CET
[setup] copy App/Tool/Script structure
[setup] remove github editor configuration files
[setup] set App/Tool/Script permission
[setup] create symbolic link of App/Tool/Script
[setup] done

/root/scripts/gen_sh_tool/ver.2.0/
├── bin/
│   ├── center.sh
│   ├── display_logo.sh
│   └── gen_sh_tool.sh
├── conf/
│   ├── gen_sh_tool.cfg
│   ├── gen_sh_tool.logo
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

4 directories, 13 files
lrwxrwxrwx 1 root root 52 Dec  1 09:11 /root/bin/gen_sh_tool -> /root/scripts/gen_sh_tool/ver.2.0/bin/gen_sh_tool.sh
```

Or You can use docker to create image/container.

### Usage

```
# Create symlink for shell tool
ln -s /root/scripts/gen_sh_tool/ver.x.y/bin/gen_sh_tool.sh /root/bin/gen_sh_tool

# Setting PATH
export PATH=${PATH}:/root/bin/

# Generating shell tool
gen_sh_tool FileCheck

gen_sh_tool ver.2.0
Wed 01 Dec 2021 09:15:17 AM CET

[check_root] Check permission for current session? [ok]
[check_root] Done

                                                                                      
                                          ██              ██                      ██  
                                         ░██             ░██                     ░██  
    █████   █████  ███████         ██████░██            ██████  ██████   ██████  ░██  
   ██░░░██ ██░░░██░░██░░░██       ██░░░░ ░██████       ░░░██░  ██░░░░██ ██░░░░██ ░██  
  ░██  ░██░███████ ░██  ░██      ░░█████ ░██░░░██        ░██  ░██   ░██░██   ░██ ░██  
  ░░██████░██░░░░  ░██  ░██       ░░░░░██░██  ░██        ░██  ░██   ░██░██   ░██ ░██  
   ░░░░░██░░██████ ███  ░██ █████ ██████ ░██  ░██ █████  ░░██ ░░██████ ░░██████  ███  
    █████  ░░░░░░ ░░░   ░░ ░░░░░ ░░░░░░  ░░   ░░ ░░░░░    ░░   ░░░░░░   ░░░░░░  ░░░   
   ░░░░░                                                                               
	                                                 
		Info   github.io/gen_sh_tool ver.2.0
		Issue  github.io/issue
		Author vroncevic.github.io

[gen_sh_tool] Loading basic and util configuration!
100% [================================================]

[load_conf] Loading App/Tool/Script configuration!
[check_cfg] Checking configuration file [/root/scripts/gen_sh_tool/ver.2.0/conf/gen_sh_tool.cfg] [ok]
[check_cfg] Done

[load_conf] Done

[load_util_conf] Load module configuration!
[check_cfg] Checking configuration file [/root/scripts/gen_sh_tool/ver.2.0/conf/gen_sh_tool_util.cfg] [ok]
[check_cfg] Done

[load_util_conf] Done

[gen_sh_tool] Generating tool directory structure!
[gen_sh_tool] Generating file [/root/scripts/FileCheck/bin/FileCheck.sh]
[gen_sh_tool] Generating file [/root/scripts/FileCheck/bin/.editorconfig]
[gen_sh_tool] Generating file [/root/scripts/FileCheck/conf/FileCheck.cfg]
[gen_sh_tool] Generating file [/root/scripts/FileCheck/conf/.editorconfig]
[gen_sh_tool] Generating file [/root/scripts/FileCheck/conf/FileCheck_util.cfg]
[gen_sh_tool] Generating file [/root/scripts/FileCheck/log/FileCheck.log]
[gen_sh_tool] Generating file [/root/scripts/FileCheck/log/.editorconfig]
[gen_sh_tool] Set owner!
[gen_sh_tool] Set permission!
[logging] Checking directory [/root/scripts/gen_sh_tool/ver.2.0/log/]? [ok]
[logging] Write info log!
[logging] Done

[gen_sh_tool] Done

[check_tool] Checking tool [/usr/bin/tree]? [ok]
[check_tool] Done

/root/scripts/FileCheck/
├── bin/
│   └── FileCheck.sh
├── conf/
│   ├── FileCheck.cfg
│   └── FileCheck_util.cfg
└── log/
    └── FileCheck.log

3 directories, 4 files
```

### Dependencies

**gen_sh_tool** requires these other modules and libraries
* sh_util [https://github.com/vroncevic/sh_util](https://github.com/vroncevic/sh_util)

### Shell tool structure

**gen_sh_tool** is based on MOP.

Shell tool structure
```
sh_tool/
├── bin/
│   ├── center.sh
│   ├── display_logo.sh
│   └── gen_sh_tool.sh
├── conf/
│   ├── gen_sh_tool.cfg
│   ├── gen_sh_tool.logo
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

[![Documentation Status](https://readthedocs.org/projects/gen_sh_tool/badge/?version=latest)](https://gen-sh-tool.readthedocs.io/projects/gen_sh_tool/en/latest/?badge=latest)

More documentation and info at
* [https://gen_sh_tool.readthedocs.io/en/latest/](https://gen-sh-tool.readthedocs.io/en/latest/)
* [https://www.gnu.org/software/bash/manual/](https://www.gnu.org/software/bash/manual/)

### Copyright and licence

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0) [![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

Copyright (C) 2017 - 2024 by [vroncevic.github.io/gen_sh_tool](https://vroncevic.github.io/gen_sh_tool)

**gen_sh_tool** is free software; you can redistribute it and/or modify
it under the same terms as Bash itself, either Bash version 4.2.47 or,
at your option, any later version of Bash 4 you may have available.

Lets help and support FSF.

[![Free Software Foundation](https://raw.githubusercontent.com/vroncevic/gen_sh_tool/dev/docs/fsf-logo_1.png)](https://my.fsf.org/)

[![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://my.fsf.org/donate/)
