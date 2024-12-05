package org.example.wsd_proj.DAO;

import org.apache.ibatis.session.SqlSession;
import org.example.wsd_proj.VO.PostVO;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PostDAO {

    @Autowired
    SqlSession sqlSession;

    public int insert(PostVO vo){
        return sqlSession.insert("post.insert", vo);
    }
    public int update(PostVO vo){
        return sqlSession.update("post.update", vo);
    }
    public int delete(int id){
        return sqlSession.delete("post.delete", id);
    }
    public List<PostVO> selectAll(){
        return sqlSession.selectList("post.selectAll");
    }
    public PostVO selectById(int id){
        return sqlSession.selectOne("post.selectById", id);
    }
    public List<PostVO> selectByTitle(String keyword) {
        return sqlSession.selectList("post.selectByTitle", "%"+keyword+"%");
    }
}
