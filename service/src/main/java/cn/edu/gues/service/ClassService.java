package cn.edu.gues.service;

import cn.edu.gues.mapper.ClassMapper;
import cn.edu.gues.pojo.Class;
import cn.edu.gues.pojo.ClassAndCollege;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassService extends BaseService<Class> {
    @Autowired
    private ClassMapper classMapper;

    public List<ClassAndCollege> selectAllClassAndCollege() {
        return classMapper.selectAllClassAndCollege();
    }
}
