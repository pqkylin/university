-- homework4--step3

-- 3-1.把peoples表中school不是GDUFS的人全部找出来？（包括school为NULL的人）写出MySQL语句。
select * from peoples where school is NULL or school != 'GDUFS';

-- 3-2.查找计算机系每次考试学生的平均成绩(最终显示考试名称, 平均分)。
select exam_name,avg(grade) from student;

-- 3-3.查找女学霸（考试平均分达到80分或80分以上的女生的姓名, 分数）。
select name,grade from student where avg(grade) >= 80 and sex = 'f';

-- 3-4.找出人数最少的院系以及其年度预算。
select academy,yearly budget from school where people = min(people);

-- 3-5.计算机系改名了，改成计算机科学系（comp. sci.），写出mysql语句。
update school set academy = 'sci.' where academy = 'comp.';

-- 3-6.修改每个系的年度预算，给该系的每个学生发2000元奖金。（修改每个系的年度预算为 原预算+该系人数*2000）。
update school set yearly_budget = yearly_budget + stu.num*2000;

-- 3-7.向department表中插入一条数据, dept_name属性的值为avg_budget, building为空, 年度预算为所有院系的年度预算平均值.
insert into department (dept_name,building,budget) select "avg_budget",null,sum(budget)/count(budget) from department;



-- 3-8. 删除计算机系中考试成绩平均分低于70的学生
delete from peoples where academy = 'comp.' and avg(grade) < 70;

-- 3-9.找出所有正在谈恋爱,但是学习成绩不佳(考试平均分低于75)的学生,强制将其情感状态改为单身.
select * from student where emotion_state = 'loving' and avg(grade) < 75;
update student set emotion_state = 'single' where emotion_state = 'loving' and avg(grade) < 75;

-- 3-10(选做). 对每个学生, 往exam表格中插入名为Avg_Exam的考试, 考试分数为之前学生参加过考试的平均分.
alter table exam add column Avg_Exam varchar(100);
insert into exam set Avg_Exam = avg(grade);





