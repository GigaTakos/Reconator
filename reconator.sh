# BUG BOUNTY RECON AWESOME ONLINER PIPELINE

cat <<EOF > services.txt
tcp:9990
tcp:9991
tcp:9992
EOF

echo "$1"
echo "$1" | /root/go/bin/httpx -nfs -H "X-tool: github.com/GigaTakos/Reconator" -p $(cat services.txt | awk -F ":" '{print $2}' | sort -u | tr '\n' ',' | sed 's/,$//') -silent -t 1 -json | jq -c '. | "bbrf url add '"'"'\(."url"|@sh) \(."status-code") \(."content-length")'"'"' -t last_update:$(date +%s) -t http_title:\(."title"[0:15]|@sh)"' | sed -E 's| null| 0|g' | sed 's/\\"//g' | xargs -I {} sh -c 'echo {}'
