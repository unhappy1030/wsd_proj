package org.example.wsd_proj.controller;

import org.example.wsd_proj.DTO.IngredientListDTO;
import org.example.wsd_proj.Service.CRecipeService;
import org.example.wsd_proj.VO.CManual;
import org.example.wsd_proj.VO.CRecipe;
import org.example.wsd_proj.VO.CRecipeIngredient;
import org.example.wsd_proj.VO.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/custom")
public class CRecipeController {

    @Autowired
    private CRecipeService cRecipeService;
    @GetMapping("/")
    public String myPage(Model model, HttpSession session) {
        UserVO loginvo = (UserVO) session.getAttribute("login");
        if(loginvo != null) {
            model.addAttribute("user", loginvo);
        }
        List<CRecipe> recipes = cRecipeService.getAllRecipes(loginvo.getUserid());
        model.addAttribute("recipes", recipes); // 모델에 레시피 리스트 추가
        return "crecipe-list";  // 'recipe-list.jsp' 파일을 렌더링
    }

    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") int id,Model model) {
        CRecipe recipe = cRecipeService.getRecipeById(id);
        model.addAttribute("recipe", recipe); // 모델에 레시피 리스트 추가
        return "crecipe-detail";  // 'recipe-list.jsp' 파일을 렌더링
    }

    @PostMapping("/insert")
    public String insertRecipe(@ModelAttribute CRecipe cRecipe, Model model, HttpSession session) {
        UserVO loginvo = (UserVO) session.getAttribute("login");

        if (loginvo != null) {
            System.out.println("User : " + loginvo.getUserid());

            cRecipe.setUserId(loginvo.getUserid()); // getUserId() 로 수정
            System.out.println("cRecipe: " + cRecipe.toString());
            // CRecipeService를 사용하여 레시피 추가
            int insertedRecipeId = cRecipeService.insertCRecipe(cRecipe);
            System.out.println("insertedRecipeId: " + insertedRecipeId);
            // 추가된 레시피의 ID를 사용하여 CNutrition 및 CManual에 recipeId 설정
            cRecipe.getNutritionInfo().setRecipeId(String.valueOf(insertedRecipeId));
            for (CManual step : cRecipe.getManualSteps()) {
                step.setRecipeId(String.valueOf(insertedRecipeId));
                System.out.println("step: " + step.toString());
            }

            cRecipeService.insertCNutrition(cRecipe.getNutritionInfo());
            cRecipeService.insertCManual(cRecipe.getManualSteps());

            return "redirect:/";
        } else {
            // 로그인되지 않은 경우 처리 (예: 로그인 페이지로 리다이렉트)
            return "redirect:/login";
        }
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") int id, Model model, HttpSession session) {
        UserVO loginvo = (UserVO) session.getAttribute("login");
        if(loginvo != null) {
            try {
                cRecipeService.deleteRecipe(id);
                model.addAttribute("message", "레시피가 삭제되었습니다.");
            } catch (Exception e) {
                model.addAttribute("message", "레시피 삭제 실패: " + e.getMessage());
            }
        }
        return "redirect:/custom/";  // 'recipe-list.jsp' 파일을 렌더링
    }
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") int id, Model model) {
        CRecipe recipe = cRecipeService.getRecipeById(id);
        model.addAttribute("recipe", recipe);
        return "crecipe-edit";
    }
    @PostMapping("/update")
    public String update(@ModelAttribute CRecipe cRecipe, Model model, HttpSession session) {
        UserVO loginUser = (UserVO) session.getAttribute("login");

        if (loginUser != null) {
            try {
                CRecipe originCRecipe = cRecipeService.getRecipeById(cRecipe.getId());
                List<CManual> originSteps = originCRecipe.getManualSteps();
                List<CManual> newSteps = cRecipe.getManualSteps();

                for(int i = originSteps.size(); i <= newSteps.size() - 1; i++) {
                    cRecipeService.insertCManualStep(newSteps.get(i));
                }
                for(int i = newSteps.size(); i <= originSteps.size() - 1; i++) {
                    cRecipeService.deleteCManualStep(originSteps.get(i));
                }

                for (CManual step : cRecipe.getManualSteps()) {
                    System.out.println("step: " + step.toString());
                }
                cRecipeService.updateCNutrition(cRecipe.getNutritionInfo());
                cRecipeService.updateCManual(cRecipe.getManualSteps());
                cRecipeService.updateCRecipe(cRecipe);
                System.out.println("custom recipe update success");
                return "redirect:/custom/";
            } catch (Exception e) {
                model.addAttribute("message", "레시피 업데이트 중 오류가 발생했습니다.");
                System.out.println("custom recipe update failed");
                System.out.println(e.getMessage());
                return "redirect:/";
            }
        } else {
            return "redirect:/login";
        }
    }
    @GetMapping("/create")
    public String create(Model model) {
        return "crecipe-create";
    }
    @PostMapping("/updateCheckList")
    public String updateCheckList(@ModelAttribute IngredientListDTO ingredientListDTO, Model model, HttpSession session) {
        List<CRecipeIngredient> ingredients = ingredientListDTO.getIngredients();
        if (ingredients != null && !ingredients.isEmpty()) {
            for (CRecipeIngredient ingredient : ingredients) {
                System.out.println("ingredient: " + ingredient.toString());
//                cRecipeService.saveIngredients(ingredient);  // 재료를 DB에 저장하는 메서드 호출 (가정)
            }
            model.addAttribute("message", "재료 리스트가 성공적으로 저장되었습니다.");
        } else {
            model.addAttribute("message", "재료 리스트가 비어 있습니다.");
        }
        return "successPage";  // 성공 페이지로 리다이렉트
    }
}