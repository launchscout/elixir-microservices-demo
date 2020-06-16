# Yauth

Testing distributed microservices with Elixir

The backend for the accounts code now lives in a [different repo](https://github.com/willus10245/auth_server).

To get the functioning experience:

* clone both repos and install dependencies
* start the auth server with a name `iex --sname auth@localhost -S mix`
* start the web server in a different terminal `iex --sname web@localhost -S mix phx.server`
* from the iex console of the web server, connect to the auth server `> Node.connect(:auth@localhost)`

Now you can visit [`localhost:4000/register`](http://localhost:4000/register) from your browser, and create an account, and the user will be created in the database on the auth server.
