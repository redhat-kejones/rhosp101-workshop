#!/usr/bin/bash

#Parameters
user=student
password=redhat
tenant=student

#Start as the admin user
source ~/overcloudrc

for i in {16..20}; do
  echo student$i;
  #Create the student tenant and student user defined above
  openstack project create $tenant$i --description "Project intended for Red Hat OpenStack Platform Workshop" --enable
  openstack user create $user$i --project $tenant$i --password $password --enable

  #Grant the admin role to the student
  #openstack role add admin --user $user$i --project $tenant$i

  #create an rc file for the new student user
  cp overcloudrc ${user}${i}rc
  sed -i "s/\(export OS_USERNAME=\).*/\1${user}${i}/" ${user}${i}rc
  sed -i "s/\(export OS_PROJECT_NAME=\).*/\1${tenant}${i}/" ${user}${i}rc
  sed -i "s/\(export OS_PASSWORD=\).*/\1${password}/" ${user}${i}rc

  #Copy each StudentRC file over to bastion host
  scp /home/stack/student${i}rc student${i}@192.168.1.77:;
done
