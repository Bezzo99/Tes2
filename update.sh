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
BZh91AY&SYc�4�  �_�\����/o߮����    @��
P4��J~�
���zCC@ S�h(�&��	��F �  �   � �a �i��� ��$Dh��6�$٪mM7�j����=F��4�$�zA�DM0u��):+�K��1G�c}�u��Y�V��p�Y�-�z1�$�����]��*���c��h�(���h#�0Cu@��n2�F�����XӖh/e�D�Ƙ|_	�#�Y��[Ġ��,I���ј��V;Җ�qm����iӢ(�=K�����p8*<�p}R�����GBe�9 r���ݺN���y,����÷{�2�22c���U��9O5]�j*��r.[��C�ᡲ4[^�!g��D�.J�BC	A$��¡A�2{S�y�#!���Xʿ+s�UUU ���LQ�DN�tvBݨ�W�j��dKpe�'���bZY�!�~� ��m���NJ�e>��hf��@��^�a�@�0s�&f!�.�Ƌ����c�����#W�;M�%�TMb��A�W�h�Mr�6�P�v:�|l%"m�r1�͟iV�Wu�PUhF;JO�3X]C	A^��?����)�.��g>(=6(N��Nb�7x�:����u�1�ф.���O�g��z!i*q.���
��
��}���f���>6kVkS�!A��A�4�^At%�ġ�&�D�$����@"�PX�%���QTh�7"�X���1��a��*|�ZJ�oZ�VEe�4�|��L�9��I%�	$�RV���H�
uf�@