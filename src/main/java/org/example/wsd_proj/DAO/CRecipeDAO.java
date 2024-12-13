package org.example.wsd_proj.DAO;

import org.apache.ibatis.session.SqlSession;
import org.example.wsd_proj.VO.CManual;
import org.example.wsd_proj.VO.CNutrition;
import org.example.wsd_proj.VO.CRecipe;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CRecipeDAO {
    @Autowired
    private SqlSession sqlSession;

    public int insertCRecipe(CRecipe cRecipe) {
        sqlSession.insert("crecipe.insertCRecipe", cRecipe);
        return cRecipe.getId();
    }

    public int insertCNutrition(CNutrition cNutrition) {
        return sqlSession.insert("crecipe.insertCNutrition", cNutrition);
    }

    public int insertCManualSteps(List<CManual> cManuals) {
        return sqlSession.insert("crecipe.insertCManualSteps", cManuals);
    }
}