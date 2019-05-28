package cn.edu.gues.mapper;

import cn.edu.gues.pojo.StudentBaseInfo;
import cn.edu.gues.pojo.TeaCheckUserPojo;
import cn.edu.gues.pojo.User;

import java.util.List;
import java.util.Map;

public interface UserMapper extends IMapper<User> {
    List<TeaCheckUserPojo> search(Map<String, Object> params);

    List<StudentBaseInfo> selectAllBaseInfo(Map<String, Object> params);

    List<User> selectListByClassId(Long clzId);
}
