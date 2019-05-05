package cn.edu.gues.service;

import cn.edu.gues.pojo.AdminUser;
import cn.edu.gues.pojo.AdminUserRole;
import cn.edu.gues.pojo.Role;
import org.springframework.stereotype.Service;

@Service
public class AdminUserRoleService extends ManyToManyBaseService<AdminUserRole, AdminUser, Role> {
}
