package cn.edu.gues.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * StuInformation
 *
 * @author lulu
 * @date 2019-05-10
 **/
public class StuInformation {
    private String name;
    private Boolean gender;
    private String nationality;
    private String politicalStatus;
    private String beforeResidency;
    private String idCardNum;
    /*@JsonFormat(pattern = "yyyy-MM-dd")
    private Date birthday;*/
    private String graduatedSchool;
    private String totalNumOfFamily;
    private String phone;
    private String houseStatus;
    private String specialty;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getGender() {
        return gender;
    }

    public void setGender(Boolean gender) {
        this.gender = gender;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getPoliticalStatus() {
        return politicalStatus;
    }

    public void setPoliticalStatus(String politicalStatus) {
        this.politicalStatus = politicalStatus;
    }

    public String getBeforeResidency() {
        return beforeResidency;
    }

    public void setBeforeResidency(String beforeResidency) {
        this.beforeResidency = beforeResidency;
    }

    public String getIdCardNum() {
        return idCardNum;
    }

    public void setIdCardNum(String idCardNum) {
        this.idCardNum = idCardNum;
    }

   /* @JsonFormat(pattern = "yyyy-MM-dd")
    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }
*/
    public String getGraduatedSchool() {
        return graduatedSchool;
    }

    public void setGraduatedSchool(String graduatedSchool) {
        this.graduatedSchool = graduatedSchool;
    }

    public String getTotalNumOfFamily() {
        return totalNumOfFamily;
    }

    public void setTotalNumOfFamily(String totalNumOfFamily) {
        this.totalNumOfFamily = totalNumOfFamily;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getHouseStatus() {
        return houseStatus;
    }

    public void setHouseStatus(String houseStatus) {
        this.houseStatus = houseStatus;
    }

    public String getSpecialty() {
        return specialty;
    }

    public void setSpecialty(String specialty) {
        this.specialty = specialty;
    }
}
