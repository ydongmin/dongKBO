package com.dong.KBO.service;

import com.dong.KBO.domain.H_recordDto;
import com.dong.KBO.domain.P_recordDto;

import java.util.List;

public interface P_recordService {
    List<P_recordDto> getList() throws Exception;

    P_recordDto read(Integer pitcher_rank);

    int remove(String player_name) throws Exception;

    int modify(P_recordDto dto) throws Exception;
}
