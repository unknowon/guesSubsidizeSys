package cn.edu.gues.service;

import cn.edu.gues.pojo.Permission;
import cn.edu.gues.pojo.Role;
import cn.edu.gues.pojo.RolePermission;
import org.springframework.stereotype.Service;

@Service
public class RolePermissionService extends ManyToManyBaseService<RolePermission, Role, Permission> {
}
