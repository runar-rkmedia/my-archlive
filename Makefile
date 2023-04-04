default: archlive copyRootFiles setFilePermissions
	echo Done
clean:
	rm -r archlive out
archlive:
	cp -r /usr/share/archiso/configs/releng/ archlive
copyRootFiles:
	cp -r ./root_files/* ./archlive/airootfs/root/
setFilePermissions:
	sed -i '/file_permissions/a\  ["/root/init.sh"]="0:0:755"' archlive/profiledef.sh
buildToRam: default
	mkarchiso -v -w /tmp/archiso-tmp ./archlive/
copyToMyDisk:
	cp out/*.iso /run/media/runar/Ventoy/
