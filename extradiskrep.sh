sudo bash -c '
echo "===== lsblk =====" > lvm_report2.txt
lsblk -f >> lvm_report2.txt

echo -e "\n===== pvs =====" >> lvm_report2.txt
sudo pvs -v --segments >> lvm_report2.txt

echo -e "\n===== vgs =====" >> lvm_report2.txt
sudo vgs -v >> lvm_report2.txt

echo -e "\n===== lvs =====" >> lvm_report2.txt
sudo lvs -a -o +devices >> lvm_report2.txt

echo -e "\n===== df -Th =====" >> lvm_report2.txt
df -Th >> lvm_report2.txt

echo -e "\n===== blkid =====" >> lvm_report2.txt
sudo blkid >> lvm_report2.txt

echo -e "\n===== mount =====" >> lvm_report2.txt
mount | grep "^/dev" >> lvm_report2.txt
'
