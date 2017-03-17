Engines Bug Logger v0.2
=======================
Sinatra application for remote exception logging from Engines applications.

Deploy
------

Persistent directory at '/home/fs/exception_reports/'

Fire it up: start.rb
(Needs production environment set, e.g. ruby start.rb -p ????? -e production)

Usage
-----

POST to '/v0/exception_reports' with the exception report in the body. The exception report will be written to file with a timestamp in the name.

The exception report doesn't need any specific format -- this app just writes the request body to file.

However, to make exception reports easier to handle, JSON with keys :class, :message, :backtrace, :detail is recommeded:
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
Put into "detail" whatever makes sense for helping with debugging.
