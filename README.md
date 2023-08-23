# Use Docker Compose for cli tool management

Advantages over simply docker run

1. Declaratively allows a network connection to the main compose server
2. Image version can be managed in one file
3. You can manage options such as volume mount and tty with the host environment in one file

## Example

Eh, just typing docker compose run into the terminal makes my fingers tired. It would be nice to make a simple wrapper script

### Case 1. openapi-generator-cli needs Java 😢

-> very easy

```sh
./tools/openapi-generator generate -i petstore.yml -g python -o generated
```

### Case 2. hadolint not distributed apt 😢

-> very easy

```sh
./tools/hadolint < Dockerfile
```

output

```sh
❯ ./tools/hadolint < Dockerfile
-:1 DL3006 warning: Always tag the version of an image explicitly
-:3 DL3018 warning: Pin versions in apk add. Instead of `apk add <package>` use `apk add <package>=<version>`
-:7 DL3011 error: Valid UNIX ports range from 0 to 65535
```

### Case 3. connect my compose servers

-> easy

```sh
❯ docker network create my_server
❯ docker compose up -d
❯ ./tools/curl -L "http://server:80/param?query=demo"

{"host":{"hostname":"server","ip":"::ffff:xxx.xx.x.x","ips":[]},"http":{"method":"GET","baseUrl":"","originalUrl":"/param?query=demo","protocol":"http"},"request":{"params":{"0":"/param"},"query":{"query":"demo"},"cookies":{},"body":{},"headers":{"host":"server","user-agent":"curl/8.2.1","accept":"*/*"}},"environment":{"PATH":"/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin","HOSTNAME":"0110d0e9fb8d","NODE_VERSION":"18.17.0","YARN_VERSION":"1.22.19","HOME":"/root"}}%   
```
