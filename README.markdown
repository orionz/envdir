# json2env

This is a simple tool for converting JSON into an envdir. It will take a json file or read from stdin.

    $ json2env -f env.json dir

or 

    $ cat env.json | json2env dir

Then you can execute a program with this env using the envdir tool. 


    $ envdir dir program

