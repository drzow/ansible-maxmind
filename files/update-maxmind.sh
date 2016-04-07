#!/bin/sh
## simple cron script to update maxmindb
dir=/var/maxmind

cd $dir
for u in \
    http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz \
    http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz \
    http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz \
    http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz \
    http://geolite.maxmind.com/download/geoip/database/asnum/GeoIPASNum.dat.gz \
    http://geolite.maxmind.com/download/geoip/database/asnum/GeoIPASNumv6.dat.gz \
    ; do
    wget -N -q $u -O ${u##*/} && gunzip -f ${u##*/}
done

