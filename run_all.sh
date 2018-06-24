vagrant destroy -f
rm -rf .vagrant
rm -rf .vm_data/*
vagrant up
./generate_inventory.sh
./run_playbook.sh
