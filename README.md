<p align="center">
  <img alt="logo" src="https://hsto.org/webt/5e/qm/xf/5eqmxfiuapmg6yxmtvh1dpiaxuy.png" width="128" />
</p>

# Docker image with [hugo][hugo]

[![Build Status][badge_build_latest]][link_actions]
[![Build Status][badge_build_non_existing]][link_actions]
[![Pulls][badge_pulls]][link_docker_tags]
[![License][badge_license]][link_license]

### What is this?

Hugo is one of the most popular open-source static site generator. With its amazing speed and flexibility, Hugo makes building websites fun again.

...dockerized ;)

### How can I use this?

Pull latest image:

```bash
$ docker pull tarampampam/hugo:latest
```

And then you can:

```bash
$ docker run --rm tarampampam/hugo:latest version
  Hugo Static Site Generator v0.61.0-9B445B9 linux/amd64 BuildDate: 2019-12-19T07:23:15Z
```

Or start live server:

```bash
$ docker run --rm -v "$(pwd)/your_static_site:/src:ro" -p 1313:1313 -u $(id -u):$(id -g) \
    tarampampam/hugo:latest server --watch --logFile /dev/stdout --baseURL 'http://127.0.0.1:1313/' \
    --port 1313 --bind 0.0.0.0
```

And open in your favorite browser [127.0.0.1:1313](http://127.0.0.1:1313/).

> If you use Google Chrome web browser, you may want to install [livereload extension][livereload].

### Supported tags

All supported image tags [can be found here][link_docker_tags].

#### License

MIT. Use anywhere for your pleasure.

[badge_pulls]:https://img.shields.io/docker/pulls/tarampampam/hugo.svg?style=flat&maxAge=30
[badge_size]:https://img.shields.io/microbadger/image-size/tarampampam/hugo/latest?style=flat
[badge_license]:https://img.shields.io/github/license/tarampampam/hugo-docker.svg?style=flat&maxAge=30

[badge_build_latest]:https://github.com/tarampampam/hugo-docker/workflows/Build%20latest%20image/badge.svg
[badge_build_non_existing]:https://github.com/tarampampam/hugo-docker/workflows/Build%20non-existing%20image/badge.svg
[link_actions]:https://github.com/tarampampam/hugo-docker/actions

[link_license]:https://github.com/tarampampam/hugo-docker/blob/master/LICENSE
[link_docker_tags]:https://hub.docker.com/r/tarampampam/hugo/tags
[docker_hub]:https://hub.docker.com/r/tarampampam/hugo-docker/
[hugo]:https://gohugo.io/
[livereload]:https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei
