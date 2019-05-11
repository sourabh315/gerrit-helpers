#!/bin/bash

CURR_PATH=$(dirname $(readlink -f $0))
#FINAL_PATH=${CURR_PATH}:${PATH}
#FINAL_PATH=$(printf %s "$FINAL_PATH" | awk -v RS=: -v ORS=: '!arr[$0]++')

cat<<EOF>~/.gerrit_helper_rc

if [[ -z \$GERRIT_HELPERS_INSTALLED ]]
then 
     
      PATH=${CURR_PATH}:\${PATH}
      chmod  a+rx ./git-*
      export GERRIT_HELPERS_INSTALLED=true
      :
fi 
EOF

sed -i '/.gerrit_helper_rc/d' ~/.bashrc
echo  ". ~/.gerrit_helper_rc"  >> ~/.bashrc 
