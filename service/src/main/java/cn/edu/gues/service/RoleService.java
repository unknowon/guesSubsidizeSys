package cn.edu.gues.service;

import cn.edu.gues.pojo.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleService extends BaseService<Role> {
    @Autowired
    private RolePermissionService rolePermissionService;

    @Autowired
    private RoleService roleService;

    public void insert(Role role, Long[] permissionIds){
        insert(role);
        Role params = new Role();
        params.setName(role.getName());
        role = selectOne(params);

        rolePermissionService.updateFirst(role.getId(), permissionIds);
    }

    public Role getNextLevelRole(Role role) {
        Role roleResult = new Role();
        String roleName = role.getName();



        switch (roleName){
            case "学校管理员": roleResult.setName("学院书记"); break;
            case "学院书记": roleResult.setName("辅导员"); break;
            case "辅导员": roleResult.setName("班主任"); break;
            default: roleResult.setName("学校管理员"); break;
        }
        roleResult = roleService.selectOne(roleResult);
        return roleResult;
    }
}
