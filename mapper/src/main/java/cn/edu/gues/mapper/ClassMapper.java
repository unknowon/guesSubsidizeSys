package cn.edu.gues.mapper;

import cn.edu.gues.pojo.Class;
import cn.edu.gues.pojo.ClassAndCollege;

import java.util.List;

public interface ClassMapper extends IMapper<Class> {

    List<ClassAndCollege> selectAllClassAndCollege();
}
