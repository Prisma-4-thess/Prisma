#!/bin/bash
# This script handles ssh and scp operations to all our servers
# by spirosbond

mylo=user@snf-493177.vm.okeanos.grnet.gr
dimitris=user@snf-219118.vm.okeanos.grnet.gr
spiros=user@snf-30113.vm.okeanos.grnet.gr

mySsh(){
	echo ""
	echo ""
	echo "  1    Connect to Dimitris"
	echo "  2    Connect to Mylo"
	echo "  3    Connect to Spiros"
	echo "Enter your desired destination..."
	read -n 1 ANSWER
	echo ""
	case "$ANSWER" in
		1)
echo "Connecting to $dimitris"
ssh $dimitris
;;
2)
echo "Connecting to $mylo"
ssh $mylo
;;
3)
echo "Connecting to $spiros"
ssh $spiros
;;
*)
echo "Unknown command: '$ANSWER'"
;;
esac
}

myScp(){
	echo ""
	echo ""
	echo "  1    Send to Dimitris"
	echo "  2    Send to Mylo"
	echo "  3    Send to Spiros"
	echo "Enter destination:"
	read -n 1 dest
	echo ""
	read -e -p "Enter local file path: " localPath
	history -s "$localPath"
	localPath=${localPath/\~/$HOME}
	read -e -p "Enter destination file path: " destPath
	history -s "$destPath"
	case "$dest" in
		1)
echo "Sending file $localPath to $dimitris:$destPath"
scp $localPath $dimitris:$destPath
;;
2)
echo "Sending file $localPath to $mylo:$destPath"
scp $localPath $mylo:$destPath
;;
3)
echo "Sending file $localPath to $spiros:$destPath"
scp $localPath $spiros:$destPath
;;
*)
echo "Unknown command: '$ANSWER'"
;;
esac
}

start(){
	echo ""
	echo ""
	echo "Welcome to Server Utils!"
	echo "  1    ssh"
	echo "  2    scp"
	echo "  3    Clear history"
	echo "Enter your desired utility..."
	read -n 1 ANSWER
	case "$ANSWER" in
		1)	mySsh;;
2)	myScp;;
3)	clearHistory;;
*)
echo "Unknown command: '$ANSWER'"
;;
esac
start
}

function finish {
	echo ""
	echo "Closing... Bye!"
	echo ""
	history -w ~/.serverUtils
}
function clearHistory {
	echo ""
	echo "Clearing history..."
	rm ~/.serverUtils
	history -c
	echo "Done!"
}

history -r ~/.serverUtils
trap finish EXIT
start