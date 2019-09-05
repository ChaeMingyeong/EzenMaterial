--jsp 시험
create table score(
   hak number not null,
   name varchar(40) not null,
   kor number,
   eng number,
   mat number,
   tot number,
   avg number,
   PRIMARY KEY (hak));

insert into score values(201539007, '채민경', 80,80,80);

insert into score values(201900001, '새내기', 90,80,70,0,0);
insert into score values(201900002, '새내기', 90,80,70,0,0);
insert into score values(201900003, '새내기', 90,80,70,0,0);
insert into score values(201900004, '새내기', 90,80,70,0,0);
insert into score values(201900005, '새내기', 90,80,70,0,0);
insert into score values(201900006, '새내기', 90,80,70,0,0);
insert into score values(201900007, '새내기', 90,80,70,0,0);
insert into score values(201900008, '새내기', 90,80,70,0,0);
insert into score values(201900009, '새내기', 90,80,70,0,0);
insert into score values(201900010, '새내기', 90,80,70,0,0);
insert into score values(201900011, '새내기', 90,80,70,0,0);
insert into score values(201900012, '새내기', 90,80,70,0,0);
insert into score values(201900013, '새내기', 90,80,70,0,0);
insert into score values(201900014, '새내기', 90,80,70,0,0);
insert into score values(201900015, '새내기', 90,80,70,0,0);
insert into score values(201900016, '새내기', 90,80,70,0,0);
insert into score values(201900017, '새내기', 90,80,70,0,0);
insert into score values(201900018, '새내기', 90,80,70,0,0);
insert into score values(201900019, '새내기', 90,80,70,0,0);
insert into score values(201900020, '새내기', 90,80,70,0,0);
insert into score values(201900021, '새내기', 90,80,70,0,0);
insert into score values(201900022, '새내기', 90,80,70,0,0);
insert into score values(201900023, '새내기', 90,80,70,0,0);
insert into score values(201900024, '새내기', 90,80,70,0,0);
insert into score values(201900025, '새내기', 90,80,70,0,0);
insert into score values(201900026, '새내기', 90,80,70,0,0);
insert into score values(201900027, '새내기', 90,80,70,0,0);
insert into score values(201900028, '새내기', 90,80,70,0,0);
insert into score values(201900029, '새내기', 90,80,70,0,0);
insert into score values(201900030, '새내기', 90,80,70,0,0);
insert into score values(201900031, '새내기', 90,80,70,0,0);
insert into score values(201900032, '새내기', 90,80,70,0,0);
insert into score values(201900033, '새내기', 90,80,70,0,0);
insert into score values(201900034, '새내기', 90,80,70,0,0);
insert into score values(201900035, '새내기', 90,80,70,0,0);
insert into score values(201900036, '새내기', 90,80,70,0,0);
insert into score values(201900037, '새내기', 90,80,70,0,0);
insert into score values(201900038, '새내기', 90,80,70,0,0);
insert into score values(201900039, '새내기', 90,80,70,0,0);
insert into score values(201900040, '새내기', 90,80,70,0,0);
insert into score values(201900041, '새내기', 90,80,70,0,0);
insert into score values(201900042, '새내기', 90,80,70,0,0);
insert into score values(201900043, '새내기', 90,80,70,0,0);
insert into score values(201900044, '새내기', 90,80,70,0,0);
insert into score values(201900045, '새내기', 90,80,70,0,0);
insert into score values(201900046, '새내기', 90,80,70,0,0);
insert into score values(201900047, '새내기', 90,80,70,0,0);
insert into score values(201900048, '새내기', 90,80,70,0,0);
insert into score values(201900049, '새내기', 90,80,70,0,0);
insert into score values(201900050, '새내기', 90,80,70,0,0);

select * from
(select rownum rn, pp. *from        
(select * from score order by hak asc) pp)
where rn>=1 and rn<=5;


select * from score order by hak asc;
delete score where hak = 201539007;
select count(*) as count from score;
commit;