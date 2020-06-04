sudo apt-get update

echo "******************************************************************************************"
echo "*                                 INSTALLING JAVA                                        *"
echo "******************************************************************************************"

sudo apt-get purge openjdk-\* icedtea-\* icedtea6-\*
sudo apt install openjdk-8-jre-headless

echo "

Checking java is working by printing version: "
java -version
echo "

"


echo "******************************************************************************************"
echo "*                                     INSTALLING SCALA                                   *"
echo "******************************************************************************************"
sudo apt-get install scala
echo "

Checking scala is working by printing version: "
scala -version
echo "

"

echo "******************************************************************************************"
echo "*                                     INSTALLING PIP                                     *"
echo "******************************************************************************************"
export PATH=$PATH:$HOME/anaconda3.bin
conda install pip
which pip


echo "******************************************************************************************"
echo "*                                     INSTALLING py4j                                    *"
echo "******************************************************************************************"
pip install py4j

echo "******************************************************************************************"
echo "*                                     INSTALLING spark                                   *"
echo "******************************************************************************************"
conda install pyspark

echo "******************************************************************************************"
echo "*                                     TESTING pyspark                                    *"
echo "******************************************************************************************"
echo "from pyspark import SparkContext" > temp.py
echo "print('pyspark import worked')" >> temp.py
python temp.py
rm temp.py