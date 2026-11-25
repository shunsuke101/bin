SSH_DIR=$HOME/.ssh
TEST_DIR=$HOME/test/ssh-attestation
openssl rand -out ${TEST_DIR}/nonce.bin 20
tpm2_quote -c ${TEST_DIR}/ak.ctx -l sha256:0,1,2,3,4,5,6,7,8,9,10 -q ${TEST_DIR}/nonce.bin -m ${TEST_DIR}/quote.msg -s ${TEST_DIR}/quote.sig -o ${TEST_DIR}/quote.pcrs -F values

base64 -w0 ${TEST_DIR}/quote.msg > ${TEST_DIR}/quote_msg.b64
base64 -d ${TEST_DIR}/quote_msg.b64 > ${TEST_DIR}/encoded_quote.msg
base64 -w0 ${TEST_DIR}/quote.sig > ${TEST_DIR}/quote_sig.b64
base64 -d ${TEST_DIR}/quote_sig.b64 > ${TEST_DIR}/encoded_quote.sig
base64 -w0 ${TEST_DIR}/nonce.bin > ${TEST_DIR}/nonce_bin.b64
base64 -d ${TEST_DIR}/nonce_bin.b64 > ${TEST_DIR}/encoded_nonce.bin
base64 -w0 ${TEST_DIR}/quote.pcrs > ${TEST_DIR}/quote_pcrs.b64
base64 -d ${TEST_DIR}/quote_pcrs.b64 > ${TEST_DIR}/encoded_quote.pcrs



ssh-keygen -s $SSH_DIR/ca.key -I certificate_test -n lab-student -z 1 \
	-O extension:quote_msg.b64="$(cat ${TEST_DIR}/quote_msg.b64)"\
	-O extension:quote_sig.b64="$(cat ${TEST_DIR}/quote_sig.b64)"\
	-O extension:nonce_bin.b64="$(cat ${TEST_DIR}/nonce_bin.b64)"\
	-O extension:quote_pcrs.b64="$(cat ${TEST_DIR}/quote_pcrs.b64)"\
	$SSH_DIR/test_cert.pub
