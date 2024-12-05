package org.example.wsd_proj.Service;

import org.example.wsd_proj.DAO.PostDAO;
import org.example.wsd_proj.VO.PostVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PostService {

    @Autowired
    PostDAO postDAO;

    public int insert(PostVO vo) {
        return postDAO.insert(vo);
    }

    public int update(PostVO vo) {
        return postDAO.update(vo);
    }

    public int delete(int id) {
        return postDAO.delete(id);
    }

    public List<PostVO> selectAll() {
        return postDAO.selectAll();
    }

    public PostVO selectById(int id) {
        return postDAO.selectById(id);
    }

    public List<PostVO> selectByTitle(String keyword) {
        return postDAO.selectByTitle(keyword);
    }
}
