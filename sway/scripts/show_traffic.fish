#!/bin/fish
function convert_to_hrf
	numfmt --to=si $argv
end

function get_stats0
	ip -j -s link | jq '.[] | select(.link_type != "loopback").stats64'
end

function get_rx_stats
	echo $argv | jq .rx.bytes
end

function get_tx_stats
	echo $argv | jq .tx.bytes
end

function accumulate
	set sum 0

	for each in (string split \n $argv)
		set -f sum (math $sum+$each)
	end

	echo $sum
end

set stats (get_stats0)
set rx_stats (get_rx_stats $stats)
set tx_stats (get_tx_stats $stats)


set rx_total (accumulate $rx_stats)
set tx_total (accumulate $tx_stats)

set tmp_file /tmp/net_traffic_record.txt

if test -f $tmp_file
	cat $tmp_file | read -l -d\  rx_before tx_before

	set rx_diff (math $rx_total-$rx_before)
	set tx_diff (math $tx_total-$tx_before)
	
	set rx_hrf (convert_to_hrf $rx_diff)B
	set tx_hrf (convert_to_hrf $tx_diff)B

	set pad_width 9

	echo  (string pad -w$pad_width -c_ $rx_hrf)  (string pad -w$pad_width -c_ $tx_hrf)
end

echo $rx_total $tx_total > $tmp_file
