# # deleting previous users

# for i in 0{1..9} {10..25}
# do
# 	userdel -r user$i
# done

# creating new users

for i in 0{1..9} {10..25}
do
	adduser --quiet --disabled-password --shell /bin/bash --home /home/user$i --gecos "User" user$i
	echo "user$i:password$i" | chpasswd
done

# copying files and changing permissions
for i in 0{1..9} {10..25}
do
	mkdir /home/user$i/code
	mkdir /home/user$i/data
	mkdir /home/user$i/data/posts
	mkdir /home/user$i/credentials
	cp /home/rstudio/code/* /home/user$i/code/
	cp /home/rstudio/data/congress-facebook-2017.csv /home/user$i/data/
	cp /home/rstudio/data/posts/* /home/user$i/data/posts/
	cp /home/rstudio/credentials/bigquery-token.json /home/user$i/credentials/
	sudo chown user$i -R /home/user$i/
done	

# solutions challenge 1
for i in 0{1..9} {10..25}
do
	cp /home/rstudio/code/challenge1-solutions.Rmd /home/user$i/code/
	cp /home/rstudio/code/challenge1-solutions.html /home/user$i/code/
	sudo chown user$i -R /home/user$i/
done

# solutions challenge 2
for i in 0{1..9} {10..25}
do
	cp /home/rstudio/code/challenge2-solutions.Rmd /home/user$i/code/
	cp /home/rstudio/code/challenge2-solutions.html /home/user$i/code/
	sudo chown user$i -R /home/user$i/
done


# solutions challenge 3
for i in 0{1..9} {10..25}
do
	cp /home/rstudio/code/challenge3-solutions.Rmd /home/user$i/code/
	cp /home/rstudio/code/challenge3-solutions.html /home/user$i/code/
	sudo chown user$i -R /home/user$i/
done


# solutions challenge 3
for i in 0{1..9} {10..25}
do
	cp /home/rstudio/code/challenge4-solutions.Rmd /home/user$i/code/
	sudo chown user$i -R /home/user$i/
done
