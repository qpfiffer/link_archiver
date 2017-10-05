# Link Archiver

Send this thing URLs, either through a small web interface or through JSON or whatever, and it'll either `wget` spider them or `youtube-dl` them. The main idea is that a lot of the web is lost, and it's a good idea to save what you like when you can.

## Goals

* Keep it simple
* It should run indefinitely and be very stable.
* Files should be introspectable and recoverable without the service
* Files should be compressed using standard tools - tar archives with xz or bzip or gzip or something.

## Resources

* http://sircmpwn.github.io/2017/06/19/Archive-it-or-miss-it.html
* https://www.gwern.net/Archiving-URLs
