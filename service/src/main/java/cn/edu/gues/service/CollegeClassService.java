package cn.edu.gues.service;

import cn.edu.gues.pojo.Class;
import cn.edu.gues.pojo.College;
import cn.edu.gues.pojo.CollegeClass;
import org.springframework.stereotype.Service;

@Service
public class CollegeClassService extends ManyToManyBaseService<CollegeClass, College, Class> {
}
