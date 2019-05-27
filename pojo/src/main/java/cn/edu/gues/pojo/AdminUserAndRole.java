package cn.edu.gues.pojo;

/**
 * AdminUserAndRole
 *
 * @author lulu
 * @date 2019-05-27
 **/
public class AdminUserAndRole {
    private Long adminUserId;
    private String adminUserName;
    private Long RoleId;
    private String RoleName;
    private String workId;
    private String phone;

    public Long getAdminUserId() {
        return adminUserId;
    }

    public void setAdminUserId(Long adminUserId) {
        this.adminUserId = adminUserId;
    }

    public String getAdminUserName() {
        return adminUserName;
    }

    public void setAdminUserName(String adminUserName) {
        this.adminUserName = adminUserName;
    }

    public Long getRoleId() {
        return RoleId;
    }

    public void setRoleId(Long roleId) {
        RoleId = roleId;
    }

    public String getRoleName() {
        return RoleName;
    }

    public void setRoleName(String roleName) {
        RoleName = roleName;
    }

    public String getWorkId() {
        return workId;
    }

    public void setWorkId(String workId) {
        this.workId = workId;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
