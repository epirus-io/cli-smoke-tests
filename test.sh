echo "[ EPIRUS-SMOKE ] Initializing Epirus tests"
echo "[ EPIRUS-SMOKE ] Using local Epirus API instance on localhost:80"
export EPIRUS_APP_URL="http://localhost:80"
curl -L get.epirus.io && source ~/.epirus/source.sh 
echo "[ EPIRUS-SMOKE ] Using pre-build Epirus config file"
cp .config ~/.epirus/
echo "[ EPIRUS-SMOKE ] Test 1: Running Epirus New"
epirus new --project-name=Web3App --package=org.com --output-dir=$(pwd)
cd Web3App
echo "[ EPIRUS-SMOKE ] Test 2: Deploying to Rinkeby"
epirus run rinkeby