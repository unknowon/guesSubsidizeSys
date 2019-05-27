package cn.edu.gues.mapper;

import cn.edu.gues.pojo.AdminUser;
import cn.edu.gues.pojo.AdminUserAndRole;

import java.util.List;

public interface AdminUserMapper extends IMapper<AdminUser> {
    List<AdminUserAndRole> selectAllAndRole(AdminUserAndRole adminUserAndRole);
}
