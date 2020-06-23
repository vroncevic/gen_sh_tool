GEN_SH_TOOL
------------

.. toctree::
 :hidden:

 self

**gen_sh_tool** is shell tool for generating shell tool.

Developed in `bash <https://en.wikipedia.org/wiki/Bash_(Unix_shell)>`_ code: **100%**.

The README is used to introduce the tool and provide instructions on
how to install the tool, any machine dependencies it may have and any
other information that should be provided before the tool is installed.

|GitHub issues| |Documentation Status| |GitHub contributors|

.. |GitHub issues| image:: https://img.shields.io/github/issues/vroncevic/gen_sh_tool.svg
   :target: https://github.com/vroncevic/gen_sh_tool/issues

.. |GitHub contributors| image:: https://img.shields.io/github/contributors/vroncevic/gen_sh_tool.svg
   :target: https://github.com/vroncevic/gen_sh_tool/graphs/contributors

.. |Documentation Status| image:: https://readthedocs.org/projects/gen_sh_tool/badge/?version=latest
   :target: https://gen_sh_tool.readthedocs.io/projects/gen_sh_tool/en/latest/?badge=latest

INSTALLATION
-------------

Navigate to release `page`_ download and extract release archive.

.. _page: https://github.com/vroncevic/gen_sh_tool/releases

To install **gen_sh_tool** type the following:

.. code-block:: bash

   tar xvzf gen_sh_tool-x.y.z.tar.gz
   cd gen_sh_tool-x.y.z
   cp -R ~/sh_tool/bin/   /root/scripts/gen_sh_tool/ver.1.0/
   cp -R ~/sh_tool/conf/  /root/scripts/gen_sh_tool/ver.1.0/
   cp -R ~/sh_tool/log/   /root/scripts/gen_sh_tool/ver.1.0/

DEPENDENCIES
-------------

**gen_sh_tool** requires next modules and libraries:
    sh_util `https://github.com/vroncevic/sh_util <https://github.com/vroncevic/sh_util>`_

SHELL TOOL STRUCTURE
---------------------

**gen_sh_tool** is based on MOP.

Code structure:

.. code-block:: bash

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

COPYRIGHT AND LICENCE
----------------------

|License: GPL v3| |License: Apache 2.0|

.. |License: GPL v3| image:: https://img.shields.io/badge/License-GPLv3-blue.svg
   :target: https://www.gnu.org/licenses/gpl-3.0

.. |License: Apache 2.0| image:: https://img.shields.io/badge/License-Apache%202.0-blue.svg
   :target: https://opensource.org/licenses/Apache-2.0

Copyright (C) 2016 by `vroncevic.github.io/gen_sh_tool <https://vroncevic.github.io/gen_sh_tool>`_

This tool is free software; you can redistribute it and/or modify it
under the same terms as Bash itself, either Bash version 4.2.47 or,
at your option, any later version of Bash 4 you may have available.

