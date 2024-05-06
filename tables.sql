CREATE TABLE student (
	student_id	number(8) not null,	
	passport_num	varchar2(9),               --if they dont travel, we don't need this
	fname		varchar2(15) not null,
	minit		varchar2(1),               				--not absolutely necessary
	lname		varchar2(15) not null,
	gender		varchar(20) not null,
	grad_yr		number(4) not null,        -- 2024, 2025, 2026, 2027, ...
	bdate		date,			   -- 10-NOV-1927		-- not absolutely necessary
	address		varchar2(70),
	phone_num	varchar2(20) not null,
	email		varchar2(254) not null,
	major		varchar2(15) not null,
	isHumanitarian	char(1) not null,
	isGraduate	char(1) not null, 	   -- 'Y' or 'N'
	primary key (student_id)
);	

CREATE TABLE partner (
	partner_id 	number(3) not null,
	partner_name	varchar2(40) not null,
	partner_phone	varchar2(20),
	pweb		varchar2(255),
	paddress	varchar2(70),
	pemail		varchar2(254) not null,
	primary key (partner_id)
);

CREATE TABLE projects (
	pnumber 	number(3) not null,
	term		varchar2(11) not null,     -- "Spring 2024"
	plocation	varchar2(40) not null,
	tl_sid		number(8) not null,
	risk_lvl	varchar2(6) not null,
	cost		number(4) not null,
	visa_required	char(1) not null,
	part_id		number(3) not null,
	primary key (pnumber, term),
	foreign key (tl_sid) references student(student_id),
	foreign key (part_id) references partner(partner_id)
);

CREATE TABLE feedback (
	feedback_num	number(3) not null,
	feedback_text	varchar2(400),
	rating		number(1),
	pnum		number(3) not null,
    term        varchar2(11) not null,
	primary key (feedback_num),
	foreign key (pnum, term) references projects (pnumber, term)
);

CREATE TABLE scholarships (
	snum		number(4) not null,
	sname		varchar2(50) not null,
	samt		number(4) not null,
	recipient_id 	number(8) not null,
	primary key (snum),
	foreign key (recipient_id) references student (student_id)
);

CREATE TABLE emergency_contacts (
	name		varchar2(31) not null,
	sstudent_id	number(8) not null,
	phone		varchar2(20) not null,
	email		varchar2(254),
	relationship	varchar2(20),
	primary key (name, sstudent_id),
	foreign key (sstudent_id) references student (student_id)
);

CREATE TABLE works_on (
	super_studentid	number(8) not null,
	pno		number(3) not null,
    term    varchar2(11) not null,
	traveled	char(1) not null,
	primary key (super_studentid, pno, term),
	foreign key (super_studentid) references student(student_id),
	foreign key (pno, term) references projects(pnumber, term)
);