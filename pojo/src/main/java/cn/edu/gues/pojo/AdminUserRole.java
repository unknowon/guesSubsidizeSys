package cn.edu.gues.pojo;

import java.io.Serializable;

public class AdminUserRole implements Serializable {
    private static final long serialVersionUID = -9218372413836176862L;
    private Long id;
    private Long adminUserId;
    private Long roleId;

    @Override
    public boolean equals(Object o) {
        if(this == o){ return true;}
        if(o == null || getClass() != o.getClass()){ return false;}

        AdminUserRole that = (AdminUserRole) o;

        return id != null ? id.equals(that.id) : that.id == null;

    }

    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getAdminUserId() {
        return adminUserId;
    }

    public void setAdminUserId(Long adminUserId) {
        this.adminUserId = adminUserId;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }
}
