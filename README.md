# Containerised TiddlyWiki

This is a simple, flexible Docker image for hosting a TiddlyWiki using Node.js. It leaves much of how things should be run up to the end user.

## Usage

To initialise a new wiki using a local folder (`~/my_wiki`) as a volume for configuration and all Tiddlers:

```bash
$ docker run -v ~/my_wiki:/wiki ioces/tiddlywiki:latest /wiki --init server
```

To serve the same wiki on port 80 locally:

```bash
$ docker run --name tiddlywiki --init -v ~/my_wiki:/wiki -p 127.0.0.1:80:8080 ioces/tiddlywiki:latest /wiki --listen host=0.0.0.0
```

Obviously more complicated setups can be configured using `docker-compose`.

A few points to note:
* The entrypoint for this image is just `tiddlywiki`, so any arguments you'd normally use with it can also be utilised.
* It's recommended you use `--init`, because the core `tiddlywiki` executable does not handle signals properly, and without it the container needs to be forced to end.
* To allow serving of a wiki outside the container, the host must be explicitly set (`0.0.0.0` binds to all available IPv4 interfaces in the container), otherwise TiddlyWiki will simply serve to `localhost` inside the container.