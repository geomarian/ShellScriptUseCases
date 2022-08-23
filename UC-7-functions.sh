#!/bin/bash -x

isPartTime=1
isFullTime=2
maxRateInMonth=100
numOfWorkingDays=20
empRatePerHr=20
totalEmpHr=0
totalWorkingDays=0

function getWorkingHours()
{
	case $randomCheck in
			$isPartTime )
				empHrs=4
			;;
			$isFullTime )
				empHrs=8
			;;
			*)
				empHrs=0
			;;
	esac
}

while [[ $totalEmpHr -lt $maxRateInMonth && $totalWorkingDays -lt $numOfWorkingDays ]]
do
	((totalWorkingDays++))
	randomCheck=$((RANDOM%3))
	getWorkingHours $randomCheck
	totalEmpHr=$(($totalEmpHr+$empHrs))
done

totalSalary=$(($totalEmpHr*$empRatePerHr))
