#!bin/bash
echo -e "IP Address\tSub-Domain"
for ((i=0;i<=255;i++));do
	for ((ii=0;ii<=255;ii++));do
		output=($(nslookup 130.15.${i}.${ii}))
		if [[ "${output[9]}" == *"cs.queensu.ca." ]];then
			echo -e "130.15.${i}.${ii}\t${output[9]}"
		fi
	done
done
