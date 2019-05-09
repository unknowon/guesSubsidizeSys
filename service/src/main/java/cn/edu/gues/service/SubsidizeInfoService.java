package cn.edu.gues.service;

import cn.edu.gues.pojo.SubsidizeInfo;
import cn.edu.gues.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SubsidizeInfoService extends BaseService<SubsidizeInfo> {

    @Autowired
    private UserService userService;

    public String selectValueByKeyAndUserId(String key, Long userId) {

        SubsidizeInfo subsidizeInfo = new SubsidizeInfo();
        subsidizeInfo.setUserId(userId);
        subsidizeInfo.setKey(key);
        subsidizeInfo = selectOne(subsidizeInfo);
        return subsidizeInfo.getValue();
    }
}
