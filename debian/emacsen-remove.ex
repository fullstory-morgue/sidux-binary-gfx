#!/bin/sh -e
# /usr/lib/emacsen-common/packages/remove/sidux-binary-gfx

FLAVOR=$1
PACKAGE=sidux-binary-gfx

if [ ${FLAVOR} != emacs ]; then
    if test -x /usr/sbin/install-info-altdir; then
        echo remove/${PACKAGE}: removing Info links for ${FLAVOR}
        install-info-altdir --quiet --remove --dirname=${FLAVOR} /usr/info/sidux-binary-gfx.info.gz
    fi

    echo remove/${PACKAGE}: purging byte-compiled files for ${FLAVOR}
    rm -rf /usr/share/${FLAVOR}/site-lisp/${PACKAGE}
fi
