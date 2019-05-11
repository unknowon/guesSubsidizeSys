package cn.edu.gues.service;

import cn.edu.gues.pojo.User;
import cn.edu.gues.util.CommonUtils;
import org.springframework.stereotype.Service;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Map;

@Service
public class UserService extends BaseService<User> {


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
}
