.emacsconfig
============
To fully load:
git clone https://github.com/plvines/.emacsconfig
cd .emacs.d
git submodule init
git submodule update
open emacs; load-file .emacsconfig/ergo.el


Put the following in .emacs:
(load "~/.emacsconfig/loads.el")
(load "~/.emacsconfig/ergo.el")
(load "~/.emacsconfig/coq.el")
