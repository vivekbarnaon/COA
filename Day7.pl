% Employee Database
% employee(EmployeeID, Name, Company, Designation, DateOfJoining, Degree, Institute).

employee(101, 'Lakshmi Shrivastava', 'AMAZON', 'Software Engineer', '2019-06-15', 'B.Tech', 'HIT').
employee(102, 'Rahul Verma', 'TCS', 'Data Scientist', '2020-07-10', 'M.Tech', 'HIT').
employee(103, 'Ananya Gupta', 'TCS', 'Software Developer', '2018-08-20', 'B.Tech', 'HIT').
employee(104, 'Aryan Sharma', 'AMAZON', 'ML Engineer', '2021-05-30', 'M.Tech', 'HIT').
employee(105, 'Pooja Reddy', 'TCS', 'Software Engineer', '2017-09-12', 'B.Tech', 'HIT').
employee(106, 'Karan Singh', 'TCS', 'Software Developer', '2019-12-01', 'M.Tech', 'HIT').
employee(107, 'Lakshmi Shrivastava', 'MICROSOFT', 'AI Engineer', '2022-01-05', 'B.Tech', 'IITD').

% a) Extract the records of Employee with EMPNAME='Lakshmi Shrivastava' and COMPANY='AMAZON'

query_a(EmployeeID, Name, Company, Designation, DateOfJoining, Degree, Institute) :-
    employee(EmployeeID, 'Lakshmi Shrivastava', 'AMAZON', Designation, DateOfJoining, Degree, Institute).

% b) Retrieve names of employees, EmployeeID, DateOfJoining, and Degree
% Working in 'TCS', 'CTS', or 'AMAZON'
% from 'CSE', 'CSE-AIML', 'CSE-DSA' from 'HIT'

query_b(EmployeeID, Name, DateOfJoining, Degree) :-
    employee(EmployeeID, Name, Company, _, DateOfJoining, Degree, 'HIT'),
    member(Company, ['TCS', 'CTS', 'AMAZON']),
    member(Degree, ['B.Tech', 'M.Tech']).
