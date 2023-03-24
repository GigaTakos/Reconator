# HACK THE WORLD
mapcidr -cidr 0.0.0.0/8 -o targets.txt

cat > ./config.json << EOF
{
    "username": "bbrf",
    "password": "<your secure password>",
    "couchdb": "https://<your-bbrf-server>/bbrf",
    "slack_token": "<a slack token to receive notifications>",
    "discord_webhook": "<your discord webhook if you want one>",
    "ignore_ssl_errors": false
}
EOF

# create a new program
bbrf new vulnkagus
# or continue with a program you have created before
bbrf use vulnkagus
# define a scope for your program
bbrf inscope add '*'

while true;
do 
	cat targets.txt	| parallel -j90 sudo docker run --rm reconator bash /opt/reconator.sh {}
done
