What is it?
===========

A puppet module that installs varnish, sets up daemon options, and pushes
out a vcl.  It comes with a rather generic VCL file that does some basic
caching but is probably insufficient for most environments.


Usage:
------

Generic varnish install
<pre>
  class { 'varnish': }
</pre>

To include your own VCL file
<pre>
  class { 'varnish':
    vcl_content => template('myapp/myvcl.erb')
  }
</pre>


Known Issues:
-------------
Only tested on CentOS 6

TODO:
____
[ ] Move vcl definitions to a define and accept multiple?

License:
_______

Released under the Apache 2.0 licence


Contribute:
-----------
* Fork it
* Create a topic branch
* Improve/fix (with spec tests)
* Push new topic branch
* Submit a PR
