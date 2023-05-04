package com.dong.KBO.dao;

import com.dong.KBO.domain.CommentDto;
import com.dong.KBO.domain.SearchCondition;

import java.util.List;
import java.util.Map;

public interface CommentDao {
    int count(Integer bno) throws Exception;

    int deleteAll(Integer bno) throws Exception;

    int delete(Integer cno, String commenter) throws Exception;

    int insert(CommentDto dto) throws Exception;

    List<CommentDto> selectAll(Integer bno) throws Exception;

    CommentDto select(Integer cno) throws Exception;

    int update(CommentDto dto) throws Exception;
//    ************************

    List<CommentDto> selectPage(Map map) throws Exception;

}
