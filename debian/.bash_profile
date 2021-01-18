# cd /usr/local/bin/etc || echo "WARNING: Failed attempt to cd into /usr/local/bin/etc..."
# /usr/bin/find . -type f | while read f; do
#  fDest=${f#.}
# if [ ! -e "${HOME}${fDest}" -a ! -L "${HOME}${fDest}" ]; then
#  /usr/bin/install -D -p -v "${f}" "${HOME}/${fDest}"
# fi
# done
# unset fDest
# cd $HOME

if [ -e /etc/bash.bashrc ] ; then
  source /etc/bash.bashrc
fi

if [ -e "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

