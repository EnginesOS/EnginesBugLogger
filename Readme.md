Engines Bug Logger v0.2
=======================
Sinatra application for remote exception logging from Engines applications.
_______________________

Bug files written to '/home/fs/exception_reports/'

Enter at start.rb
Needs production enviroment set, e.g. ruby start.rb -p ????? -e production


Usage
-----

POST to '/v0/exceptions' with exception report in the body. The JSON will be written to file with a timestamp in the name.

The exception report doesn't need any specific format -- it just writes the request body to file. However, to make exception reports easier to handle, this format is recommeded:
```
{
  "class": "NameError",
  "message": "undefined local variable or method `crashme' for #<#<Class:0x000000060f3998>:0x0000000632df10>",
  "backtrace": [
    "/app/views/engines_systems/control_panels/_show.html.erb:2",
    "/app/views/engines_systems/control_panels/show.js.coffee:2"
  ],
  "detail": {
    "params": "<ActionController::Parameters {\"engines_system_id\"=>\"32\", \"controller\"=>\"engines_systems/control_panels\", \"action\"=>\"show\"} permitted: false>"
  }
}
```
Put whatever makes sense into "detail"...
