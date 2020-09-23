-- sudo apt-get install -y postgresql postgresql-contrib
--https://www.digitalocean.com/community/tutorials/how-to-customize-the-postgresql-prompt-with-psqlrc-on-ubuntu-14-04
--https://www.postgresql.org/docs/8.4/app-psql.html#APP-PSQL-PROMPTING
-- testdb=> \set foo 'my_table'
-- testdb=> SELECT * FROM :foo;
---------
-- Basically because it wasn't possible to retroactively change how views work. I'd like to be able to support SECURITY INVOKER (or equivalent) for views but as far as I know no such feature presently exists.
-- 
-- You can filter access to the view its self with row security normally.
-- 
-- The tables accessed by the view will also have their row security rules applied. However, they'll see the current_user as the view creator because views access tables (and other views) with the rights of the user who created/owns the view.
-- 
-- Maybe it'd be worth raising this on pgsql-hackers if you're willing to step in and help with development of the feature you need, or pgsql-general otherwise?
-- 
-- That said, while views access tables as the creating user and change current_user accordingly, they don't prevent you from using custom GUCs, the session_user, or other contextual information in row security policies. You can use row security with views, just not (usefully) to filter based on current_user.




CREATE TABLE t_company
(
     id            serial,
     department    text NOT NULL,
     manager       text NOT NULL
);
 
CREATE TABLE t_manager
(
     id      serial,
     person  text,
     manager text,
     UNIQUE (person, manager)
);
INSERT INTO t_manager (person, manager)
VALUES ('hans', NULL),
       ('paula', 'hans'),
       ('berta', 'hans'),
       ('manuel', 'paula'),
       ('mike', 'paula'),
       ('joe', 'berta'),
       ('jack', 'berta'),
       ('jane', 'berta')
;

INSERT INTO tabella_ruoload_schemaad (nome)
VALUES ('primo'),
       ( 'secondo'),
       ( 'primo2'),
       ( 'secondo2'),
       ('primo3'),
       ('terzo'),
       ('quarto'),
       ('primo4')
;

INSERT INTO t_company (department, manager)
VALUES ('dep_1_1', 'joe'),
       ('dep_1_2', 'jane'),
       ('dep_1_3', 'jack'),
       ('dep_2_1', 'mike'),
       ('dep_2_2', 'manuel'),
       ('dep_1', 'berta'),
       ('dep_2', 'paula'),
       ('dep', 'hans')
;



ALTER TABLE t_company ENABLE ROW LEVEL SECURITY;

ALTER TABLE tabella_ruoload_schemaad ENABLE ROW LEVEL SECURITY;

CREATE POLICY my_fancy_policy
  ON c_order
  USING (ad_client_id=1000000)



CREATE POLICY my_fancy_policy
  ON t_company
  USING (manager IN ( WITH RECURSIVE t AS
                        (
                           SELECT current_user AS person, NULL::text AS manager
                           FROM t_manager
                           WHERE manager = CURRENT_USER
                           UNION ALL
                           SELECT m.person, m.manager
                           FROM t_manager m
                           INNER JOIN t ON t.person = m.manager
                        )
                        SELECT person FROM t
                    )
        )
;



CREATE ROLE paula LOGIN;
GRANT ALL ON t_company TO paula;
GRANT ALL ON t_manager TO paula;

SET ROLE paula;
SELECT * FROM t_company;
