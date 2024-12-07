//package org.example.wsd_proj.controller;
//
//import org.example.wsd_proj.Service.PostService;
//import org.example.wsd_proj.VO.PostVO;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import java.util.List;
//
//@Controller
//public class PageController {
//
//    @Autowired
//    private PostService postService;
//
//    @RequestMapping("/")
//    public String index() {
//        return "main/list";
//    }
//
//    @RequestMapping(value = "/crud/list", method = RequestMethod.GET)
//    public String postList(Model model) {
//        model.addAttribute("list", postService.selectAll());
//        return "crud/list";
//    }
//
//    @RequestMapping(value = "/crud/write", method = RequestMethod.GET)
//    public String postWrite() {
//        return "crud/write";
//    }
//
//    @RequestMapping(value = "/crud/write_ok", method = RequestMethod.POST)
//    public String postWriteOk(PostVO vo) {
//        int i = postService.insert(vo);
//        if (i != 0) {
//            System.out.println("insert success");
//        } else {
//            System.out.println("insert fail");
//        }
//        return "redirect:/crud/list";
//    }
//
//    @RequestMapping(value = "/crud/edit/{id}", method = RequestMethod.GET)
//    public String postEdit(@PathVariable("id") int id, Model model) {
//        PostVO postVO = postService.selectById(id);
//        model.addAttribute("post", postVO);
//        return "crud/edit";
//    }
//
//    @RequestMapping(value = "/crud/edit_ok", method = RequestMethod.POST)
//    public String postEditOk(PostVO vo) {
//        int i = postService.update(vo);
//        if (i != 0) {
//            System.out.println("update success");
//        } else {
//            System.out.println("update fail");
//        }
//        return "redirect:/crud/list";
//    }
//
//    @RequestMapping(value = "/crud/delete/{id}", method = RequestMethod.POST)
//    public String postDelete(@PathVariable("id") int id) {
//        int i = postService.delete(id);
//        if (i != 0) {
//            System.out.println("delete success");
//        } else {
//            System.out.println("delete fail");
//        }
//        return "redirect:/crud/list";
//    }
//
//    @RequestMapping(value = "/crud/view/{id}", method = RequestMethod.GET)
//    public String postView(@PathVariable("id") int id, Model model) {
//        PostVO postVO = postService.selectById(id);
//        model.addAttribute("post", postVO);
//        return "crud/view";
//    }
//
//    @RequestMapping(value = "/crud/search", method = RequestMethod.GET)
//    public String searchPosts(String keyword, Model model) {
//        List<PostVO> posts = postService.selectByTitle(keyword);
//        System.out.println("Search keyword: " + keyword);
//        System.out.println("Search results:");
//        for (PostVO post : posts) {
//            System.out.println("ID: " + post.getId() + ", Title: " + post.getTitle() +
//                    ", Author: " + post.getAuthor() + ", Created At: " + post.getCreatedAt());
//        }
//        model.addAttribute("list", posts);
//        model.addAttribute("searchKeyword", keyword);
//        return "crud/list";
//    }
//}
