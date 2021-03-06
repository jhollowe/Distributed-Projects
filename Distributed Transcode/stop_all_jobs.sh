
hostGroup="babbage"
hostMaxNum=33

if [[ ! -z $1 ]]; then
	hostGroup="$1"
fi

if [[ ! -z $2 ]]; then
	hostMaxNum=$2
fi


for i in `seq 1 $hostMaxNum`; do
	ssh -q $hostGroup$(( $i )) "killall ffmpeg 2> /dev/null"  2> /dev/null &
	echo "stopping job on $hostGroup$(( $i ))"
done

echo "Forced all jobs to exit"
