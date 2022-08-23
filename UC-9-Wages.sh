#!/bin/bash -x

isPartTime=1
isFullTime=2
empRatePerHr=20
maxRateInMonth=100
numOfWorkingDays=20

totalEmpHr=0
totalWorkingDays=0

#function to caluclutae dailywage
function getWorkHours()
{
	case $randomCheck in
			$isPartTime )
				empHr=4
			;;
			$isFullTime )
				empHr=8
			;;
			*)
				empHr=0
			;;
	esac
}
#function to caluclutae totalWage/TotalSalary

function getEmpWage()
{
	echo $(($totalEmpHr*$empRatePerHr))
}

while [[ $totalEmpHr -lt $maxRateInMonth && 
$totalWorkingDays -lt $numOfWorkingDays ]]
do
	((totalWorkingDays++))
	randomCheck=$((RANDOM%3))
	getWorkHours $randomCheck
	totalEmpHr=$(($totalEmpHr+$empHr))
	dailyWages[$totalWorkingDays]=$(($empHr*$empRatePerHr))
done

totalSalary=$( getEmpWage $totalEmpHr )  #totalwage
echo ${dailyWages[@]}    #Dailywages

echo ${!dailyWages[@]}   #days

echo ${#dailyWages[@]}   #total no of days 
