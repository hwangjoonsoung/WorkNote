-- dumping
mysqldump -u root -p [database name] > [path+file name]
ex) mysqldump -u root -p kipeconf > /home/webcric/dumped_data

-- import
mysql -u root -p [database name] < [path+dumped sql file name]
ex) mysql -u root -p kipeconf < /home/webcric/dumped_data/kipe.sql


|        7 | 0.00074175 | select * from registrations limit 1,100 |
|        9 | 0.00066450 | select * from registrations limit 100   |

|       11 | 0.00069275 | select * from registrations limit 1,100 |
|       12 | 0.00133650 | select * from registrations limit 100