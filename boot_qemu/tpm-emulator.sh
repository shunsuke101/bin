MYTPM_DIR=${HOME}/mytpm/state
TPM_SOCKET_DIR=/tmp/emulated_tpm

mkdir -p ${MYTPM_DIR}
mkdir -p ${TPM_SOCKET_DIR}
swtpm socket --tpmstate dir=${MYTPM_DIR} \
         --ctrl type=unixio,path=${TPM_SOCKET_DIR}/swtpm-sock \
         --log level=20 --tpm2 --daemon

