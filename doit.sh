#get all grails versions from GVM that haven't been diffed already
#for each version...
#  git push origin
# gvm list grails | grep [0-9\.]
grails_versions=("2.4.3" "2.4.4" "2.4.5" "2.5.0" "3.0.0" "3.0.1")
source ~/.gvm/bin/gvm-init.sh
git init
previous="n/a"
for i in "${grails_versions[@]}"
do 	
    echo "create-app from $previous to $i"
	echo -e "n" | gvm install grails $i
	gvm use grails $i 
	grails create-app gupdatediff
    git add --all
    git commit -m "create-app from $previous to $i"
    cd gupdatediff
    rm -rf *
    cd ..
    previous=$i
done