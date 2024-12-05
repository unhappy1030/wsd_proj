package org.example.wsd_proj.DAO;

import org.apache.ibatis.session.SqlSession;
import org.example.wsd_proj.VO.UserVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
    @Autowired
    SqlSessionTemplate sqlSession;

    public UserVO getUser(UserVO userVO) {
        return sqlSession.selectOne("user.getUser", userVO);
    }
}
