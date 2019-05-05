package cn.edu.gues.mapper;

import cn.edu.gues.pojo.AdminUser;
import cn.edu.gues.pojo.AdminUserRole;
import cn.edu.gues.pojo.Role;

public interface AdminUserRoleMapper extends IManyToManyMapper<AdminUserRole, AdminUser, Role> {
}
