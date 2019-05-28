package cn.edu.gues.service;

import cn.edu.gues.mapper.UserMapper;
import cn.edu.gues.pojo.StudentBaseInfo;
import cn.edu.gues.pojo.TeaCheckUserPojo;
import cn.edu.gues.pojo.User;
import cn.edu.gues.util.CommonUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class UserService extends BaseService<User> {

    @Autowired
    private UserMapper mapper;

    public User login(String account, String password) {
        User user = new User();
        user.setStudentNum(account);

        user = selectOne(user);
        if(user!=null){
            if(user.getPassword().equalsIgnoreCase(CommonUtils.calculateMD5(password+ user.getPasswordSalt()))){
                return user;
            }
        }
        return null;
    }


    public void updateSomeValue(Long userId, Map<Object, Object> params) throws NoSuchMethodException, InvocationTargetException, IllegalAccessException {
        User user = selectOne(userId);
        Class clz = user.getClass();
        for (Map.Entry<Object, Object> entry: params.entrySet()){

            String clzName = "set" + entry.getKey().toString().substring(0,1).toUpperCase() + entry.getKey().toString().substring(1);
            Method method = clz.getDeclaredMethod(clzName, entry.getValue().getClass());

            method.invoke(user, entry.getValue());
        }

        update(user);
    }

    public PageInfo<TeaCheckUserPojo> search(int pageNum, int pageSize, Map<String, Object> params) {
        PageHelper.startPage(pageNum, pageSize);
        List<TeaCheckUserPojo> list = mapper.search(params);
        return new PageInfo<TeaCheckUserPojo>(list);
    }


    public PageInfo<StudentBaseInfo> selectAllBaseInfo(Integer pageNum, int pageSize, Map<String, Object> params) {
        PageHelper.startPage(pageNum, pageSize);
        List<StudentBaseInfo> list = mapper.selectAllBaseInfo(params);
        return new PageInfo<StudentBaseInfo>(list);
    }

    public List<User> selectListByClassId(Long clzId) {
        return mapper.selectListByClassId(clzId);
    }

    public User newStudent(String name, Boolean gender, String idCardNum, String studentNum, String phone) {
        User user = new User();
        user.setStudentNum(studentNum);
        User tmpUser = selectOne(user);
        if(tmpUser != null){
            return null;
        }
        String passwordSalt = UUID.randomUUID().toString();
        user.setPasswordSalt(passwordSalt);
        user.setPassword(CommonUtils.calculateMD5("gues520" + passwordSalt));
        insert(user);

        user = selectOne(user);

        user.setName(name);
        user.setGender(gender);
        user.setIdCardNum(idCardNum);
        user.setPhone(phone);

        update(user);

        user = selectOne(user);
        return user;
    }
}
