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
BZh91AY&SY#��  �_�\����/o߮����    @���A���C'�6�i�� =OQ�x��ښ!A��4��  �4� h� �4hi�L	��2�4b40F@���'�E4�=E<hS�=�d�ЛS�`�	���Y�vzR�NI�J�O��˶��uL�(қ"������-�y�xT��Ĥ�mVWJ�-yYFke	i�0��m���WWt"�V[�"�w��Ѿ2W�%�f�`�#N�^�a̐������tXu�	���:��E-T�����\l���;��A䋃�ʒHi��1ɗ8lq��k#��^�:��ޮ>G�d�]����v^������OͲ�"���5�Y��$>�-ɛa���8�$,��&����LHHa($��$[t�ǂ<NT"0A�����S�a��Bi����1Ds<�� �����W?oo�m�SQ��e9��=����C8��������5�%?�~��g��		LA}�j�ŚP8ţ3e��B��tc�AM��~j���}q�}�}F�
EKp��s�������h��0�U��}+%"���1���E.̗�*3#��~y�V]3	Ahn�w��v���SE��-�<�jM�9�)#v�gUx�~�]#@�@�Ϭa���[mi�Pڧ4- EU��I�` ��,B����a��2Rh���������BbV�A�if�k9�c�@=�߄a|�F�2=܅P��A�KE�^�G�������5��N2��n�lP[e6K�ɹ�WZ�Q�����m�c��I�I/RBJ����"�(H�[��