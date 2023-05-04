package com.dong.KBO.dao;

import com.dong.KBO.domain.H_recordDto;
import com.dong.KBO.domain.P_recordDto;

import java.util.List;

public interface P_recordDao {
    List<P_recordDto> selectAll() throws Exception;

    P_recordDto select(Integer pitcher_rank);

    int deleteAll() throws Exception;
    int delete(String player_name) throws Exception;
    int insert(P_recordDto dto) throws Exception;
    int update(P_recordDto dto) throws Exception;
}
