package cn.edu.gues.service;

import cn.edu.gues.pojo.SubsidizeInfo;
import cn.edu.gues.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class SubsidizeInfoService extends BaseService<SubsidizeInfo> {

    @Autowired
    private UserService userService;

    public String selectValueByKeyAndUserId(String key, Long userId) {

        SubsidizeInfo subsidizeInfo = new SubsidizeInfo();
        subsidizeInfo.setUserId(userId);
        subsidizeInfo.setKey(key);
        subsidizeInfo = selectOne(subsidizeInfo);
        if(subsidizeInfo != null){
            return subsidizeInfo.getValue();
        }
        return null;
    }

    public void insertN(Long userId, Map<String, String> params){
        for (Map.Entry<String, String> entry : params.entrySet()) {
            SubsidizeInfo subsidizeInfo = new SubsidizeInfo();
            subsidizeInfo.setUserId(userId);
            subsidizeInfo.setKey(entry.getKey());

            if(selectOne(subsidizeInfo) != null){
                delete(selectOne(subsidizeInfo).getId());
            }

            subsidizeInfo.setValue(entry.getValue());

            insert(subsidizeInfo);
        }
    }
}
