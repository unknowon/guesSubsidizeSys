package cn.edu.gues.service;

import cn.edu.gues.pojo.Class;
import cn.edu.gues.pojo.ClassUser;
import cn.edu.gues.pojo.User;
import org.springframework.stereotype.Service;

@Service
public class ClassUserService extends ManyToManyBaseService<ClassUser, Class, User> {
}
