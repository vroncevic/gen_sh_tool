gen_sh_tool
------------

**gen_sh_tool** is shell tool for generating shell tool.

Developed in `bash <https://en.wikipedia.org/wiki/Bash_(Unix_shell)>`_ code: **100%**.

|GitHub shell checker|

.. |GitHub shell checker| image:: https://github.com/vroncevic/gen_sh_tool/workflows/gen_sh_tool%20shell%20checker/badge.svg
   :target: https://github.com/vroncevic/gen_sh_tool/actions?query=workflow%3A%22gen_sh_tool+shell+checker%22

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

.. toctree::
 :hidden:

 self

Installation
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

Or You can use Docker to create image/container.

|GitHub docker checker|

.. |GitHub docker checker| image:: https://github.com/vroncevic/gen_sh_tool/workflows/gen_sh_tool%20docker%20checker/badge.svg
   :target: https://github.com/vroncevic/gen_sh_tool/actions?query=workflow%3A%22gen_sh_tool+docker+checker%22

Dependencies
-------------

**gen_sh_tool** requires next modules and libraries:

* sh_util `https://github.com/vroncevic/sh_util <https://github.com/vroncevic/sh_util>`_

Shell tool structure
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

Copyright and licence
----------------------

|License: GPL v3| |License: Apache 2.0|

.. |License: GPL v3| image:: https://img.shields.io/badge/License-GPLv3-blue.svg
   :target: https://www.gnu.org/licenses/gpl-3.0

.. |License: Apache 2.0| image:: https://img.shields.io/badge/License-Apache%202.0-blue.svg
   :target: https://opensource.org/licenses/Apache-2.0

Copyright (C) 2016 by `vroncevic.github.io/gen_sh_tool <https://vroncevic.github.io/gen_sh_tool>`_

**gen_sh_tool** is free software; you can redistribute it and/or modify it
under the same terms as Bash itself, either Bash version 4.2.47 or,
at your option, any later version of Bash 4 you may have available.

Lets help and support FSF.

|Free Software Foundation|

.. |Free Software Foundation| image:: https://raw.githubusercontent.com/vroncevic/gen_sh_tool/dev/docs/fsf-logo_1.png
   :target: https://my.fsf.org/

|Donate|

.. |Donate| image:: https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif
   :target: https://my.fsf.org/donate/

Indices and tables
------------------

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`
