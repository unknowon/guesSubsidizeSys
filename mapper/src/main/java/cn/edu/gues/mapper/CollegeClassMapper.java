package cn.edu.gues.mapper;

import cn.edu.gues.pojo.Class;
import cn.edu.gues.pojo.College;
import cn.edu.gues.pojo.CollegeClass;

public interface CollegeClassMapper extends IManyToManyMapper<CollegeClass, College, Class> {
}
