package cn.edu.gues.service;

import cn.edu.gues.mapper.AdminUserMapper;
import cn.edu.gues.pojo.*;
import cn.edu.gues.pojo.Class;
import cn.edu.gues.util.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

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

    public List<NextLevelTeacher> selectAllNextLevel(Role role, Role nextRole, List<Class> classList) {
        return mapper.selectAllNextLevel(role, nextRole, classList);
    }

    public AdminUser newAdminUser(String name, String workId, String phone){
        AdminUser adminUser = new AdminUser();
        adminUser.setWorkId(workId);
        adminUser.setPhone(phone);
        adminUser.setName(name);

        AdminUser tmpAdminUser = selectOne(adminUser);
        if(tmpAdminUser != null){
            return null;
        }
        String passwordSalt = UUID.randomUUID().toString();
        System.out.println(passwordSalt);
        adminUser.setPasswordSalt(passwordSalt);
        adminUser.setPassword(CommonUtils.calculateMD5("gues520" + passwordSalt));
        insert(adminUser);

        return selectOne(adminUser);
    }

    public List<NextLevelTeacher> selectAllNextLevelByRole(Long shujiRoleId) {
        return mapper.selectAllNextLevelByRole(shujiRoleId);
    }

    public List<NextLevelTeacher> selectAllNextLevelByRoleAndCollegeId(Long fuDaoYuanRoleId, Long collegeId) {
        return mapper.selectAllNextLevelByRoleAndCollegeId(fuDaoYuanRoleId, collegeId);
    }
}
