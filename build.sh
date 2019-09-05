chmod +x ./build.sh 

mkdir dist

copy code from src directory into dist or build directory 

cp ./src/app.rb ./dist
cp ./src/itinerary.csv ./dist
cp ./src/countries.json ./dist

gem install tty-prompt
gem install tty-spinner
gem install csv
gem install json