package cn.edu.gues.service;

import cn.edu.gues.pojo.AdminUser;
import cn.edu.gues.pojo.Class;
import cn.edu.gues.pojo.ClassAdminUser;
import org.springframework.stereotype.Service;

@Service
public class ClassAdminUserService extends ManyToManyBaseService<ClassAdminUser, Class, AdminUser> {
}
