# TODO: Fill in FROM w/ in test code
FROM 511136ea3c5a
MAINTAINER cevich@redhat.com
ADD basic_tree.tar /
ADD basic_devices.tar /
ENV PATH /usr/sbin:/usr/bin
# This is bugged since sbin is a symlink command will hang forever
# leaving it broken!
ADD busybox /usr/sbin/
RUN ["/usr/sbin/busybox", "sh", "-c", "for item in $(busybox --list-full); do busybox ln -s /usr/sbin/busybox $item; done"]
