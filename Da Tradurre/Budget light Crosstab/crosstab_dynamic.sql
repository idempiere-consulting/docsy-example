CREATE TABLE demo1(
	a text
);
SELECT * FROM demo1
DROP TABLE students
CREATE TABLE students(
	s_id SERIAL primary key,
	name character varying(50) 
);
INSERT INTO students(name) VALUES
('Dũng'),
('Bình')
SELECT * FROM students;
DROP TABLE mark
CREATE TABLE mark(
	m_id SERIAL primary key,
	m_mark numeric(10,0),
	s_id integer,
	CONSTRAINT s_m FOREIGN KEY (s_id) REFERENCES students(s_id)
);
INSERT INTO mark(m_mark,s_id) VALUES
(100,1),
(70,2),
(50,1),
(60,2),
(80,1),
(30,2),
(10,2),
(45,1);
SELECT * FROM mark;
--SELECT DATA
SELECT rank() OVER (PARTITION BY s.name ORDER BY m.m_mark ASC),s.name,m.m_mark FROM students s LEFT JOIN mark m ON s.s_id=m.s_id ORDER BY 1,2
--CROSS TAB static
SELECT * FROM crosstab(
       'SELECT rank() OVER (PARTITION BY s.name ORDER BY m.m_mark ASC) AS s_id,s.name,m.m_mark FROM students s LEFT JOIN mark m ON s.s_id=m.s_id ORDER BY 1,2'  
      ,$$ VALUES ('Dũng'), ('Bình')$$)
AS ct ("s_id" integer, "Dũng" numeric(10,0), "Bình" numeric(10,0));
--CROSS TAB DYNAMIC
--Function loop student for dynamic cross tab
DROP FUNCTION test_crosstab_dynamics(text)
CREATE OR REPLACE FUNCTION test_crosstab_dynamics(symb character varying(2)) RETURNS text AS
$$
	DECLARE
		tmp character varying(1000);
		cts character varying(1000);
		s character varying(1000);
		r RECORD;
	BEGIN
		tmp:= '';
		s:=null;
		cts:='("s_id" integer,';
		FOR r IN SELECT  s_id,name  FROM students ORDER BY s_id
			LOOP
				IF r.s_id IS NOT NULL AND r.s_id <> (SELECT s_id FROM students ORDER BY s_id DESC LIMIT 1) THEN
					tmp := tmp || '(''' || r.name || '''),';
					cts:=cts || r.name || ' numeric(10,0),';
				ELSE
					tmp := tmp || '(''' || r.name || ''')';
					cts:=cts || r.name || ' numeric(10,0))';
				END IF; 	
			END LOOP;
			
			s:='SELECT * FROM crosstab(''';
				s:=s || 'SELECT rank() OVER (PARTITION BY s.name ORDER BY m.m_mark ASC),s.name,m.m_mark FROM students s LEFT JOIN mark m ON s.s_id=m.s_id ORDER BY 1,2''';  
			        s:=s ||',';
			        s:=s || symb || 'VALUES' || tmp || symb ||') AS ct' || cts;
		RETURN s;
	END;
$$
LANGUAGE plpgsql;
--
SELECT * FROM (SELECT * FROM test_crosstab_dynamics('$$')) AS t
--
SELECT * FROM crosstab('SELECT rank() OVER (PARTITION BY s.name ORDER BY m.m_mark ASC),s.name,m.m_mark FROM students s LEFT JOIN mark m ON s.s_id=m.s_id ORDER BY 1,2',$$VALUES('Dũng'),('Bình')$$) AS ct("s_id" integer,Dũng numeric(10,0),Bình numeric(10,0))
