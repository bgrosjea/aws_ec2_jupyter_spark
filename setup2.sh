
which python

echo "******************************************************************************************"
echo "*               Generating jupyter config and permissions                                *"
echo "******************************************************************************************"
jupyter notebook --generate-config
mkdir certs
cd certs
sudo openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mycert.pem -out mycert.pem
sudo chmod 777 mycert.pem


cd ~/.jupyter/

echo "c = get_config()
c.NotebookApp.certfile=u'/home/ubuntu/certs/mycert.pem'
c.NotebookApp.ip='*'
c.NotebookApp.open_browser = False
c.NotebookApp.port = 8888" > temp
cat temp ~/.jupyter/jupyter_notebook_config.py > temp2
mv temp2 ~/.jupyter/jupyter_notebook_config.py
rm temp

echo "******************************************************************************************"
echo "*                       CHECK JUPYTER NOTEBOOK IS WORKING                                *"
echo "*            Connect to it in browser at https://<aws_ec2_instance_DNS>:8888             *"
echo "******************************************************************************************"

jupyter notebook
