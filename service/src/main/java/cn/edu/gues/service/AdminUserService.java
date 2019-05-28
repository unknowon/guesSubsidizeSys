package cn.edu.gues.service;

import cn.edu.gues.mapper.AdminUserMapper;
import cn.edu.gues.pojo.AdminUser;
import cn.edu.gues.pojo.AdminUserAndRole;
import cn.edu.gues.pojo.Class;
import cn.edu.gues.pojo.Role;
import cn.edu.gues.util.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminUserService extends BaseService<AdminUser> {

    @Autowired
    private AdminUserMapper mapper;

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

    public List<AdminUserAndRole> selectAllAndRole(AdminUserAndRole adminUserAndRole) {
        return mapper.selectAllAndRole(adminUserAndRole);
    }

    public List<AdminUserAndRole> selectAllNextLevel(Role role, Role nextRole, List<Class> classList) {
        return mapper.selectAllNextLevel(role, nextRole, classList);
    }
}
