package cn.edu.gues.pojo;

/**
 * ClassAndCollege
 *
 * @author lulu
 * @date 2019-05-26
 **/
public class ClassAndCollege {
    private Long classId;
    private String className;
    private Long collegeId;
    private String collegeName;

    public Long getClassId() {
        return classId;
    }

    public void setClassId(Long classId) {
        this.classId = classId;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public Long getCollegeId() {
        return collegeId;
    }

    public void setCollegeId(Long collegeId) {
        this.collegeId = collegeId;
    }

    public String getCollegeName() {
        return collegeName;
    }

    public void setCollegeName(String collegeName) {
        this.collegeName = collegeName;
    }
}
