#!/bin/sh
echo "Limit maximum bw to 4Mbps"
sudo wondershaper eth0 1048576 1048576
