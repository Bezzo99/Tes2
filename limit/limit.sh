#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY�1>  �_� ]� � >���@��@42d�CM4hh�*~�� � ��C!�M �4�F��
�SA0S�6S�4hi�4����KK[n+�i��FY�#8���B�Uz�;�d�H�k4��"� �6���n����̣S��ik�/]#A=�m�n�q���ģx�6t���8�HzC��x�ݡ�����=�c�&Á���4�2�P�A`s
��H�a`J��UUUU��5�8�a�}�X�b7�<3�=��;��Ŷ[l��m�=R3Ø���⛩�O�F�0�8s�8�G8c�~��r2��_ꪵjեV;�ɢWO(gC­���6h<�!�8�:ј�#�%�6ۧBt�x�C��hj�V#�#h��2�#��?��H�
f'��