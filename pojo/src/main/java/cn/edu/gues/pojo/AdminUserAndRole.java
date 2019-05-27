package cn.edu.gues.pojo;

/**
 * AdminUserAndRole
 *
 * @author lulu
 * @date 2019-05-27
 **/
public class AdminUserAndRole {
    private Long id;
    private String name;
    private Long RoleId;
    private String RoleName;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
}
