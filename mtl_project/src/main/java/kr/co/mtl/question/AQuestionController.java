package kr.co.mtl.question;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
@RequestMapping("/api/question")
public class AQuestionController {
    @Autowired
    private AQuestionService questionService;

    @PostMapping("/search")
    public Map<String, Object> searchQuestions(@RequestBody Map<String, Object> param) {
        return questionService.searchQuestions(param);
    }

    @PostMapping("/detail")
    public Map<String, Object> getQuestionDetail(@RequestBody Map<String, Object> param) {
        Integer idx = (Integer) param.get("idx");
        return questionService.getQuestionDetail(idx);
    }
}
