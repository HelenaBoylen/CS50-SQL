-- Create Indexes

-- Student related:
CREATE INDEX "student_name_index"
ON "students"("name");

-- Course related:
CREATE INDEX "course_semester_index"
ON "courses"("title", "semester");

CREATE INDEX "course_info_index"
ON "courses"("department", "number", "semester");

-- Requirement related:
CREATE INDEX "requirements_index"
ON "requirements"("name");

-- Enrollment related:
CREATE INDEX "enrollments_index"
ON "enrollments"("student_id", "course_id");

