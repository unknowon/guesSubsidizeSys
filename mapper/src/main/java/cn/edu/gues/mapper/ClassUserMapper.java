package cn.edu.gues.mapper;

import cn.edu.gues.pojo.Class;
import cn.edu.gues.pojo.ClassUser;
import cn.edu.gues.pojo.User;

public interface ClassUserMapper extends IManyToManyMapper<ClassUser, Class, User> {
}
