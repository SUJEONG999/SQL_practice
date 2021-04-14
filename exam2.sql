SELECT * 
FROM edu13db.emp;



SELECT *
FROM edu13db.emp
ORDER BY sal; -- 월급이 적은순으로



SELECT *
FROM edu13db.emp
ORDER BY sal DESC; -- 월급이 많은순으로



SELECT * 
FROM edu13db.emp
ORDER BY hiredate; -- 고용날짜가 오래된 순으로



SELECT * 
FROM edu13db.emp
ORDER BY hiredate DESC; -- 고용날짜가 최근인 순으로




SELECT * 
FROM edu13db.emp
WHERE deptno = 30; 



SELECT ename, sal, deptno 
FROM edu13db.emp
WHERE empno = 7900;




SELECT ename, sal, deptno 
FROM edu13db.emp
WHERE ename = 'JONES';




SELECT ename, sal, deptno 
FROM edu13db.emp
WHERE ename = 'jones';-- mariaDB에서 변수  VARCHAR는 대소문자 구분 안함.




SELECT ename, sal, deptno 
FROM edu13db.emp
WHERE ename = 'J%'; -- 등가연산자 쓰면 아무것도 안나옴/ 일치하는 거로 찾기 때문



SELECT ename, sal, deptno 
FROM edu13db.emp
WHERE ename like 'J%'; -- 등가연산자가 아니라 like 연산자를 써야함. (J로 시작하는)




SELECT ename, sal, deptno 
FROM edu13db.emp
WHERE ename LIKE '%O%'; -- O가 들어가는 




SELECT ename, sal, deptno 
FROM edu13db.emp
WHERE ename LIKE '%O__'; -- O가 들어가 있고 O뒤에 두글자가 오는





SELECT ename, sal, hiredate 
FROM edu13db.emp
WHERE date_format(hiredate, '%Y') = '1981'; -- 고용날짜가 1981년인 경우




SELECT ename, sal, date_format(hiredate, '%Y') -- 연도만 추출
FROM edu13db.emp
WHERE date_format(hiredate, '%Y') = '1981';





SELECT ename 직원명, sal 급여, date_format(hiredate, '%Y') "입사 년도" -- 컬럼명 지정하기
FROM edu13db.emp
WHERE date_format(hiredate, '%Y') = '1981';




SELECT ename 직원명, job 직무, date_format(hiredate, '%Y') "입사 년도"  -- 공백이 있을 경우 인용부호로 묶어서 쓴다.
FROM edu13db.emp
WHERE date_format(hiredate, '%Y') = '1981'
AND job = 'manager';


SELECT ename 직원명, job 직무, date_format(hiredate, '%Y') "입사 년도", deptno "부서 번호"
FROM edu13db.emp
WHERE date_format(hiredate, '%Y') = '1981' -- 조건이 3개인 경우
AND job = 'manager'
AND deptno = 20;




SELECT *
FROM edu13db.emp
WHERE deptno = 10
OR deptno = 20;




SELECT *
FROM edu13db.emp
WHERE deptno IN (10,20); -- 여러 값 지정할때 유용




SELECT *
FROM edu13db.emp
WHERE sal >= 2000
AND sal <= 3000;



SELECT *
FROM edu13db.emp
WHERE sal BETWEEN 2000 AND 3000;




SELECT deptno, SUM(sal) 
FROM edu13db.emp
GROUP BY deptno; -- 그룹단위로 집계




SELECT deptno, SUM(sal) 
FROM edu13db.emp
GROUP BY deptno
HAVING SUM(sal) > 10000; -- 그룹조건 설정




SELECT deptno "부서번호", SUM(sal) "부서별 급여합"
FROM edu13db.emp
GROUP BY deptno;




SELECT deptno "부서번호", MAX(sal) "부서별 최대급여"
FROM edu13db.emp
GROUP BY deptno;




SELECT deptno "부서번호", job 직무, MAX(sal) "부서별 직무별 최대 급여"
FROM edu13db.emp
GROUP BY deptno, job;



SELECT job, COUNT(*) -- GROUP BY 사용시, 그룹단위로 집계
FROM edu13db.emp
WHERE deptno = 30
GROUP BY job;


SELECT job, COUNT(*) -- 전체로 집계
FROM edu13db.emp


SELECT job, COUNT(*)
FROM edu13db.emp
WHERE deptno = 30
GROUP BY job
HAVING COUNT(*) > 2;




SELECT ename, sal 
FROM edu13db.emp
ORDER BY sal DESC;

 
 

SELECT ename, concat(sal, '원')  -- 원을 결합하여 내보냄
FROM edu13db.emp
ORDER BY sal DESC;




SELECT ename, concat(format(sal, 0), '원')  -- 1000단위 마다 콤마 넣어주고 원붙임./ 소수점 자리수 설정은 두번째 아규먼트
FROM edu13db.emp
ORDER BY sal DESC;



SELECT job
FROM edu13db.emp;



SELECT distinct job -- 중복제거하여 표현하기
FROM edu13db.emp;



SELECT ename
FROM edu13db.emp
WHERE date_format(hiredate, '%Y') = '1981';


SELECT ename
FROM edu13db.emp
WHERE deptno = 10;



SELECT ename
FROM edu13db.emp
WHERE date_format(hiredate, '%Y') = '1981'
UNION all
select ename
FROM edu13db.emp
WHERE deptno = 10;



SELECT ename
FROM edu13db.emp
WHERE date_format(hiredate, '%Y') = '1981'
UNION
SELECT ename
FROM edu13db.emp
WHERE deptno = 10;



SELECT ename
FROM edu13db.emp
WHERE date_format(hiredate, '%Y') = '1981'
INTERSECT
SELECT ename
FROM edu13db.emp
WHERE deptno = 10;



SELECT ename
FROM edu13db.emp
WHERE date_format(hiredate, '%Y') = '1981'
EXCEPT
SELECT ename
FROM edu13db.emp
WHERE deptno = 10;



SELECT ename, '근무중' -- 14개의 직원이름이 나오는데 모든 행마다 근무중 붙임
FROM edu13db.emp;



SELECT ename, '근무중', 100, NOW()
FROM edu13db.emp;




SELECT ename, sal, sal*12
FROM edu13db.emp;



SELECT *
FROM edu13db.emp
ORDER BY sal DESC
LIMIT 1; -- 행 하나만 출력



SELECT *
FROM edu13db.emp
ORDER BY sal DESC
LIMIT 7;




SELECT *
FROM edu13db.emp
ORDER BY sal DESC
LIMIT 5 OFFSET 0; -- OFFSET : 몇번째부터 출력하겠다.// 1번째부터 5개 출력




SELECT *
FROM edu13db.empedu13db
ORDER BY sal DESC
LIMIT 3 OFFSET 3; -- 4번째부터 3개출력