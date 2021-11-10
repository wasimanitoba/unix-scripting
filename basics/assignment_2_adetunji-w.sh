#!/bin/bash


wrong_usage(){
	
	echo "Try $0  -h for more information."
	exit 1;
}

usage(){
	echo "Usage: assignment_2_adetunji-w.sh -f file [-r]"
	echo -e "\t-f file, specify input file"
	echo -e "\t-r, generate a report"

}
get_student_name(){
	echo $0 | cut -c16-25 
	exit 0
		

}

make_report(){
	

	echo -ne $(< $report) | awk '/("*")/ {print;next} {printf "%s ", $0}'  
}


# first we will get the arguments
while getopts f:r:h opt; do
	case $opt in
		f)
 		#	echo "-f was triggered with argument $OPTARG" 
			filename1=$OPTARG
			get_student_name	
			exit 0
			;;
		
		r)
		#	echo "-r0 was triggered with optarg $OPTARG"
			report=$OPTARG
			make_report
			exit 0
			;;
	
		h)
			usage
			exit 0
			;;	
		\?) 
			wrong_usage
			exit 1;
			;;
		:) 	
			wrong usage
			exit 1;
			;;
	esac
done

wrong_usage #more comments..
# first argument passed can be reached with $1
exit 1;


 
