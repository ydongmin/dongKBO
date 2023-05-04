package com.dong.KBO.dao;

import com.dong.KBO.domain.H_recordDto;

import java.util.List;

public interface H_recordDao {
    List<H_recordDto> selectAll() throws Exception;

    H_recordDto select(Integer pitcher_rank);

    int deleteAll() throws Exception;
    int delete(String player_name) throws Exception;
    int insert(H_recordDto dto) throws Exception;
    int update(H_recordDto dto) throws Exception;
}
