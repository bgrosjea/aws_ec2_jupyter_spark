echo "1st argument = .pem file"
echo "2nd argument = .dns file which stores DNS from AWS console"

dns=`cat $2`

scp -i $1 ./setup1.sh  ubuntu@$dns:
scp -i $1 ./setup2.sh  ubuntu@$dns:
scp -i $1 ./setup3.sh  ubuntu@$dns:

ssh -i $1 ubuntu@$dns
