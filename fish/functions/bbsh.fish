function bbsh
    set tmpfile (mktemp)
    echo 'source ./buildImage.sh -m castle -k ~/s/stos/Image_rsa.img -e' >$tmpfile
    env OVL_USE_GCM_USERPATS=1 bash --init-file $tmpfile
    rm $tmpfile
end
