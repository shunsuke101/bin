SSH_DIR=$HOME/.ssh

base64 -w0 quote.msg > quote_msg.b64
base64 -w0 quote.sig > quote_sig.b64
base64 -w0 nonce.bin > nonce_bin.b64
base64 -w0 quote_badvalue.pcrs > quote_pcrs.b64
ssh-keygen -s $SSH_DIR/ca.key -I certificate_test -n ubuntu -z 1 \
	-O extension:quote_msg.b64="$(cat quote_msg.b64)" \
	-O extension:quote_sig.b64="$(cat quote_sig.b64)" \
	-O extension:nonce_bin.b64="$(cat nonce_bin.b64)" \
	-O extension:quote_pcrs.b64="$(cat quote_pcrs.b64)" \
	$SSH_DIR/test_cert.pub
