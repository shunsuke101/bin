SSH_DIR=$HOME/.ssh

openssl rand -out bad_nonce.bin 20

base64 -w0 quote.msg > quote_msg.b64
base64 -w0 quote.sig > quote_sig.b64
base64 -w0 bad_nonce.bin > bad_nonce_bin.b64


ssh-keygen -s $SSH_DIR/ca.key -I certificate_test -n ubuntu -z 1 \
	-O extension:quote_msg.b64="$(cat ./quote_msg.b64)"\
	-O extension:quote_sig.b64="$(cat ./quote_sig.b64)"\
	-O extension:nonce_bin.b64="$(cat ./bad_nonce_bin.b64)"\
	$SSH_DIR/test_cert.pub
