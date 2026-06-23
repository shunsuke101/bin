TPM_DIR=$HOME/test/tpm
SSH_DIR=$HOME/.ssh


ssh-keygen -s $SSH_DIR/ca.key -I certificate_test -n ubuntu -z 1 \
	-O extension:quote_msg.b64="$(cat $TPM_DIR/quote_msg.b64)" \
	-O extension:quote_sig.b64="$(cat $TPM_DIR/quote_sig.b64)" \
	-O extension:nonce_bin.b64="$(cat $TPM_DIR/nonce_bin.b64)" \
	$SSH_DIR/test_cert.pub
