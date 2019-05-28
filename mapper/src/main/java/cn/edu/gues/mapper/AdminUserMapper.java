package cn.edu.gues.mapper;

import cn.edu.gues.pojo.*;
import cn.edu.gues.pojo.Class;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminUserMapper extends IMapper<AdminUser> {
    List<AdminUserAndRole> selectAllAndRole(AdminUserAndRole adminUserAndRole);

    List<NextLevelTeacher> selectAllNextLevel(@Param("role")Role role, @Param("nextRole") Role nextRole, @Param("classList") List<Class> classList);
}
