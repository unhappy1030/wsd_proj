package org.example.wsd_proj.Service;

import org.example.wsd_proj.DAO.UserDAO;
import org.example.wsd_proj.VO.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    UserDAO userDAO;
    public UserVO getUser(UserVO userVO) {
        return userDAO.getUser(userVO);
    }
}
