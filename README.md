# Nexus Repository OSS (s6-overlay) Docker Image

[![Docker Pulls](https://img.shields.io/docker/pulls/frekele/nexus.svg)](https://hub.docker.com/r/frekele/nexus/)
[![Docker Stars](https://img.shields.io/docker/stars/frekele/nexus.svg)](https://hub.docker.com/r/frekele/nexus/)
[![GitHub issues](https://img.shields.io/github/issues/frekele/docker-nexus.svg)](https://github.com/frekele/docker-nexus/issues)
[![GitHub forks](https://img.shields.io/github/forks/frekele/docker-nexus.svg)](https://github.com/frekele/docker-nexus/network)
[![GitHub stars](https://img.shields.io/github/stars/frekele/docker-nexus.svg)](https://github.com/frekele/docker-nexus/stargazers)
[![Website](https://img.shields.io/website-up-down-green-red/http/shields.io.svg)](https://frekele.github.io/docker-nexus/)

[![Nexus Image][NexusImage]][NexusWebsite]

| [Website]  | [GitHub]  | [DockerHub]  |


#### Nexus with Oracle JDK Branches:
| Branch                       | From                     | Usage        | Tag Names                        |
| ---------------------------- | ------------------------ | ------------ | ---------------------------------|
| [3.0.1-01] - latest          | frekele/java:jdk8        | Production   | 3.0.1-01, 3.0.1, 3, latest       |
| [3.0.0-03]                   | frekele/java:jdk8        | Production   | 3.0.0-03, 3.0.0                  |
| [dev]                        | frekele/java:jdk8        | Development  | dev                              |


# Dockerfile extends From:
- https://github.com/frekele/docker-java
- https://hub.docker.com/r/frekele/java


## Relations:
 - https://github.com/just-containers/s6-overlay


### Working with Persistent Data:
#### Data volume
**Important! For use Nexus user, you needs to set the PID=200.*
```
mkdir /mnt/my-volume/nexus-data
chown -R 200:200 /mnt/my-volume/nexus-data

docker run --rm -v /mnt/my-volume/nexus-data:/nexus-data --name nexus -p 8081:8081 frekele/nexus

# or

docker volume create --name nexus-data
docker run --rm -v nexus-data:/nexus-data --name nexus -p 8081:8081 frekele/nexus
```
#### Data volume container
```
docker run -d --name nexus-data -p 8081:8081 frekele/nexus
docker run --rm --volumes-from nexus-data --name nexus -p 8081:8081 frekele/nexus
```


### License:
See [NEXUS LICENSE]

frekele/docker-Nexus is **licensed** under the **[MIT License]**. The terms of the license are as follows:

    The MIT License (MIT)

    Copyright (c) 2016 Leandro Kersting de Freitas

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.


[NexusImage]: https://raw.githubusercontent.com/frekele/docker-nexus/dev/nexus-logo.png
[NexusWebsite]: http://www.sonatype.com/nexus-repository-oss
[Website]: https://frekele.github.io/docker-nexus
[GitHub]: https://github.com/frekele/docker-nexus
[DockerHub]: https://hub.docker.com/r/frekele/nexus
[NEXUS LICENSE]: https://github.com/frekele/docker-nexus/blob/dev/NEXUS_LICENSE
[MIT LICENSE]: https://github.com/frekele/docker-nexus/blob/dev/LICENSE

[3.0.1-01]: https://github.com/frekele/docker-nexus/blob/3.0.1-01/Dockerfile
[3.0.0-03]: https://github.com/frekele/docker-nexus/blob/3.0.0-03/Dockerfile
[dev]: https://github.com/frekele/docker-nexus/blob/dev/Dockerfile
