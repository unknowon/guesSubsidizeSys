package cn.edu.gues.mapper;

import cn.edu.gues.pojo.AdminUser;
import cn.edu.gues.pojo.Class;
import cn.edu.gues.pojo.ClassAdminUser;

public interface ClassAdminUserMapper extends IManyToManyMapper<ClassAdminUser, Class, AdminUser> {
}
