package cn.edu.gues.service;

import cn.edu.gues.pojo.User;
import cn.edu.gues.util.CommonUtils;
import org.springframework.stereotype.Service;

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
}
