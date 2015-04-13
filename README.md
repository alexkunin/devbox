# devbox
Idea comes from [10 Docker Tips and Tricks That Will Make You Sing A Whale Song of Joy](http://nathanleclaire.com/blog/2014/07/12/10-docker-tips-and-tricks-that-will-make-you-sing-a-whale-song-of-joy/).

Here is how to run it:

`docker run -it --name devbox --hostname devbox -v /var/run/docker.sock:/var/run/docker.sock alexkunin/devbox`

Included goodies (latest packages from Ubuntu or independent repos):

  * vim
  * git
  * subversion
  * curl
  * PHP 5
  * Python 3
  * zip
  * docker (client)
  * docker-compose
  * psysh
  * composer
  * wget
  * tree
  * nodejs
  * npm
