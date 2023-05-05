package com.dong.KBO.controller;

import com.dong.KBO.domain.*;
import com.dong.KBO.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
public class CommentController {
    @Autowired
    CommentService commentservice;

//    {
//        "pcno":0,
//            "comment" : "hihihi"
//             "commenter : "asdf"
//    }

    //댓글 수정하는 메서드
    @PatchMapping("/comments/{cno}") // KBO/comments/26  PATCH
    public ResponseEntity<String> modify(@PathVariable Integer cno, @RequestBody CommentDto dto, HttpSession session) {
        String commenter = (String)session.getAttribute("id");
        dto.setCommenter(commenter);
        dto.setCno(cno);
        System.out.println("dto = " + dto);

        try {
            if(commentservice.modify(dto) != 1)
                throw new Exception("Write failed.");

            return new ResponseEntity<>("수정이 완료되었습니다.", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("댓글을 수정하는 중에 오류가 발생했습니다.", HttpStatus.BAD_REQUEST);
        }
    }

//        {
//        "pcno":0,
//            "comment" : "hihihi"
//    }

    // 댓글을 등록하는 메서드
    @PostMapping("/comments") // /kbo/comments?bno=1085 post, Content-Type  application/json
    public ResponseEntity<String> write(@RequestBody CommentDto dto, Integer bno, HttpSession session) {
        String commenter = (String)session.getAttribute("id");
        dto.setCommenter(commenter);
        dto.setBno(bno);
        System.out.println("dto = " + dto);

        try {
            if(commentservice.write(dto) != 1)
                throw new Exception("Write failed.");

            return new ResponseEntity<>("댓글 등록이 완료되었습니다.", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("WRT_ERR", HttpStatus.BAD_REQUEST);
        }
    }

    // 지정된 댓글을 삭제하는 메서드
    @DeleteMapping("/comments/{cno}") // /comments/5?bno=1085
    public ResponseEntity<String> remove(@PathVariable Integer cno, Integer bno, HttpSession session) {
        String commenter = (String)session.getAttribute("id");

        try {
            int rowCnt = commentservice.remove(cno, bno, commenter);
            System.out.println("cno = " + cno);
            System.out.println("bno = " + bno);

            if(rowCnt != 1)
                throw new Exception("Delete Failed");

            return new ResponseEntity<>("댓글 삭제가 완료되었습니다", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("댓글을 삭제하는중에 오류가 발생했습니다.", HttpStatus.BAD_REQUEST);
        }
    }

    //지정된 게시물의 모든 댓글을 가져오는 메서드
    @GetMapping("/comments") // /comments?bno=1080 GET
//    @CrossOrigin(origins = "*", methods = RequestMethod.GET)
    public ResponseEntity<List<CommentDto>> list(Integer bno) {
        List<CommentDto> list = null;

        try {
            list = commentservice.getList(bno);

            System.out.println("list = " + list);
            return new ResponseEntity<List<CommentDto>>(list, HttpStatus.OK); //200
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<CommentDto>>(HttpStatus.BAD_REQUEST); //400
        }
    }

//    @GetMapping("/comments") // /comments?bno=1080 GET
////    @CrossOrigin(origins = "*", methods = RequestMethod.GET)
//    public ResponseEntity<List<CommentDto>> list(Integer bno, SearchCondition sc, HttpServletRequest request) {
//        List<CommentDto> list = null;
//
//        try {
//            int totalCnt = commentservice.getSearchResultCnt(sc);
//            request.setAttribute("totalCnt", totalCnt);
//
//            PageHandler pageHandler = new PageHandler(totalCnt, sc);
//            request.setAttribute("ph", pageHandler);
//
//            list = commentservice.getList(bno);
//
//            System.out.println("list = " + list);
//            return new ResponseEntity<List<CommentDto>>(list, HttpStatus.OK); //200
//        } catch (Exception e) {
//            e.printStackTrace();
//            return new ResponseEntity<List<CommentDto>>(HttpStatus.BAD_REQUEST); //400
//        }
//    }




}
