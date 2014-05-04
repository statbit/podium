# README

This is a pretty tiny Rails app that is running at my home to control Airfoil
on an iMac to give somewhat more one-touch accesss to music in the house (there are 
a ton of airplay speakers to turn on).

It is running on nginx / puma at the house (the puma startup script is included). I'm 
still fooling around with some of that configuration but haven't gotten around to making
it super awesome yet. 

It works basically by running applescripts against the host iMac, and so needs to be started
as a logged in user. The iMac is set to log in as me, so having puma start via my user's 
launch agents works fine. If you are starting it some other way, you'll likely get errors. 

