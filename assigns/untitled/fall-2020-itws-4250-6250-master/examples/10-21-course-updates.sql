ALTER TABLE enroll ADD FOREIGN KEY (student_email) REFERENCES student(email)
    ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE enroll ADD FOREIGN KEY (course_name, semester) REFERENCES course(name, semester)
    ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE course ADD CHECK (capacity > 0);

CREATE OR REPLACE VIEW database_students AS
SELECT email, major, name
FROM student, enroll
WHERE email = student_email
  AND course_name ilike '%database%';

CREATE INDEX course_semester ON course(semester, name);

CREATE FUNCTION verify_grade_floor() RETURNS TRIGGER
AS $$
BEGIN
    IF OLD.grade > NEW.grade
    THEN RETURN NULL;
    ELSE RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER grade_floor_trigger
    BEFORE UPDATE ON grades
    FOR EACH ROW
EXECUTE PROCEDURE verify_grade_floor();

DROP TABLE IF EXISTS grade_log;
CREATE TABLE grade_log(
                          student_email VARCHAR(255),
                          old_grade FLOAT,
                          new_grade FLOAT,
                          updated TIMESTAMP
);

CREATE OR REPLACE FUNCTION log_grade_change() RETURNS TRIGGER
AS $$
BEGIN
    INSERT INTO grade_log(student_email, old_grade, new_grade, updated)
    VALUES(NEW.student_email ,OLD.grade, NEW.grade, now());

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER grade_change_trigger
    AFTER UPDATE OF grade ON grades
    FOR EACH ROW
    WHEN (OLD.grade < NEW.grade)
EXECUTE PROCEDURE log_grade_change();

CREATE OR REPLACE FUNCTION grade_curver() RETURNS TRIGGER
AS $$
DECLARE
    diff FLOAT;
    curved grades%ROWTYPE;
BEGIN
    diff := NEW.grade - OLD.grade;
    curved := NEW;
    curved.grade = NEW.grade - (diff / 2);
    IF diff < 0
    THEN RETURN curved;
    ELSE RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER grade_curve_trigger
    BEFORE UPDATE OF grade ON grades
    FOR EACH ROW
EXECUTE PROCEDURE grade_curver();