#p=$(aws ec2 describe-instances --filter Name=tag:Name,Values=usecase3 --query "Reservations[*].Instances[*].PublicDnsName" | tr -d '"[]' | tr -s " ")
#echo $ip
#touch /root/docker.sh
#cat <<EOF > /root/docker.sh
#touch /root/test.txt
#EOF
#cat /root/docker.sh |
ssh  -t -t -i ~/chefrepo/codedeploy.pem -oStrictHostKeyChecking=no ec2-user@$1 << EOF
sudo yum install git -y
cd ~
git clone https://github.com/ReenaDevOps/Docker
sudo service docker start
cd /home/ec2-user/Docker
docker build -t petclinic -f petclinic .
docker run -it --rm -p 8080:8080 petclinic 2>&1
exit
EOF
2>&1
