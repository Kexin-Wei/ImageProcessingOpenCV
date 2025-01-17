#!/bin/sh

# Display usage
cpack_usage()
{
  cat <<EOF
Usage: $0 [options]
Options: [defaults in brackets after descriptions]
  --help            print this message
  --version         print cmake installer version
  --prefix=dir      directory in which to install
  --include-subdir  include the Tutorial-1.0-Darwin subdirectory
  --exclude-subdir  exclude the Tutorial-1.0-Darwin subdirectory
  --skip-license    accept license
EOF
  exit 1
}

cpack_echo_exit()
{
  echo $1
  exit 1
}

# Display version
cpack_version()
{
  echo "Tutorial Installer Version: 1.0, Copyright (c) Humanity"
}

# Helper function to fix windows paths.
cpack_fix_slashes ()
{
  echo "$1" | sed 's/\\/\//g'
}

interactive=TRUE
cpack_skip_license=FALSE
cpack_include_subdir=""
for a in "$@"; do
  if echo $a | grep "^--prefix=" > /dev/null 2> /dev/null; then
    cpack_prefix_dir=`echo $a | sed "s/^--prefix=//"`
    cpack_prefix_dir=`cpack_fix_slashes "${cpack_prefix_dir}"`
  fi
  if echo $a | grep "^--help" > /dev/null 2> /dev/null; then
    cpack_usage
  fi
  if echo $a | grep "^--version" > /dev/null 2> /dev/null; then
    cpack_version
    exit 2
  fi
  if echo $a | grep "^--include-subdir" > /dev/null 2> /dev/null; then
    cpack_include_subdir=TRUE
  fi
  if echo $a | grep "^--exclude-subdir" > /dev/null 2> /dev/null; then
    cpack_include_subdir=FALSE
  fi
  if echo $a | grep "^--skip-license" > /dev/null 2> /dev/null; then
    cpack_skip_license=TRUE
  fi
done

if [ "x${cpack_include_subdir}x" != "xx" -o "x${cpack_skip_license}x" = "xTRUEx" ]
then
  interactive=FALSE
fi

cpack_version
echo "This is a self-extracting archive."
toplevel="`pwd`"
if [ "x${cpack_prefix_dir}x" != "xx" ]
then
  toplevel="${cpack_prefix_dir}"
fi

echo "The archive will be extracted to: ${toplevel}"

if [ "x${interactive}x" = "xTRUEx" ]
then
  echo ""
  echo "If you want to stop extracting, please press <ctrl-C>."

  if [ "x${cpack_skip_license}x" != "xTRUEx" ]
  then
    more << '____cpack__here_doc____'
This is the open source License.txt file introduced in
CMake/Tutorial/Step9...

____cpack__here_doc____
    echo
    while true
      do
        echo "Do you accept the license? [yn]: "
        read line leftover
        case ${line} in
          y* | Y*)
            cpack_license_accepted=TRUE
            break;;
          n* | N* | q* | Q* | e* | E*)
            echo "License not accepted. Exiting ..."
            exit 1;;
        esac
      done
  fi

  if [ "x${cpack_include_subdir}x" = "xx" ]
  then
    echo "By default the Tutorial will be installed in:"
    echo "  \"${toplevel}/Tutorial-1.0-Darwin\""
    echo "Do you want to include the subdirectory Tutorial-1.0-Darwin?"
    echo "Saying no will install in: \"${toplevel}\" [Yn]: "
    read line leftover
    cpack_include_subdir=TRUE
    case ${line} in
      n* | N*)
        cpack_include_subdir=FALSE
    esac
  fi
fi

if [ "x${cpack_include_subdir}x" = "xTRUEx" ]
then
  toplevel="${toplevel}/Tutorial-1.0-Darwin"
  mkdir -p "${toplevel}"
fi
echo
echo "Using target directory: ${toplevel}"
echo "Extracting, please wait..."
echo ""

# take the archive portion of this file and pipe it to tar
# the NUMERIC parameter in this command should be one more
# than the number of lines in this header file
# there are tails which don't understand the "-n" argument, e.g. on SunOS
# OTOH there are tails which complain when not using the "-n" argument (e.g. GNU)
# so at first try to tail some file to see if tail fails if used with "-n"
# if so, don't use "-n"
use_new_tail_syntax="-n"
tail $use_new_tail_syntax +1 "$0" > /dev/null 2> /dev/null || use_new_tail_syntax=""

extractor="pax -r"
command -v pax > /dev/null 2> /dev/null || extractor="tar xf -"

tail $use_new_tail_syntax +152 "$0" | gunzip | (cd "${toplevel}" && ${extractor}) || cpack_echo_exit "Problem unpacking the Tutorial-1.0-Darwin"

echo "Unpacking finished successfully"

exit 0
#-----------------------------------------------------------
#      Start of TAR.GZ file
#-----------------------------------------------------------;
� 1� d �}t[յ�d;��DJ�-?ͅ&L�#ْ�$@�K�b��m��H�eY��ʒ�8SA��<��L��x^üL�t�}]������v�-~Ӯ>��o��0�i5-��}��Wҕ%�q��η|���}���}����j������n)u0j��1ʞkE��f�Xkl6�UZg�D��EG�!0�3�>_�A����uv�Ê"���^�L�B��#��,�$LXW\��E���O������HR��2GD�	���v����ս��ހ;���w��_P~q���PH�B�޿i��������V� ڗ�0�y�'�_-�D#����_�<�k���B���v�/
������K�����V{]]������������?���e����Z_&�b������K���\�W�}�l�y�C��鉞iOK��Μȗ��e9��d�r��n`�޽,×d�-b٬,�#��pA}���=�ë(G}e}r������g�������E���xdo����#��\}
�;��k��@�=�H��*P�'ne����l��}�@8���w�'f��E��/�̣ς�Ʋ�b�%~w��ٹ�e���;��6g���P^D�D�w�ܮ�>����.gڒm��֓˱+��.�̲�w���=�A��	�7��g�E�յ�ru�#��rf�q�ם�k�W2�Gî;�v�R�r4���H�0����z�܂r�@ʁ�;����K5$���I���J��4�D� �1��H�l��,s��|!$_G��k�*�6EáM~_�����������h���}jc�O7��e��e�Uҋ<Ӷ)w�o�ߩX�'z�x����>Q2` ZӶ���jk5�k���Y򺛫Js���#ޞ��0	�h��)V��'����������������������������������F�+�[ׁ7�NK�6�?�GS����#��-{?B��r%,ʶ��9~�u�~�
AP,�!ߜPf.S�~H�.�8�;��k:� ���Q�z�����W�HiH9K�����$�Y:�~��T�����L&�N�PP��-w�ƉX\:�|b��#��+�B	@�s�U��)��H��r2I�$\!O��_��m�W2�a�OO��8�*�4Sږ?C�z�I�/U�C��@�$yN�oāac�֓4�o����KBz�u�d۾W��1�����5��Gtaˀȴ+A(8ޯ��F'��o�Dt�Y�#����W:�U]�5NU�)[�Lk
DM�^1���G��*w%v).���H{W��]WA�LGR�o/�Ϡ*�W�i$�2��0��e�ǔ[�
j�Ik0���AZw�$�J�9�8��A^j�N(��|@z��^<�3"_^��S��I���%�I��T�	�j��Kǩ��t|��Ӣ��*����cS�j 0@�1��t��5����s�_��+�8 �ǔ	Xy�s333��D��a��4���e' y�4$�����?ԛ�Ϡq�3������)�\#���N+�XSS{�#��[2e�<��^MWܫ��\�ݴP�3`G7�l\���j��ѓ�����i�7�Ʀ&��D�r��J-����*����F4?Vf�3����g�T?1�ى�g~z�<�k�񅗲]�'���*
��
n�8� f�h<�:П��Vd�szj�:�45��6���&�����5qî�Ҩ��,D7�6����g���Y1���AfC��U �ؓhR�Ko���/c�SB�=�:���C�����q���y�ؘS��W�J1W��}��O+/��V0�N);���j�4l<h�c�ii���0�I�[��f>��5B�t���?��1��3ph�x�Bm�)_��i�N��IZ'���ur���:?E[gF�SH�q�2I�b�J�����Ǘ|�Q���x���p�kcw�oĄ��R��JfW���h�/���Wc�GDҡ~��a�5?���&ȓq��8ڤ�o5����ɗ�N0˞x��l `�m��ؙlR�����^xHj�'�W�OD��,�E��!�����,�̕h}[�r��������'����ga]������Jp��<'$e��p�M���l0�C�<B�
iBY'�sF��S���[�W���P*��._Ӭ���D�B��g�s:)u�-����r9N#t!���Д�ϱ��V�=Sy����r!]�������K�X��ь��FWl�P�V�!ci�9�+��?K"^(�e�:�sZ0~���o��_.���Ҝ�&&;{~���T���-�ȷ~a��[_9���_���p}Z�>L�iVY5��&�U�#j��y%m��	e�{33�����C5��������iX�n���7�0��h��It:�b�0��[�q��hf���1�IX�dAwZ]T(������qd,v�rJ���_Ҹ$�5�\��-���;a�
א�J��>����uE#�\?����MЙw|u���d����,_����3���a6ؐ˸,��93:N��ru�I�٭����4V}��/�H���CG7(���6� �Q�O >f|�N�	�0��nr˾J�I�"�����
�;Gm���a�4P%?�����YR��g+�G�g��
3�dv}�c�������򌅦V�p/���#b�	'A<}������r@��A-+Ǘ�m�z���~��,�ھݝ�#��R�7������tv��T�Vy�f5]d����������seY����ͱ�k��o=�Y���?��g^.-��I\���>�z��_�_֗��_�|��/�?,����z�p~�kt��#��#��G�{(�Z#B��`��#���$g��v�̺��� �?N��~�ޟ�������/��������g�����Uz�������������ޟ��o����\�= ۛgֽ���g7��f������xv��y25F�*���ty�.y�"y�y�'�4H�� �SO�����	��$yz�<�!O�I�:�,@�n#O��1�t/yz�<5����������f�Do��<�M�֓���n��/`ſ�V����=�~]9�Uw���'������u���&Ɠ��U~l(��A7nX��sL��(XzTo��^���U�
]��U.�.-W%@µkڄ�sǋ�xCa_0 
�Bk����"
b ���	-�^1|��`0";!�A�+F 2�n��=(��^���@�����/�s�����Wv{z�_�t�P	$i����m��u>�4�����FL'o��o'�tZ)���q	{���~��'����ߌ���QQ$�̭��v� ؀�`8j :	�>��[���ۇoe��LB�b�����N<Y���4�z�d��K�8�V%�&a��t���J��2����������������������������������������������������������������������ވt���q��M��0�V�.���އ�i/҇�T����Q�!�;�ϫr�}�Q�?B��[��'�8Rێ�������O%���<�Ap��f�:����8z��|��_��ȍ��S����˜L�ܹ�z��������������������������������������������������������������(�U�>B�S�ｳ9R+�V�'�H��!!�j�D��zwy�_�Dc䮾>��
n�/�_~�"$W;;��;�p$�.��^���Y��nwH��ܾH�Y���e_ "���'��2YD�����8��@W�[j�ã����ro4"i�'��a��Qo�庳Y�U�M�k��a�G�#!��gW��b�%��Nn���&�1Wv&�����M�X�BXX�ZB�ɻ��h��/\�����������ѰW�t{���"���&�p�/�!S������ꄰ%���5�(����_���'G�!Z��拐J�!*�Oe��(t^�VV\�FUn�m�Zp���t����h������;��@$��U��\+%mV�VA��k�����wAI}$iL�Y`����dA�)5QW�h��4��L�-pao�;�}����}0B�!o�;|��?�?�����Cҧ��	&��cH�/��xi�!.{��r�����rO7���xI�j���;�Xt�t�P*d��/ ԇ�EZ��~�pJ/�{�eo���x�n�����{�[��� �A�F͎��$i��^0,xDzO�D#��ܔ��zC�`� ��P���;�YSċz�~@R����p��0�-������k44�m�X�(�X�^�b-�&K��$�LmN�"�C�(����Ĥ�b�HEI96^Q*+u�Ћ�Դ"�D��ȧ����;�<�ue��Q]LhC��233�-䇐�X��q�oE�Y���!߆�˘�$�b� �C~��h/�A��M�F�	��"C���h�Ǒ,���@���^�W�>�ۑD�䇐�:�ȿ��he��*��/#C�ߐB޽�G�u�'�/_���s�nDބ�#��"��'�󔐟D�Ԉ��2�f���E~�>�Sȫ�7d��߸]�o�ֿ�Z��9��5�����N�_�:�?��i�)V����:�?M�i��T��'g�֟��Z�����Y�O��Zrn��S�f�?�n��Sl�֟&7k�Iܢ�'��?�n��Sr�֟�h�it�֟Ʒh�ɲU�OM[��ԻU�O��Zo��S��D<G�g���� oC�]���21�>�� �G�����m4c<����l�_I�X����ȫ�݋�zYL��<�_�<��ku�7ѱ���:�_��o=�h�.�zu���:����_����;�Z��9�wr����7�|g�l?���:���hyW���?����ß��_����%��-+����p�p��u\���.7\�py���K��.����ק����W ��p���~��p���\!�")OQ��bzQv��9����/�x���<{}+�e��Y�n��-.�!^ԭ�"n�e������ٽ�m�6����z[�ț�B����z��-�ϝ��ͳ������VP���z5���o���	�9ٕ�`��.�����������^��Z��A���A��zd����͘G{�S�A�Q��:��\O�HM�[Z���<�ɟ-��F���2�`Ã�+�����,5��������i��JG����vhjv�<�ׄ#����;�����鮐���:"9�=�N��BCg8@ȿΨNw\�[�;�.0@��.��59s\Tw��7������Ю�v��^��.��I���r����G��*G�]R�v�׻Z仠�\Kj�ג���`�Aw��`B��vFG��|��uzCtAG����$��5�
'{�ޞ.a��"5�[h��v�vh3h�YA�u��5�!I�7X!�HPvwt�|w��Zdu�qA}�
IaI)�a��[R�ւa�t-�6Rq�@�o1��nfz���P��/Q��w�B�6��wp;-�v��a�UE0�KVK:0�[��goFv�^���B'�yN�s��P䧭��؟'rn�0ax�-ECf�FZ%��%��;�"����ӂyt�����:G��v߱v�o/p`+j�b�R?+��1+�f�-5[���2]@��|�U�b�FP�?ڱ8���b����"�F-56F�s�h��,k��氊k���.��%�)�(xJL����x��+$b��E����i����/#o���fq���o��s���_����--��8We��.~����^���7˗�V.D��&��_��"����oZ�<���������V�Ki��y�WۿZntG�o�<_0��^�<�>6�\�m]��a��-�������|��PC��K������Zkn���Zy���Fao!�&�#׷ak��m�EAf�o�����:}]�9�o����������/
����������ϣ�[�9��aw����`�&1��=�٣!o��k@����H��
������H��:����7 �#�n�uםr��Oܵ[��u'X��ܸ͒�q{���7�T�~_��q��k����/
������%}�Kp��k�{1@ڟ��@��������Z�����?� �i{�\����n��﨩���1p���֊�Y7�X�����:�m��^�+��h+kK�n�Gɶ
Y�n�۸S�]l�kw����u��n7���!݃���6�}
鷐����z���b��;������Y�����־ف��ڽ���WT����[]�A`�	���4��DO�4�K��l6��b�J��_�u�P��H&�,�H{Zf�[�"���2v-��"0�l9�Z������PCXo"��Ϡ$'_Y��x��'��ς��ȻLY?��Y&_���wnoٞ�Q��M�m���/ܥy�}ӨO/L���sme��^ G���䆝��Ε������X��6�JY�v˝!w�7�}���]�×3}���U���A�KW
��G]%�0S^�$�7��+�¨	Ӯǋ,��p]*�?Z]�ߺ�i9g\%����4V}��2p$tz�Ɲ3�J'�(mLAp�B�@|��؝8L��[!ȕ��d�:b?
��?,y��9��Ɣ��������<���Yp��l������Ya���ک5 �ِ�{2�Z�½�vߏ��$�I��)	����r@�׬H�c�R`c���d�)ڸt9�����tv�333T�Vy�v8i���qM,��EW����\	�	BI��$�d�$�OD']�स��j㚃��k��>S������H���h^`P�ܕإ�tcJ�;R�DRƑ��*%�F-č��<�� �4!�J̞v韠i�� 7 �HK/���~7�בh�a̎V��TR1'hl\:>Ū���!�&Ӣ��*�j�@�I:6U� .�ئ{��q% �+�:�$]���=Ƭ<�9h�)���Ô�i�N@�$hhHH1t�C�q�G�8�4>]�G�MY�)e���4D���dʔyN� 4�i��*Wb7-T���ygt�d��I�F�^�6��$3��ϲ@��������T��Lj�FuT�};�?�����~�3��R���$��@[E��Z��'����g\�S��ЊLsNO�P��&�׆1Z��Z�K�7��*��^ʒAt�k�K�x�y�ii+g2�e2�G������[���Ґ��e,qJȶ�Z��ځ�aH�}���Ƒ�3�#�{�Ug�z��+��>Z�8�$Z�l:UЭ�J�ƃ�<6���$2u��d��	h�c�U��`��Ak�Ш�`E��}���5;Y�N&�S'W�ꬣ�S�>э��I��D_3Vfpy�728d��ly����\�S��#&ĥTڮķ�9��>{5�{DT;ZS��I,ob I�_���M�V�:P/�|I���G�H���DN;�M�%k�CR�?ἲ�� jg	��\�����F�d��@��j��/��=�O��0?�}�� ��Aan�	I�5>��Dci6��k!C����=&���̯>����U���5ͪ��K�/�揩��D�;N'p���aқ��2�3�ت�g*O��AS�������K����T�O{�j�pu�T�V䆐v�s�����rX&��Q;��^��|��B�0�N�-0���fy�v}�տ��WN��k�ʒ�h}�,,4Ӱ�j��:�*tD��3����:1�|Z�~�����#��^<:����*M�o�a������tD��Va[�Jꐝ�YǦ� H$��pAwZ]T�R�NGF�b')�4o�e:RM�#�ƿv�ìf(�o�^XW4����3��Y޴�y�W�X�H����Y��Hmct��	���䶙g���^>��mxNV�{U����x� <c�i�ǆ��tㆵYg����V	GaGwTo��^���5��
]��U.�.-W%@µkڄ�B��ym�7�|g��Jz�/h��<>P�;7t�����q�������x��K��j����9�X�S����/rП�����������C���J������Q�(�-t�|�C$/V�`�(�$����ʐ.��^�M�?�!���Đ�❸;�#�I�yP�c8�e��ҷa���c�^����1����1~U���w�oYq�c��@�(Ư.?��
ě���@�����o(?���#��7��3��@|�W�Ob|E!�0���G�H?>G����@����a������}_�|)�/d��I]!�+���`<�BK����%+��7���{|�R_Y �~�l�}O�}1����}��@�$�j����݂�Ϥ3U-+O�X';=�3>5������;V�B��ρ���mBa9��w�-"�$\'Pno�����."G^�M���E䪠���3������4ʭ*"w_���"rA�����x�,(����O���[]D�=�s�ܦ"rk�}7�k ��ss�_�|�r7��2ȵ��ۯN�� ��TD�M�K�ܾ"r�a�V���P���\�C���{�����\�<���!S��ȕ�d�-"��$S�5E�Z@��m("�p��b�r<K_����$S���K2�RL�5�y��};K3�R���Ant�=	r�(WYD� '���]_D�,ȭG��E䪀���x�]�T�PS�1�=KV�&u�؈�\
Ӄ�f��?��}D���{���u�P~Say�[�H�h����K
��>�?����\^��/a�c>VE?;3'��,�D��g`f?Pؑ���n��kO��뀊Ut-e>^I����k_�t7�zг�3U���k+�+���y�w#+���LΨ��7O/�k�w�^4��~�l�z����s=��U����<�\��@/�����滁^�RN�8�����w��ň��etoa�.���/_F���et�n�T���S���2�3�\F�<�?�������O���ǁ��,�K �z?SB׺�K��L·%�����*�ky�_�,^��?7�#���30��0�0P(���@?C7�f�>a&c|�w(dm���~nl����6��E6�e�1_��R����������̷�Ceͷ0����o Z�:��+0��K1�U���Э�Z�G>.Уʯ}H`���M�%�Œ��+@$���1�F�Nv�m��T@:]B�Y���l���[6�tii�=��	�91\D* �4�>��HcHې:��H��zL�tiiR'R��tR��"�!mC�D*"�Á˦��G@}H�C�$��0����T@����7�A=�I�ǭ���xu�0m�����)��n��:<��;�x�6�O��q_nQ�[G~9�ېy���W�����������q�(��Ǒ�g�� �W�o��~u��
�Q�-Q��wL�u,�����z�?�o�y��ޫ�ǎ�Q��G�<O]ݧV��G�sXu>�����A{�}�'�W��wh�6�G�����>x�j/����R���������SG��a��'��{�0����*c珫�*���Q_����>vg9���^[�^� ����R��8��P^}O�B�B��ɯ$�=�W˴�Tr~}6��Z��eZ��-��r-�5����˵��9��-Ǟ��Z�|�#�='=Yj��jy]N�r�{.��{����ї��8�������s.�ҝB�A9�q�r6nѳh���%9����N4�{/����'�_�Aϋ|<o�CO/� ��ǌ_�q�x�E�~��\��㼧���<��<��<��>�S��k������B�/�/�����"�:x�Oھ�oџ�o���8=<�BNq]�S�߇�T�q�����y��{��p&���>�p,�����ӗ�P���<���)�?L.�~,��؋�O0r�o���!���J�à� pppp,�>��$ J 