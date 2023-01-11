/* Table: Seat
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| student     | varchar |
+-------------+---------+
id is the primary key column for this table.
Each row of this table indicates the name and the ID of a student.
id is a continuous increment.
Write an SQL query to swap the seat id of every two consecutive students.
If the number of students is odd, the id of the last student is not swapped.
Return the result table ordered by id in ascending order.
The query result format is in the following example.

Example 1:
Input:
Seat table:
+----+---------+
| id | student |
+----+---------+
| 1  | Abbot   |
| 2  | Doris   |
| 3  | Emerson |
| 4  | Green   |
| 5  | Jeames  |
+----+---------+
Output:
+----+---------+
| id | student |
+----+---------+
| 1  | Doris   |
| 2  | Abbot   |
| 3  | Green   |
| 4  | Emerson |
| 5  | Jeames  |
+----+---------+
Explanation:
Note that if the number of students is odd, there is no need to change the last one's seat.
 */

-- Path: day16/swap_seat.sql

CREATE TABLE seat (
    id INT NOT NULL,
    student VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO seat (id, student) VALUES (1, 'Abbot');
INSERT INTO seat (id, student) VALUES (2, 'Doris');

INSERT INTO seat (id, student) VALUES (3, 'Emerson');
INSERT INTO seat (id, student) VALUES (4, 'Green');
INSERT INTO seat (id, student) VALUES (5, 'Jeames');

/* Output:
+----+---------+
| id | student |
+----+---------+
| 1  | Doris   |
| 2  | Abbot   |
| 3  | Green   |
| 4  | Emerson |
| 5  | Jeames  | */
--swap id using plsql

CREATE OR REPLACE PROCEDURE swap_seat
AS
    v_id1 seat.id%TYPE;
    v_id2 seat.id%TYPE;
    v_student1 seat.student%TYPE;
    v_student2 seat.student%TYPE;
BEGIN
    FOR i IN (SELECT id FROM seat) LOOP
        IF MOD(i.id, 2) = 0 THEN
            SELECT student INTO v_student1 FROM seat WHERE id = i.id - 1;
            SELECT student INTO v_student2 FROM seat WHERE id = i.id;
            UPDATE seat SET student = v_student1 WHERE id = i.id;
            UPDATE seat SET student = v_student2 WHERE id = i.id - 1;
        END IF;
    END LOOP;
END;
/
