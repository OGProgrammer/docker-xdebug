# docker-xdebug

This is a docker container that installs and using xdebug.

The real tricky part is getting the correct IP address fed into the container for the xdebug host ini setting.

I use environment variables set from the `docker_up.sh` bash script to pass into the `docker-compose.yml` file. 

The `docker_up.sh` script uses `ifconfig` to find your IP address on your en0 or en1 interface (Your wireless or LAN depending on whats connected) and then sets the `OGP_XDEBUG_HOST` variable that is later used in the `docker-compose.yml` to dynamically set the host machines IP address.

Note that if the en0 or en1 do not return an IP, it falls back to creating an alias IP address on en0 to use in the container.

Put the domain `example.local` into your `/etc/hosts` file for `127.0.0.1`

### Enable Profiling

Edit the xdebug file `files/usr/local/etc/php/conf.d/xdebug.ini` and uncomment the 3 configs under the profiling section.

Rebuild the docker container with `./docker_build.sh` and then bring the container up with `./docker_up.sh`. That should build the new xdebug.ini config into the container and then run your application.

The `./code/examples/profiler_outputs` directory will start to fill up with cachegrind.out files that you can open with KCacheGrind or the like.
### About & other info

```
Built & Maintained by @OGProgrammer

Support Your Local User Groups
http://php.ug/

Check out our PHP UG in Las Vegas, NV
http://PHPVegas.com

Support your local tech scene!
#VegasTech

Share your knowledge!
Become a speaker, co-organizer, at your local user groups.
Contribute to your favorite open source packages (even if its a README ;)

If you enjoyed this code, please support me at one of the following:

Thank you! ☺

BTC Wallet
1HNHoUz8ruQGko8vh85Jf4nXx8tpEaxUxr

ETH Wallet
0xb561e6a160c86cd5831c323b0f9ce319b56c6421

Patreon
https://www.patreon.com/ogprogrammer
```
