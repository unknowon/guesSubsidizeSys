package cn.edu.gues.mapper;

import cn.edu.gues.pojo.Permission;
import cn.edu.gues.pojo.Role;
import cn.edu.gues.pojo.RolePermission;

public interface RolePermissionMapper extends IManyToManyMapper<RolePermission, Role, Permission> {
}
