<p align="center">
  <img alt="logo" src="https://hsto.org/webt/x9/2l/_g/x92l_ghsud0eavfxf9niqd7z978.png" width="70" height="70" />
</p>

# Docker image with [hugo][hugo]

[![Build][badge_build]][link_build]
[![Stars][badge_pulls]][link_pulls]
[![License][badge_license]][link_license]
[![Issues][badge_issues]][link_issues]

### What is this?

Hugo is one of the most popular open-source static site generators. With its amazing speed and flexibility, Hugo makes building websites fun again.

...dockerized ;)

### How can I use this?

Pull latest image:

```bash
$ docker pull tarampampam/hugo:latest
$ docker tag tarampampam/hugo hugo
```

And then you can:

```bash
$ docker run --rm hugo version
  Hugo Static Site Generator v0.46 linux/amd64 BuildDate: 2018-08-01T09:00:55Z
```

Or start live server:

```bash
$ docker run --rm -v "$(pwd)/your_static_site:/src:ro" -p 1313:1313 -u $(id -u):$(id -g) \
    hugo server --watch --logFile /dev/stdout --baseURL 'http://127.0.0.1:1313/' \
    --port 1313 --bind 0.0.0.0
```

And open in your favorite browser [127.0.0.1:1313](http://127.0.0.1:1313/).

> If you use Google Chrome web browser, you may want to install [livereload extension][livereload].

#### License

MIT. Use anywhere for your pleasure.

[badge_build]:https://img.shields.io/docker/build/tarampampam/hugo.svg?style=flat&maxAge=30
[badge_pulls]:https://img.shields.io/docker/pulls/tarampampam/hugo.svg?style=flat&maxAge=30
[badge_license]:https://img.shields.io/github/license/tarampampam/hugo-docker.svg?style=flat&maxAge=30
[badge_issues]:https://img.shields.io/github/issues/tarampampam/hugo-docker.svg?style=flat&maxAge=30
[link_build]:https://hub.docker.com/r/tarampampam/hugo/builds/
[link_pulls]:https://hub.docker.com/r/tarampampam/hugo/
[link_license]:https://github.com/tarampampam/hugo-docker/blob/master/LICENSE
[link_issues]:https://github.com/tarampampam/hugo-docker/issues
[docker_hub]:https://hub.docker.com/r/tarampampam/hugo-docker/
[hugo]:https://gohugo.io/
[livereload]:https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei
