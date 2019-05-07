package cn.edu.gues.service;

import cn.edu.gues.pojo.AdminUser;
import cn.edu.gues.util.CommonUtils;
import org.springframework.stereotype.Service;

@Service
public class AdminUserService extends BaseService<AdminUser> {

    public AdminUser login(String account, String password) {
        AdminUser adminUser = new AdminUser();

        adminUser.setWorkId(account);

        adminUser = selectOne(adminUser);
        if(adminUser!=null){
            if(adminUser.getPassword().equalsIgnoreCase(CommonUtils.calculateMD5(password+ adminUser.getPasswordSalt()))){
                return adminUser;
            }
        }
        return null;
    }
}
