create table  book(
   code varchar2(40) not null,
   title varchar2(40) not null,
   author varchar2(40) not null,
   publisher varchar2(40),
   price number,
   primary key(code)
);

select * from book;
select * from book where code = 'A-101';
insert into book values('A-103', '테스트', '테스트', '오렌지땅콩', 12000);
insert into book values('A-104', '테스트', '테스트', '오렌지땅콩', 12000);
insert into book values('A-105', '테스트', '테스트', '오렌지땅콩', 12000);
insert into book values('A-106', '테스트', '테스트', '오렌지땅콩', 12000);
insert into book values('A-107', '테스트', '테스트', '오렌지땅콩', 12000);
insert into book values('A-108', '테스트', '테스트', '오렌지땅콩', 12000);
insert into book values('A-109', '테스트', '테스트', '오렌지땅콩', 12000);
insert into book values('A-110', '테스트', '테스트', '오렌지땅콩', 12000);
insert into book values('A-111', '테스트', '테스트', '오렌지땅콩', 12000);
insert into book values('A-112', '테스트', '테스트', '오렌지땅콩', 12000);
insert into book values('A-113', '테스트', '테스트', '오렌지땅콩', 12000);
insert into book values('A-114', '테스트', '테스트', '오렌지땅콩', 12000);
insert into book values('A-115', '테스트', '테스트', '오렌지땅콩', 12000);
insert into book values('A-116', '테스트', '테스트', '오렌지땅콩', 12000);
insert into book values('A-117', '테스트', '테스트', '오렌지땅콩', 12000);
insert into book values('A-118', '테스트', '테스트', '오렌지땅콩', 12000);
insert into book values('A-119', '테스트', '테스트', '오렌지땅콩', 12000);
insert into book values('A-120', '테스트', '테스트', '오렌지땅콩', 12000);
insert into book values('A-121', '테스트', '테스트', '오렌지땅콩', 12000);
insert into book values('A-122', '테스트', '테스트', '오렌지땅콩', 12000);
insert into book values('A-123', '테스트', '테스트', '오렌지땅콩', 12000);
insert into book values('A-124', '테스트', '테스트', '오렌지땅콩', 12000);
insert into book values('A-125', '테스트', '테스트', '오렌지땅콩', 12000);
insert into book values('A-126', '테스트', '테스트', '오렌지땅콩', 12000);
insert into book values('A-127', '테스트', '테스트', '오렌지땅콩', 12000);
insert into book values('A-128', '테스트', '테스트', '오렌지땅콩', 12000);
insert into book values('A-129', '테스트', '테스트', '오렌지땅콩', 12000);
insert into book values('A-130', '테스트', '테스트', '오렌지땅콩', 12000);
insert into book values('A-131', '테스트', '테스트', '오렌지땅콩', 12000);
insert into book values('A-132', '테스트', '테스트', '오렌지땅콩', 12000);
delete book where code ='A-101';

select * from   
(select rownum rn, tt. *from        
(select * from book order by code desc) tt)
where rn>=1 and rn<=10;

select count(*) as count from book;

commit;