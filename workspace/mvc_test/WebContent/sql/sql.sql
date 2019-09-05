create table score2(
   hak number not null,
   name varchar(40) not null,
   kor number,
   eng number,
   mat number,
   his number, 
   tot number,
   avg number,
   PRIMARY KEY (hak));
   


insert into score2 values(201900001, '새내기', 80, 90,80, 90,0,0);
insert into score2 values(201900002, '새내기', 80, 90,80, 90,0,0);
insert into score2 values(201900003, '새내기', 80, 90,80, 90,0,0);
insert into score2 values(201900004, '새내기', 80, 90,80, 90,0,0);
insert into score2 values(201900005, '새내기', 80, 90,80, 90,0,0);
insert into score2 values(201900006, '새내기', 80, 90,80, 90,0,0);
insert into score2 values(201900007, '새내기', 80, 90,80, 90,0,0);
insert into score2 values(201900008, '새내기', 80, 90,80, 90,0,0);
insert into score2 values(201900009, '새내기', 80, 90,80, 90,0,0);
insert into score2 values(201900010, '새내기', 80, 90,80, 90,0,0);
insert into score2 values(201900011, '새내기', 80, 90,80, 90,0,0);
insert into score2 values(201900012, '새내기', 80, 90,80, 90,0,0);
insert into score2 values(201900013, '새내기', 80, 90,80, 90,0,0);
insert into score2 values(201900014, '새내기', 80, 90,80, 90,0,0);
insert into score2 values(201900015, '새내기', 80, 90,80, 90,0,0);
insert into score2 values(201900016, '새내기', 80, 90,80, 90,0,0);
insert into score2 values(201900017, '새내기', 80, 90,80, 90,0,0);
insert into score2 values(201900018, '새내기', 80, 90,80, 90,0,0);
insert into score2 values(201900019, '새내기', 80, 90,80, 90,0,0);
insert into score2 values(201900020, '새내기', 80, 90,80, 90,0,0);
insert into score2 values(201900021, '새내기', 80, 90,80, 90,0,0);
insert into score2 values(201900022, '새내기', 80, 90,80, 90,0,0);
insert into score2 values(201900023, '새내기', 80, 90,80, 90,0,0);
insert into score2 values(201900024, '새내기', 80, 90,80, 90,0,0);
insert into score2 values(201900025, '새내기', 80, 90,80, 90,0,0);
insert into score2 values(201900026, '새내기', 80, 90,80, 90,0,0);
insert into score2 values(201900027, '새내기', 80, 90,80, 90,0,0);
insert into score2 values(201900028, '새내기', 80, 90,80, 90,0,0);
insert into score2 values(201900029, '새내기', 80, 90,80, 90,0,0);
insert into score2 values(201900030, '새내기', 80, 90,80, 90,0,0);
insert into score2 values(201900031, '새내기', 80, 90,80, 90,0,0);
insert into score2 values(201900032, '새내기', 80, 90,80, 90,0,0);
insert into score2 values(201900033, '새내기', 80, 90,80, 90,0,0);
select * from score2 order by hak asc;

select * from   
(select rownum rn, tt. *from        
(select * from score2 order by hak asc) tt)
where rn>=1 and rn<=10;

select count(*) from score2;

delete score2 where hak = 201539007;
commit;