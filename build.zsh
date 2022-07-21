echo "======"
echo "building nnn"
NNNTMP=$TMPDIR/nnn
mkdir -p $NNNTMP
(cd $NNNTMP && git clone https://github.com/jarun/nnn.git . && make O_NERD=1 O_GITSTATUS=1)
mv $NNNTMP/nnn /usr/local/bin/
echo "======"
