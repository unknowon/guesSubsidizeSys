package cn.edu.gues.service;

import cn.edu.gues.mapper.SubsidizeInfoMapper;
import cn.edu.gues.pojo.SubsidizeInfo;
import cn.edu.gues.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
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

    public Map<String, String> selectMapByUserId(Long userId){
        Map<String, String> map = new HashMap<>();
        SubsidizeInfo subsidizeInfo = new SubsidizeInfo();
        subsidizeInfo.setUserId(userId);
        List<SubsidizeInfo> subsidizeInfoList = selectList(subsidizeInfo);
        for(int i = 0; i < subsidizeInfoList.size(); i++){
            SubsidizeInfo subsidizeInfoTmp = subsidizeInfoList.get(i);
            map.put(subsidizeInfoTmp.getKey(), subsidizeInfoTmp.getValue());
        }
        return map;
    }
}
