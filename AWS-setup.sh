# creating new users

for i in 0{1..9} {10..25}
do
	adduser --quiet --disabled-password --shell /bin/bash --home /home/sql$i --gecos "User" sql$i
	echo "sql$i:password$i" | chpasswd
done

# copying files and changing permissions
for i in 0{1..9} {10..25}
do
	mkdir /home/sql$i/code
	mkdir /home/sql$i/data
	mkdir /home/sql$i/data/posts
	mkdir /home/sql$i/credentials
	cp /home/rstudio/code/* /home/sql$i/code/
	cp /home/rstudio/data/congress-facebook-2017.csv /home/sql$i/data/
	cp /home/rstudio/data/posts/* /home/sql$i/data/posts/
	cp /home/rstudio/credentials/bigquery-token.json /home/sql$i/credentials/
	sudo chown sql$i -R /home/sql$i/
done	

# solutions challenge 1
for i in 0{1..9} {10..25}
do
	cp /home/rstudio/code/challenge1-solutions.Rmd /home/sql$i/code/
	cp /home/rstudio/code/challenge1-solutions.html /home/sql$i/code/
	sudo chown sql$i -R /home/sql$i/
done

# solutions challenge 2
for i in 0{1..9} {10..25}
do
	cp /home/rstudio/code/challenge2-solutions.Rmd /home/sql$i/code/
	cp /home/rstudio/code/challenge2-solutions.html /home/sql$i/code/
	sudo chown sql$i -R /home/sql$i/
done


# solutions challenge 3
for i in 0{1..9} {10..25}
do
	cp /home/rstudio/code/challenge3-solutions.Rmd /home/sql$i/code/
	cp /home/rstudio/code/challenge3-solutions.html /home/sql$i/code/
	sudo chown sql$i -R /home/sql$i/
done


# solutions challenge 3
for i in 0{1..9} {10..25}
do
	cp /home/rstudio/code/challenge4-solutions.Rmd /home/sql$i/code/
	sudo chown sql$i -R /home/sql$i/
done
