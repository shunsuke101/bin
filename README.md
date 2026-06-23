# binについて
need-tool.sh:qemuを動かすために必要なpackageをinstallする

need_option.sh:qemuをbuildする($make)前に、qemuに必要なものを制御し、必要なものをbuildするために、実行するshellscript

tpm_emulator.sh:qemu上でswtpmを動かすときに、swtpmのsocketを作成する(/tmp/emulated_tpmに作られる)

rum_qemu_tpm.sh:risc-vで動作するqemuを起動する、tpm_emulator.shで作成したswtpmのsocketに接続することで、qemuでtpmが利用できる
